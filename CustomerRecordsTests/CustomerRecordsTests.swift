//
//  CustomerRecordsTests.swift
//  CustomerRecordsTests
//
//  Created by Himanshi Goyal on 07/06/2020.
//  Copyright © 2020 Himanshi Goyal. All rights reserved.
//

import XCTest
@testable import CustomerRecords

class CustomerRecordsTests: XCTestCase {
    
    let customerManager = CustomerManager()
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    // Test dummy location within 100 km from Dublin Office location
    func testDistanceIn100Km(){
        let distance = DistanceCalculator.calculateDistance(from: Location(53.2451022, -6.238335), to: Location(53.339428, -6.257664))
        XCTAssert(distance <= 100.0)
    }
    
    // Test dummy location beyond 100 km from Dublin Office location
    func testDistanceNotIn100Km(){
        let distance = DistanceCalculator.calculateDistance(from: Location(51.92893, -10.27699), to: Location(53.339428, -6.257664))
        XCTAssert(distance >= 100.0)
    }
    
    // Test customers are filtered on calling filter function and expected count is returned
    func testFilterCountByDistanceIn100Km(){
        let customer1 = Customer(userId: 1, name: "1", latitude: 51.92893, longitude: -10.27699)
        let customer2 = Customer(userId: 2, name: "2", latitude: 51.8856167, longitude: -10.4240951)
        let customer3 = Customer(userId: 3, name: "3", latitude: 53.2451022, longitude: -6.238335)
        let customer4 = Customer(userId: 4, name: "4", latitude: 53.1302756, longitude: -6.238335)
        let customers = [customer1,customer2,customer3,customer4]
        let filtered = customerManager.filterCustomers(customers: customers, byDistance: 100.0, from: Location(53.339428, -6.257664))
        XCTAssert(filtered.count == 2)
    }
    
    // Test customers are filtered on calling filter function and result is as expected
    func testFilterByDistanceIn100Km(){
        let customer1 = Customer(userId: 1, name: "1", latitude: 51.92893, longitude: -10.27699)
        let customer2 = Customer(userId: 2, name: "2", latitude: 51.8856167, longitude: -10.4240951)
        let customer3 = Customer(userId: 3, name: "3", latitude: 53.2451022, longitude: -6.238335)
        let customer4 = Customer(userId: 4, name: "4", latitude: 53.1302756, longitude: -6.238335)
        let customers = [customer1,customer2,customer3,customer4]
        let filtered = customerManager.filterCustomers(customers: customers, byDistance: 100.0, from: Location(53.339428, -6.257664))
        XCTAssert(filtered.count == 2 && filtered.contains(where: {$0.userId == customer3.userId}) && filtered.contains(where: {$0.userId == customer4.userId}))
    }
    
    // Test customers are sorted on calling sort function
    func testSortCustomers() {
        let customer1 = Customer(userId: 1, name: "1", latitude: 51.92893, longitude: -10.27699)
        let customer2 = Customer(userId: 2, name: "2", latitude: 51.8856167, longitude: -10.4240951)
        let customer3 = Customer(userId: 3, name: "3", latitude: 53.2451022, longitude: -6.238335)
        let customer4 = Customer(userId: 4, name: "4", latitude: 53.1302756, longitude: -6.238335)
        var customers = [customer3,customer1,customer4,customer2]
        customerManager.sortCustomers(&customers)
        XCTAssert(customers == [customer1,customer2,customer3,customer4])
        
    }
    
    // Test read customers file and check count
    func testReadCustomersFile(){
        let customers = CustomerFileIO.readFile(forResource: "customers", type: "txt")
        XCTAssert(customers.count == 32)
    }
    
}
