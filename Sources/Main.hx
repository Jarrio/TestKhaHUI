package;

import js.Browser;
import util.Electron.TExposed;
import haxe.ui.ComponentBuilder;
import haxe.ui.core.Screen;
import haxe.ui.macros.ComponentMacros;
import ecs.Universe;
import kha.Assets;
import kha.Color;
import kha.Framebuffer;
import kha.Scheduler;
import kha.System;

class Main {
	static var universe:Universe;
	public static var electron:TExposed;
	static function update(): Void {
		universe.update(1 / 60);
	}

	public static function main() {
		System.start({title: "Project", width: 1600, height: 800, window: {x: 0, y: 550}}, function (_) {
			// Just loading everything is ok for small projects
			Assets.loadEverything(function () {
				haxe.ui.Toolkit.init();
				// Avoid passing update/render directly,
				// so replacing them via code injection works
				universe = Universe.create({
					entities: 1000,
					phases: [
						{
							name: 'main',
							systems: [
								systems.KhaRender
							]
						}
					]
				});

				var foo:Dynamic = Browser.window;
				Main.electron = foo.electron;
				trace(foo.electron);
				
				Scheduler.addTimeTask(function () { update(); }, 0, 1 / 60);
			});
		});
	}
}
