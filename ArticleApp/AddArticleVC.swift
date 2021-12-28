//
//  AddArticleVC.swift
//  ArticleApp
//
//  Created by WjdanMo on 25/11/2021.
//

import UIKit
import CoreData

enum Category2 : Int {
    case art = 0, lifestyle = 1, iOS = 2
}

class AddArticleVC: UIViewController {
    
    @IBOutlet weak var articleName: UITextView!
    
    @IBOutlet weak var articleContent: UITextView!
    
    @IBOutlet weak var articleCat: UISegmentedControl!
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

//    var homeVC = ViewController()
    
    var articleArray = [Article]()
    var catSelected = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        articleName.layer.cornerRadius = 10
        articleContent.layer.cornerRadius = 10
    }
    
    @IBAction func createNewArticle(_ sender: Any) {
        let newArticle = Article(context: self.context)
        newArticle.title = articleName.text
        newArticle.content = articleContent.text
        newArticle.cat = catSelected
        newArticle.creationTime = Date()
        
        self.articleArray.append(newArticle)
        saveData()
//        homeVC.loadData()
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func indexChanged(_ sender: Any) {
        switch segmentedControl.selectedSegmentIndex {
        case Category2.art.rawValue :
            catSelected = "Art"
            
        case Category2.lifestyle.rawValue :
            catSelected = "Lifestyle"
            
        case Category2.iOS.rawValue :
            catSelected = "iOS"
        default:
            catSelected = ""
        }
    }
    
    func saveData() {
        do {
            try context.save()
        } catch {
            print("Error saving context \(error)")
        }
    }

}



