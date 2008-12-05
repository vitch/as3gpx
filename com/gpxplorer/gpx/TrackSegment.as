package com.gpxplorer.gpx 
{

	/**
	 * @author Kelvin Luck
	 */
	public class TrackSegment 
	{
		
		private var _trackPoints:Vector.<Waypoint>;

		public function get trackPoints():Vector.<Waypoint>
		{
			return _trackPoints.concat();
		}

		// extensions
		
		public function get averageSpeed():Number
		{
			var totalSpeed:Number = 0;
			var wp:Waypoint;
			var wp1:Waypoint;
			for each (wp in _trackPoints) {
				if (wp1) {
					totalSpeed += wp.getAverageSpeedBetween(wp1);
				}
				wp1 = wp;
			}
			return totalSpeed / _trackPoints.length;
		}
		
		// return matching waypoint??
		public function get minSpeed():Number
		{
			var minSpeed:Number = Number.MAX_VALUE;
			var minSpeedWaypoint:Waypoint;
			var wp:Waypoint;
			var wp1:Waypoint;
			var s:Number;
			for each (wp in _trackPoints) {
				if (wp1) {
					s = wp.getAverageSpeedBetween(wp1);
					if (s < minSpeed) {
						minSpeed = s;
						minSpeedWaypoint = wp;
					}
				}
				wp1 = wp;
			}
			//return minSpeedWaypoint;
			return minSpeed;
		}

		// return matching waypoint??
		public function get maxSpeed():Number
		{
			var maxSpeed:Number = Number.MIN_VALUE;
			var maxSpeedWaypoint:Waypoint;
			var wp:Waypoint;
			var wp1:Waypoint;
			var s:Number;
			for each (wp in _trackPoints) {
				if (wp1) {
					s = wp.getAverageSpeedBetween(wp1);
					if (s > maxSpeed) {
						maxSpeed = s;
						maxSpeedWaypoint = wp;
					}
				}
				wp1 = wp;
			}
			//return maxSpeedWaypoint;
			return maxSpeed;
		}

		// in meters
		public function get distanceTravelled():Number
		{
			var totalDistance:Number = 0;
			
			var wp1:Waypoint;
			var wp:Waypoint;
			for each (wp in _trackPoints) {
				if (wp1) {
					totalDistance += wp.getDistanceTo(wp1);
				}
				wp1 = wp;
			}
			return totalDistance;
		}

		// in meters
		public function get distanceBirdFlies():Number
		{
			return firstWaypoint.getDistanceTo(lastWaypoint);
		}
		
		// in seconds
		public function get totalTime():Number
		{
			return lastWaypoint.getTimeSince(firstWaypoint);
		}

		private function get firstWaypoint():Waypoint
		{
			return _trackPoints[0];
		}

		private function get lastWaypoint():Waypoint
		{
			return _trackPoints[_trackPoints.length-1];
		}

		public function TrackSegment(x:XML=null, trackPoints:Vector.<Waypoint> = null)
		{
			if (x) {
				init(x);
			} else if (trackPoints) {
				_trackPoints = trackPoints;
			}
		}
		
		private function init(x:XML):void
		{
			_trackPoints = new Vector.<Waypoint>();
			
			//var lastWaypoint:Waypoint;

			var ns:Namespace = x.namespace();
			
			var waypoint:Waypoint;
			var waypointXML:XML;
			for each (waypointXML in x.ns::trkpt) {
				waypoint = new Waypoint(waypointXML);
				_trackPoints.push(waypoint);
				/*
				if (lastWaypoint) {
					trace (
						'XML speed:', waypoint.speed, 
						'Distance:', waypoint.getDistanceTo(lastWaypoint) + 'm', 
						'Time:', waypoint.getTimeSince(lastWaypoint) + 's',
						'Calc speed:', waypoint.getAverageSpeedBetween(lastWaypoint)
					);
				}
				lastWaypoint = waypoint;
				 */
			}
		}
		
		public function toString():String
		{
			return '[TrackSegment] : ' + '\n'
				+ '\t' + _trackPoints.length + ' points' + '\n'
				+ '\t' + 'Average speed: ' + averageSpeed  + 'km/h\n'
				+ '\t' + 'Max speed: ' + maxSpeed + 'km/h\n'
				+ '\t' + 'Min speed: ' + minSpeed + 'km/h\n'
				+ '\t' + 'Distance travelled: ' + distanceTravelled/1000 + 'km\n'
				+ '\t' + 'Distance as bird flies: ' + distanceBirdFlies/1000 + 'km\n'
				+ '\t' + 'Total time: ' + totalTime/3600 + 'h\n'
				+ '\t' + 'Average overall speed (meaningless): ' + distanceTravelled * 3.6 / totalTime + 'km/h\n'
				;
		}
	}
}
