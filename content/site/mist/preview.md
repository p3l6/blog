---
title: Mist Palette Preview
layout: page

# LIQUID VARS START

params:
  color_names: [red,orange,yellow,green,cyan,blue,purple,magenta]
  gray_levels_light: [100,200,300,400,500,700,900]
  gray_levels_dark: [900,800,700,600,500,400,200]
  all_levels: [100,200,300,400,500,600,700,800,900]

# LIQUID VARS END
---

{{< styles.inline "gray_levels_light" >}}
<style>

.color-grid {
  display: grid;
  gap: .5rem;
}

.color-scale {
  display: grid;
  grid-template-columns: repeat({{ .Page.Params.all_levels | len }}, minmax(0, 1fr));
  gap: 0.25rem;
}

.swatch {
  display: flex;
  flex-direction: column;
  gap: 0.25rem;
  aspect-ratio: 0.8;
  border: 1px solid var(--mist-border);
  border-radius: 4px;
}

.sample-palette {
  display: grid;
  gap: 0.75rem;
  padding: 1rem;
  border: 1px solid var(--mist-border);
  border-radius: 6px;
}

.sample-palette.light {
  background: var(--mist-{{ index (first 1 .Page.Params.gray_levels_light) 0 }});
  color: var(--mist-{{ index (last 1 .Page.Params.gray_levels_light) 0 }});
}

.sample-palette.dark {
  background: var(--mist-{{ index (first 1 .Page.Params.gray_levels_dark) 0 }});
  color: var(--mist-{{ index (last 1 .Page.Params.gray_levels_dark) 0 }});
}

.sample-swatch-row {
  display: grid;
  grid-template-columns: repeat(8, minmax(0, 1fr));
  grid-auto-rows: 3.5rem;
  gap: 0.5rem;
}

.sample-swatch-row.compact {
  grid-auto-rows: 1.75rem;
}

.sample-swatch {
  min-height: 100%;
  border-radius: 4px;
  box-shadow: inset 0 0 0 1px rgba(0,0,0,0.12);
}

.sample-palette.dark .sample-swatch {
  box-shadow: inset 0 0 0 1px rgba(255,255,255,0.16);
}

</style>
{{< /styles.inline >}}

Refer back to [the theme explanation page](/site/mist/) for color codes and more information.

## Light mode color pallet

{{< palette.inline "gray_levels_light" "light" >}}
<section class="sample-palette {{ .Get 1 }}">
  <div class="sample-swatch-row">
  {{- range (index .Page.Params (.Get 0)) -}}
    <div class="sample-swatch" style="background-color: var(--mist-{{.}})" title="{{.}}"></div>
  {{- end }}
  </div>
  <div class="sample-swatch-row compact">
    {{- range .Page.Params.color_names -}}
    <div class="sample-swatch" style="background-color: var(--mist-{{.}}-300)" title="{{.}}-300"></div>
    {{- end }}
  </div>
  <div class="sample-swatch-row">
    {{- range .Page.Params.color_names -}}
    <div class="sample-swatch" style="background-color: var(--mist-{{.}}-700)" title="{{.}}-700"></div>
    {{- end }}
  </div>
</section>
{{< /palette.inline >}}

## Dark mode color pallet

{{< palette.inline "gray_levels_dark" "dark" />}}

## Full color grid

{{< grid.inline >}}
{{ $all_levels := .Page.Params.all_levels }}
<div class="color-grid">
  <div class="color-scale">
    {{- range $all_levels -}}
    <div>
      {{.}}
    </div>
    {{- end }}
  </div>
  <div class="color-scale">
    {{- range $all_levels -}}
      <div class="swatch" style="background-color: var(--mist-{{.}})"></div>
    {{- end }}
  </div>
  {{- range .Page.Params.color_names -}}
  {{ $color := . }}
  <div class="color-scale">
    {{- range $all_levels -}}
      <div class="swatch" style="background-color: var(--mist-{{$color}}-{{.}})"></div>
    {{- end }}
  </div>
  {{- end }}
</div>
{{< /grid.inline >}}
