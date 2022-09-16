//
//  ChooseContactViewController.swift
//  ProjectTest
//
//  Created by Mohammad Shaker Mojahed on 15.09.22.
//

import UIKit




class ChooseContactViewController: UIViewController {

    
    @IBOutlet weak var chooseContactBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let navController = segue.destination as! UINavigationController
        
        let destController = navController.topViewController as! ContactsViewController
        
        
        destController.delegate = self
    }
    
}

extension ChooseContactViewController: itemSelectionDelegate{
    func itemSelected(selectedItem: String) {
        chooseContactBtn.setTitle(selectedItem, for: .normal)
    }
}
