//
//  PointDirect.swift
//  EmbroideryProto
//
//  Created by Shelley Zhao on 5/13/18.
//  Copyright © 2018 Mark Siffer. All rights reserved.
//

import Foundation
import UIKit

public struct PointDirect : Point {
    
    var x: CGFloat
    var y: CGFloat
    var data: Int
    
    init(x: CGFloat, y: CGFloat, data: Int = 1) {
        self.x = x
        self.y = y
        self.data = data
    }
    
    init(x: Double, y: Double, data: Int = 1) {
        self.x = CGFloat(x)
        self.y = CGFloat(y)
        self.data = data
    }
    func getX() -> CGFloat {
        return self.x
    }
    
    func getY() -> CGFloat {
        return self.y
    }
    
    func getData() -> Int {
        return self.data
    }
    
    mutating func setData(data: Int) {
        self.data = data
    }
    
    mutating func setXAndY(x: CGFloat, y: CGFloat) {
        self.x = x
        self.y = y
    }
    
    mutating func setXAndY(x: Double, y: Double) {
        self.x = CGFloat(x)
        self.y = CGFloat(y)
    }
    
}
