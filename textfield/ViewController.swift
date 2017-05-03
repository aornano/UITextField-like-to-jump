//
//  ViewController.swift
//  textfield
//
//  Created by Alessandro Ornano on 29/04/2017.
//  Copyright © 2017 selbstverstandlich. All rights reserved.
//

import UIKit
class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var myTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        myTextField.delegate = self
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("textFieldDidBeginEditing")
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("textFieldDidEndEditing")
    }
}
extension UITextField
{
    override open func layoutSubviews() {
        super.layoutSubviews()
        self.layer.sublayers?.forEach{
            if let subs = $0.sublayers, subs.count>0 {
                var f = $0.frame
                f.origin.y = 0.0
                $0.frame = f
            } else {
                var layerFrame = CGRect.zero
                layerFrame.origin = self.editingRect(forBounds: self.bounds).origin
                layerFrame.size = self.editingRect(forBounds: self.bounds).size
                if let size = self.font?.pointSize, 14 ... 17 ~= size {
                    layerFrame.origin.y = -0.5
                } else {
                    layerFrame.origin.y = 0.0
                }
                $0.frame = layerFrame
            }
        }
    }
}
