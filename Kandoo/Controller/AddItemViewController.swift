//
//  AddItemViewControllerTableViewController.swift
//  Kandoo
//
//  Created by Winston on 7/18/19.
//  Copyright © 2019 Winston. All rights reserved.
//

import UIKit

class AddItemViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //Turn off the large title.
        navigationItem.largeTitleDisplayMode = .never
    }

    /*==================================================================
     ============[ @IBActions  ]========
     ===================================================================
     */
 
    //Cancel Button option.
    @IBAction func cancel(){
        navigationController?.popViewController(animated: true)
    }

    //Done button option.
    @IBAction func done(){
        navigationController?.popViewController(animated: true)
    }
}
