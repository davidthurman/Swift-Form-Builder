# FormBuilder

## Overview
**FormBuilder** is a Swift framework that allows you to easily populate a view with a variety of form elements.

------ 
![Platform](https://img.shields.io/badge/platform-ios-lightgrey.svg)

------
![alt_tag](https://i.imgur.com/bSn65k9.png)



## Installation
Drag the FormBuilder.swift file into your project.

## Usage
### Building the Form
Create a FormBuilder variable in your ViewController

```swift
var myFormBuilder = FormBuilder()
```

Create a Field for each form element you need. Each type of element will accept the required values it needs. Then initialize the FormBuilder variable with the view you want populated and an array of your Field elements.

```swift
let field1 = Field(type: .text, label: "Username", placeholder: "Enter text here")
let field2 = Field(type: .password, label: "Password", placeholder: "Enter more text")
let field3 = Field(type: .date, label: "Birthday")
let field4 = Field(type: .option, label: "Subscribe")
let field5 = Field(type: .radio, label: "Account Type", radioValues: ["Buyer", "Seller", "Both"])
let fields: [Field] = [field1, field2, field3, field4, field5]
myFormBuilder.populateForm(view: self.view, fields: fields)
```

If you have a long form or undetermined amount of elements, you might want to use something like a scrollview. You can easily pass in a different type of view to the FormBuilder class...

```swift
//I am setting the content size for my scrollview before I pass it to FormBuilder
let screenSize: CGRect = UIScreen.main.bounds
let screenWidth = screenSize.width
self.scrollView.contentSize = CGSize(width: screenWidth, height: CGFloat(2000));
        
let field1 = Field(type: .text, label: "Username", placeholder: "Enter text here")
let field2 = Field(type: .password, label: "Password", placeholder: "Enter more text")
let field3 = Field(type: .date, label: "Birthday")
let field4 = Field(type: .option, label: "Subscribe")
let field5 = Field(type: .radio, label: "Account Type", radioValues: ["Buyer", "Seller", "Both"])
let fields: [Field] = [field1, field2, field3, field4, field5]
myFormBuilder.populateForm(view: self.scrollView, fields: fields)
```

Note: I came across a bug using an outdated version of XCode that creates issues when passing a ScrollView to FormBuilder. If you are having any issues, try updating XCode.

### Retrieve Values
In order to retrieve the values from your FormBuilder, call the getValues function from your FormBuilder variable
```swift
let myValues = myFormBuilder.getValues()
for value in myValues {
    print(value.key, " : ", value.value)
}
```

Note: FormBuilder uses tags to keep track of every element in the view. It will assign your first form element to tag 1, your second element to tag 2, and etc. If you are using other tags in the same view controller, make sure you do not use conflicting tag numbers.


