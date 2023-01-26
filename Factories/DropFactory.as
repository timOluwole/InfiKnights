package Factories {
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import Enemies.Beetle;
	import HUD.EnemyHUD;
	import Global.Game;
	import Utilities.Maths;
	
	public class DropFactory {

		private var healSpawnTimer:Timer;
		private var buffSpawnTimer:Timer;
		private var allySpawnTimer:Timer;
		private var skillSpawnTimer:Timer;		
		private var lastBuffSpawned:String;		
		private var score:uint;
		
		public function DropFactory() {
			score = 0;
			healSpawnTimer.addEventListener(TimerEvent.TIMER, spawnHeal);
			buffSpawnTimer.addEventListener(TimerEvent.TIMER, spawnBuff);
			Game.STAGE.addEventListener(UnitEvent.UNIT_TAKE_DAMAGE, listenForDamage);
		}
	
		private function updateScore(G:GameEvent):void {
			if (G) {
				score = G.value;
				scoreBasedTimers();
			}
		}
	
		private function scoreBasedTimers():void {
			if (score == 10) {			
				var initialHealSpawnWait:uint = Maths.minutes(1);
				healSpawnTimer = new Timer(initialHealSpawnWait);			
				healSpawnTimer.start();	
				
				var initialBuffSpawnWait:uint = Maths.scatter10Percent(Maths.minutes(2));
				buffSpawnTimer = new Timer(initialBuffSpawnWait);			
				buffSpawnTimer.start();			
			}
		}
	
		private function spawnHeal(T:TimerEvent):void {
			// spawn heal
		}
	
		private function spawnBuff(T:TimerEvent):void {
			
		}
	
		private function listenForDamage(U:UnitEvent):void {
			if (U) {
				
			}
		}

	}
	
}
