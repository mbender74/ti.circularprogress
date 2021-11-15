//
//  TiCircularprogressViewProxy.swift
//  ti.circularprogress
//
//  Created by Your Name
//  Copyright (c) 2021 Your Company. All rights reserved.
//

import UIKit
import TitaniumKit

@objc(TiCircularprogressViewProxy)
class TiCircularprogressViewProxy: TiViewProxy {
    private var _duration: TimeInterval
    private var _progressValue: NSNumber

    @objc public var progressValue: NSNumber {
        get { return _progressValue }
        set {
        _progressValue = newValue
          self.replaceValue(newValue, forKey: "progressValue", notification: false)
          if circularprogressView != nil {
              if NSNumber(value:_duration) != 0.0 {
                  circularprogressView.animate(toAngle: (_progressValue.doubleValue).myclamp(lowerBound: 0.0, upperBound: 1.0) * 360.0, duration: _duration, relativeDuration: true, proxy:_viewProxy, completion: { result in
                      self.circularprogressView.pauseAnimation()
                      self.fireEvent("progressDone")
                      //print("go to next lvl", result)
                  })
              }
              else {
                  //self.circularprogressView.stopAnimation()
                  circularprogressView.progress = _progressValue
              }
          }
        }
      }

    @objc public var duration: NSNumber {
        get { return NSNumber(value:_duration) }
        set {
           _duration = TimeInterval(newValue.doubleValue)
          self.replaceValue(newValue, forKey: "duration", notification: false)
        }
      }

    
    
    var _viewProxy:TiViewProxy!
    var circularprogressView: KDCircularProgress!
    var trackColor:UIColor = UIColor.clear
    var roundedCorners:Bool = false
    var clockwise:Bool = true

    var progressThickness:CGFloat = 0.2
    var trackThickness:CGFloat = 0.6
    var glowAmount:CGFloat = 0.9
    var gradientRotateSpeed:CGFloat = 1

    
    override init() {
        _progressValue = NSNumber(value: 0.0)
        _duration = TimeInterval(0.0)
         super.init()
     }
       
       override public func _init(withProperties properties: [AnyHashable : Any]!) {
           let props = properties;
           super._init(withProperties: props)
           
           if properties["trackColor"] != nil {
               trackColor = TiUtils.colorValue(properties["trackColor"])!.color
           }
           
           if properties["roundedCorners"] != nil {
               roundedCorners = TiUtils.boolValue(properties["roundedCorners"])
           }

           if properties["clockwise"] != nil {
               clockwise = TiUtils.boolValue(properties["clockwise"])
           }
           
           if properties["gradientRotateSpeed"] != nil {
               gradientRotateSpeed = TiUtils.floatValue(properties["gradientRotateSpeed"])
           }
           
           if properties["progressWidth"] != nil {
               progressThickness = TiUtils.floatValue(properties["progressWidth"])
           }

           if properties["tackWidth"] != nil {
               trackThickness = TiUtils.floatValue(properties["tackWidth"])
           }

           if properties["glowAmount"] != nil {
               glowAmount = TiUtils.floatValue(properties["glowAmount"])
           }

           _viewProxy = self

           
           circularprogressView = KDCircularProgress(frame: CGRect(x:0, y:0, width:self.view.bounds.width, height:self.view.bounds.height))

           circularprogressView.startAngle = -90
           circularprogressView.progressThickness = progressThickness
           circularprogressView.trackThickness = trackThickness
           circularprogressView.clockwise = clockwise
           circularprogressView.gradientRotateSpeed = gradientRotateSpeed
           circularprogressView.roundedCorners = roundedCorners
           circularprogressView.glowMode = .forward
           circularprogressView.glowAmount = glowAmount
           circularprogressView.trackColor = trackColor
           circularprogressView.progress = _progressValue
           circularprogressView.set(colors: UIColor.red , UIColor.yellow)
           circularprogressView.myProxy = self
           self.view.addSubview(circularprogressView)
       }
      

    
  /**
   Test a number return value.
 
   - returns: The numeric return value
   
   - parameters:
       - unused An unused parameter
   */

  @objc(testNumber:)
  func testNumber(unused: Any?) -> Any {
    return TiUtils.intValue("42") // or return 42 directly
  }
  
  /**
   Test a string return value.
   
   - returns: The string return value
   
   - parameters:
   - unused An unused parameter
   */

  @objc(testString:)
  func testString(unused: Any?) -> String {
    return "Hello world"
  }
  
  /**
   Test a dictionary return value.
   
   - returns: The dictionary return value
   
   - parameters:
   - unused An unused parameter
   */
  
  @objc(testDictionary:)
  func testDictionary(unused: Any?) -> [String: String] {
    return ["hello": "world"]
  }
  
  /**
   Tests an array return value.
   
   - returns: The array return value
   
   - parameters:
   - unused An unused parameter
   */

  @objc(testArray:)
  func testArray(unused: Any?) -> [String] {
    return ["hello", "world"]
  }

  /**
   Tests a nil/null return value.
   
   - returns: The null return value
   
   - parameters:
   - unused An unused parameter
   */
  
  @objc(testNull:)
  func testNull(unused: Any?) -> Any? {
    return nil // Or "NSNull()" for dictionary safety
  }
   
    
//@objc(_setProgressValue:)
//   public func _setProgressColors(args: Array<Any>?) {
//      // circularprogressView.set(colors: TiUtils.colorValue(args?[0])!.color)
//}

    
    
@objc(animateProgress:)
  public func animateProgress(arguments: Array<Any>?) {
      guard let params = arguments?.first as? [String: Any] else {
        return
      }
      var animated = NSNumber(value: true)
      animated = params["animated"] as? NSNumber ?? animated

      
      
      let animateDuration: TimeInterval = TimeInterval(TiUtils.intValue(params["duration"]))

      if params["startValue"] != nil  && params["endValue"] != nil {
          let startValue = CGFloat(TiUtils.floatValue(params["startValue"])).myclamp(lowerBound: 0.0, upperBound: 1.0) * 360.0
          let endValue = CGFloat(TiUtils.floatValue(params["endValue"])).myclamp(lowerBound: 0.0, upperBound: 1.0) * 360.0

          circularprogressView.animate(fromAngle: startValue, toAngle: endValue, duration: animateDuration, relativeDuration: true, proxy: self, completion: { result in
              self.circularprogressView.pauseAnimation()
              self.fireEvent("progressDone")
              //print("go to next lvl", result)
          })
      }
      else if params["startValue"] == nil && params["endValue"] != nil {
          let endValue = CGFloat(TiUtils.floatValue(params["endValue"])).myclamp(lowerBound: 0.0, upperBound: 1.0) * 360.0

          circularprogressView.animate(toAngle: endValue, duration: animateDuration, relativeDuration: true, proxy: self, completion: { result in
              self.circularprogressView.pauseAnimation()
              self.fireEvent("progressDone")
              //print("go to next lvl", result)
          })
      }
  }

    
}
private extension Comparable {
    func myclamp(lowerBound: Self, upperBound: Self) -> Self {
        return min(max(self, lowerBound), upperBound)
    }
}
