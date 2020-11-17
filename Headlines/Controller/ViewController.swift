//
//  ViewController.swift
//  Headlines
//
//  Created by Md Ashfaqur Rahman on 16/11/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var newsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTextField.delegate = self
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(DismissKeyboard))
        view.addGestureRecognizer(tap)
        newsTableView.addGestureRecognizer(tap)
    }
    
    @objc func DismissKeyboard(){
        //Causes the view to resign from the status of first responder.
        view.endEditing(true)
    }


    @IBAction func searchButton(_ sender: UIButton) {
        searchTextField.endEditing(true)
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("Click me 1")
        searchTextField.borderStyle = .bezel
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("Click me 2")
        searchTextField.endEditing(true)
        return true
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("Click me 3")
        if searchTextField.text != "" {
            searchTextField.placeholder = ""
            return true
        } else {
            searchTextField.placeholder = "Type Country Short Name"
            return true
        }
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("Click me 4")
        searchTextField.text = ""
        searchTextField.borderStyle = .roundedRect
    }
}
