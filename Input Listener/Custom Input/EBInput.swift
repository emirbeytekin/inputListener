//
//  EBInput.swift
//  Input Listener
//
//  Created by Emir on 30.08.2020.
//  Copyright © 2020 Emir Beytekin. All rights reserved.
//

import UIKit

@objc protocol EBTextFieldDelegate {
    
    func EBBeginEditing()
    func EBEndEditing()
    func EBShouldReturn(textField: UITextField)
    func getMyText(text: String)
}

@IBDesignable class EBInput: UIView, UITextFieldDelegate {

    @IBOutlet var view: UIView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet var delegate: AnyObject?

    override init(frame: CGRect) {
        super.init(frame: frame)
        nibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        nibSetup()
    }
    
    
    private func nibSetup() {
        backgroundColor = .clear
        view = loadViewFromNib()
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.translatesAutoresizingMaskIntoConstraints = true
        addSubview(view)
    }
    
    private func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let nibView = nib.instantiate(withOwner: self, options: nil).first as! UIView
        return nibView
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        delegate?.EBBeginEditing()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        delegate?.EBEndEditing()
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        delegate?.EBShouldReturn(textField: textField)
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let updatedString = (textField.text as NSString?)?.replacingCharacters(in: range, with: string) ?? ""
        delegate?.getMyText(text: updatedString)
        return true
    }
}
