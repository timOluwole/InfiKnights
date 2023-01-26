﻿package Assets.Units.AlliedUnits {
	
	import Assets.Units.Unit;
	import Assets.Weapons.Weapon;
	import Data.Stats.*;
	import Events.EnemyEvent;
	import Events.WeaponEvent;
	import flash.geom.Point;
	import Global.Directions;
	import Global.Game;
	import Global.Teams;
	import Utilities.UtilMaths;
	
	public class InfiKnight extends Unit {
		
		public var equippedWeaponIndex:int;
		public var weaponsList:Array;
		
		public function InfiKnight() {
			super(Teams.ALLY);
			
			this.scaleX = 0.5;
			this.scaleY = 0.5;			
			
			this.walkSpeed = new FlexiStat(300);
			this.maximumTurnSpeed = new BasicStat(180);
			
			equippedWeaponIndex = 0;
			weaponsList = new Array();
			
			if (!Game.STAGE.hasEventListener(EnemyEvent.ENEMY_LOCATE_KNIGHT)) {
				Game.STAGE.addEventListener(EnemyEvent.ENEMY_LOCATE_KNIGHT, findKnight);
			}
		}
	
		public function stand(facingAngle:Number):void {
			if (currentLabel != "standing") {			
				gotoAndStop("standing");
			}
		
			face(facingAngle);
		}
	
		public function fireWeapon():void {
			var weapon:Weapon = getEquippedWeapon();
			if (weapon) {
				if (weapon.canFire) {
					weapon.fire();
				}
			}
		}
	
		public function findKnight(e:EnemyEvent):void {
			if (e) {
				if (e.enemy) {
					var distance:Number = UtilMaths.distance(new Point(e.enemy.x, e.enemy.y), new Point(this.x, this.y));
					
					if (distance <= e.enemy.visionRange || e.enemy.visionRange == -1) {
						e.enemy.brain.target = this;
					}
				}
			}
		}
	
		public function getEquippedWeapon():Weapon {
			return weaponsList[equippedWeaponIndex];
		}
	
		public function cycleThroughWeapons(direction:int):void {
			this.removeChild(weaponsList[equippedWeaponIndex]);
			equippedWeaponIndex += direction;
			if (equippedWeaponIndex < 0) {
				equippedWeaponIndex = weaponsList.length - 1;
			} else if (equippedWeaponIndex >= weaponsList.length) {
				equippedWeaponIndex = 0;
			}
			this.addChild(weaponsList[equippedWeaponIndex]);
			weaponsList[equippedWeaponIndex].dispatchEvent(new WeaponEvent(WeaponEvent.WEAPON_CHANGE, weaponsList[equippedWeaponIndex], null, null, direction));
		}
	
		public function pickUpWeapon(weapon:Weapon):void {
			weaponsList.push(weapon);
			
			if (weaponsList.length == 1) {		
				this.addChild(weaponsList[equippedWeaponIndex]);	
				weapon.dispatchEvent(new WeaponEvent(WeaponEvent.WEAPON_CHANGE, weapon));
			}
		
			Game.STAGE.dispatchEvent(new WeaponEvent(WeaponEvent.WEAPON_ACQUIRE, weapon, null, this));
		}
		
	}
	
}
