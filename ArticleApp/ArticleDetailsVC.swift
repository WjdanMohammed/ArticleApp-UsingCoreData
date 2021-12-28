//
//  ArticleDetailsVC.swift
//  ArticleApp
//
//  Created by WjdanMo on 25/11/2021.
//

import UIKit
import CoreData

class ArticleDetailsVC: UIViewController {
    
    @IBOutlet weak var articleTitle: UILabel!
    
    @IBOutlet weak var articleCat: UILabel!
    
    @IBOutlet weak var articleCreationTime: UILabel!
    
    @IBOutlet weak var articleContent: UITextView!
    
    var selectedArticle = ""
    var selectedArticleCat = ""
    var selectedArticleContent = ""
    var selectedArticleCreationDate = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        articleTitle.text = selectedArticle
        articleContent.text = selectedArticleContent
        articleCat.text = selectedArticleCat
        articleCreationTime.text = selectedArticleCreationDate
      
        articleContent.layer.cornerRadius = 10
        
    }

}
