package systems;

import components.ui.MainView;
import haxe.ui.core.Screen;
import kha.Color;
import kha.Framebuffer;
import ui.UI;

typedef Pos = {
	var x:Int;
	var y:Int;
}

class KhaRender extends ecs.System {
	static var logo = ["1 1 1 1 111", "11  111 111", "1 1 1 1 1 1"];

	@:fastFamily var renders:{pos:Pos};
	
	override function onEnabled() {
		super.onEnabled();
		Screen.instance.addComponent(new MainView());
		
		var pos:Pos = {
			x: 500,
			y: 90
		}

		universe.setComponents(universe.createEntity(), pos);

		kha.System.notifyOnFrames(function(frames) {
			render(frames);
		});
	}

	function render(frames:Array<Framebuffer>):Void {
		final fb = frames[0];
		final g2 = fb.g2;
		final screen = haxe.ui.core.Screen.instance; 

		g2.begin(true, Color.White);
		screen.renderTo(g2);
		iterate(renders, {
			g2.color = Color.White;
			g2.fillRect(pos.x, pos.y, 20, 20);
		});

		
		g2.end();
	}
}