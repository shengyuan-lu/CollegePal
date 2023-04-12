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
        
        VStack {
            Text(college.name)
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
