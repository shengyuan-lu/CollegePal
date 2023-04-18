//
//  CollegeExplorerVM.swift
//  
//
//  Created by Shengyuan Lu on 4/10/23.
//

import Foundation
import SwiftUI

class CollegeExplorerVM: ObservableObject {
    
    
    @Published var colleges: [CollegeStruct]
    
    init() {
        
        var tempColleges = JSONParser<CollegeStruct>.parse(forFileName: "colleges", forType: "json")
        
        tempColleges.shuffle()
        
        colleges = tempColleges
    }
    
    func shuffleColleges() {
        colleges.shuffle()
    }
    
}
