//
//  CollegeExplorerListView.swift
//  
//
//  Created by Shengyuan Lu on 4/11/23.
//

import SwiftUI

struct CollegeExplorerListView: View {
    
    var colleges: [CollegeStruct]
    
    var body: some View {
        
        ScrollView(showsIndicators: false) {
            ForEach(colleges, id: \.name) { college in
                
                NavigationLink {
                    CollegeExploreDetailView(college: college)
                } label: {
                    CollegeExplorerListCellView(college: college)
                }
                
            }
        }
        .edgesIgnoringSafeArea(.all)
        .scrollContentBackground(.hidden)
    }
}
