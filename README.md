# iOS-Google-Panoramio-API
A project tutorial to demonstrate how to use Google Panoramio API with CLLocationCoordinate2D

# What is this?
With this project you can make (see L3SDKPanoramioHelper) and consume (see HTTPPanoramioRK) a REST api of Google Panoramio, by using latitude and longitude coordinates.

The JSON structure response has been "mapped" with a set of Objective-C classes:

L3SDKPanoramioPanoramas
<br/>
---> L3SDKPanoramioMapLocation
<br/>
---> L3SDKPanoramioPhoto

Within this project I also used another my project to show Panoramio images on a slideshow:
<br/>
https://github.com/alchimya/iOS-Images-Slideshow
<br/>
If you want to learn more about iOS and RestKit see this tutorial
<br/>
https://github.com/alchimya/iOS-RestKit-Node-Express
<br/>
For further details of Panoramio API see:
<br/>
http://www.panoramio.com/api/data/api.html

# Project structure

- Here you can find all classes and helpers to manage Panoramio.
<br/>
--->L3SDK
<br/>
------> Google
<br/>
------------> Panoramio
<br/>
- Here you can find an useful UIIageView sublass to implement an images slideshow.
<br/>
If you want to learn more about this class see:
<br/>
https://github.com/alchimya/iOS-Images-Slideshow
<br/>
------>L3SDK
<br/>
---------> UIKit
        
- Here you can find all classes and helpers to manage Rest request and response with RestKit.
If you want to learn more about this classes see
<br/>
https://github.com/alchimya/iOS-RestKit-Node-Express
<br/>
------>RESTSDK


# How to use

The following instructions are for the L3SDK\Google\Panoramio\L3SDKPanoramioHelper class.


<h5>methods</h5>
  name                           |     type        |   description    
---------------------------------| ----------------|-------------------------------------------------------------------
mapRectWithCoordinate            | MKMapRect       | it makes a MKMapRect with coordinate and a side of square (km)
getPanoramioAPIUrlWithOptions    | NSString        | it makes a panoramio API url by using options params (see L3SDKPanoramioAPIOptions)
getPanoramioRESTPathWithOptions  | NSString        | it makes a panoramio API rest path by using options params (see L3SDKPanoramioAPIOptions)



<h5>example</h5>
```objectivec
  //makes CLLocationCoordinate2D with userinput data
  CLLocationCoordinate2D coordinate=CLLocationCoordinate2DMake(
                          40.758896,
                          -73.985130);
  
  //init a panoramio options object
  L3SDKPanoramioAPIOptions*options=[[L3SDKPanoramioAPIOptions alloc]init];
  //sets panoramio coordinates and a side of a square (km)
  //for a complete description of the Panoramio API params (options) see
  //http://www.panoramio.com/api/data/api.html
  options.sideSquarePanoramio=[self.txtSuqareSide.text doubleValue];
  options.pointCoordinate=coordinate;
  
  //gets a panoramio api rest path with options
  //you can consume it with your favourite REST iOS framework
  NSString*restPath=[L3SDKPanoramioHelper getPanoramioRESTPathWithOptions:options];
```

<br/>
![ScreenShot](https://raw.github.com/alchimya/iOS-Google-Panoramio-API/master/screenshots/iOS-Google-Panoramio-API.gif)
