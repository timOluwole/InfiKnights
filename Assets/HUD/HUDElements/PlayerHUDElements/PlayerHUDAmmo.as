﻿package Assets.HUD.HUDElements.PlayerHUDElements {
	
	import Assets.HUD.HUDElements.HUDElement;
	import Events.WeaponEvent;
	import flash.display.MovieClip;
	import flash.text.TextField;
	import Global.Game;
	
	public class PlayerHUDAmmo extends HUDElement {
		
		private var ammoBar:MovieClip;
		private var currentAmmoText:TextField;
		private var maximumAmmoText:TextField;
		private var container:MovieClip;
		private var defaultAmmoBarWidth:Number;
		private var ammoSeparators:Array;

		public function PlayerHUDAmmo() {
			ammoSeparators = new Array();
			
			Game.STAGE.addEventListener(WeaponEvent.WEAPON_CHANGE, updateWeaponAmmo);
			Game.STAGE.addEventListener(WeaponEvent.WEAPON_FIRE, updateWeaponAmmo);
		}
	
		public override function setUpComponents() {
			ammoBar = this["AmmoBar"];
			currentAmmoText = this["CurrentAmmo"];
			maximumAmmoText = this["MaximumAmmo"];
			container = this["ContainerBox"];
			
			defaultAmmoBarWidth = ammoBar.width;
		}
		
		private function updateWeaponAmmo(W:WeaponEvent):void {		
			var currentAmmo:uint = W.weapon.getCurrentAmmo();
			var maximumAmmo:uint = W.weapon.getMaximumAmmo();
			
			if (maximumAmmo > 0) {	
				this.visible = true;
				if (W.type == WeaponEvent.WEAPON_CHANGE) {
					changeSeparators(maximumAmmo);
				}		
			
				currentAmmoText.text = currentAmmo.toString();
				maximumAmmoText.text = maximumAmmo.toString();
				
				ammoBar.width = (currentAmmo / maximumAmmo) * defaultAmmoBarWidth;
			} else {
				this.visible = false;
				currentAmmoText.text = "-";//"∞";
				maximumAmmoText.text = "-";//"∞";
				
				ammoBar.width = 0;
			}
		}
	
		private function changeSeparators(maximumAmmo:uint):void {
			for each (var separator:MovieClip in ammoSeparators) {
				container.removeChild(separator);
			}		
			
			ammoSeparators.length = 0;
		
			if (maximumAmmo > 0) {
				ammoSeparators.length = 0;
				var separatorDistance:Number = defaultAmmoBarWidth / (maximumAmmo / 10);
				
				for (var i:uint = 1; i < (maximumAmmo / 10); i++) {
					var newSeparator:PlayerHUDAmmoSeparator = new PlayerHUDAmmoSeparator();
					newSeparator.x = 5 + (i * separatorDistance);
					newSeparator.y = 0;
					container.addChild(newSeparator);
					ammoSeparators.push(newSeparator);
				}
			}
			
		}

	}
	
}
