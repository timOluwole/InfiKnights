package Assets.Containers {
	
	import flash.display.MovieClip;
	
	public class DepthLayer extends MovieClip {

		public function DepthLayer() {
			
		}
	
		public function setDepth(depth:int):void {
			setChildIndex(this, depth);
		}

	}
	
}
