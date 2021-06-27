//
//  ViewController.swift
//  Alert
//
//  Created by Григорий Клинтухов on 27/06/2021.
//

//
//  ViewController.swift
//  treni
//
//  Created by Григорий Клинтухов on 27/06/2021.
//

import UIKit

class ViewController: UIViewController {
    // Creating buttons


     let greet = UILabel(frame: CGRect(x: 67, y: 183, width: 300, height: 36))
     let buttonOne = UIButton(frame: CGRect(x: 51, y: 661, width: 140, height: 40))
     let buttonTwo = UIButton(frame: CGRect(x: 243, y: 661, width: 140, height: 40))
     override func viewDidLoad() {
         super.viewDidLoad()
         // Do any additional setup after loading the view.
         createViews()
     }
     override func viewDidAppear(_ animated: Bool) {
         firstAlert()
     }
    // Creating inscription
     func createViews() {
         self.greet.font = UIFont(name: "Arial", size: 30)
         self.greet.textAlignment = .center
         self.greet.text = "Hi,"

         // button addition numbers
        
         self.buttonOne.setTitle("Сложить", for: .normal)
         self.buttonOne.setTitle("nazhato slozhut", for: .highlighted)

         self.buttonOne.backgroundColor = .systemGray // color button
         self.buttonOne.addTarget(self, action: #selector(addition(sender:)), for: .touchUpInside)
            //  button rounding
         self.buttonOne.layer.cornerRadius = 3

            // button guess the number
         self.buttonTwo.setTitle("Угадай число", for: .normal)
         self.buttonTwo.backgroundColor = .systemGray
         self.buttonTwo.addTarget(self, action: #selector(guessTheNumber(sender:)), for: .touchUpInside)
            //  button rounding
         self.buttonTwo.layer.cornerRadius = 5
         self.view.addSubview(self.buttonOne)
         self.view.addSubview(self.buttonTwo)
         self.view.addSubview(self.greet)
     }

            // start programm messege
     func firstAlert()  {
        let alertControl = UIAlertController(title: "Сообщение", message: "Введите ФИО", preferredStyle: .alert)

         let actionOk = UIAlertAction(title: "Ok", style: .default) { _ in
             let text = alertControl.textFields?.first?.text
             self.greet.text = "Hi, " + (text ?? " ")
         }

         alertControl.addTextField(configurationHandler: nil)
         alertControl.addAction(actionOk)

         self.present(alertControl, animated: true, completion: nil)

     }

        // outputing different messages
    
     func otherAlert(title: String,message: String, preferredStyle: UIAlertController.Style )  {
         let alertControl = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)

         let actionOk = UIAlertAction(title: "Ok", style: .default)
         alertControl.addAction(actionOk)
         self.present(alertControl, animated: true, completion: nil)
     }

     //MARK: Запрос и сложение чисел в алерте
     @objc func addition(sender: UIButton) {
         var sum = 0

         let alertControls = UIAlertController(title: "Сложение", message: "Введите числа для сложения", preferredStyle: .alert)
         let actionOk = UIAlertAction(title: "Ok", style: .default) { [self] _ in
             for i in alertControls.textFields! {
                 if let number = i.text {
                    sum += Int(number) ?? 0
                 }
             }
             self.otherAlert(title: "Результат", message: "Сумма чисел равна: \(sum)", preferredStyle: .alert)
         }
         let actionCancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)

         alertControls.addTextField(configurationHandler: nil)// dobavilo 2 polia
         alertControls.addTextField(configurationHandler: nil)

         alertControls.addAction(actionOk)
         alertControls.addAction(actionCancel)

         self.present(alertControls, animated: true, completion: nil)
     }

     //MARK: Реализация функции угадай число
     @objc func guessTheNumber(sender:UIButton) {
         let number = Int.random(in: 1...10)
         let alertControls = UIAlertController(title: "Викторина", message: "Угадай число от 1 до 10", preferredStyle: .alert)
          print(number)
         let actionOk = UIAlertAction.init(title: "Ok", style: .default) { _ in
             if let inputedNumber = alertControls.textFields?.first?.text {
                 print(inputedNumber)
                 if number == Int(inputedNumber) {
                     self.otherAlert(title: "Викторина", message: "Вы угадали!", preferredStyle: .actionSheet)
                 } else {
                     self.otherAlert(title: "Викторина", message: "Вы проиграли!", preferredStyle: .actionSheet)
                 }
             }
         }
         alertControls.addTextField(configurationHandler: nil)
         alertControls.addAction(actionOk)
         self.present(alertControls, animated: true, completion: nil)

     }
 }
