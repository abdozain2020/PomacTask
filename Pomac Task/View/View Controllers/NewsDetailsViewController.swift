//
//  NewsDetailsViewController.swift
//  Pomac Task
//
//  Created by Abdelrahman zain on 10/30/20.
//  Copyright © 2020 Abdelrahman zain. All rights reserved.
//

import UIKit

class NewsDetailsViewController: UIViewController {

    @IBOutlet weak var articleImageView: UIImageView!
    @IBOutlet weak var articleTitleLabel: UILabel!
    @IBOutlet weak var articleTypeLabel: UILabel!
    @IBOutlet weak var articleSectionLabel: UILabel!
    @IBOutlet weak var articleSourceLabel: UILabel!
    @IBOutlet weak var articlePublishedAtLabel: UILabel!
    
    
    let newsDetailsViewModel = NewsDetailsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Article Data"
        
        setDataToView()
    }
    
    func setDataToView(){
        articleImageView.sd_setImage(with: URL(string: newsDetailsViewModel.newsDetailsModel.imageURL), placeholderImage: UIImage(named: "imagePlaceHolder"), options: .refreshCached, context: nil)
        articleTitleLabel.text = newsDetailsViewModel.newsDetailsModel.title
        articleTypeLabel.text = newsDetailsViewModel.newsDetailsModel.itemType
        articleSectionLabel.text = newsDetailsViewModel.newsDetailsModel.section
        articleSourceLabel.text = newsDetailsViewModel.newsDetailsModel.source
        articlePublishedAtLabel.text = newsDetailsViewModel.newsDetailsModel.publishingDate
    }
   
}
