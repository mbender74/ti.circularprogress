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

    var circularprogressView: KDCircularProgress!
    var trackColor:UIColor = UIColor.clear
    var roundedCorners:Bool = false
    var clockwise:Bool = true
    var progressValue:CGFloat = 0.0

    var progressThickness:CGFloat = 0.2
    var trackThickness:CGFloat = 0.6
    var glowAmount:CGFloat = 0.9
    var gradientRotateSpeed:CGFloat = 1

    
    override init() {
           NSLog("[INFO] inside override init in ComKossoSwiftiViewProxy.swift ... ")
           super.init()
       }
       
       override public func _init(withProperties properties: [AnyHashable : Any]!) {
           NSLog("[INFO] inside override public func _init in ComKossoSwiftiViewProxy.swift ... ")
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

           if properties["progressValue"] != nil {
               progressValue = TiUtils.floatValue(properties["progressValue"])
           }

           
           if properties["gradientRotateSpeed"] != nil {
               gradientRotateSpeed = TiUtils.floatValue(properties["gradientRotateSpeed"])
           }
           
           if properties["progressThickness"] != nil {
               progressThickness = TiUtils.floatValue(properties["progressThickness"])
           }

           if properties["trackThickness"] != nil {
               trackThickness = TiUtils.floatValue(properties["trackThickness"])
           }

           if properties["glowAmount"] != nil {
               glowAmount = TiUtils.floatValue(properties["glowAmount"])
           }

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
           circularprogressView.progress = progressValue
           circularprogressView.set(colors: UIColor.red , UIColor.yellow)
           self.view.addSubview(circularprogressView)
       }
      
    @objc public var progress: CGFloat = 0.0


    
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
   
    
@objc(updateProgress:)
  public func updateProgress(arguments: Array<Any>?) {

      guard let params = arguments?.first as? [String: Any] else {
        debugPrint("[ERROR] No valid arguments provided")
        return
      }
      
      progress = CGFloat(TiUtils.floatValue(params["progress"]))
      
      
      
    var animated = NSNumber(value: true)
    animated = params["animated"] as? NSNumber ?? animated

    circularprogressView.progress = Double(progress)
  }

    
}
