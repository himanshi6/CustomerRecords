//
//  ViewController.swift
//  CustomerRecords
//
//  Created by Himanshi Goyal on 07/06/2020.
//  Copyright © 2020 Himanshi Goyal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Called get Near cutomers from customer manager.
        // This prints and saves result in output file.
        CustomerManager().getNearCustomers()
    }
    
    
}

