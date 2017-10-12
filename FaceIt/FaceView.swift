//
//  FaceView.swift
//  FaceIt
//
//  Created by User on 12.10.2017.
//  Copyright © 2017 User. All rights reserved.
//

import UIKit

class FaceView: UIView {

    var scale: CGFloat = 0.9

    override func draw(_ rect: CGRect) {
    
        let skullRadius = min(bounds.size.width, bounds.size.height) / 2 * scale
        let skullCenter = CGPoint(x: bounds.midX, y: bounds.midY)
        let path = UIBezierPath(arcCenter: skullCenter, radius: skullRadius, startAngle: 0, endAngle: CGFloat(2 * Double.pi), clockwise: false)
        path.lineWidth = 5.0
        UIColor.blue.set()
        path.stroke()
    }
    

}
