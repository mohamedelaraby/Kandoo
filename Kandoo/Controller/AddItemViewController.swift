//
//  AddItemViewControllerTableViewController.swift
//  Kandoo
//
//  Created by Winston on 7/18/19.
//  Copyright © 2019 Winston. All rights reserved.
//

import UIKit

class AddItemViewController: UITableViewController {

    /*==================================================================================
     ============[ @IBOutlets  ]========
     ===================================================================================
     */
    @IBOutlet weak var textField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Turn off the large title.
        navigationItem.largeTitleDisplayMode = .never
    }

    /*==================================================================================
                        ============[ @IBActions  ]========
     ===================================================================================
     */
    
    
 
    //Done button option.
    @IBAction func done(){
        //Reading the contents of the text field.
        print("Content of the text field: \(textField.text!)")
        navigationController?.popViewController(animated: true)
    }
    
    //Cancel Button option.
    @IBAction func cancel(){
        navigationController?.popViewController(animated: true)
    }

    
    
    /*=================================================================================
                ============[ @Table View Methods  ]========
     ==================================================================================
     */
    
    //MARK:- Table View Delegates.
    override func tableView(_ tableView: UITableView,
                            willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
}
