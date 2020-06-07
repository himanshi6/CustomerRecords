//
//  Customer.swift
//  CustomerRecords
//
//  Created by Himanshi Goyal on 07/06/2020.
//  Copyright © 2020 Himanshi Goyal. All rights reserved.
//

import Foundation

// Class Customer to be used as a model for customers
public struct Customer : Equatable {
    
    let userId:Int
    let name:String
    let location:Location
    
    init(userId:Int, name:String, location:Location) {
        self.userId = userId
        self.name = name
        self.location = location
    }
    
    init(userId:Int = 0, name:String = "", latitude:Float = 0.0, longitude:Float = 0.0) {
        self.init(userId:userId,name:name,location:Location(latitude,longitude))
    }
    
    init?(json:Dictionary<String, Any>) {
        if let userId = json["user_id"] as? Int, let name = json["name"] as? String, let latitude = json["latitude"] as? String, let latFloat = Float(latitude), let longitude = json["longitude"] as? String, let longFloat = Float(longitude) {
            self.init(userId:userId, name:name, latitude:latFloat, longitude:longFloat)
        }
        else {
            return nil
        }
    }
    
    //Returns description with name and id
    func customerDesc() -> String {
        return "User Id:\(self.userId) | Name:\(self.name)"
    }
    
    //prints description
    func print() {
        Swift.print("\(self.customerDesc())")
    }

    //Compare two objects of customers
    public static func == (lhs: Customer, rhs: Customer) -> Bool {
        lhs.userId == rhs.userId
    }
    
}

public struct Location {
    let latitude:Float
    let longitude:Float
    
    init(_ latitude:Float,_ longitude:Float) {
        self.latitude = latitude
        self.longitude = longitude
    }
}


