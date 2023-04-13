//
//  CollegeExploreDetailView.swift
//  
//
//  Created by Shengyuan Lu on 4/11/23.
//

import SwiftUI

struct CollegeExploreDetailView: View {
    
    let college: CollegeStruct
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            List {
                
                
                Section {
                    
                    

                }
                
                Section {
                    
                    VStack {
                        Text(college.description)
                    }
                    .padding(8)
                    
                }
                
                
                Section {
                    
                    VStack {
                        Text(college.getYearInString())
                        Text(college.getAcceptanceRateInString())
                        Text(college.getGraduationRateInString())
                    }
                    .padding(8)
                    
                } header: {
                    
                    Text("Data")
                    
                }

                Section {
                    

                    
                }
                
            }
            
        }
        .navigationTitle(college.name)
        .navigationBarTitleDisplayMode(.large)
        
    }
    
}

struct CollegeExploreDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CollegeExploreDetailView(college: CollegeStruct.example)
    }
}
