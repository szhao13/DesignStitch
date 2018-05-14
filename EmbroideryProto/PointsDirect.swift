//
//  PointsCollection.swift
//  EmbroideryProto
//
//  Created by Shelley Zhao on 5/12/18.
//  Copyright © 2018 Mark Siffer. All rights reserved.
//

import Foundation
import UIKit

struct PointsDirect : Points {

    
    var Points = [Point]()
    var size : Int
    var minX : CGFloat
    var minY : CGFloat
    var maxX : CGFloat
    var maxY : CGFloat
    
    init(points: [Points]) {
        Points = points
        
        
    }
    func size() -> Int {
        return size
    }
    

    
    func getPoint(index: Int) -> PointDirect {
        return Points[index]
    }
    
    func getX(index: Int) -> CGFloat {
        return Points[index].getX()
    }
    
    func getY(index: Int) -> CGFloat {
        return Points[index].getY()
    }
    
    mutating func getData(index: Int) -> Int {
        return Points[index].getData()
    }
    
    mutating func setXAndY(index: Int, x: CGFloat, y: CGFloat) {
        self.Points[index].setXAndY(x: x, y: y)
    }
    
    func addPoint(x: CGFloat, y: CGFloat) {
        
    }
    private func addPoint(index: Int, point: Point) {
        Points.insert(point, at: index)
        size += 1
    }
    
    func addPoint(index: Int, point: Point) {
        
    }
    
    private func checkBounds(px: CGFloat, py: CGFloat) -> Bool {
        var boundChanged = false
        if px < minX {
            minX = px
            boundChanged = true
        }
        if px > maxX {
            maxX = px
            boundChanged = true
        }
        if (py < minY) {
            minY = py
            boundChanged = true
        }
        if (py > maxY) {
            maxY = py
            boundChanged = true
        }
        return boundChanged
    }
    
//    func removePoint(index: Int) {
//
//    }
    
    
}
