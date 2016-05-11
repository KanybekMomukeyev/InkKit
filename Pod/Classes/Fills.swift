//
//  Fills.swift
//  InkKit
//
//  Created by Shaps Mohsenin on 10/05/2016.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import CoreGraphics

extension Draw {
  
 /**
   Fills the specified path
   
   - parameter path:            The path to fill
   - parameter startColor:      The start color for the gradient
   - parameter endColor:        The end color for the gradient
   - parameter angleInDegrees:  The angle (in degrees) of the gradient
   - parameter attributesBlock: Any additional attributes can be configured using this configuration block
   */
  public static func fillPath(path: BezierPath, startColor: Color, endColor: Color, angleInDegrees: CGFloat, attributes attributesBlock: AttributesBlock? = nil) {
    drawGradientPath(path, startColor: startColor, endColor: endColor, angleInDegrees: angleInDegrees, stroke: false, attributes: attributesBlock)
  }
  
  public static func fillPath(path: BezierPath, color: UIColor, attributes attributesBlock: AttributesBlock? = nil) {
    UIGraphicsGetCurrentContext()?.draw(inRect: path.bounds, attributes: attributesBlock) { context, rect, attributes in
      CGContextSetFillColorWithColor(context, color.CGColor)
      CGContextAddPath(context, path.CGPath)
      CGContextFillPath(context)
    }
  }
  
  public static func fillRect(rect: CGRect, color: UIColor, attributes attributesBlock: AttributesBlock? = nil) {
    UIGraphicsGetCurrentContext()?.draw(inRect: rect, attributes: attributesBlock) { context, rect, attributes in
      CGContextSetFillColorWithColor(context, color.CGColor)
      UIRectFill(rect)
    }
  }
  
}
