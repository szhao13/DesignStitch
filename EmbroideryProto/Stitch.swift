//
//  Point.swift
//  EmbroideryProto
//
//  Created by Shelley Zhao on 5/10/18.
//  Copyright © 2018 Mark Siffer. All rights reserved.
//

import Foundation
import UIKit

//protocol Point {
//
//    func getX() -> CGFloat
//    func getY() -> CGFloat
//    func getData() -> CGFloat
//    func setXAndY(x: CGFloat, y: CGFloat)

class Stitch {
    var Point: CGPoint
    var StitchType: Int?

    init(x: CGFloat, y: CGFloat, stitchType: Int = 0) {
        self.Point = CGPoint.init(x: x, y: y)
        self.StitchType = stitchType
    }
    
    func getX() -> CGFloat {
        return self.Point.x
    }
    
    func getY() -> CGFloat {
        return self.Point.y
    }
    
    func getStitchType() -> Int? {
        return self.StitchType
    }
    
    func setPoint(x: CGFloat, y: CGFloat) {
        self.Point.x = x
        self.Point.y = y
        
    }
    
    func setStitchType(stitchType: Int) {
        self.StitchType = stitchType
    }
}
