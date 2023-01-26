package Events {
	
	import Assets.Units.Unit;
	import flash.events.Event;
	
	public class UnitEvent extends Event {
		
		public static const UNIT_ATTACK_HIT_CHECK:String = "UNIT_ATTACK_HIT_CHECK";
		public static const UNIT_DESPAWN:String = "DESPAWN";
		public static const UNIT_DIE:String = "DIE";
		public static const UNIT_HEAL_DAMAGE:String = "HEAL_DAMAGE";
		public static const UNIT_TAKE_DAMAGE:String = "TAKE_DAMAGE";
		public static const UNIT_UPDATE_HEALTH:String = "UPDATE_HEALTH";

		public var unit:Unit; 
		public var healthChange:int; 
		
		public function UnitEvent( type:String, unit:Unit, healthChange:int = 0, bubbles:Boolean = true, cancelable:Boolean = false) {
			super( type, bubbles, cancelable );
			this.unit = unit;
			this.healthChange = healthChange;
		}

	}
	
}
