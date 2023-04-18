//
//  FindResultView.swift
//  
//
//  Created by Shengyuan Lu on 4/18/23.
//

import SwiftUI



struct FindResultView: View {
    
    let viewModel: FindResultVM
    
    var body: some View {
        
        
        ScrollView(showsIndicators: false) {
            
            VStack(alignment: .leading, spacing: 20) {
                
                VStack(alignment: .leading) {
                    Text("Based On Machine Learning")
                        .font(.title3)
                        .bold()
                    
                    Divider()
                }

                
                if viewModel.hasReachSchools() {
                    
                    VStack(alignment: .leading) {
                        Text("Reach Colleges")
                            .font(.title)
                            .foregroundColor(.accentColor)
                            .bold()
                        CollegeExploreGridView(colleges: viewModel.reachSchools)

                    }
                    
                }
                
                if viewModel.hasMatchSchools() {
                    
                    VStack(alignment: .leading) {
                        Text("Match Colleges")
                            .font(.title)
                            .foregroundColor(.accentColor)
                            .bold()
                        CollegeExploreGridView(colleges: viewModel.matchSchools)
                        
                    }
                    
                }
                
                if viewModel.hasSafetySchools() {
                    VStack(alignment: .leading) {
                        Text("Safety Colleges")
                            .font(.title)
                            .foregroundColor(.accentColor)
                            .bold()
                        CollegeExploreGridView(colleges: viewModel.safetySchools)
                    }

                }

            }
            
            
        }
        .navigationTitle("Colleges For You")
        .navigationBarTitleDisplayMode(.large)
        .padding(20)
        
        
        
        
    }
}
