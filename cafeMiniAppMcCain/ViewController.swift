//
//  ViewController.swift
//  cafeMiniAppMcCain
//
//  Created by SEAN MCCAIN on 9/12/24.
//

import UIKit

var totalPrice = 0.0
var foods = ["apple","banana","chicken","pizza","ham"]
var prices = [0.75,0.55,7.55,14.99,9.99]
var shoppingCart: [String: Int] = [:]

class ViewController: UIViewController {

    let alert = UIAlertController(title: "Administrator Mode", message: "Enter the correct password in order to gain access to administrator features.", preferredStyle: .alert)
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var quantityField: UITextField!
    @IBOutlet weak var dismissErrorButton: UIButton!
    @IBOutlet weak var errorView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        alert.addTextField { alertTextField in
            
            alertTextField.placeholder = "Password"
            alertTextField.keyboardType = .default
            alertTextField.returnKeyType = .go
            alertTextField.isSecureTextEntry = true
            alertTextField.textContentType = .password
            
        }
        
        let button = UIAlertAction(title: "Go", style: .default){ _ in
            
            let alertTextField = self.alert.textFields![0].text
            
            if alertTextField == "password" {
                
                self.performSegue(withIdentifier: "admin", sender: nil)
                
            }
            else{
                
                self.errorView.isHidden = false
                self.dismissErrorButton.tintColor = UIColor.systemRed
                self.errorLabel.textColor = UIColor.systemRed
                self.errorLabel.text = "Error: Incorrect Administrator Passord"
                
            }
            
        }
        alert.addAction(button)
        
        errorView.isHidden = true
        
        if foods.count == 0{
            
            textView.text = "The Menu is Empty"
            
        }
        else{
            
            var text = ""
            for i in 0..<foods.count{
                
                text += "\(foods[i])  -  $\(prices[i])\n"
                
            }
            textView.text = text
            
        }
        
    }

    @IBAction func addButton(_ sender: Any) {
        
        textField.resignFirstResponder()
        quantityField.resignFirstResponder()
        
        if textField.text == "" || quantityField.text == "" {
            
            dismissErrorButton.tintColor = UIColor.systemRed
            errorView.isHidden = false
            errorLabel.textColor = UIColor.systemRed
            errorLabel.text = "Error: Both fields are required"
            
        }
        else{
            
            var itemExists = false
            for i in 0..<foods.count{
                
                if textField.text == foods[i] {
                    
                    itemExists = true
                    
                    var itemInCart = false
                    
                    for item0 in shoppingCart{
                        
                        if foods[i] == item0.key{
                            
                            dismissErrorButton.tintColor = UIColor.systemRed
                            errorView.isHidden = false
                            errorLabel.textColor = UIColor.systemRed
                            errorLabel.text = "Error: Item already in cart"
                            itemInCart = true
                            
                        }
                        
                    }
                    if itemInCart == false{
                        
                        dismissErrorButton.tintColor = UIColor.systemGreen
                        errorView.isHidden = false
                        shoppingCart[foods[i]] = Int(quantityField.text!)
                        totalPrice += prices[i]*Double(quantityField.text!)!
                        errorLabel.textColor = UIColor.systemGreen
                        errorLabel.text = "Item successfully added to cart!"
                        
                    }
                    break
                    
                }
                
            }
            if(itemExists == false){
                
                dismissErrorButton.tintColor = UIColor.systemRed
                errorView.isHidden = false
                errorLabel.textColor = UIColor.systemRed
                errorLabel.text = "Error: Specified item does not exist"
                
            }
            
        }
        
        textField.text = ""
        quantityField.text = ""
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if foods.count == 0{
            
            textView.text = "The Menu is Empty"
            
        }
        else{
            
            var text = ""
            for i in 0..<foods.count{
                
                text += "\(foods[i])  -  $\(prices[i])\n"
                
            }
            textView.text = text
            
        }
        
    }
    
    @IBAction func AdminButton(_ sender: Any) {
        
        self.present (alert, animated: true)
        
    }
    
    @IBAction func cartButton(_ sender: Any) {
        
        textField.resignFirstResponder()
        quantityField.resignFirstResponder()
        
    }
    
    @IBAction func dismissErrorButton(_ sender: Any) {
        
        errorView.isHidden = true
        errorLabel.text = ""
        
    }
}

