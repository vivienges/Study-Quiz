//
//  ProgressCircle.swift
//  study-quiz
//
//  Created by Vivien Geschwind on 2019-12-04.
//  Copyright © 2019 David Bielenberg. All rights reserved.
//

import Foundation
import UIKit

class ProgressCircle: UIView {

  @IBInspectable public var backGroundCircleColor: UIColor = UIColor.lightGray
    @IBInspectable public var startGradientColor: UIColor = UIColor(red: 129/255.0, green: 128/255.0, blue: 239/255.0, alpha: 1)
  @IBInspectable public var endGradientColor: UIColor = UIColor(red: 129/255.0, green: 128/255.0, blue: 239/255.0, alpha: 1)



    var backgroundLayer = CAShapeLayer()
    var foregroundLayer = CAShapeLayer()
    var gradientLayer = CAGradientLayer()

  public var progress: CGFloat = 0 {
    didSet {
        didProgressUpdated()
    }
  }

  override func draw(_ rect: CGRect) {

    guard layer.sublayers == nil else {
      return
    }

    let width = rect.width
    let height = rect.height

    let lineWidth = 15

    backgroundLayer = createCircularLayer(rect: rect, strokeColor: backGroundCircleColor.cgColor, fillColor: UIColor.clear.cgColor, lineWidth: CGFloat(lineWidth))

    foregroundLayer = createCircularLayer(rect: rect, strokeColor: UIColor.red.cgColor, fillColor: UIColor.clear.cgColor, lineWidth: CGFloat(lineWidth))

    gradientLayer = CAGradientLayer()
    gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
    gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)

    gradientLayer.colors = [startGradientColor.cgColor, endGradientColor.cgColor]
    gradientLayer.frame = rect
    gradientLayer.mask = foregroundLayer

    
    
    layer.addSublayer(backgroundLayer)
    layer.addSublayer(gradientLayer)
   
  }

  private func createCircularLayer(rect: CGRect, strokeColor: CGColor,
                                   fillColor: CGColor, lineWidth: CGFloat) -> CAShapeLayer {

    let width = rect.width
    let height = rect.height

    let center = CGPoint(x: width / 2, y: height / 2)
    let radius = (min(width, height) - lineWidth) / 2

    let startAngle = -CGFloat.pi / 2
    let endAngle = startAngle + 2 * CGFloat.pi

    let circularPath = UIBezierPath(arcCenter: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)

    let shapeLayer = CAShapeLayer()

    shapeLayer.path = circularPath.cgPath
    shapeLayer.strokeColor = strokeColor
    shapeLayer.fillColor = fillColor
    shapeLayer.lineWidth = lineWidth
    shapeLayer.lineCap = .round

    return shapeLayer
  }


  private func didProgressUpdated() {
    
    foregroundLayer.strokeEnd = progress
    
   
 }
}
