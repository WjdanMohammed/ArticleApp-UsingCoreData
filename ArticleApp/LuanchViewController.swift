//
//  LuanchViewController.swift
//  ArticleApp
//
//  Created by WjdanMo on 29/11/2021.
//

import UIKit
import Lottie

class LuanchViewController: UIViewController {

    
    @IBOutlet weak var buttonBounry: UIButton!
    
    
    @IBOutlet weak var viewAnimation: AnimationView!
    override func viewDidLoad() {
        super.viewDidLoad()
        viewAnimation?.loopMode = .loop
        viewAnimation?.animationSpeed = 1.5
        view.addSubview(viewAnimation!)
        viewAnimation?.play()
        buttonBounry.layer.cornerRadius = 20

        // Do any additional setup after loading the view.
    }
    
    @IBAction func openApp(_ sender: Any) {
        performSegue(withIdentifier: "goMain", sender: self)
    }
       
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
