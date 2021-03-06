//
//  AlamofireGETOperation.swift
//  ProcedureKitTest
//
//  Created by Joe Levin on 9/18/16.
//  Copyright © 2016 Joe Levin. All rights reserved.
//

import Foundation
import Alamofire
import ProcedureKit

class AlamofireGETOperation: Procedure {
    
    weak var request : DataRequest? = nil
    var JSON: Any?
    
    override func execute() {
        self.request = Alamofire.request("https://httpbin.org/get").responseJSON { [weak self] response in
            print(response.request)  // original URL request
            print(response.response) // HTTP URL response
            print(response.data)     // server data
            print(response.result)   // result of response serialization
            
            if let JSON = response.result.value {
                print("JSON: \(JSON)")
                self?.JSON = JSON
                self?.finish()
            }
        }
    }
}
