// default: https://github.com/vercel/hyper/blob/master/app/config/config-default.js

module.exports = {
  config: {
    shell: "/usr/bin/fish",
    fontFamily: '"Comic Code", "JetBrains Mono", monospace',
    uiFontFamily: '"Comic Code", "JetBrains Mono", monospace',
    cursorBlink: true,
    scrollback: 10000, // default: 1000
    webGLRenderer: true,
    webLinksActivationKey: "ctrl",
    bell: false,
  },

  plugins: [
    "hyper-snazzy", // theme
    "hypercwd",
    "hyper-tab-icons-plus",
  ],

  localPlugins: [],

  // default: https://github.com/vercel/hyper/tree/master/app/keymaps
  keymaps: {
    // Example
    // 'window:devtools': 'cmd+alt+o',
    "zoom:in": "ctrl+shift+-",
    "tab:next": ["shift+right"],
    "tab:prev": ["shift+left"],
  },
};
