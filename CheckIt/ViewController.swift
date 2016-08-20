//
//  ViewController.swift
//  CheckIt
//
//  Created by Manisha Ramprasad on 8/13/16.
//  Copyright © 2016 Manisha Ramprasad. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate{
    
    var name: String
    var bday: String
    
    //MARK: Initialization
    required init?(coder aDecoder: NSCoder) {
        self.name = ""
        self.bday = ""
        super.init(coder: aDecoder)
    }

    //MARK: Properties
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var birthdayLabel: UILabel!
    @IBOutlet weak var birthdayPicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.delegate = self
    }

    //MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //Hide the keyboard
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        name = textField.text!
    }
    
    //MARK: Actions
    @IBAction func birthdayPickerAction(_ sender: AnyObject) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy"
        bday = dateFormatter.string(from: birthdayPicker.date)
    }

    @IBAction func submitInfoButton(_ sender: AnyObject) {
        print("My name is " + name + " and my birthday is " + bday)
        let age: Int = calcAge(birthday: bday)
        print("I am \(age) years old")
    }
    
    //MARK: Calculations
    func calcAge(birthday:String) -> Int{
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "MM/dd/yyyy"
        let birthdayDate = dateFormater.date(from: birthday)
        let calendar: Calendar! = Calendar(calendarIdentifier: Calendar.Identifier.gregorian)
        let now: NSDate! = NSDate()
        let calcAge = calendar.components(.year, from: birthdayDate!, to: now as Date, options: [])
        let age = calcAge.year
        return age!
    }

}

