//
//  ViewController.swift
//  FormBuilder
//
//  Created by David Thurman on 3/9/17.
//  Copyright © 2017 David Thurman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let field1 = Field(type: "textfield", label: "Label 1", placeholder: "Enter text here")
        let field2 = Field(type: "textfield", label: "Label 2", placeholder: "Enter more text")
        let field3 = Field(type: "datefield", label: "Date 1")
        let field4 = Field(type: "optionfield", label: "Option 1")
        let field5 = Field(type: "radiofield", label: "Radio 1", radioValues: ["Val 1", "Val 2", "Val 3"])
        let fields: [Field] = [field1, field2, field3, field4, field5]
        _ = FormBuilder(view: self.view, fields: fields)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

