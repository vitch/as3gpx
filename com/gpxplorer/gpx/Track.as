package com.gpxplorer.gpx 
{

	/**
	 * @author Kelvin Luck
	 */
	public class Track 
	{
		
		// specified in spec but not included in my example file...
		// name
		// cmt
		// desc
		// src
		// link
		// number
		// type
		// extensions
		
		private var _segments:Array;
		public function get segments():Array
		{
			return _segments.concat();
		}
		
		public function Track(x:XML)
		{
			var ns:Namespace = x.namespace();
			
			_segments = [];
			var segmentXML:XML;
			for each (segmentXML in x.ns::trkseg) {
				_segments.push(new TrackSegment(segmentXML));
			}
		}
	}
}
