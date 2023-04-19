//
//  FindMyFitResultView.swift
//  
//
//  Created by Shengyuan Lu on 4/18/23.
//

import SwiftUI



struct FindMyFitResultView: View {
    
    let viewModel: FindMyFitResultVM
    
    var body: some View {
        
        
        ScrollView(showsIndicators: false) {
            
            VStack(alignment: .leading, spacing: 20) {
                
                Text("*Suggested Based On Machine Learning For Reference Purposes Only")
                    .font(.title3)
                    .bold()
                    .foregroundColor(.secondary)
                
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
