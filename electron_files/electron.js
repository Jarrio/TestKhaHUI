'use strict';

const electron = require('electron');
const dialog = electron.dialog;
const fs = require('fs');
const path = require('path');
const app = electron.app;
const BrowserWindow = electron.BrowserWindow;

var mainWindow = null;

electron.ipcMain.on('show-window', (event, arg) => {
	if (arg.width && arg.height) mainWindow.setContentSize(arg.width, arg.height);
	if (arg.title) mainWindow.setTitle(arg.title);
	if (arg.x != -1 && arg.y != -1) {
		mainWindow.setPosition(arg.x, arg.y);
	}
	else {
		mainWindow.center();
	}
	mainWindow.show();
});

electron.ipcMain.on('load-blob', (event, arg) => {
	let url = null;
	if (path.isAbsolute(arg.file)) {
		url = arg.file;
	}
	else {
		url = path.join(__dirname, arg.file);
	}
	try {
		const data = fs.readFileSync(url);
		mainWindow.webContents.send('blob-loaded', {id: arg.id, data: data});
	}
	catch (err) {
		mainWindow.webContents.send('blob-failed', {id: arg.id, url: url, error: err});
	}
});

app.on('window-all-closed', function () {
	app.quit();
});

electron.ipcMain.handle('dialog', (event, params) => {
	console.log(method);
	console.log(params);
	dialog.showOpenDialogSync(null, params).then(filePaths => {
		mainWindow.webContents.send('open-file-paths', filePaths)
	});
	
	let data = {
		title,
		label,
		properties,
		paths
	}
	event.sender.send('dialogFinished', data);
});

app.on('ready', function () {
	mainWindow = new BrowserWindow({
		width: 1600, height: 800,
		show: false, useContentSize: true, autoHideMenuBar: true,
		icon: app.getAppPath() + '/favicon' + '.ico',
		webPreferences: {
			contextIsolation: true,
			preload: path.join(app.getAppPath(), 'preload.js')
		}
	});
	mainWindow.loadURL('file://' + app.getAppPath() + '/index.html');
	mainWindow.on('closed', function() {
		mainWindow = null;
	});
});
