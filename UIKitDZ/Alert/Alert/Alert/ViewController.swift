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


     let myLabel = UILabel(frame: CGRect(x: 67, y: 183, width: 300, height: 36))
     let firstButton = UIButton(frame: CGRect(x: 51, y: 661, width: 140, height: 40))
     let secondButton = UIButton(frame: CGRect(x: 243, y: 661, width: 140, height: 40))
     override func viewDidLoad() {
         super.viewDidLoad()
         // Do any additional setup after loading the view.
         createViews()
     }
     override func viewDidAppear(_ animated: Bool) {
         firstAlert()
     }

     func createViews() {
         //MARK: создаем надпись
         self.myLabel.font = UIFont(name: "Arial", size: 30)
         self.myLabel.textAlignment = .center
         self.myLabel.text = "Hi,"

         //MARK: кнопка сложения чисел
        
         self.firstButton.setTitle("Сложить", for: .normal)
         self.firstButton.setTitle("nazhato slozhut", for: .highlighted)

        self.firstButton.backgroundColor = .systemGray // color button
         self.firstButton.addTarget(self, action: #selector(addition(sender:)), for: .touchUpInside)
         self.firstButton.layer.cornerRadius = 3 // zakruglenie

         //MARK: кнопка угадай число
         self.secondButton.setTitle("Угадай число", for: .normal)
         self.secondButton.backgroundColor = .systemGray
         self.secondButton.addTarget(self, action: #selector(guessTheNumber(sender:)), for: .touchUpInside)
         self.secondButton.layer.cornerRadius = 5
         self.view.addSubview(self.firstButton)
         self.view.addSubview(self.secondButton)
         self.view.addSubview(self.myLabel)
     }

     //MARK: сообщение при старте программы
     func firstAlert()  {
        let alertControl = UIAlertController(title: "Сообщение", message: "Введите ФИО", preferredStyle: .alert)

         let actionOk = UIAlertAction(title: "Ok", style: .default) { _ in
             let text = alertControl.textFields?.first?.text
             self.myLabel.text = "Hi, " + (text ?? " ")
         }

         alertControl.addTextField(configurationHandler: nil)
         alertControl.addAction(actionOk)

         self.present(alertControl, animated: true, completion: nil)

     }

     //MARK: для вывода разных сообщений
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
