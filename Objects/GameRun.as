package Objects {
	import Global.Game;
	import Global.Teams;
	import Events.UnitEvent;
	import Events.GameEvent;
	
	public class GameRun {
		
		private var score:uint;

		public function GameRun() {
			score = 0;
			
			Game.STAGE.addEventListener(UnitEvent.UNIT_DIE, unitDies);
		}
	
		public function unitDies(U:UnitEvent):void {
			if (U.unit.getTeam() == Teams.ENEMY) {
				score++;
				Game.STAGE.dispatchEvent(new GameEvent(GameEvent.GAME_UPDATE_SCORE, score));
			}
		}

	}
	
}
