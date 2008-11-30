package com.gpxplorer.gpx {
	/**
	 * @author Kelvin Luck
	 */
	public class Bounds 	{				private var _minlat:Number;		public function get minlat():Number		{			return _minlat;		}				private var _minlon:Number;		public function get minlon():Number		{			return _minlon;		}				private var _maxlat:Number;		public function get maxlat():Number		{			return _maxlat;		}				private var _maxlon:Number;		public function get maxlon():Number		{			return _maxlon;		}		public function Bounds(x:XML)		{			_minlat = x.@minlat;			_minlon = x.@minlon;			_maxlat = x.@maxlat;			_maxlon = x.@maxlon;		}				public function toString():String		{			return '[com.gpxplorer.gpx.Bounds: ' + _minlat + ', ' + _minlon + ' -> ' + _maxlat + ', ' + _maxlon + ']';		}	}
}
