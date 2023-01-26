package Assets.Units.EnemyUnits {
	
	import Assets.Units.Unit;
	import Controllers.EnemyBrain;
	import Data.AttackData.AttackData;
	import Global.Teams;
	
	public class EnemyUnit extends Unit {

		public var brain:EnemyBrain;
		public var visionRange:int;
		public var periphery:uint;
		
		public function EnemyUnit() {
			super(Teams.ENEMY);
			
			this.brain = new EnemyBrain(this);
		}
	
		public function attack(selectedAttack:AttackData):void {
			if (selectedAttack) {
				this.gotoAndPlay(selectedAttack.getAttackFrame());
			}
		}
	}
	
}
