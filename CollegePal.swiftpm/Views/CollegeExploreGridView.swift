//
//  CollegeExploreGridView.swift
//  
//
//  Created by Shengyuan Lu on 4/11/23.
//

import SwiftUI

struct CollegeExploreGridView: View {
    
    var colleges: [CollegeStruct]
    
    var body: some View {
        ScrollView {
            
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 350, maximum: 800))], spacing: 16) {
                
                ForEach(colleges, id: \.name) { college in
                    CollegeCardView(college: college)
                        .aspectRatio(5/3, contentMode: .fit)
                }
            }
        }
    }
    
}
