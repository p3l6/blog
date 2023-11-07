const defaultTheme = require('tailwindcss/defaultTheme')

/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["../**/*.{html,md}"],
  theme: {
    extend: {
      fontFamily: {
        'sans': [ 'Spinnaker', ...defaultTheme.fontFamily.sans],
        'heading': ['Comfortaa', 'serif'],
        'mono': ['"Fira Code"', ...defaultTheme.fontFamily.mono]
      },
    },
  },
  plugins: [
    require('@tailwindcss/typography')
  ],
}

