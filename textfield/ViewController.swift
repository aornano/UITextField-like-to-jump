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
        let FieldEditor: AnyObject.Type = NSClassFromString("UIFieldEditor")!
        let LabelLayer: AnyObject.Type = NSClassFromString("_UILabelLayer")!
        self.layer.sublayers?.forEach{
            if ($0.delegate?.self.isKind(of: FieldEditor))! {
                var f = $0.frame
                f.origin.y = 0.0
                $0.frame = f
            }
            if $0.self.isKind(of: LabelLayer) {
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
