#!/usr/bin/env ruby
# frozen_string_literal: true


#
# Color seed values
#

GRAYSCALE_HUE = 254
COLOR_HUES = {
  red: 29,
  orange: 56,
  yellow: 84,
  green: 134,
  cyan: 184,
  blue: 242,
  purple: 286,
  magenta: 331
}.freeze

LIGHTNESS_STOPS = {
  100 => 0.97,
  200 => 0.92,
  300 => 0.86,
  400 => 0.78,
  500 => 0.71,
  600 => 0.61,
  700 => 0.49,
  800 => 0.40,
  900 => 0.30
}.freeze

GRAYSCALE_CHROMA = 0.010
CHROMA_STOPS = {
  100 => 0.017,
  200 => 0.041,
  300 => 0.066,
  400 => 0.109,
  500 => 0.120,
  600 => 0.103,
  700 => 0.083,
  800 => 0.069,
  900 => 0.047
}.freeze

LIGHT_ACCENT_LEVELS = [600, 400].freeze
DARK_ACCENT_LEVELS = [400, 600].freeze
LIGHT_GRAY_LEVELS = {
  'bg': 100,
  'bg-sel': 200,
  'border': 300,
  'border-sel': 400,
  'comment': 500,
  'text-dim': 700,
  'text': 900
}.freeze
DARK_GRAY_LEVELS = {
  'bg': 900,
  'bg-sel': 800,
  'border': 700,
  'border-sel': 600,
  'comment': 500,
  'text-dim': 400,
  'text': 200
}.freeze

STEPS = CHROMA_STOPS.keys
COLORS = COLOR_HUES.keys

#
# Colorspace conversion
#

OKLAB_TO_LMS_MATRIX = [
  [1, 0.3963377774, 0.2158037573],
  [1, -0.1055613458, -0.0638541728],
  [1, -0.0894841775, -1.2914855480]
].freeze

LMS_TO_RGB_MATRIX = [
  [4.0767416621, -3.3077115913, 0.2309699292],
  [-1.2684380046, 2.6097574011, -0.3413193965],
  [-0.0041960863, -0.7034186147, 1.7076147010]
].freeze

def clamp(value, min, max)
  [[value, min].max, max].min
end

def matrix_mult(matrix, vector)
  matrix.map { |row| row.zip(vector).sum { |coefficient, value| coefficient * value } }
end

def oklch_to_hex(lightness, chroma, hue)
  # Convert to oklab
  hue_radians = hue * Math::PI / 180.0
  a_axis = chroma * Math.cos(hue_radians)
  b_axis = chroma * Math.sin(hue_radians)

  # Convert to rgb
  lms = matrix_mult(OKLAB_TO_LMS_MATRIX, [lightness, a_axis, b_axis])
  lms = lms.map { |value| value**3 }
  linear_rgb = matrix_mult(LMS_TO_RGB_MATRIX, lms)
  rgb = linear_rgb.map { |channel| channel <= 0.0031308 ? (12.92 * channel) : (1.055 * (channel**(1.0 / 2.4)) - 0.055) }

  # Convert to hex
  channels = rgb.map { |channel| (clamp(channel.nan? ? 0 : channel, 0, 1) * 255).round }
  format('#%<red>02X%<green>02X%<blue>02X', red: channels[0], green: channels[1], blue: channels[2])
end

#
# Color calculation
#

def build_colors
  colors = {}

  STEPS.each do |step|
    colors[:"mist-#{step}"] = oklch_to_hex(LIGHTNESS_STOPS[step], GRAYSCALE_CHROMA, GRAYSCALE_HUE)

    COLOR_HUES.each do |name, hue|
      colors[:"#{name}-#{step}"] = oklch_to_hex(LIGHTNESS_STOPS[step], CHROMA_STOPS[step], hue)
    end
  end

  colors
end

#
# Output generation
#

def pad(value, width = 24)
  value.to_s.ljust(width)
end

def css_variables(colors)
  lines = []

  STEPS.each do |step|
    lines << "  #{pad("--mist-#{step}:")}#{colors.fetch(:"mist-#{step}")};"
  end
  lines << ''

  COLORS.each do |name|
    STEPS.each do |step|
      lines << "  #{pad("--mist-#{name}-#{step}:")}#{colors.fetch(:"#{name}-#{step}")};"
    end
    lines << ''
  end

  lines.join("\n")
end

def css_aliases(grey_levels, accent_levels, inverted_grey_levels, inverted_accent_levels)
  lines = []
  lines << '  /* Content */'
  grey_levels.each do |name, step|
    lines << "  #{pad("--mist-#{name}:")}var(--mist-#{step});"
  end
  inverted_grey_levels.each do |name, step|
    lines << "  #{pad("--inv-mist-#{name}:")}var(--mist-#{step});"
  end

  lines << '  /* Accents */'
  COLORS.each do |name|
    lines << "  #{pad("--mist-#{name}:")}var(--mist-#{name}-#{accent_levels[0]});"
    lines << "  #{pad("--mist-#{name}-br:")}var(--mist-#{name}-#{accent_levels[1]});"
    lines << "  #{pad("--inv-mist-#{name}:")}var(--mist-#{name}-#{inverted_accent_levels[0]});"
    lines << "  #{pad("--inv-mist-#{name}-br:")}var(--mist-#{name}-#{inverted_accent_levels[1]});"
  end

  lines.join("\n")
end

def markdown_table(colors)
  value_width = 5
  hex_width = 9

  color_names = COLORS.map { |color| pad(" #{color.to_s.capitalize} ", hex_width) }

  markdown = <<~MD
    |#{pad('', value_width)}|#{pad(' Mist', hex_width)}|#{color_names.join('|')}|
    | --- | ------- | ------- | ------- | ------- | ------- | ------- | ------- | ------- | ------- |
  MD

  STEPS.each do |step|
    hex_values = COLORS.map { |color| pad(" #{colors.fetch(:"#{color}-#{step}")} ", hex_width) }
    row = <<~MD
      |#{pad(" #{step} ", value_width)}|#{pad(" #{colors.fetch(:"mist-#{step}")} ", hex_width)}|#{hex_values.join('|')}|
    MD
    markdown << row
  end
  markdown
end

def markdown_usage_table
  col_width = 10
  markdown = <<~MD
    |            | Light mode | Dark mode  |
    | ---------- | ---------- | ---------- |
    | Accent     | color-#{LIGHT_ACCENT_LEVELS[0]}  | color-#{DARK_ACCENT_LEVELS[0]}  |
    | Bright     | color-#{LIGHT_ACCENT_LEVELS[1]}  | color-#{DARK_ACCENT_LEVELS[1]}  |
    | ---------- | ---------- | ---------- |
    | Selection  | blue-300   | blue-700   |
    | Cursor     | blue-500   | blue-500   |
    | ---------- | ---------- | ---------- |
  MD
  LIGHT_GRAY_LEVELS.each_key do |name|
    markdown << "| #{pad(name, col_width)} "
    markdown << "| #{pad("mist-#{LIGHT_GRAY_LEVELS[name]}", col_width)} "
    markdown << "| #{pad("mist-#{DARK_GRAY_LEVELS[name]}", col_width)} |\n"
  end
  markdown
end

def liquid_vars
  <<~LQ
    {% assign color_names = "#{COLORS.join(',')}" | split: "," %}
    {% assign gray_levels_light = "#{LIGHT_GRAY_LEVELS.values.join(',')}" | split: "," %}
    {% assign gray_levels_dark = "#{DARK_GRAY_LEVELS.values.join(',')}" | split: "," %}
    {% assign all_levels = "#{STEPS.join(',')}" | split: "," %}
  LQ
end

def replace_section(file_path, marker_name, new_section)
  lines = File.readlines(file_path, chomp: true)

  start_idx = lines.find_index { |l| l.match?(/#{Regexp.escape(marker_name)}\s+START/) }
  end_idx   = lines.find_index { |l| l.match?(/#{Regexp.escape(marker_name)}\s+END/) }

  raise "Invalid or missing markers '#{marker_name}' in #{file_path}" unless start_idx && end_idx && start_idx < end_idx

  updated_lines = lines[0..start_idx] + [''] + new_section.lines(chomp: true) + [''] + lines[end_idx..]
  content = updated_lines.join("\n")
  content += "\n"

  File.write(file_path, content)
end

if __FILE__ == $PROGRAM_NAME
  colors = build_colors

  replace_section('index.md', 'USAGE TABLE', markdown_usage_table)
  replace_section('index.md', 'EXPANDED TABLE', markdown_table(colors))

  replace_section('preview.html', 'LIQUID VARS', liquid_vars)

  replace_section('../../_sass/colors.css', 'MIST COLORS', css_variables(colors))
  replace_section('../../_sass/colors.css', 'LIGHT ALIASES',
                  css_aliases(LIGHT_GRAY_LEVELS, LIGHT_ACCENT_LEVELS, DARK_GRAY_LEVELS, DARK_ACCENT_LEVELS))
  replace_section('../../_sass/colors.css', 'DARK ALIASES',
                  css_aliases(DARK_GRAY_LEVELS, DARK_ACCENT_LEVELS, LIGHT_GRAY_LEVELS, LIGHT_ACCENT_LEVELS))
end
