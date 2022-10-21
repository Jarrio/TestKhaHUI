package util;

import js.lib.Promise;
import js.Browser;
import js.html.Window;


extern class Electron {
	public static var window(get, never):Window;
	static inline function get_window():Window {
		return Browser.window;
	}

	public static var exposed(get, never):TExposed;
	static inline function get_exposed():TExposed {
		var window:Dynamic = Browser.window;
		return window.electron;
	}
}

@:native
extern class TExposed {
	public function openDialog(title:String, label:String, properties:Array<String>):Promise<Dynamic>;
}

typedef TOpenDialogParams = {
	var title:String;
	var buttonLabel:String;
	var properties:Array<String>;
};

enum abstract DialogOptions(String) {
	var showOpenDialog;
}