//
//  NewsListViewModel.swift
//  Pomac Task
//
//  Created by Abdelrahman zain on 10/30/20.
//  Copyright © 2020 Abdelrahman zain. All rights reserved.
//

import Foundation

class NewsListViewModel: AbstractViewModel {
    
    let newsManager = ListManager()
    var newsList = Array<NewsModel>()
    
    func getNewsList(){
        if Connectivity.isConnectedToInternet(){
            delegate?.viewWillUpdate()
            newsManager.getNewsList(onSuccess: { (list) in
                self.newsList = list
                self.delegate?.viewDidUpdate()
            }) { (error) in
                self.delegate?.showErrorView(error: error)
            }
        }else{
            self.delegate?.showErrorView(error: "Connection Error")
        }
    }
    
    
}
