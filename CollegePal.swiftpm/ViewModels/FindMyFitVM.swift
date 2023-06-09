//
//  FindMyFitVM.swift
//  
//
//  Created by Shengyuan Lu on 4/17/23.
//

import SwiftUI
import Foundation
import CoreML

class FindMyFitVM: ObservableObject {
    
    @Published var gpa: Double = 3.7
    @Published var standardizedTest: Double = 1300
    @Published var extracurricular: Double = 3
    @Published var personalStatement: Double = 3
    @Published var lor: Double = 2
    
    let classification = ["N/A", "Standard", "Impressive", "Outstanding", "Exceptional"]
    
    init() {}
    
    func getPrediction() -> Double {
        
        do {
        
            let config = MLModelConfiguration()
            
            if let url = Bundle.main.url(forResource: "FindFit", withExtension:"mlmodelc") {
                let model = try? FindFit(contentsOf: url, configuration: config)
                
                let prediction = try model!.prediction(normalized_score: self.getNormalizedScore())
                
                // print("Prediction Successful!")
                
                var admission_rate = prediction.admissions_rate
                
                if admission_rate > 0.95 {
                    admission_rate = 0.95
                } else if admission_rate < 0.05 {
                    admission_rate = 0.05
                }
                
                return admission_rate
            }
            
        } catch {}
        
        var admission_rate = 1 - getNormalizedScore()
        
        if admission_rate > 0.95 {
            admission_rate = 0.95
        } else if admission_rate < 0.1 {
            admission_rate = 0.1
        }
        
        return admission_rate
        
    }
    
    func getClassificationString(value: Double) -> String {
        return classification[Int(value-1)]
    }
    
    func getNormalizedScore() -> Double {
        
        var value: Double = 0
        
        value += getGPANormalized() * 0.4
        value += getStandardizedTestNormalized() * 0.1
        value += getExtracurricularNormalized() * 0.2
        value += getPersonalStatementNormalized() * 0.2
        value += getLorNormalized() * 0.1
        
        if value > 1 {
            value = 1
        }
        
        return value
    }
    
    func getGPANormalized() -> Double {
        
        var value: Double = 0
        
        if gpa <= 2.0 {
            value += 0.05 * (gpa - 0) / 2.0
        }
        
        else if gpa > 2.0 && gpa <= 3.0 {
            value += 0.05
            value += 0.1 * (gpa - 2) / 1
        }
        
        else if gpa > 3.0 && gpa <= 3.5 {
            value += 0.15
            value += 0.3 * (gpa - 3) / 0.5
        }
        
        else if gpa > 3.5 && gpa <= 4.0 {
            value += 0.45
            value += 0.6 * (gpa - 3.5) / 0.5
        }
        
        return value
    }
    
    func getStandardizedTestNormalized() -> Double {
        
        var value: Double = 0
        
        if standardizedTest <= 1200 {
            value += 0.1 * (standardizedTest - 0) / 1200
        }
        
        else if standardizedTest > 1200 && standardizedTest <= 1300 {
            value += 0.1
            value += 0.2 * (standardizedTest - 1200) / 100
        }
        
        else if standardizedTest > 1300 && standardizedTest <= 1400 {
            value += 0.3
            value += 0.3 * (standardizedTest - 1300) / 100
        }
        
        else if standardizedTest > 1400 && standardizedTest <= 1600 {
            value += 0.6
            value += 0.6 * (standardizedTest - 1400) / 200
        }
        
        return value
    }
    
    
    func getExtracurricularNormalized() -> Double {
        
        switch (Int(extracurricular)) {
        case 0:
            return 0
        case 1:
            return 0.1
        case 2:
            return 0.2
        case 3:
            return 0.3
        case 4:
            return 0.6
        case 5:
            return 1
        default:
            return 0
        }
        
    }
    
    
    func getPersonalStatementNormalized() -> Double {
        
        switch (Int(personalStatement)) {
        case 0:
            return 0
        case 1:
            return 0.1
        case 2:
            return 0.2
        case 3:
            return 0.3
        case 4:
            return 0.6
        case 5:
            return 1
        default:
            return 0
        }
        
    }
    
    
    func getLorNormalized() -> Double {
        
        switch (Int(lor)) {
        case 0:
            return 0
        case 1:
            return 0.2
        case 2:
            return 0.4
        case 3:
            return 0.6
        case 4:
            return 0.8
        case 5:
            return 1
        default:
            return 0
        }
        
    }
}
