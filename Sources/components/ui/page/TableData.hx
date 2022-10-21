package components.ui.page;

import util.Electron;
import js.Browser;
import kha.Assets;
import haxe.Json;
import haxe.ui.containers.dialogs.Dialog.DialogButton;
import haxe.ui.containers.dialogs.Dialogs.FileDialogTypes;
import haxe.ui.containers.dialogs.OpenFileDialog;
import haxe.ui.events.MouseEvent;
import haxe.ui.containers.VBox;

@:build(haxe.ui.macros.ComponentMacros.build("../Assets/ui/tabledata.xml"))
class TableData extends VBox {
	public function new() {
		super();
	}

	@:bind(load_file, MouseEvent.CLICK)
	private function onOpen(event) {
		//Dialog.showOpenDialogSync(null, {});
		var dialogConfig = {
			title: 'Select a file',
			buttonLabel: 'This one will do',
			properties: ['openFile']
		};
		var foo = Main.electron.openDialog('select', 'open', ['openFile']);
		trace(foo);
		
		//EElectron.exposed.
		//EElectron.exposed.showDialog('showOpenDialog', dialogConfig).then(result -> trace(result));

		//var file = Json.parse(Assets.blobs.data_json);
	}
}
