//
//  Point.swift
//  EmbroideryProto
//
//  Created by Shelley Zhao on 5/10/18.
//  Copyright © 2018 Mark Siffer. All rights reserved.
//

// Protocol for Point 
import Foundation
import UIKit

protocol Point {

//    var x: CGFloat { get set }
//    var y: CGFloat { get set }
//    var data: Int { get set }
    
    func getX() -> CGFloat
    func getY() -> CGFloat
    func getData(index: Int) -> Int
    mutating func setData(data: Int)
    mutating func setXAndY(x: CGFloat, y: CGFloat)
}
