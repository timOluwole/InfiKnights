package Assets.Projectiles {
	
	import Assets.Particles.HitParticles.BugHitParticle;
	import Events.ProjectileEvent;
	import Global.Game;
	
	
	public class PistolBullet extends Bullet {

		public function PistolBullet(sourceTeam:String, damage:int) {
			super(sourceTeam, damage, 800, 3);
			this.addEventListener(ProjectileEvent.PROJECTILE_HIT_COMPLETE, projectileHitComplete);
		}		
	
		private function projectileHitComplete(p:ProjectileEvent):void {
			var splatter:uint = 10 + (Math.random() * 5);
			
			for (var i:uint = 0; i < splatter; i++) {
				Game.UNIT_LAYER.addChild(new BugHitParticle(this.x, this.y));
			}
			
			this.deleteThis();
		}

	}
	
}
