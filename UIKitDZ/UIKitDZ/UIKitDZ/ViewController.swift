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


    @IBAction func showButton(_ sender: Any) {
        
        let aletController = UIAlertController.init(title: "Error", message: "Achtung", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "ok", style: .default) { (action) in
            
        }
        
        aletController .addAction(action)
        self.present(aletController, animated: true, completion: nil)
        
    }
    
    
    @IBAction func buttonTwo(_ sender: Any) {
        let aletController = UIAlertController.init(title: "Error", message: "Achtung", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "ok", style: .default) { (action) in
            
        }
        
        aletController .addAction(action)
        self.present(aletController, animated: true, completion: nil)
    }
    
}

