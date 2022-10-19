package ui;

import haxe.ui.Toolkit;
import haxe.ui.containers.VBox;

@:build(haxe.ui.ComponentBuilder.build("../Assets/ui.xml"))
class UI extends VBox {
	public function new() {
		super();
		// theme.onChange = function(e) {
		// 	trace(theme.selectedItem.value);
		// 	Toolkit.theme = theme.selectedItem.value;
		// }
	}
}
