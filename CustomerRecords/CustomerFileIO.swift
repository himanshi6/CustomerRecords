//
//  FileReader.swift
//  CustomerRecords
//
//  Created by Himanshi Goyal on 07/06/2020.
//  Copyright © 2020 Himanshi Goyal. All rights reserved.
//

import Foundation

class CustomerFileIO {
    
    //Write customers objects array to output file
    static func writeToFile(forResource resource:String, type:String, customers:[Customer])  {
        var fileText = ""
        for customer in customers {
            fileText.append(customer.customerDesc())
            fileText.append("\n")
        }
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let docDir = paths[0]
        let filename = docDir.appendingPathComponent("\(resource).\(type)")

        do {
            try fileText.write(to: filename, atomically: true, encoding: String.Encoding.utf8)
        } catch {
            // failed to write file – bad permissions, bad filename, missing permissions, or more likely it can't be converted to the encoding
        }
    }
    
    //Read File and outputs customers array
    static func readFile(forResource resource:String, type:String) -> [Customer] {
        var customers:[Customer] = []
        if let path = Bundle.main.path(forResource: resource, ofType: type) {
            do {
                let data1 = try String(contentsOfFile: path, encoding: .utf8)
                let jsonStrings = data1.components(separatedBy: .newlines)
                for json in jsonStrings {
                    if let data = json.data(using: .utf8), let jsonCustomer = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves) as? Dictionary<String, Any> {
                        
                        if let customer = Customer(json: jsonCustomer) {
                            customers.append(customer)
                        }
                    }
                }
            } catch {
                // handle error
            }
        }
        return customers
    }
}
