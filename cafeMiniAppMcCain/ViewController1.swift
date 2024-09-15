//
//  ViewController1.swift
//  cafeMiniAppMcCain
//
//  Created by SEAN MCCAIN on 9/13/24.
//

import UIKit

class ViewController1: UIViewController {

    
    @IBOutlet weak var cartTextView: UITextView!
    @IBOutlet weak var priceTextLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var text = ""

        if(shoppingCart.count == 0){
            
            cartTextView.text = "The Shopping Cart is Empty"
            
        }
        else{
            
            for item in shoppingCart{
                
                text+=item.key
                text+=" x\(item.value)\n"
                
            }
            cartTextView.text = text
            
            totalPrice*=100
            totalPrice.round()
            totalPrice/=100
            
            priceTextLabel.text = "Total: $\(totalPrice)"
            
        }
        
    }
    
}
