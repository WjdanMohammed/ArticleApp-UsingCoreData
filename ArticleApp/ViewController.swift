//
//  ViewController.swift
//  ArticleApp
//
//  Created by WjdanMo on 25/11/2021.
//

import UIKit
import CoreData

enum Category : Int {
    case all = 0, art = 1, lifestyle = 2, iOS = 3
}

class ViewController: UIViewController {
    
    @IBOutlet weak var categorySwitch: UISegmentedControl!
    
    @IBOutlet weak var articlesTableView: UITableView!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var articleArray = [Article]()
    
    var selectedArticle = ""
    var selectedArticleContent = ""
    var selectedArticleCat = ""
    var selectedArticleCreationDate = ""
    var formattedDate = ""
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        articlesTableView.delegate = self
        articlesTableView.dataSource = self
        loadData()
        articlesTableView.reloadData()
        
    }
    
    @IBAction func categorySwitched(_ sender: Any) {
        switch categorySwitch.selectedSegmentIndex {
            
        case Category.all.rawValue :
            loadData()
            
        case Category.art.rawValue :
            filterArticles(cat: "Art")
            
        case Category.lifestyle.rawValue :
            filterArticles(cat: "Lifestyle")
            
        case Category.iOS.rawValue :
            filterArticles(cat: "iOS")
            
        default:
            loadData()
            
        }
    }
}

extension ViewController : UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        articleArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "articleCell", for: indexPath) as! HomeScreenArticleCell
        
        cell.title.text = articleArray[indexPath.row].title
        cell.cat.text = articleArray[indexPath.row].cat
        cell.creationDate.text = dateFormatter(date: articleArray[indexPath.row].creationTime ?? Date.now)
        cell.layer.cornerRadius = 6
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        context.delete(articleArray[indexPath.row])
        articleArray.remove(at: indexPath.row)
        saveData()
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedArticle = articleArray[indexPath.row].title!
        selectedArticleContent = articleArray[indexPath.row].content!
        selectedArticleCat = articleArray[indexPath.row].cat!
        selectedArticleCreationDate = dateFormatter(date: articleArray[indexPath.row].creationTime ?? Date.now)
        
        self.performSegue(withIdentifier: "segueID", sender:self)
        
    }
}


extension ViewController{
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "segueID" {
            let articleDetailsVC = segue.destination as! ArticleDetailsVC
            articleDetailsVC.selectedArticle = selectedArticle
            articleDetailsVC.selectedArticleCat = selectedArticleCat
            articleDetailsVC.selectedArticleContent = selectedArticleContent
            articleDetailsVC.selectedArticleCreationDate = selectedArticleCreationDate
        }
    }
    
    func loadData() {
        
        let request : NSFetchRequest<Article> = Article.fetchRequest()
        do {
            articleArray = try context.fetch(request)
        } catch {
            print("Error loading data \(error)")
        }
        articlesTableView.reloadData()
    }
    
    func saveData() {
        do {
            try context.save()
        } catch {
            print("Error saving context \(error)")
        }
        articlesTableView.reloadData()
    }
    
    
    func filterArticles(cat: String){
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let request : NSFetchRequest<Article> = Article.fetchRequest()
        request.predicate = NSPredicate(format: "cat LIKE %@", cat)
    
        do {
            articleArray = try context.fetch(request)
        }
        catch{
            print("Error loading data \(error)")
        }
        articlesTableView.reloadData()
    }
    
    func dateFormatter(date: Date) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let formattedDate = dateFormatter.string(from: date)
        return formattedDate
    }
}
