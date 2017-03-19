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
    
    var view: UIView? = nil
    var screenWidth: Int = 0
    var currentHeight: Int = 0
    var textColor = UIColor(red:0, green:0, blue:0, alpha:1.0)
    var xIndex: Int = 0
    var tagIncrement: Int = 0
    var tagToValue: [Int : String] = [:]
    var textFieldAlignment: NSTextAlignment = .center
    var labelAlignment: NSTextAlignment = .center
    
    func populateForm(view: UIView, fields: [Field]) {
        self.view = view
        tagIncrement = 1
        tagToValue = [:]
        xIndex = Int(view.frame.size.width)
        self.screenWidth = Int(view.bounds.size.width)
        currentHeight = 50
        for field in fields {
            switch field.type {
            case .text:
                textField(field: field)
            case .date:
                dateField(field: field)
            case .option:
                optionField(field: field)
            case .radio:
                radioField(field: field)
            case .password:
                passwordField(field: field)
            }
        }
    }
    
    func textField(field: Field){
        label(text: field.label)
        let newTextField = UITextField(frame: CGRect(x: xIndex, y: currentHeight, width: 200, height: 21))
        if field.placeholder != nil {
            newTextField.placeholder = field.placeholder!
        }
        newTextField.center.x = self.view!.center.x
        newTextField.textAlignment = textFieldAlignment
        newTextField.font = UIFont.systemFont(ofSize: 15)
        newTextField.borderStyle = UITextBorderStyle.roundedRect
        newTextField.autocorrectionType = UITextAutocorrectionType.no
        newTextField.keyboardType = UIKeyboardType.default
        newTextField.returnKeyType = UIReturnKeyType.done
        newTextField.clearButtonMode = UITextFieldViewMode.whileEditing;
        newTextField.tag = tagIncrement
        tagToValue[tagIncrement] = field.label
        tagIncrement = tagIncrement + 1
        self.view!.addSubview(newTextField)
        currentHeight = currentHeight + 50
    }
    
    func dateField(field: Field){
        label(text: field.label)
        let newDateField = UIDatePicker(frame: CGRect(x: xIndex, y: currentHeight, width: screenWidth, height: 100))
        newDateField.center.x = self.view!.center.x
        newDateField.datePickerMode = .date
        newDateField.setValue(textColor, forKey: "textColor")
        newDateField.tag = tagIncrement
        tagToValue[tagIncrement] = field.label
        tagIncrement = tagIncrement + 1
        self.view!.addSubview(newDateField)
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
        newSwitch.setOn(true, animated: false)
        newSwitch.tag = tagIncrement
        tagToValue[tagIncrement] = field.label
        tagIncrement = tagIncrement + 1
        self.view!.addSubview(newLabel)
        self.view!.addSubview(newSwitch);
        currentHeight = currentHeight + 60
    }
    
    func radioField(field: Field){
        if field.radioValues != nil {
            let newRadioField = UISegmentedControl(items: field.radioValues)
            newRadioField.frame = CGRect(x: xIndex, y: currentHeight, width:200, height: 30)
            newRadioField.selectedSegmentIndex = 0
            newRadioField.tintColor = textColor
            newRadioField.center.x = self.view!.center.x
            newRadioField.tag = tagIncrement
            tagToValue[tagIncrement] = field.label
            tagIncrement = tagIncrement + 1
            self.view!.addSubview(newRadioField)
            currentHeight = currentHeight + 50
        }
    }
    
    func passwordField(field: Field){
        label(text: field.label)
        let newTextField = UITextField(frame: CGRect(x: xIndex, y: currentHeight, width: 200, height: 21))
        if field.placeholder != nil {
            newTextField.placeholder = field.placeholder!
        }
        newTextField.center.x = self.view!.center.x
        newTextField.textAlignment = .center
        newTextField.font = UIFont.systemFont(ofSize: 15)
        newTextField.borderStyle = UITextBorderStyle.roundedRect
        newTextField.autocorrectionType = UITextAutocorrectionType.no
        newTextField.keyboardType = UIKeyboardType.default
        newTextField.returnKeyType = UIReturnKeyType.done
        newTextField.clearButtonMode = UITextFieldViewMode.whileEditing;
        newTextField.isSecureTextEntry = true
        newTextField.tag = tagIncrement
        tagToValue[tagIncrement] = field.label
        tagIncrement = tagIncrement + 1
        self.view!.addSubview(newTextField)
        currentHeight = currentHeight + 50
    }
    
    func label(text: String){
        let label = UILabel(frame: CGRect(x: 0, y: currentHeight, width: 200, height: 21))
        label.text = text
        label.center.x = self.view!.center.x
        label.textAlignment = labelAlignment
        label.textColor = textColor
        self.view!.addSubview(label)
        currentHeight = currentHeight + 50
    }
    
    func getValues() -> [String : String]{
        var valuestoReturn: [String : String] = [:]
        for counter in 1...tagToValue.count {
            var userInput = ""
            if let currentField = view!.viewWithTag(counter) as? UITextField {
                if currentField.text != nil {
                    userInput = currentField.text!
                }
                else {
                    userInput = ""
                }
                
            }
            else if let currentField = view!.viewWithTag(counter) as? UIDatePicker {
                let dateFormatter = DateFormatter()
                dateFormatter.locale = Locale(identifier: "en_US")
                dateFormatter.setLocalizedDateFormatFromTemplate("MMMMdyyyy")
                userInput = dateFormatter.string(from: currentField.date)
            }
            else if let currentField = view!.viewWithTag(counter) as? UISwitch {
                userInput = String(currentField.isOn)
            }
            else if let currentField = view!.viewWithTag(counter) as? UISegmentedControl {
                userInput = String(currentField.selectedSegmentIndex)
            }
            
            valuestoReturn[tagToValue[counter]!] = userInput
            
        }
        return valuestoReturn
    }
    
}

enum Type {
    case text
    case date
    case option
    case radio
    case password
}

class Field {
    
    var type: Type
    var label: String
    var placeholder: String?
    var radioValues: [String]?
    
    //UITextField & Password & Options
    init(type: Type, label: String, placeholder: String?) {
        self.type = type
        self.label = label
        self.placeholder = placeholder
    }
    
    //DatePicker
    init(type: Type, label: String) {
        self.type = type
        self.label = label
    }
    
    //Radio
    init(type: Type, label: String, radioValues: [String]?) {
        self.type = type
        self.label = label
        self.radioValues = radioValues
    }
    
}
