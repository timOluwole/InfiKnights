package Utilities {
	import flash.utils.*;
	
	public class UtilClass {

		public static function getClass(obj:Object):Object {
			return getDefinitionByName(getQualifiedClassName(obj));
		}
	
	}
	
}
