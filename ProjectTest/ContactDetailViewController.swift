//
//  ContactDetailViewController.swift
//  ProjectTest
//
//  Created by Mohammad Shaker Mojahed on 16.09.22.
//

import UIKit

class ContactDetailViewController: UIViewController {

    var contact:Contact? = nil
    
    var isDeleted: Bool = false
    
    var indexPath:IndexPath? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = contact?.name
        phoneLabel.text = contact?.phonNumber

    }
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var phoneLabel: UILabel!

    
    @IBAction func done(_ sender: Any) {
        performSegue(withIdentifier: "unwindToContactList", sender: self)
        
    }
    
    @IBAction func deleteContact(_ sender: Any) {
        isDeleted = true
        performSegue(withIdentifier: "unwindToContactList", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editContactSegue"{
            
            guard let viewController = segue.destination as? AddContactViewController else {return}
            viewController.titleText = "Edit Contact"
            viewController.contact = contact
            viewController.indexPathForContact = self.indexPath!
        }
    }
    
    
}
