const { defineConfig } = require("cypress");
const { configureAllureAdapterPlugins } = require('@mmisty/cypress-allure-adapter/plugins');

module.exports = defineConfig({
  e2e: {
    setupNodeEvents(on, config) {
      configureAllureAdapterPlugins(on, config);
      return config;
    },
    env: {
      allure: true,
      allureAddVideoOnPass: true,
      allureCleanResults: true
    },
    viewportWidth: 1280,
    viewportHeight: 720,
    baseUrl: "https://loginxp.vercel.app",
    video: true
  }
});
