//
//  FindMyFitResultVM.swift
//  
//
//  Created by Shengyuan Lu on 4/18/23.
//

import Foundation

class FindMyFitResultVM: ObservableObject {
    
    @Published var reachSchools: [CollegeStruct] = [CollegeStruct]()
    @Published var matchSchools: [CollegeStruct] = [CollegeStruct]()
    @Published var safetySchools: [CollegeStruct] = [CollegeStruct]()
    
    @Published var colleges: [CollegeStruct] = JSONParser<CollegeStruct>.parse(forFileName: "colleges", forType: "json")
    
    var alreadyAdded = Set<String>()
    
    let score: Double
    
    init(score: Double) {
        self.score = score
        
        self.colleges.sort(by: {$0.acceptanceRate < $1.acceptanceRate})
        
        findReach()
        findMatch()
        findSafety()
    }
    
    
    func hasReachSchools() -> Bool {
        return !(self.reachSchools.count == 0)
    }
    
    func hasMatchSchools() -> Bool {
        return !(self.matchSchools.count == 0)
    }
    
    func hasSafetySchools() -> Bool {
        return !(self.safetySchools.count == 0)
    }
    
    
    private func findReach() {
        
        let lowRange: Double = self.score
        var highRange: Double = self.score - 0.2
        
        var schools = [CollegeStruct]()
        
        if highRange < 0 {
            highRange = 0
        }
        
        
        for c in self.colleges {
            
            
            if c.acceptanceRate >= highRange && c.acceptanceRate <= lowRange && !alreadyAdded.contains(c.name) && schools.count < 3 {
                
                schools.append(c)
                alreadyAdded.insert(c.name)
            }
            
        }
        
        schools.sort(by: {$0.acceptanceRate < $1.acceptanceRate})
        
        self.reachSchools = schools
        
    }
    
    
    private func findMatch() {
        
        var lowRange: Double = self.score + 0.1
        var highRange: Double = self.score - 0.1
        
        var schools = [CollegeStruct]()
        
        
        if highRange < 0 {
            highRange = 0
        }
        
        if lowRange > 1 {
            lowRange = 1
        }
        
        for c in self.colleges {
            
            if c.acceptanceRate >= highRange && c.acceptanceRate <= lowRange && !alreadyAdded.contains(c.name) && schools.count < 3 {
                schools.append(c)
                alreadyAdded.insert(c.name)
            }
            
        }
        
        schools.sort(by: {$0.acceptanceRate < $1.acceptanceRate})
        
        
        self.matchSchools = schools
        
    }
    
    private func findSafety() {
        
        var lowRange: Double = self.score + 0.2
        let highRange: Double = self.score
        var schools = [CollegeStruct]()
        
        if lowRange > 1 {
            lowRange = 1
        }
        
        
        for c in self.colleges {
            
            if c.acceptanceRate >= highRange && c.acceptanceRate <= lowRange && !alreadyAdded.contains(c.name) && schools.count < 3 {
                schools.append(c)
                alreadyAdded.insert(c.name)
            }
            
        }
        
        schools.sort(by: {$0.acceptanceRate < $1.acceptanceRate})
        
        self.safetySchools = schools
        
        
    }
}
