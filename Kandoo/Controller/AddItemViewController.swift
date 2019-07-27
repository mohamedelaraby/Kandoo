//
//  AddItemViewControllerTableViewController.swift
//  Kandoo
//
//  Created by Winston on 7/18/19.
//  Copyright © 2019 Winston. All rights reserved.
//

import UIKit

//AddItemViewController Delegate protocol.
protocol AddItemViewControllerDelegate : class  {
    
    func addItemViewControllerDidCancel(_ controller: AddItemViewController)
    
    func addItemViewController(_ controller: AddItemViewController,
                               didFinishAdding item: CheckListItem)
}



class AddItemViewController: UITableViewController, UITextFieldDelegate {

    //Make the checklistitemviewcontroller is delegate of the additemviewcontroller.
   weak var delegate: AddItemViewControllerDelegate?
    
    
    
    
    
    /*==================================================================================
     ============[ @IBOutlets  ]========
     ===================================================================================
     */
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    
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
    
        //create new item fro checklistitem class.
        let item  = CheckListItem()
        item.text = textField.text!
        
        //assign the new item to teh delegate method.
        delegate?.addItemViewController(self, didFinishAdding: item)
        
       navigationController?.popViewController(animated: true)
    }
    
    //Cancel Button option.
    @IBAction func cancel(){
        delegate?.addItemViewControllerDidCancel(self)
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
    
    
    
    /*=================================================================================
     ============[ @Custom Methods  ]========
     ==================================================================================
     */
    
   override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textField.becomeFirstResponder()
    }
    
    /*=================================================================================
     ============[ @Delegates ]========
     ==================================================================================
     */
    
    //Handle the done button disable or no disable.
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let oldText = textField.text!
        let stringRange = Range(range, in: oldText)!
        let newText = oldText.replacingCharacters(in: stringRange, with: string)
        
        doneBarButton.isEnabled = !newText.isEmpty
        
        return true
    }
    
    //Handle the clear button with the done button disable function.
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        doneBarButton.isEnabled = false
        return true
    }

}

