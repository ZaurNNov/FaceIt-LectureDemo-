//
//  FaceViewController.swift
//  FaceIt
//
//  Created by User on 12.10.2017.
//  Copyright © 2017 User. All rights reserved.
//

import UIKit

class FaceViewController: UIViewController
{
    
    @IBOutlet weak var faceView: FaceView! {
        didSet {
            let handler = #selector(FaceView.changeScale(byReactTo:))
            
            let pinchRecognizer = UIPinchGestureRecognizer(target: faceView, action: handler)
            faceView.addGestureRecognizer(pinchRecognizer)
            
            let tapRecornizer = UITapGestureRecognizer(target: self, action: #selector(toggleEyes(byReactTo:)))
            tapRecornizer.numberOfTapsRequired = 1
            faceView.addGestureRecognizer(tapRecornizer)
            
            let swipeUpRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(increaseHappines))
            swipeUpRecognizer.direction = .up
            faceView.addGestureRecognizer(swipeUpRecognizer)
            
            let swipeDownRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(decreaseHappines))
            swipeDownRecognizer.direction = .down
            faceView.addGestureRecognizer(swipeDownRecognizer)
            updateUI()
        }
    }
    
    @objc func increaseHappines()
    {
        expression = expression.happier
    }
    
    @objc func decreaseHappines()
    {
        expression = expression.sadder
    }
    
    @objc func toggleEyes(byReactTo tapRecognizer: UITapGestureRecognizer) {
        if tapRecognizer.state == .ended {
            let eyes: FacialExpression.Eyes = (expression.eyes == .closed) ? .open : .closed
            expression = FacialExpression(eyes: eyes, mouth: expression.mouth)
        }
    }
    
    var expression = FacialExpression(eyes: .closed, mouth: .grin) {
        didSet {
            updateUI()
        }
    }
    
    private func updateUI()
    {
        switch expression.eyes {
        case .open: faceView?.eyeOpen = true
        case .closed: faceView?.eyeOpen = false
        case .squinting: faceView?.eyeOpen = false
        }
        
        faceView?.mouthCurvature = mouthCurvatures[expression.mouth] ?? 0.0
        
    }
    
    private let mouthCurvatures = [FacialExpression.Mouth.grin: 0.5, .frown: -1.0, .smile: 1.0, .neutral: 0.0, .smirk: -0.5]
    
    
}

