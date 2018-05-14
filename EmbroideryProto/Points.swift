//
//  Points.swift
//  EmbroideryProto
//
//  Created by Shelley Zhao on 5/10/18.
//  Copyright © 2018 Mark Siffer. All rights reserved.
//

import Foundation
import UIKit

protocol Points {
    func getPoint(index: Int) -> Point
    func getX(index: Int) -> CGFloat
    func getY(index: Int) -> CGFloat
    func getData(index: Int) -> Int
    mutating func setData(index: Int) -> Int
    mutating func setXAndY(index: Int, x: CGFloat, y: CGFloat)
//    func removePoint(index: Int) -> Point
}
// Collection of stitches
// class Thread {
//    
//    var Size: Int = 0
//    var Stitches = [Stitch]()
//    var Color: UIColor = UIColor.black
//
//    public func getBounds() -> CGRect {
//        var left = CGFloat.infinity
//        var top = CGFloat.infinity
//        var right = -CGFloat.infinity
//        var bottom = -CGFloat.infinity
//        for stitch in self.Stitches {
//            left = min(left, stitch.getX())
//            top = min(top, stitch.getY())
//            right = max(right, stitch.getX())
//            bottom = max(bottom, stitch.getY())
//        }
//        return CGRect(x: left, y: top, width: right-left, height: bottom - top)
//    }
//    
//    public func addStitchAbs(stitch: Stitch) {
//        self.Stitches.append(stitch)
//    }
//
//}
