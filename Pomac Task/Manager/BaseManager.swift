//
//  BaseManager.swift
//  Pomac Task
//
//  Created by Abdelrahman zain on 10/30/20.
//  Copyright © 2020 Abdelrahman zain. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class BaseManager {

        func request(requestURL : String , method : HTTPMethod , parameters : Parameters? ,  onSuccess: @escaping(_ response: JSON) -> Void, onFail: @escaping(_ error: String) -> Void){
      
            AF.request(requestURL, method: method, parameters: parameters , encoding: URLEncoding.default , headers: nil).responseData { (response) in
                switch response.result {
                case .success( let value):
                    let json = JSON(value)
                    if !json.getStringValue(forKey: "status").elementsEqual("OK"){
                        onFail("failed to retrieve data")}
                    else {
                        onSuccess(json)}
    
                case .failure(let error):
                    onFail("failed to retrieve data with error \(error)")
                    return
                }
            }
        }
    }




