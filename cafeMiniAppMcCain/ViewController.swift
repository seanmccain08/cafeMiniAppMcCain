//
//  ViewController.swift
//  cafeMiniAppMcCain
//
//  Created by SEAN MCCAIN on 9/12/24.
//

import UIKit

var foods = ["Apple","Banana","Chicken","Pizza","Ham"]
var prices = [0.75,0.55,7.55,14.99,9.99]
var shoppingCart: [String: Int] = [:]

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var quantityField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var text = ""
        for i in 0..<foods.count{
            
            text += foods[i]
            text += "  -  "
            text += "$\(prices[i])\n"
            
        }
        textView.text = text
        
    }

    @IBAction func addButton(_ sender: Any) {
        
        var temp = false
        for item in foods{
            
            if textField.text == item {
                
                temp = true
                errorLabel.isHidden = true
                
            }
            
        }
        if(temp == false){
            
            errorLabel.isHidden = false
            errorLabel.text = "Error: Specified item does not exist"
            
        }
        
        
    }
    
    @IBAction func AdminButton(_ sender: Any) {
        
        
        
    }
    
    @IBAction func cartButton(_ sender: Any) {
        
        
        
    }
    
}

