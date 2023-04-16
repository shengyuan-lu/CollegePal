//
//  ChecklistItem.swift
//  
//
//  Created by Shengyuan Lu on 4/16/23.
//

import Foundation

struct ChecklistItem: Identifiable {
    let id = UUID()
    let name: String
    let description: String
    var isChecked = false
}
