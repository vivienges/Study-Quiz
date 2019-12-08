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
    
     var trackColor: UIColor = UIColor.lightGray
     var progressColor = UIColor(named: "Secondary")
    
     var progressLayer = CAShapeLayer()
     var trackLayer = CAShapeLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createCircularPath()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        createCircularPath()
    }
    
    let lineWidth = 15
    
    func createCircularPath() {
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
    
    func setProgressWithAnimation(value: Float) {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.duration = 1
        animation.fromValue = 0
        animation.toValue = value
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        progressLayer.strokeEnd = CGFloat(value)
        progressLayer.add(animation, forKey: "animateprogress")
    }
    
}
