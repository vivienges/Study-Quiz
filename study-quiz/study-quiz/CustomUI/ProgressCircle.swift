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
    

        @IBInspectable public var trackColor: UIColor = UIColor.lightGray
        @IBInspectable public var progressColor = UIColor(named: "Secondary")
    
    fileprivate var progressLayer = CAShapeLayer()
    fileprivate var trackLayer = CAShapeLayer()
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createCircularPath()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        createCircularPath()
    }
    

    
    let lineWidth = 15
    
    fileprivate func createCircularPath() {
        self.backgroundColor = UIColor.clear
        self.layer.cornerRadius = self.frame.size.width/2
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width/2, y: frame.size.height/2), radius: (frame.size.width - 1.5)/2, startAngle: CGFloat(-0.5 * .pi), endAngle: CGFloat(1.5 * .pi), clockwise: true)
        trackLayer.path = circlePath.cgPath
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.strokeColor = trackColor.cgColor
        trackLayer.lineWidth = CGFloat(lineWidth)
        trackLayer.strokeEnd = 1.0
        trackLayer.lineCap = .round
        layer.addSublayer(trackLayer)
        
        progressLayer.path = circlePath.cgPath
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.strokeColor = progressColor?.cgColor
        progressLayer.lineWidth = CGFloat(lineWidth)
        progressLayer.lineCap = .round
        
        progressLayer.strokeEnd = 0.0
        layer.addSublayer(progressLayer)
    }
    
    func setProgressWithAnimation(duration: TimeInterval, value: Float) {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.duration = duration
        animation.fromValue = 0
        animation.toValue = value
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        progressLayer.strokeEnd = CGFloat(value)
        progressLayer.add(animation, forKey: "animateprogress")
    }
    
    
    
    
    

//    @IBInspectable public var backGroundCircleColor: UIColor = UIColor.lightGray
//    @IBInspectable public var progressColor = UIColor(named: "Secondary")
//
//    var progressLayer = CAShapeLayer()
//    var trackLayer = CAShapeLayer()
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        createCircularPath()
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        createCircularPath()
//    }
//
//    func createCircularPath() {
//
//            let startAngle = -CGFloat.pi / 2
//            let endAngle = startAngle + 2 * CGFloat.pi
//            let lineWidth = 15
//
//        self.backgroundColor = UIColor.clear
//        self.layer.cornerRadius = self.frame.size.width/2
//        let circlePath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width/2, y: frame.size.height/2), radius: (frame.size.width - 1.5)/2, startAngle: startAngle, endAngle: endAngle, clockwise: true)
//
//        trackLayer.path = circlePath.cgPath
//        trackLayer.fillColor = UIColor.clear.cgColor
//        trackLayer.strokeColor = backgroundColor?.cgColor
//        trackLayer.lineWidth = CGFloat(lineWidth)
//        trackLayer.strokeEnd = 1.0
//        layer.addSublayer(trackLayer)
//
//        progressLayer.path = circlePath.cgPath
//        progressLayer.fillColor = UIColor.clear.cgColor
//        progressLayer.strokeColor = backgroundColor?.cgColor
//        progressLayer.lineWidth = CGFloat(lineWidth)
//        progressLayer.strokeEnd = 0.0
//        layer.addSublayer(progressLayer)
//    }
//
//    func setProgressWithAnimation(duration: TimeInterval, value: Float) {
//        let animation = CABasicAnimation(keyPath: "strokeEnd")
//        animation.duration = duration
//        animation.fromValue = 0
//        animation.toValue = value
//        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
//        progressLayer.strokeEnd = CGFloat(value)
//        progressLayer.add(animation, forKey: "animateprogress")
//}
//
//
//
////
////    guard layer.sublayers == nil else {
////      return
////    }
////
//
////
////    backgroundLayer = createCircularLayer(rect: rect, strokeColor: backGroundCircleColor.cgColor, fillColor: UIColor.clear.cgColor, lineWidth: CGFloat(lineWidth))
////    foregroundLayer = createCircularLayer(rect: rect, strokeColor: progressColor!.cgColor, fillColor: UIColor.clear.cgColor, lineWidth: CGFloat(lineWidth))
//
////    layer.addSublayer(backgroundLayer)
////    layer.addSublayer(foregroundLayer)
////
////  }
////
////  private func createCircularLayer(rect: CGRect, strokeColor: CGColor,
////                                   fillColor: CGColor, lineWidth: CGFloat) -> CAShapeLayer {
////
////    let width = rect.width
////    let height = rect.height
////
////    let center = CGPoint(x: width / 2, y: height / 2)
////    let radius = (min(width, height) - lineWidth) / 2
////
////    let startAngle = -CGFloat.pi / 2
////    let endAngle = startAngle + 2 * CGFloat.pi
////
////    let circularPath = UIBezierPath(arcCenter: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
////
////    let shapeLayer = CAShapeLayer()
////
////    shapeLayer.path = circularPath.cgPath
////    shapeLayer.strokeColor = strokeColor
////    shapeLayer.fillColor = fillColor
////    shapeLayer.lineWidth = lineWidth
////    shapeLayer.lineCap = .round
////
////    return shapeLayer
////  }
////
////
////  private func didProgressUpdated() {
////
////    foregroundLayer.strokeEnd = progress
////
//// }

}
