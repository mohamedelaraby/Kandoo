//
//  ViewController.swift
//  Kandoo
//
//  Created by Winston on 7/11/19.
//  Copyright © 2019 Winston. All rights reserved.
//



/**
 
 //1: table view need to know how many row of data it has.
 //2: how to display them into the screen.
 //3: should know the data source to get it`s data using delegate.
 //4: in the datasource you provide how many rows you have to display.
 //5: the tableview when hookup with the datasource it sends numbersofrowsinsection message to ask the data source how many rows you have ?
 //6: to draw a particulat row in the screen it sends cellforrowat to ask the data source for a cell.
 
 */

import UIKit

class CheckListViewController: UITableViewController {
    
    //the new data model.
     var items = [CheckListItem]()
    
    
    override func viewDidLoad() {
        let item1 = CheckListItem()
        item1.text = "Walk the dog"
        items.append(item1)
        
        //The second row items.
        let item2 = CheckListItem()
        item2.text = "Brush my teeth"
        item2.isChecked = true
        items.append(item2)
        
        let item3 = CheckListItem()
        item3.text = "Learn ios development"
        items.append(item3)
        
        let item4 = CheckListItem()
        item4.isChecked = true
        item4.text = "Soccer practice"
        items.append(item4)
        
        let item5 = CheckListItem()
        item5.text = "Eat ice Cream"
        item5.isChecked = true
         items.append(item5)
        
        //Show big long nav bar title.
        navigationController?.navigationBar.prefersLargeTitles = true
        
        super.viewDidLoad()
        
    }
  
/*==============================================================
  =============[ Table View Methods ]=============
  ==============================================================
*/
    
    //MARK:- TAble view Data source
    //Ask the data source for the number of rows it has.
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //Return the  actual number of the array as rows numbers.
        return items.count
        
    }
    
    //ask the data source for cell to display into the row.
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "checkListItem", for: indexPath)
        
        //This asks the array fir the checklistitem object ar the index that cprresponds to the row number
        let item = items[indexPath.row]
        
        //Configure the row content.
        configureText(for: cell, with: item)
        configureCheckmark(for: cell, with: item)
        
        return cell
    }
    
    //tabel view delegate to handle the user tapped row.
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let cell = tableView.cellForRow(at: indexPath) {
            let item = items[indexPath.row]
            item.toggleChecked()
            configureCheckmark(for: cell, with: item)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
  
    
    
/*==============================================================
  =============[ IBActions ]=============
  ==============================================================
*/
    //MARK:-- Add some functionality to the add item button
    @IBAction func addItem(){
        //1- Get new row index
        //2- Create an checklistitm object
        //3- Add new text to teh item object
        //4- append this item to the items array.
        //5- Get new index path for the new row.
        //6- put the indexpath into array to pass it to the table view as new indexpath.
        //7- tell table view that you will insert new row.
        
        let newRowIndex = items.count
        let item = CheckListItem()
        item.text = "I a new row"
        items.append(item)
        
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        let indexPathes = [indexPath]
        
        tableView.insertRows(at: indexPathes, with: .automatic)
    }
    
    

 /*==============================================================
   =============[ Custom Methods ]=============
   ==============================================================
*/
    //MARK:- Configure the check mark property.
    func configureCheckmark(for cell: UITableViewCell, with item: CheckListItem){
    
        if item.isChecked {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
    }
    
    
    //MARK:- Configure out the row`s text
    func configureText(for cell: UITableViewCell, with item: CheckListItem) {
        let label = cell.viewWithTag(1000) as! UILabel
        label.text = item.text
    }
    
    
    
    
    
    
    
    
    
}


    
    
    
    
    

    


