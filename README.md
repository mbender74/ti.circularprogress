# ti.circularprogress

```js
 var circualrProgessView = cirularProgressModule.createView({
	height:100,
	width:100,
	trackColor:'#66ffffff',
	roundedCorners:true,
	progressWidth:0.5,
	tackWidth:0.8,
	duration:0.0, 
	// when duration:0.0 -> circualrProgessView.progressValue=value is not animated, else animated
	gradientRotateSpeed:1.0,
	glowAmount:0.8,
	progressValue:0.0
 });

 circualrProgessView.addEventListener('progressDone', function() {
	//console.log("+++++++++++++++ circualrProgessView progressDone");
 });

 circualrProgessView.addEventListener('progressing', function(e) {
	//console.log("+++++++++++++++ circualrProgessView progressing: "+e.progressValue);
 });

 circualrProgessView.progressValue = 0.5;

 circualrProgessView.animateProgress({
	endValue:1.0,
	duration:2
 });

 circualrProgessView.animateProgress({
   startValue:0.0,
   endValue:1.0,
   duration:1
 });

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
