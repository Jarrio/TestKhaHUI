//import * as fs from 'fs'
//const electron = require('electron');
const fs = require('fs');
//const dialog = electron.dialog;

let project = new Project('New Project');
project.addAssets('Assets/**');
project.addShaders('Shaders/**');
project.addSources('Sources');
project.addLibrary('aidenecs');
project.addLibrary('haxeui-core');
project.addLibrary('haxeui-kha');
project.addLibrary('electron');
project.addLibrary('hxnodejs');
project.addDefine('kha_live_reload');

// project.targetOptions.html5.expose = {
// 	openDialog: (method, config) => electron.ipcRenderer.invoke('dialog', method, config)
// }

callbacks.postBuild = () => {
	console.info('here ');
	try {
		//console.dir(project);
		fs.copyFileSync('./build/debug-html5/custom/electron.js', './build/debug-html5/electron.js');
		fs.copyFileSync('./build/debug-html5/custom/preload.js', './build/debug-html5/preload.js');
		// file written successfully
	} catch (err) {
		console.error(err);
	}
}
resolve(project);
