//
//  ViewController.swift
//  FormBuilder
//
//  Created by David Thurman on 3/9/17.
//  Copyright © 2017 David Thurman. All rights reserved.
//

import UIKit

class MyScrollView: UIScrollView {
    override var frame: CGRect {
        didSet {
            print("\(frame)")
        }
    }
}

class ViewController: UIViewController {
    
    @IBOutlet var scrollView: UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let screenSize: CGRect = UIScreen.main.bounds
        let screenWidth = screenSize.width
        if let myScroll = scrollView{
            print("")
        }
        //self.scrollView.contentSize = CGSize(width: screenWidth, height: CGFloat(2000));
        
        let field1 = Field(type: "text", label: "Label 1", placeholder: "Enter text here")
        let field2 = Field(type: "password", label: "Label 2", placeholder: "Enter more text")
        let field3 = Field(type: "date", label: "Date 1")
        let field4 = Field(type: "option", label: "Option 1")
        let field5 = Field(type: "radio", label: "Radio 1", radioValues: ["Val 1", "Val 2", "Val 3"])
        let fields: [Field] = [field1, field2, field3, field4, field5]
        _ = FormBuilder(view: self.scrollView, fields: fields)
        scrollView.layoutSubviews()
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

