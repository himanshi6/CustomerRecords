//
//  FileManager.swift
//  CustomerRecords
//
//  Created by Himanshi Goyal on 07/06/2020.
//  Copyright © 2020 Himanshi Goyal. All rights reserved.
//

import Foundation
class CustomerManager {
    
    // Function to get near custoemrs. It makes all neecessary calls to get relevant results
    func getNearCustomers(){
        let customers = CustomerFileIO.readFile(forResource: "customers", type: "txt")
        // The GPS coordinates for our Dublin office are 53.339428, -6.257664.
        var nearCustomers = filterCustomers(customers: customers,byDistance:100.0,from:Location(53.339428, -6.257664))
        sortCustomers(&nearCustomers)
        printCustomers(nearCustomers)
        CustomerFileIO.writeToFile(forResource: "output", type:"txt", customers:nearCustomers)
    }
    
    // Prints customers array
    func printCustomers(_ customers:[Customer]) {
        for customer in customers {
            customer.print()
        }
    }
    
    // Sort customers array
    func sortCustomers(_ customers: inout [Customer]) {
        customers.sort(by: { (cust1, cust2) -> Bool in
            cust1.userId < cust2.userId
        })
    }
    
    // Filters customers array by certain distance limit from a specific location
    func filterCustomers(customers:[Customer], byDistance distance:Float, from location:Location) -> [Customer] {
        var filterCustomers:[Customer] = []
        for customer in customers {
            if DistanceCalculator.calculateDistance(from: location, to: customer.location) <= distance {
                filterCustomers.append(customer)
            }
        }
        return filterCustomers
    }
}
