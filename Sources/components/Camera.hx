package components;

import kha.graphics2.Graphics;
import kha.math.FastMatrix3;

class Camera {
	public var x:Float;
	public var y:Float;
	public var translate:FastMatrix3;
	public function new() {
		this.translate = FastMatrix3.identity();
	}

	public function set(graphics:Graphics) {
		graphics.pushTransformation(translate);
		graphics.translate(-this.x, -this.y);
	}

	public function unset(graphics:Graphics) {
		graphics.popTransformation();
	}
}