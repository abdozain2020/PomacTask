//
//  JSON.swift
//  Pomac Task
//
//  Created by Abdelrahman zain on 10/30/20.
//  Copyright © 2020 Abdelrahman zain. All rights reserved.
//


import Foundation
import SwiftyJSON

extension JSON {
   
    func getStringValue (forKey: String) -> String {
        if let returnedData = self[forKey].string  {
                return returnedData
        }
        return ""
    }

}
