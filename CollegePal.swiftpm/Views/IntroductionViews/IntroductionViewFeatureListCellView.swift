//
//  IntroductionViewFeatureListCellView.swift
//  
//
//  Created by Shengyuan Lu on 4/17/23.
//

import SwiftUI

struct IntroductionViewFeatureListCellView: View {
    
    let title: String
    let description: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .bold()
                .padding(.bottom, 4)
            
            Text(description)
        }
    }
}
