//
//  ViewController2.swift
//  cafeMiniAppMcCain
//
//  Created by Sean McCain on 9/14/24.
//

import UIKit

class ViewController2: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var itemPriceField: UITextField!
    @IBOutlet weak var errorView: UIStackView!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var dismissErrorButton: UIButton!
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
    
    @IBAction func addItembutton(_ sender: Any) {
        
        textField.resignFirstResponder()
        itemPriceField.resignFirstResponder()
        
        if textField.text == "" || itemPriceField.text == ""{
            
            dismissErrorButton.tintColor = UIColor.systemRed
            errorView.isHidden = false
            errorLabel.textColor = UIColor.systemRed
            errorLabel.text = "Error: Both fields are required"
            
        }
        else{
            
            var addItem = true
            for i in 0..<foods.count{
                
                if(textField.text == foods[i]){
                    
                    dismissErrorButton.tintColor = UIColor.systemRed
                    errorView.isHidden = false
                    errorLabel.textColor = UIColor.systemRed
                    errorLabel.text = "Error: Item with the same name already exists"
                    addItem = false
                    break
                    
                }
                
            }
            if addItem{
                
                foods.append(textField.text!)
                prices.append(Double(itemPriceField.text!)!)
                
                dismissErrorButton.tintColor = UIColor.systemGreen
                errorView.isHidden = false
                errorLabel.textColor = UIColor.systemGreen
                errorLabel.text = "Item successfully added!"
                
                var text = ""
                for i in 0..<foods.count{
                    
                    text += "\(foods[i])  -  $\(prices[i])\n"
                    
                }
                textView.text = text
                
            }
            
        }
        textField.text = ""
        itemPriceField.text = ""
        
    }
    
    @IBAction func removeItemButton(_ sender: Any) {
        
        textField.resignFirstResponder()
        itemPriceField.resignFirstResponder()
        
        if textField.text == ""{
            
            dismissErrorButton.tintColor = UIColor.systemRed
            errorView.isHidden = false
            errorLabel.textColor = UIColor.systemRed
            errorLabel.text = "Error: Item Name field is required"
            
        }
        else if itemPriceField.text != ""{
            
            dismissErrorButton.tintColor = UIColor.systemRed
            errorView.isHidden = false
            errorLabel.textColor = UIColor.systemRed
            errorLabel.text = "Error: Price field must be empty to remove items"
            
        }
        else{
            
            var itemExists = false
            for i in 0..<foods.count{
                
                if textField.text == foods[i] {
                        
                    itemExists = true
                    foods.remove(at: i)
                    prices.remove(at: i)
                    
                    errorView.isHidden = false
                    dismissErrorButton.tintColor = UIColor.systemGreen
                    errorLabel.textColor = UIColor.systemGreen
                    errorLabel.text = "Item successfully removed!"
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
        itemPriceField.text = ""
        
    }
    
    @IBAction func dismissErrorButton(_ sender: Any) {
        
        errorView.isHidden = true
        errorLabel.text = ""
        
    }
}
