# ti.circularprogress

## Demo

<img src="./demo.gif" width="135" height="293" alt="Example iOS" />


## Example :slightly_smiling_face:
```js
var cirularProgressModule = require("ti.circularprogress");
var win = Ti.UI.createWindow({backgroundColor: '#fff'});
var btn = Ti.UI.createButton({title: "animate from 0",bottom: 0});
var btn2 = Ti.UI.createButton({title: "set random value",bottom: 50});
var lbl = Ti.UI.createLabel({text: "10%",color:"#000"});
var circularProgessView = cirularProgressModule.createCircularProgress({
	height: 200,
	width: 200,
	trackColor: '#777',
	progressColor: '#f0f',
	roundedCorners: false,
	progressWidth: 50,
	trackWidth: 10,
	duration: 0,
	maxValue: 100,
  progressValue: 10,
	// when duration:0.0 -> circualrProgessView.progressValue=value is not animated
	// else animated - default (intern) set on 0.0
	gradientRotateSpeed: 1.0,
	glowAmount: 0.8,
});

circularProgessView.addEventListener('done', function() {
	console.log("reached end value");
	lbl.text = circularProgessView.progressValue + "%";
});

circularProgessView.addEventListener('progress', function(e) {
  console.log("progress: ", e.progress);
	lbl.text = Math.round(e.progress) + "%";
	//console.log("+++++++++++++++ circualrProgessView progressing: "+e.progressValue);
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
win.add([circularProgessView, btn, btn2,lbl])
win.open();
 ```
## iOS
using: https://github.com/kaandedeoglu/KDCircularProgress


## Android

using: https://github.com/owl-93/Determinate-Progress-View/

```
repositories {
maven { url 'https://jitpack.io' }
}
```

```
<uses-sdk android:minSdkVersion="22" />
```
