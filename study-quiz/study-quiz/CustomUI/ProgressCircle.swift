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
    @IBInspectable public var progressColor = UIColor(named: "Secondary")

    var backgroundLayer = CAShapeLayer()
    var foregroundLayer = CAShapeLayer()

  public var progress: CGFloat = 0 {
    didSet {
        didProgressUpdated()
    }
  }

  override func draw(_ rect: CGRect) {

    guard layer.sublayers == nil else {
      return
    }

    let lineWidth = 15

    backgroundLayer = createCircularLayer(rect: rect, strokeColor: backGroundCircleColor.cgColor, fillColor: UIColor.clear.cgColor, lineWidth: CGFloat(lineWidth))
    foregroundLayer = createCircularLayer(rect: rect, strokeColor: progressColor!.cgColor, fillColor: UIColor.clear.cgColor, lineWidth: CGFloat(lineWidth))

    layer.addSublayer(backgroundLayer)
    layer.addSublayer(foregroundLayer)
   
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
