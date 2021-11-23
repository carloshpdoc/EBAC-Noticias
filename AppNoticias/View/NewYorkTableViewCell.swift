//
//  NewYorkTableViewCell.swift
//  AppNoticias
//
//  Created by Carlos Carmo on 21/11/21.
//

import UIKit

class NewYorkTableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var imageNews: UIImageView!
    @IBOutlet weak var by: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        imageNews.layer.cornerRadius = 10
        imageNews.layer.borderWidth = 1
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func prepare(with news: ResultNews) {
        title.text = news.title
        by.text = news.byline
        imageNews.image = UIImage(named: "17malcolmx-mediumThreeByTwo440-v2")
    }

}
