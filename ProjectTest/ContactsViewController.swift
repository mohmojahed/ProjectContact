//
//  ContactsViewController.swift
//  ProjectTest
//
//  Created by Mohammad Shaker Mojahed on 09.09.22.
//

import UIKit


class ContactsViewController: UITableViewController {
    
    
    var contacts: [Contact] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let tom = Contact(name: "Tom", phonNumber: "(0176) 1234567")
        contacts.append(tom)
        tableView.reloadData()

    }
    
    @IBAction func done(_ sender: UIBarButtonItem) {
        
    }
   

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return contacts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath)
        
        let contact = contacts[indexPath.row]
        
        cell.textLabel?.text = contact.name
        cell.detailTextLabel?.text = contact.phonNumber
        
        return cell
    
    }
    
    //Mark Navigation
    
    
    //Unwind segue
    @IBAction func unwindToContactList(segue: UIStoryboardSegue){
        
        if let viewController = segue.source as? AddContactViewController {
            guard let name  = viewController.nameTextField.text, let phoneNumber = viewController.phoneNumberTextField.text else{ return }
            let contact = Contact(name: name, phonNumber: phoneNumber)
            if let indexPath = viewController.indexPathForContact{
                contacts[indexPath.row] = contact
            }else{
                contacts.append(contact)
            }
            tableView.reloadData()
           
        } else if let viewController = segue.source as? ContactDetailViewController{
            
            if viewController.isDeleted{
                guard let indexPath: IndexPath = viewController.indexPath else {return}
                contacts.remove(at: indexPath.row)
                tableView.reloadData()
            }
            
        }
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "contactDetailSegue"{
            guard let navViewController = segue.destination as? UINavigationController else {return}
            guard let viewController = navViewController.topViewController as? ContactDetailViewController else {return}
            guard let indexPath = tableView.indexPathForSelectedRow else {return}
            let contact = contacts[indexPath.row]
            viewController.contact = contact
            viewController.indexPath = indexPath
            
        }
    }
    
    
    
    

}
