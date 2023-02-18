const defaultTheme = require('tailwindcss/defaultTheme');

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}',
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
        proxima_bold: ['proxima_nova_rgbold', ...defaultTheme.fontFamily.sans],
        proxima_regular: [
          'proxima_nova_rgregular',
          ...defaultTheme.fontFamily.sans,
        ],
      },
      colors: {
        main: '#3778c2',
        secondary: '#5fb523',
        text: '#434b54',
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
  ],
};
