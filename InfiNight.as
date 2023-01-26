package {
	
	import Assets.Cam.VCam;
	import Assets.HUD.PlayerHUD;
	import Assets.Units.AlliedUnits.InfiKnight;
	import Assets.Weapons.MeleeWeapons.Katana;
	import Assets.Weapons.RangedWeapons.*;
	import Controllers.HumanController;
	import Factories.EnemyFactory;
	import flash.display.MovieClip;
	import flash.display.StageScaleMode;
	import Global.Game;
	import Objects.GameRun;
	
	
	public class InfiNight extends MovieClip {

		public function InfiNight() {
			Game.SetUpStage(stage, this);
			var knight:InfiKnight = new InfiKnight();
			var controller:HumanController = new HumanController(knight);
			var vCam:VCam = new VCam();
			vCam.attachToKnight(knight);
			
			var hud:PlayerHUD = new PlayerHUD(knight);
			knight.initialiseHealth(500);
			addChild(vCam);						
			vCam.addChild(hud);
				
			var enemyFactory:EnemyFactory = new EnemyFactory();
			stage.scaleMode = StageScaleMode.NO_BORDER;
			var run:GameRun = new GameRun();
			
			knight.pickUpWeapon(new Katana());
			knight.pickUpWeapon(new Pistol());
			knight.pickUpWeapon(new Shotgun());			
		}

	}
	
}
