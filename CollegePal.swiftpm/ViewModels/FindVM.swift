//
//  FindVM.swift
//  
//
//  Created by Shengyuan Lu on 4/17/23.
//

import SwiftUI
import Foundation

class FindVM: ObservableObject {
    
    @Published var gpa: Double = 3.6
    @Published var standardizedTest: Double = 1300
    @Published var extracurricular: Double = 3
    @Published var awards: Double = 3
    @Published var lor: Double = 3
    
    let classification = ["None", "Average", "Good", "Excellenet", "Fabulous"]
    
    init() {}
    
    func getClassificationString(value: Double) -> String {
        return classification[Int(value-1)]
    }
}
