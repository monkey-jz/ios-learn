//
//  Geometry.swift
//  TextShooter
//
//  Created by boyaa on 2022/9/19.
//

import UIKit

func vectorMultiply(_ v: CGVector,_ m: CGFloat ) -> CGVector {
    return CGVector(dx: v.dx * m, dy: v.dy * m)
}

func vectorBetweenPoints(_ p1: CGPoint,_ p2: CGPoint) -> CGVector {
    return CGVector(dx: p2.x - p1.x, dy: p2.y - p1.y)
}

func vectorLength(_ v: CGVector) -> CGFloat {
    return CGFloat(sqrt(powf(Float(v.dx), 2) + powf(Float(v.dy), 2)))
}

func pointDistance(_ p1: CGPoint,_ p2: CGPoint) -> CGFloat {
    return CGFloat(sqrt(powf(Float(p2.x - p1.x), 2) + powf(Float(p2.y - p1.y), 2)))
}
