package com.gpxplorer.gpx 
{
	import com.esri.aws.awx.utils.Utils;	
	import com.kelvinluck.util.DateUtils;	
	
	/**
	 * @author Kelvin Luck
	 */
	public class Waypoint 
	{
		
		private var _lat:Number;
		public function get lat():Number
		{
			return _lat;
		}
		
		private var _lon:Number;
		public function get lon():Number
		{
			return _lon;
		}
		
		private var _ele:Number;
		public function get ele():Number
		{
			return _ele;
		}
		
		private var _time:Date;
		public function get time():Date
		{
			return _time;
		}
		
		// not in spec but in example file!
		private var _course:Number;
		public function get course():Number
		{
			return _course;
		}
		
		// not in spec but in example file!
		private var _speed:Number;
		public function get speed():Number
		{
			return _speed;
		}
		
		// magvar
		// geoidheight
		// name
		// cmt
		// desc
		// src
		// link
		// sym
		// type
		
		private var _fix:String;
		public function get fix():String
		{
			return _fix;
		}
		
		private var _sat:uint;
		public function get sat():uint
		{
			return _sat;
		}
		
		private var _hdop:int;
		public function get hdop():int
		{
			return _hdop;
		}
		
		// vdop
		// pdop
		// ageofdgpsdata
		// dgpsid
		// extensions

		public function Waypoint(x:XML)
		{	
			init(x);
		}
		
		// in meters
		public function getDistanceTo(wp:Waypoint):Number 
		{
			return Utils.distVincenty(wp.lat, wp.lon, _lat, _lon);
		}
		
		// in seconds
		public function getTimeSince(wp:Waypoint):Number
		{
			//trace(_time , '-', wp.time, '=>', (_time.getTime() - wp.time.getTime()) / 1000);
			return (_time.getTime() - wp.time.getTime()) / 1000;
		}
		
		// in km/h
		public function getAverageSpeedBetween(wp:Waypoint):Number
		{
			// 3600 seconds in an hour / 1000 meters in a km = 3.6
			return 3.6 * getDistanceTo(wp) / getTimeSince(wp);
		}
			
		private function init(x:XML):void
		{
			var ns:Namespace = x.namespace();
			
			_lat = x.@lat;
			_lon = x.@lon;
			_ele = x.ns::ele.toString();
			_time = DateUtils.fromIsoString(x.ns::time.toString());
			_course = x.ns::course.toString();
			_speed = x.ns::speed.toString();
			_fix = x.ns::fix.toString();
			_sat = x.ns::sat.toString();
			_hdop = x.ns::hdop.toString();
		}

		public function toString():String
		{
			return '[com.lucklaboratories.gpx.Waypoint]:\n' +
					'\tLatitude  : ' + _lat + '\n' +
					'\tLongitude : ' + _lon + '\n' +
					'\tElevation : ' + _ele + '\n' +
					'\tTime      : ' + _time + '\n' +
					'\tCourse    : ' + _course + '\n' +
					'\tSpeed     : ' + _speed + '\n' +
					'\tFix       : ' + _fix + '\n' +
					'\tSat       : ' + _sat + '\n' +
					'\tHDOP      : ' + _hdop + '\n';
		}
	}
}
