//
//  ViewController.swift
//  Input Listener
//
//  Created by Emir on 30.08.2020.
//  Copyright © 2020 Emir Beytekin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, EBTextFieldDelegate {
    
    @IBOutlet weak var input1: EBInput!
    @IBOutlet weak var input2: EBInput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        input1.delegate = self
        input2.delegate = self
    }
    
    func EBBeginEditing() {
        print(#function)
    }
    
    func EBEndEditing() {
        print(#function)
    }
    
    func EBShouldReturn(textField: UITextField) {
        textField.resignFirstResponder()
    }
    
    func getMyText(text: String) {
        print("controller", text)
    }


}

