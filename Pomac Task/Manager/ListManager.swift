//
//  ListManager.swift
//  Pomac Task
//
//  Created by Abdelrahman zain on 10/30/20.
//  Copyright © 2020 Abdelrahman zain. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class ListManager : BaseManager {
      
    func getNewsList(onSuccess: @escaping (_ response: [NewsModel]) -> Void, onFail: @escaping (_ error: String) -> Void )   {
        
        let url = ApisURL.newsListURL
        
        request(requestURL: url, method: .get, parameters: nil, onSuccess: { (response) in
            var newsList = Array<NewsModel>()
            
            if let results = response["results"].array{
                newsList = NewsModel.arrayFromInstance(array: results) ?? []
            }
            onSuccess(newsList)
        }) { (error) in
            onFail(error)
        }
        
    }
    
 
    
}
