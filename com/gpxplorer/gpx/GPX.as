package com.gpxplorer.gpx 
{
	import com.kelvinluck.util.DateUtils;		
	/**
	 * @author Kelvin Luck
	 */
	public class GPX 
	{
		private var _version:String;
		public function get version():String
		{
			return _version;
		}
		
		private var _creator:String;
		public function get creator():String
		{
			return _creator;
		}
		
		private var _time:Date;
		public function get time():Date
		{
			return _time;
		}
		
		private var _bounds:Bounds;
		public function get bounds():Bounds
		{
			
			return _bounds;
		}
		
		private var _waypoints:Array;
		public function get waypoints():Array
		{
			return _waypoints.concat();
		}
		
		private var _routes:Array;
		public function get routes():Array
		{
			return _routes.concat();
		}
		
		private var _tracks:Vector.<Track>;

		public function get tracks():Vector.<Track>
		{
			return _tracks.concat();
		}
		
		public function GPX(x:XML)
		{
			var ns:Namespace = x.namespace();
			
			_version = x.@version;
			_creator = x.@creator;
			_time = DateUtils.fromIsoString(x.ns::metadata.time.toString());
			_bounds = new Bounds(x.ns::metadata.bounds[0]);
			
			_waypoints = [];
			_routes = [];
			_tracks = new Vector.<Track>();
			
			var trackXML:XML;
			
			for each (trackXML in x.ns::trk) {
				_tracks.push(new Track(trackXML));
			}
			
			//trace (version, creator, time);
		}
	}
}
