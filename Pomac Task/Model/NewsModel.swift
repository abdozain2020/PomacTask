//
//  NewsModel.swift
//  Pomac Task
//
//  Created by Abdelrahman zain on 10/30/20.
//  Copyright © 2020 Abdelrahman zain. All rights reserved.
//

import UIKit
import SwiftyJSON

class NewsModel{
    
    var title: String = ""
    var imageURL: String = ""
    var section: String = ""
    var publishingDate: String = ""
    var itemType: String = ""
    var source: String = ""
    
    init() {}
    
    required init(data: JSON) {
        
        title = data.getStringValue(forKey: "title")
        section = data.getStringValue(forKey: "section")
        imageURL = data.getStringValue(forKey: "thumbnail_standard")
        publishingDate = data.getStringValue(forKey: "published_date")
        itemType = data.getStringValue(forKey: "item_type")
        source = data.getStringValue(forKey: "source")
    }
    
    class func arrayFromInstance (array : [JSON]?) -> [NewsModel]?{
        if let count = array?.count, count > 0 {
            return array?.map{
                json -> NewsModel in
                return self.init(data: json)
            }
        }
        return nil
    }
    
}
