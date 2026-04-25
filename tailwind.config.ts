import type { Config } from 'tailwindcss'

const config: Config = {
  content: [
    './src/pages/**/*.{js,ts,jsx,tsx,mdx}',
    './src/components/**/*.{js,ts,jsx,tsx,mdx}',
    './src/app/**/*.{js,ts,jsx,tsx,mdx}',
  ],
  theme: {
    extend: {
      fontFamily: {
        pretendard: ['Pretendard', 'sans-serif'],
      },
      colors: {
        brand: {
          blue: '#3B6EE8',
          'blue-light': '#EEF3FD',
          'blue-dark': '#2453C5',
          orange: '#F97316',
          'orange-light': '#FFF3EA',
        },
      },
      borderRadius: {
        '2xl': '14px',
        '3xl': '20px',
      },
    },
  },
  plugins: [],
}

export default config
