// Future versions of Hyper may add additional config options,
// which will not automatically be merged into this file.
// See https://hyper.is#cfg for all currently supported options.

module.exports = {
	config: {
		// Choose either "stable" for receiving highly polished,
		// or "canary" for less polished but more frequent updates
		updateChannel: 'stable',

		// default font size in pixels for all tabs
		fontSize: 16,

		// font family with optional fallbacks
		fontFamily: 'Hack, Consolas, "Lucida Console", monospace',

		// terminal cursor background color and opacity (hex, rgb, hsl, hsv, hwb or cmyk)
		cursorColor: '#fff',

		// `BEAM` for |, `UNDERLINE` for _, `BLOCK` for █
		cursorShape: 'BEAM',

		// set to true for blinking cursor
		cursorBlink: false,

		// custom padding (css format, i.e.: `top right bottom left`)
		padding: '12px 14px',

		shell: 'C:\\Program Files\\Git\\git-cmd.exe',

		// for setting shell arguments (i.e. for using interactive shellArgs: ['-i'])
		// by default ['--login'] will be used
		shellArgs: ['--command=usr/bin/bash.exe', '-l', '-i'],

		// for environment variables
		env: {
			TERM: 'cygwin'
		},

		// set to false for no bell
		bell: false,

		// if true, selected text will automatically be copied to the clipboard
		copyOnSelect: false,

		// for advanced config flags please refer to https://hyper.is/#cfg

		// --- Plugin configs ----
	},

	plugins: [
		'gitrocket',
		'hyper-broadcast',
		'hyper-firewatch',
		'hyperborder',
		'hyperlinks',
		'hyperterm-alternatescroll',
		'hyperterm-cursor',
	],

	localPlugins: [],

	keymaps: {
		// Example
		'window:devtools': 'cmd+alt+o',
	}
};
