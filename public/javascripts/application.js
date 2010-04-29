// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
var map;
var centerLatitude = 35.08300
var centerLongitude = -106.64886
var startZoom = 9;
var markerHash={};
var currentFocus=false;


function init() {
    map = new GMap($("map"));
}