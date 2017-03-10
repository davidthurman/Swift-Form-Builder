//
//  FormBuilder.swift
//  FormBuilder
//
//  Created by David Thurman on 3/9/17.
//  Copyright © 2017 David Thurman. All rights reserved.
//

import Foundation
import UIKit

class FormBuilder {
    
    var view: UIView
    var screenWidth: Int
    var currentHeight: Int
    var textColor = UIColor(red:0, green:0, blue:0, alpha:1.0)
    
    init(view: UIView, fields: [Field]) {
        self.view = view
        let screenSize: CGRect = UIScreen.main.bounds
        self.screenWidth = Int(screenSize.width)
        currentHeight = 50
        for field in fields {
            switch field.type {
            case "textfield":
                textField(field: field)
            case "datefield":
                dateField(field: field)
            case "optionfield":
                optionField(field: field)
            case "radiofield":
                radioField(field: field)
            default:
                break
            }
        }
    }
    
    func textField(field: Field){
        label(text: field.label)
        let newTextField = UITextField(frame: CGRect(x: 0, y: currentHeight, width: 200, height: 21))
        if field.placeholder != nil {
            newTextField.placeholder = field.placeholder!
        }
        newTextField.center.x = self.view.center.x
        newTextField.textAlignment = .center
        newTextField.font = UIFont.systemFont(ofSize: 15)
        newTextField.borderStyle = UITextBorderStyle.roundedRect
        newTextField.autocorrectionType = UITextAutocorrectionType.no
        newTextField.keyboardType = UIKeyboardType.default
        newTextField.returnKeyType = UIReturnKeyType.done
        newTextField.clearButtonMode = UITextFieldViewMode.whileEditing;
        view.addSubview(newTextField)
        currentHeight = currentHeight + 50
    }
    
    func dateField(field: Field){
        label(text: field.label)
        let newDateField = UIDatePicker(frame: CGRect(x: 0, y: currentHeight, width: screenWidth, height: 100))
        newDateField.center.x = self.view.center.x
        newDateField.datePickerMode = .date
        newDateField.setValue(textColor, forKey: "textColor")
        view.addSubview(newDateField)
        currentHeight = currentHeight + 150
    }
    
    func optionField(field: Field){
        let labelWidth = Int(Double(screenWidth) * 0.25)
        let newLabel = UILabel(frame: CGRect(x: labelWidth, y: currentHeight, width: 200, height: 21))
        let labelPosition = Int(Double(screenWidth) * 0.75) - 25
        newLabel.text = field.label
        newLabel.textColor = textColor
        let newSwitch = UISwitch(frame: CGRect(x:labelPosition,y: currentHeight, width: screenWidth, height: 50))
        newSwitch.isOn = true
        newSwitch.setOn(true, animated: false);
        self.view.addSubview(newLabel)
        self.view.addSubview(newSwitch);
        currentHeight = currentHeight + 50
    }
    
    func radioField(field: Field){
        if field.radioValues != nil {
            let newRadioField = UISegmentedControl(items: field.radioValues)
            newRadioField.frame = CGRect(x: 0, y: currentHeight, width:200, height: 30)
            newRadioField.selectedSegmentIndex = 0
            newRadioField.tintColor = textColor
            newRadioField.center.x = self.view.center.x
            self.view.addSubview(newRadioField)
            currentHeight = currentHeight + 50
        }
    }
    
    func label(text: String){
        let label = UILabel(frame: CGRect(x: 0, y: currentHeight, width: 200, height: 21))
        label.text = text
        label.center.x = self.view.center.x
        label.textAlignment = .center
        label.textColor = textColor
        view.addSubview(label)
        currentHeight = currentHeight + 50
    }
    
}

class Field {
    
    var type: String
    var label: String
    var placeholder: String?
    var radioValues: [String]?
    
    //UITextField
    init(type: String, label: String, placeholder: String?) {
        self.type = type
        self.label = label
        self.placeholder = placeholder
    }
    
    //DatePicker
    init(type: String, label: String) {
        self.type = type
        self.label = label
    }
    
    init(type: String, label: String, radioValues: [String]?) {
        self.type = type
        self.label = label
        self.radioValues = radioValues
    }
    
}
