//
//  NewsListViewController.swift
//  Pomac Task
//
//  Created by Abdelrahman zain on 10/29/20.
//  Copyright © 2020 Abdelrahman zain. All rights reserved.
//

import UIKit
import Toast_Swift

class NewsListViewController: UIViewController {
    
    @IBOutlet weak var newsTableView: UITableView!
    let loadingSpinner = UIActivityIndicatorView(style: .medium)
    
    let newsTableViewCellIdentifier = "NewsTableViewCell"
    let reloadTableViewCellIdentifier = "ReloadTableViewCell"
    let newsListViewModel = NewsListViewModel()
    
    var showReloadTableCell = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newsListViewModel.delegate = self
        registerTableViewCells()
        getNewsList()
    }
    
    func registerTableViewCells(){
        let newsCellNibFile = UINib(nibName: newsTableViewCellIdentifier , bundle: nil)
        newsTableView.register(newsCellNibFile, forCellReuseIdentifier: newsTableViewCellIdentifier)
        
        let reloadCellNibFile = UINib(nibName: reloadTableViewCellIdentifier , bundle: nil)
        newsTableView.register(reloadCellNibFile, forCellReuseIdentifier: reloadTableViewCellIdentifier)
    }
    
    func getNewsList(){
        newsListViewModel.getNewsList()
    }
    
    @objc func reloadFunction(sender: UIButton){
        //hide reload button when loader starts
        sender.isHidden = true
        
        getNewsList()
    }
    
    func hideLoaderIndicator(){
        loadingSpinner.stopAnimating()
        newsTableView.backgroundView = nil
    }
    
    func showLoaderIndicator(){
        loadingSpinner.startAnimating()
        newsTableView.backgroundView = loadingSpinner
    }
}


extension NewsListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(showReloadTableCell){ //return 1 cell which is the reload table cell
            return 1
        }else{
            return newsListViewModel.newsList.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if  newsListViewModel.newsList.isEmpty , let cell = tableView.dequeueReusableCell(withIdentifier: "ReloadTableViewCell", for: indexPath) as? ReloadTableViewCell{
            cell.reloadButton.addTarget(self, action: #selector(reloadFunction), for: .touchUpInside)
            
            if(showReloadTableCell){
                //show reload button again if it was hidden
                cell.reloadButton.isHidden = false
            }
            
            return cell
        }else if let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell", for: indexPath) as? NewsTableViewCell, indexPath.row < newsListViewModel.newsList.count {
            cell.setNewsDataToView(newsModel: newsListViewModel.newsList[indexPath.row])
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //avoid clicking on reload cell
        if(indexPath.row < newsListViewModel.newsList.count){
            let detailsVC = MainStoryboardRouter.instantiateNewsListViewController()
            detailsVC.newsDetailsViewModel.newsDetailsModel = newsListViewModel.newsList[indexPath.row]
            navigationController?.pushViewController(detailsVC, animated: true)
        }
    }
}

extension NewsListViewController:ViewModelUIDelegate{
    
    func viewWillUpdate() {
        showLoaderIndicator()
    }
    
    func viewDidUpdate() {
        hideLoaderIndicator()
        showReloadTableCell = false
        newsTableView.reloadData()
    }
    
    func showErrorView(error: String) {
        hideLoaderIndicator()
        showReloadTableCell = true
        
        //reload table to show reload cell
        newsTableView.reloadData()
        
        self.view.makeToast(error)
    }
}


