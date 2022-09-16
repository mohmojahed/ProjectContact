//
//  AddContactViewController.swift
//  ProjectTest
//
//  Created by Mohammad Shaker Mojahed on 09.09.22.
//

import UIKit

class AddContactViewController: UIViewController {
    
    var titleText = "Add Contact"
    var contact:Contact? = nil
    var indexPathForContact:IndexPath? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = titleText
        if let contact = contact{
            nameTextField.text = contact.name
            phoneNumberTextField.text = contact.phonNumber
        }
        
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    // Navigation
    
    @IBAction func saveAndClose(_ sender: Any) {
        
        performSegue(withIdentifier: "unwindToContactList", sender: self)
        
    }
    
    @IBAction func close(_ sender: Any) {
        
        nameTextField.text = nil
        phoneNumberTextField.text = nil
        performSegue(withIdentifier: "unwindToContactList", sender: self)
        
    }
    
    
}
