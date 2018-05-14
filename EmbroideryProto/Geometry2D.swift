//
//  Geometry2D.swift
//  EmbroideryProto
//
//  Created by Shelley Zhao on 5/9/18.
//  Copyright © 2018 Mark Siffer. All rights reserved.
//

import Foundation
import UIKit


public class Geometry2D {
    
    public func distanceSquared(point1: CGPoint, point2: CGPoint) -> CGFloat {
        var dx = point1.x - point2.x
        var dy  = point1.y - point2.y
        
        dx *= dx
        dy *= dy
        return dx + dy
    }
    
    public func distance(point1: CGPoint, point2: CGPoint) -> CGFloat {
        return sqrt(distanceSquared(point1: point1, point2: point2))
    }
    
    public func midpoint(point1: CGPoint, point2: CGPoint) -> CGPoint {
        return CGPoint.init(x: ((point1.x + point2.x)/2.0), y: ((point1.y + point2.y)/2.0))
    }
    
    public func angleD(point1: CGPoint, point2: CGPoint) -> CGFloat {
        return angleR(point1: point1, point2: point2) * 180 / CGFloat.pi
    }
    
    public func angleR(point1: CGPoint, point2: CGPoint) -> CGFloat {
        return CGFloat(atan2(point2.y - point1.y, point2.x - point1.x))
    }
    
    public func deltaAngleR(angle1: CGFloat, angle2: CGFloat) -> CGFloat {
        let delta = angle1 - angle2
        if delta > CGFloat.pi {
            return (2 * CGFloat.pi) - delta
        }
        if (delta < -1 * CGFloat.pi) {
            return delta + (2 * CGFloat.pi);
        }
        return delta
    }
    
//    public func sortCGPointsCW(listOfCGPoints: [CGPoint]) -> [CGPoint] {
//        
//    }
}


