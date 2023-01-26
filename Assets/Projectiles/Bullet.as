package Assets.Projectiles {
	
	public class Bullet extends Projectile {
		
		public function Bullet(sourceTeam:String, damage:int, speed:int, maximumLifeTimeSeconds:int) {	
			super(sourceTeam, damage, speed, maximumLifeTimeSeconds);		
			this.scaleX = 0.5;
			this.scaleY = 0.5;			
		}
	}
	
}
