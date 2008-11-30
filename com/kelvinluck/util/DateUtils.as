package com.kelvinluck.util 
{

	/**
	 * @author Kelvin Luck
	 */
	public class DateUtils 
	{
		
		public static function fromIsoString(dateString:String):Date
		{
			try {
				// TODO: What is the meaning of the T and the Z?
				var parts:Array = dateString.split("T");
				var dateParts:Array = parts[0].split("-");
				var timeParts:Array = parts[1].substr(0, -1).split(":");
				var d:Date = new Date(dateParts[0], dateParts[1]-1, dateParts[2], timeParts[0], timeParts[1], timeParts[2]);
				return d;
			} catch (error:TypeError) {
				// invalid input string...
			}
			return null;
		}
		
		public static function fromSeconds(seconds:int):Date
		{
			if (seconds > 0) {
				return new Date(seconds * 1000);
			}
			return null;
		}
	}
}
