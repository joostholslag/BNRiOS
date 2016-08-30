//
//  ConversionViewController.swift
//  Wordtrotter
//
//  Created by Joost Holslag on 02-02-16.
//  Copyright © 2016 Joost Holslag. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController, UITextFieldDelegate {
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        //show a dark theme if current time is ealier than 0600 or later than 1800
        let calendar = NSCalendar.currentCalendar()
        let hour = calendar.component(.Hour,fromDate: NSDate())
        var nightTime: Bool
        if (hour < 6 || hour >= 18 ){ nightTime = true}
        else {nightTime = false}
        if (nightTime) {
            view.backgroundColor = UIColor.blackColor()
            textField.textColor = UIColor.whiteColor()
            isReally.textColor = UIColor.whiteColor()
        }
        // consider else option for edge cases
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ConversionViewController loaded its view")
    }
    
    
    @IBOutlet var celsiusLabel: UILabel!
    
    var fahrenheitValue: Double?{
        didSet{
            updateCelsiusLabel()
        }
    }
    
    var celsiusValue: Double?{
        if let value = fahrenheitValue{
            return (value - 32) * (5/9)
        }
        else {
            return nil
        }
    }
    let numberFormatter: NSNumberFormatter = {
        let nf = NSNumberFormatter()
        nf.numberStyle = .DecimalStyle
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()
    
    func updateCelsiusLabel(){
        if let value = celsiusValue{
         //   celsiusLabel.text = "\(value)"
            celsiusLabel.text = numberFormatter.stringFromNumber(value)
        }
        else{
            celsiusLabel.text = "???"
        }
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
//backspace not working because it's not in validChars
//        print("Current text: \(textField.text)")
//        print("Replacement text: \(string)")
//
//        return true
//        let validChars = NSCharacterSet.init(charactersInString: "-0123456789.,") //only allow these characters
//        if string.rangeOfCharacterFromSet(validChars) != nil {
//            let existingTextHasDecimalSeperator = textField.text?.rangeOfString(".") // disallow two decimal separators in the input field
//            let replacementTextHasDecimalSeparator = string.rangeOfString(".")
//            if (existingTextHasDecimalSeperator != nil && replacementTextHasDecimalSeparator != nil) {
//                    return false
//            }else{  return true}
//        } else {    return false }
//    }
    
    let currentLocale = NSLocale.currentLocale()
    let decimalSeparator = currentLocale.objectForKey(NSLocaleDecimalSeparator) as! String
    let existingTextHasDecimalSeparator = textField.text?.rangeOfString(decimalSeparator)
    let replacementTextHasDecimalSeparator = string.rangeOfString(decimalSeparator)
    
        if existingTextHasDecimalSeparator != nil && replacementTextHasDecimalSeparator != nil {
            return false
        } else{
            return true
        }
        
    }
    
    @IBOutlet var textField: UITextField!
    @IBOutlet var isReally: UILabel!
    
    
    @IBAction func fahrenheitFieldEditingChanged(textField: UITextField){
//        if let text = textField.text where !text.isEmpty{
//            celsiusLabel.text = text
//        }else{
//            celsiusLabel.text = "???"
//        }
//        if let text = textField.text, value = Double(text){
//            fahrenheitValue = value
//        }else{
//            fahrenheitValue = nil
//        }
//    }
//    
                if let text = textField.text, number = numberFormatter.numberFromString(text) { fahrenheitValue = number.doubleValue
                }else{
                    fahrenheitValue = nil
                }
            }
            

    
    @IBAction func dismissKeyboard(sender: AnyObject){
        textField.resignFirstResponder()
    }
    
    
}
