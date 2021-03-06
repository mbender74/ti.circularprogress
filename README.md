# ti.circularprogress

Circular progress view for Titanium.
Using https://github.com/kaandedeoglu/KDCircularProgress (iOS) and https://github.com/owl-93/Determinate-Progress-View/ (Android).


## Demo

<img src="./assets/demo.gif" width="210" height="320" alt="Example iOS" /> <img src="./assets/demo_android.gif" width="241" height="322" alt="Example android" />

## Installation

* Download module
* add `<module>ti.circularprogress</module>` to `tiapp.xml`

### Android

Add this to your build.gralde:
```
repositories {
maven { url 'https://jitpack.io' }
}
```

and you have to target min 22 in your tiapp.xml:
```xml
<uses-sdk android:minSdkVersion="22" />
```


## Example :slightly_smiling_face:

### Alloy
```xml
<CircularProgress module="ti.circularprogress"/>
```

### Classic
```js
var cirularProgressModule = require("ti.circularprogress");
var win = Ti.UI.createWindow({backgroundColor: '#fff'});
var btn = Ti.UI.createButton({title: "animate from 0", bottom: 50});
var btn2 = Ti.UI.createButton({title: "set random value", bottom: 100});
var btn3 = Ti.UI.createButton({title: "change track", bottom: 150});
var lbl = Ti.UI.createLabel({
	color: '#bbffffff', width: Ti.UI.SIZE,height: Ti.UI.SIZE, textAlign: Ti.UI.TEXT_ALIGNMENT_CENTER,
	font: { fontFamily: 'Arial', fontSize: 44, fontWeight: 'bold' },
	shadowColor: '#77000000',	shadowRadius: 4, shadowOffset: {x: 1, y: 1}, text: ''
});

var circularProgessView = cirularProgressModule.createCircularProgress({
	height: 200,
	width: 200,
	trackColor: '#777',
	progressColor: ['#f00', "#ff0"],
	roundedCorners: false,
	progressWidth: 20,
	trackWidth: 10,
	duration: 150,
	progressValue: 10,
	gradientRotateSpeed: 1.0,
	glowAmount: 0.2,
	startingAngle: 90
});

circularProgessView.addEventListener('done', function() {
	console.log("reached end value");
	lbl.text = circularProgessView.progressValue + "%";
});

circularProgessView.addEventListener('progress', function(e) {
	console.log("progress: ", e.progress);
	lbl.text = Math.round(e.progress) + "%";
});

btn.addEventListener("click", function() {
	circularProgessView.animateProgress({
		startValue: 0,
		endValue: 100,
		duration: 2000
	});
})

btn2.addEventListener("click", function() {
	var rnd = Math.round(Math.random() * 100);
	circularProgessView.progressValue = rnd;
	lbl.text = rnd + "%";
})

btn3.addEventListener("click", function() {
	circularProgessView.trackWidth = Math.round(Math.random() * 10) + 10;
	circularProgessView.progressWidth = Math.round(Math.random() * 10) + 10;
	circularProgessView.roundedCorners = circularProgessView.roundedCorners == true ? circularProgessView.roundedCorners = false : circularProgessView.roundedCorners = true;

	console.log("trackWidth: ", circularProgessView.trackWidth);
	console.log("progressWidth: ", circularProgessView.progressWidth);
	console.log("roundedCorners: ", circularProgessView.roundedCorners);
})

win.add([circularProgessView, btn, btn2, btn3, lbl])
win.open();
```

## Properties
* `trackColor` - background track color
* `progressColor` - color of the progress bar. String or array `["start", "middle", "end"]` for gradient
* `roundedCorners` - boolean. flat or rounded corners
* `progressWidth` - width of the progress bar
* `trackWidth` - width of the background track
* `duration` - duration for animation. If 0 `progressValue` won't animate a change
* `progressValue` - current value of the progressbar (0 - 100)
* `startingAngle` - zero position (default top) (0-359)

## Events
* `progress` - returns event.progress
* `done` - value is set or animation is done

## Methods
* `animateProgress({startValue, endValue, duration})`

## Authors

- Marc Bender ([@mbender74](https://github.com/mbender74/))
- Michael Gangolf ([@MichaelGangolf](https://twitter.com/MichaelGangolf) / [Web](http://migaweb.de))
