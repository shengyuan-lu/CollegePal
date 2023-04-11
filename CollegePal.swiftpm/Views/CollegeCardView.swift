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
                    HStack {
                        Text(college.name)
                            .bold()
                            .font(.title2)
                            .foregroundColor(.white)
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
                .padding(.horizontal, 8)
                .padding(.vertical, 12)
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
