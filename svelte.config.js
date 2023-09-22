import adapter from '@sveltejs/adapter-static';
import {
  vitePreprocess
} from '@sveltejs/kit/vite';


/** @type {import('@sveltejs/kit').Config} */
const config = {
  // extensions: ['.svelte', '.md'],
  preprocess: vitePreprocess(),

  kit: {
    adapter: adapter(),
    paths: {
      base: process.env.NODE_ENV === 'production' ? '/ts-webcrawler-docs' : '',
    }


    //   prerender: {
    //     entries: ['*'],
    //     handleMissingId: 'warn',
    //   },
  },
};

export default config;
