//
//  CollegeCardTitleView.swift
//  
//
//  Created by Shengyuan Lu on 4/11/23.
//

import SwiftUI

struct CollegeCardTitleView: View {
    
    let college: CollegeStruct
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack() {
                Text(college.name)
                    .bold()
                    .font(.title2)
                    .foregroundColor(.white)
                    .lineLimit(1)
                    .shadow(color: Color.black, radius: 5, x: 5, y: 5)
                
                Spacer()
            }
            
            HStack {
                Text(college.location)
                    .font(.body)
                    .foregroundColor(.white)
                    .bold()
                    .shadow(color: Color.black, radius: 5, x: 5, y: 5)
                
                Spacer()
            }
        }
        .padding(16)
        .background(Color.black.opacity(0.7))
    }
}

struct CollegeCardTitleView_Previews: PreviewProvider {
    static var previews: some View {
        CollegeCardTitleView(college: CollegeStruct.example)
            .previewLayout(.sizeThatFits)
    }
}
