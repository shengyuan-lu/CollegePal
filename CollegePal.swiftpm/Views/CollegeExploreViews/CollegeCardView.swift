//
//  CollegeCardView.swift
//  CollegePal
//
//  Created by Shengyuan Lu on 4/10/23.
//

import SwiftUI

struct CollegeCardView: View {
    
    var college: CollegeStruct
    
    var body: some View {
        
        ZStack(alignment: .bottom) {
            
            Image(college.photo[0])
                .resizable()
            
            VStack {
                
                VStack(spacing: 2) {
                    
                    Spacer()
                    
                    CollegeCardTitleView(college: college)
                    
                }

            }
            
        }
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        
    }
}

struct CollegeCard_Previews: PreviewProvider {
    static var previews: some View {
        CollegeCardView(college: CollegeStruct.example)
            .previewLayout(.sizeThatFits)
    }
}
