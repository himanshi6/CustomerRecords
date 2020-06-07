//
//  DistanceCalculator.swift
//  CustomerRecords
//
//  Created by Himanshi Goyal on 07/06/2020.
//  Copyright © 2020 Himanshi Goyal. All rights reserved.
//
import Foundation

class DistanceCalculator {
    
    // Calculate distance between two location points on earth
    static func calculateDistance(from:Location,to:Location) -> Float {
        let fromLat = from.latitude * .pi / 180
        let fromLong = from.longitude * .pi / 180
        let toLat = to.latitude * .pi / 180
        let toLong = to.longitude * .pi / 180
        
        let longDiff = fromLong - toLong
        let latDiff = fromLat - toLat
        
        let sum1 = pow(sin(latDiff/2), 2)
        let sum2 = cos(fromLat)*cos(toLat)*pow(sin(longDiff/2), 2)
        let centralAngle = 2*asin(sqrt(sum1 + sum2))
        
        let distance = 6371*centralAngle
        return distance
    }
}
