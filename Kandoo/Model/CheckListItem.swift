//
//  CheckListItem.swift
//  Kandoo
//
//  Created by Winston on 7/16/19.
//  Copyright © 2019 Winston. All rights reserved.
//

import Foundation

class CheckListItem {
    var text = ""
    var isChecked = false
    
    //Modify the check property indirectly.
    func toggleChecked(){
        isChecked = !isChecked
    }
    
}
