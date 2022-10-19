package components.ui;

import haxe.ui.containers.SideBar;

@:build(haxe.ui.macros.ComponentMacros.build("../Assets/ui/sidemenu.xml"))
class SideMenu extends SideBar {
	public function new() {
		super();
		width = 250;
		percentHeight = 100;
		
	}
}