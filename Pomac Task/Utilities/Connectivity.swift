//
//  Connectivity.swift
//  Pomac Task
//
//  Created by Abdelrahman zain on 10/30/20.
//  Copyright © 2020 Abdelrahman zain. All rights reserved.
//

import Foundation
import Alamofire

class Connectivity {
    class func isConnectedToInternet() -> Bool {
        return NetworkReachabilityManager()?.isReachable ?? false
    }
}
