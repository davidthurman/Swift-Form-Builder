//
//  ViewController.swift
//  FormBuilder
//
//  Created by David Thurman on 3/9/17.
//  Copyright © 2017 David Thurman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var scrollView: UIScrollView!
    var formBuilder : FormBuilder? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let screenSize: CGRect = UIScreen.main.bounds
        let screenWidth = screenSize.width
        self.scrollView.contentSize = CGSize(width: screenWidth, height: CGFloat(2000));
        
        let field1 = Field(type: "text", label: "Username", placeholder: "Enter text here")
        let field2 = Field(type: "password", label: "Password", placeholder: "Enter more text")
        let field3 = Field(type: "date", label: "Birthday")
        let field4 = Field(type: "option", label: "Subscribe")
        let field5 = Field(type: "radio", label: "Account Type", radioValues: ["Buyer", "Seller", "Both"])
        let fields: [Field] = [field1, field2, field3, field4, field5]
        formBuilder = FormBuilder()
        formBuilder!.populateForm(view: self.scrollView, fields: fields)
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func getValues(_ sender: Any) {
        if formBuilder != nil {
            let myValues = formBuilder!.getValues()
            for value in myValues {
                print(value.key, " : ", value.value)
            }
            
        }
    
    }

}

