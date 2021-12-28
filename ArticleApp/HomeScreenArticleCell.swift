//
//  HomeScreenArticleCell.swift
//  ArticleApp
//
//  Created by WjdanMo on 25/11/2021.
//

import UIKit

class HomeScreenArticleCell: UITableViewCell {

    
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var cat: UILabel!

    @IBOutlet weak var creationDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
