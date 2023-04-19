//
//  CollegeExplorerListView.swift
//  
//
//  Created by Shengyuan Lu on 4/11/23.
//

import SwiftUI

struct CollegeExploreListView: View {
    
    var colleges: [CollegeStruct]
    
    var body: some View {
        
        ScrollView(showsIndicators: false) {
            ForEach(colleges, id: \.id) { college in
                
                NavigationLink {
                    CollegeExploreDetailView(college: college)
                } label: {
                    CollegeExploreListCellView(college: college)
                }
                
            }
        }
        .edgesIgnoringSafeArea(.all)
        .scrollContentBackground(.hidden)
    }
}
