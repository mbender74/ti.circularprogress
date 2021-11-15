# ti.circularprogress

```js
 var circualrProgessView = cirularProgressModule.createView({
	height:100,
	width:100,
	trackColor:'#66ffffff',
	roundedCorners:true,
	progressThickness:0.2,
	trackThickness:0.5,
	gradientRotateSpeed:2.0,
	glowAmount:0.5,
	progressValue:0.0
 });

 circualrProgessView.updateProgress({
	progress:0.1
 });
 ```


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
