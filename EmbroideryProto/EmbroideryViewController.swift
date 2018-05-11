//
//  ViewController.swift
//  EmbroideryProto
//
//  Created by Mark Siffer on 1/14/17.
//  Copyright © 2017 Mark Siffer. All rights reserved.
//

import UIKit

class EmbroideryViewController: UIViewController {
    
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var txtFile: UITextField!
    @IBOutlet weak var stitchView: StitchView! {
        didSet {
            stitchView.addGestureRecognizer(UIPinchGestureRecognizer(
                target: stitchView,
                action: #selector(StitchView.changeScale(_:))
            ))
        }
    }
    var swiped = false
    var lastPoint = CGPoint.zero
    var lastDroppedPoint = CGPoint.zero
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        swiped = false
        if let touch = touches.first {
            lastPoint = touch.location(in: self.stitchView)
        }
    }
    
    func drawLine(fromPoint: CGPoint, toPoint: CGPoint) {
        UIGraphicsBeginImageContext(view.frame.size)
        let context = UIGraphicsGetCurrentContext()
        
        mainImageView.image?.draw(in: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height))
        
        let radius = CGFloat(5.0)
        context?.move(to: fromPoint)
        context?.addLine(to: toPoint)
        
        let rect = CGRect(origin: CGPoint.init(x: fromPoint.x - radius/2, y: fromPoint.y - radius/2), size: CGSize(width: radius, height: radius))
        context?.setFillColor(red: 255.0, green: 0.0, blue: 0.0, alpha: 1.0)
        context?.setStrokeColor(red: 255.0, green: 0.0, blue: 0.0, alpha: 1.0)
//        context?.fillEllipse(in: rect)
        
        
        context?.strokePath()
        
        mainImageView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
//        let touchPoint = lastPoint

    }
//    func dropPoint(lastPoint: CGPoint, currentPoint: CGPoint) -> Bool {
//        
//    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        swiped = true
        if let touch = touches.first {
            let currentPoint = touch.location(in: view)
            drawLine(fromPoint: lastPoint, toPoint: currentPoint)
            
            lastPoint = currentPoint
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if !swiped {
            drawLine(fromPoint: lastPoint, toPoint: lastPoint)
        }
    }
        
    func loadFile(_ theurl : URL) {
        BinaryHelper.load(url: theurl,
                          completion: {file in
                            var pattern : EmbPattern
                            let fileextension = String(file.filename.characters.suffix(3)).lowercased()
                            var reader : FormatProtocol? = nil
                            if fileextension == "exp"  {
                                reader = FormatExp()
                            } else if fileextension == "pcs" {
                                reader = FormatPcs()
                            } else if fileextension == "pec" {
                                reader = FormatPec()
                            } else if fileextension == "pes" {
                                reader = FormatPes()
                            }
                            if reader != nil {
                                pattern = (reader?.read(file: file))!
                            } else {
                                pattern = EmbPattern()
                            }
                            self.stitchView.setPattern(pattern)
                            DispatchQueue.main.async {
                                self.stitchView.setNeedsDisplay()
                            }
        })
    }
    
    @IBAction func btnDraw(_ sender: UIButton) {
        loadFile(URL(string: self.txtFile.text!)!)
    }
}

