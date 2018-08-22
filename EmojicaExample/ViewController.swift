//
//  ViewController.swift
//  EmojicaExample
//
//  Created by ryo.izumi on 2018/08/22.
//  Copyright © 2018年 izm. All rights reserved.
//

import UIKit
import Emojica

class ViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var textField: UITextField!
    let emojica = Emojica()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        textView.delegate = self
        textField.delegate = self
        
        emojica.font = textField.font
        emojica.imageSet = .twemoji
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

// MARK: TextViewDelegate

extension ViewController : UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        emojica.textViewDidChange(textView)
    }
}

// MARK: TextFieldDelegate

extension ViewController : UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        // textField.attributedText = emojica.convert(string: textField.text!)

        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
}
