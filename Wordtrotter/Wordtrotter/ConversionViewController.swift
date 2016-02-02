//
//  ConversionViewController.swift
//  Wordtrotter
//
//  Created by Joost Holslag on 02-02-16.
//  Copyright © 2016 Joost Holslag. All rights reserved.
//

import UIKit
class ConversionViewController: UIViewController {
    @IBOutlet var celsiusLabel: UILabel!
    @IBOutlet var textField: UITextField!
    
    @IBAction func fahrenheitFieldEditingChanged(textField: UITextField){
        if let text = textField.text where !text.isEmpty{
            celsiusLabel.text = text
        }else{
            celsiusLabel.text = "???"
        }
    }
    
    @IBAction func dismissKeyboard(sender: AnyObject){
        textField.resignFirstResponder()
    }
    
    
}
