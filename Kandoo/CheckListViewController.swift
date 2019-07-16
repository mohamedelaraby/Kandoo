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

    let row0text = "Walk the dog"
    let row1text = "scour my Teeth"
    let row2text = "Learn Design Pattern"
    let row3text = "Soccor the practise"
    let row4text = "Eat ice cream"
    
    var row0checked = false
    var row1checked = true
    var row2checked = true
    var row3checked = false
    var row4checked = true
    
  
    //MARK:- TAble view Data source
    //Ask the data source for the number of rows it has.
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10    }
    
    //ask the data source for cell to display into the row.
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "checkListItem", for: indexPath)
        
        let label = cell.viewWithTag(1000) as! UILabel
        if indexPath.row % 5 == 0 {
            label.text = row0text
        } else if indexPath.row % 5 == 1 {
            label.text = row1text
        } else if indexPath.row % 5 == 2 {
            label.text = row2text
        } else if indexPath.row % 5 == 3 {
            label.text = row3text
        } else if indexPath.row % 5 == 4 {
            label.text = row4text
        }
        
        configureCheckmark(for: cell, at: indexPath)
        
        return cell
    }
    
    //tabel view delegate to handle the user tapped row.
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let cell = tableView.cellForRow(at: indexPath) {
            if indexPath.row == 0 {
                row0checked = !row0checked
            } else if indexPath.row == 1 {
                row1checked = !row1checked
            } else if indexPath.row == 2 {
                row2checked = !row2checked
            } else if indexPath.row == 3 {
                row3checked = !row3checked
            } else if indexPath.row == 4 {
                row4checked = !row4checked
            }
            configureCheckmark(for: cell, at: indexPath)
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func configureCheckmark(for cell: UITableViewCell, at indexPath: IndexPath){
        var isChecked = false
        
        if indexPath.row == 0{
            isChecked = row0checked
        } else if indexPath.row == 1{
            isChecked = row1checked
        } else if indexPath.row == 2 {
            isChecked = row2checked
        } else if indexPath.row == 3 {
            isChecked = row3checked
        } else if indexPath.row == 4 {
            isChecked = row4checked
        }
        
        if isChecked {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
    }
}


    
    
    
    
    

    


