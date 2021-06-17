//
//  GitSearchVC.swift
//  GitSearch
//
//  Created by Domagoj Biškup on 10/06/2021.
//

import UIKit

class GitSearchVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var searchTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTextField.delegate = self
    }

    @IBAction func searchPressed(_ sender: UIButton) {
        searchTextField.endEditing(true)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if searchTextField.text == "" {
            searchTextField.placeholder = "Type something!"
            Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { (_) in
                self.searchTextField.placeholder = "Repo Name"
            }
            return false
        }
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        userInput = searchTextField.text
        searchTextField.text = ""
        performSegue(withIdentifier: "searchPressed", sender: self)
    }
}

