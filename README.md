# ti.circularprogress

## Demo

<img src="./demo.gif" width="135" height="293" alt="Example iOS" />


## Example :slightly_smiling_face: 
```js
 var circularProgessView = cirularProgressModule.createView({
    height:100,
    width:100,
    trackColor:'#66ffffff', // at the moment not active
    roundedCorners:true,
    progressWidth:0.5,
    tackWidth:0.8,
    duration:0.0, 
    // when duration:0.0 -> circualrProgessView.progressValue=value is not animated
    // else animated - default (intern) set on 0.0
    gradientRotateSpeed:1.0,
    glowAmount:0.8,
    progressValue:0.0 // default (intern) 0.0
 });

 circularProgessView.addEventListener('progressDone', function() {
    //console.log("+++++++++++++++ circualrProgessView progressDone");
 });

 circularProgessView.addEventListener('progressing', function(e) {
    //console.log("+++++++++++++++ circualrProgessView progressing: "+e.progressValue);
 });

 circularProgessView.progressValue = 0.5;

 // animate from the current progressValue to endValue
 circularProgessView.animateProgress({
    endValue:1.0,
    duration:2
 });

 // animate from the startValue to endValue
 circularProgessView.animateProgress({
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
