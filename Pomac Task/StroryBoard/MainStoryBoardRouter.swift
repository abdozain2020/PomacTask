//
//  HomeTabStoryboardRouter.swift
//  DollarChat
//
//  Created by Sherif Saleh on 8/17/20.
//  Copyright © 2020 inova. All rights reserved.
//

import Foundation
import UIKit

class MainStoryboardRouter {
    
    private static func getStoryboard() -> UIStoryboard {
        return UIStoryboard(name: "Main", bundle: nil)
    }
    
    static func instantiateNewsListViewController () -> NewsDetailsViewController {
        if let newsDetailsViewController: NewsDetailsViewController = getStoryboard().instantiateViewController(withIdentifier: "NewsDetailsViewController") as? NewsDetailsViewController {
            return newsDetailsViewController
        } else {
            return NewsDetailsViewController()
        }
    }
    
    
}

