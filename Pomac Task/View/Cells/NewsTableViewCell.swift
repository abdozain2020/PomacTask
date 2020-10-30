//
//  NewsTableViewCell.swift
//  Pomac Task
//
//  Created by Abdelrahman zain on 10/30/20.
//  Copyright © 2020 Abdelrahman zain. All rights reserved.
//

import UIKit
import SDWebImage

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var newsTitleLabel: UILabel!
    @IBOutlet weak var newsPublishingDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setNewsDataToView(newsModel:NewsModel){
        newsImageView.sd_setImage(with: URL(string: newsModel.imageURL), placeholderImage: UIImage(named: "imagePlaceHolder"), options: .refreshCached, context: nil)
        newsTitleLabel.text = newsModel.title
        newsPublishingDate.text = newsModel.publishingDate
        
    }
    
}
