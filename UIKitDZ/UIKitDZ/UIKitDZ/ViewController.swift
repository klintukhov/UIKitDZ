//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Григорий Клинтухов on 26/06/2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func firstButton(_ sender: Any) {
        
        let aletController = UIAlertController.init(title: "Error", message: "Achtung", preferredStyle: .alert)
        let action = UIAlertAction(title: "ok", style: .default) { (action) in
            }
        aletController.addTextField(configurationHandler: nil)
        let text = aletController.textFields?.first?.text
        print(text ?? "nil text")
        
        aletController .addAction(action)
        self.present(aletController, animated: true, completion: nil)
        
    }
    
    func alert (title: String, message: String, style: UIAlertController) {
        
    }
    
    
    
    
    
    
    
    
    @IBAction func buttonTwo(_ sender: Any) {
        
        self.alert(title: "WARNING", message: "Enter your name", style: .alert)
    }
    func alert (title: String, message: String, style: UIAlertController.Style) {
        let aletController = UIAlertController (title: title, message: message, preferredStyle: style)
        
        let action = UIAlertAction(title: "ok", style: .default) { (action) in
            
        }
        aletController.addTextField { (textField) in
            let text = aletController.textFields?.first
        }
        
        aletController .addAction(action)
        self.present(aletController, animated: true, completion: nil)
    }
    
}

