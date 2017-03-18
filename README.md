# FormBuilder

## Overview
**FormBuilder** is a Swift framework that allows you to easily populate a view with a variety of form elements.

## Installation
Drag the FormBuilder.swift file into your project.

## Usage
Create a Field for each form element you need. Each type of element will accept the required values it needs. Then initialize the FormBuilder class with the view you want populated and an array of your Field elements.

```swift
let field1 = Field(type: "text", label: "Label 1", placeholder: "Enter text here")
let field2 = Field(type: "password", label: "Label 2", placeholder: "Enter more text")
let field3 = Field(type: "date", label: "Date 1")
let field4 = Field(type: "option", label: "Option 1")
let field5 = Field(type: "radio", label: "Radio 1", radioValues: ["Val 1", "Val 2", "Val 3"])
let fields: [Field] = [field1, field2, field3, field4, field5]
_ = FormBuilder(view: self.view, fields: fields)
```

If you have a long form or undetermined amount of elements, you might want to use something like a scrollview. You can easily pass in a different type of view to the FormBuilder class...

```swift
//I am setting the content size for my scrollview before I pass it to FormBuilder
let screenSize: CGRect = UIScreen.main.bounds
let screenWidth = screenSize.width
self.scrollView.contentSize = CGSize(width: screenWidth, height: CGFloat(2000));
        
let field1 = Field(type: "text", label: "Label 1", placeholder: "Enter text here")
let field2 = Field(type: "password", label: "Label 2", placeholder: "Enter more text")
let field3 = Field(type: "date", label: "Date 1")
let field4 = Field(type: "option", label: "Option 1")
let field5 = Field(type: "radio", label: "Radio 1", radioValues: ["Val 1", "Val 2", "Val 3"])
let fields: [Field] = [field1, field2, field3, field4, field5]
_ = FormBuilder(view: self.scrollView, fields: fields)
```


