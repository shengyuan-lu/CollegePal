//
//  CollegeExplorerListCellView.swift
//  
//
//  Created by Shengyuan Lu on 4/11/23.
//

import SwiftUI

struct CollegeExplorerListCellView: View {
    
    let college: CollegeStruct
    
    var body: some View {
        
        HStack {
            Image(college.photo[0])
                .resizable()
                .aspectRatio(4/3, contentMode: .fill)
                .frame(minWidth: 25, maxWidth: 150, minHeight: 75)
                .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                .padding(.trailing, 8)
            
            VStack(alignment: .leading) {
                
                Text(college.name)
                    .font(.title3)
                    .foregroundColor(.black)
                    .bold()
                
                Text(college.location)
                    .font(.body)
                    .foregroundColor(.black)
                
                Spacer()
                
                HStack {
                    
                    TagView(text: college.type, foregroundColor: Color.white, backgroundColor: Color.accentColor)
                    
                    TagView(text: college.getYearInString(), foregroundColor: Color.white, backgroundColor: Color.purple)
                    
                    TagView(text: college.setting, foregroundColor: Color.white, backgroundColor: Color.blue)
                    
                    Spacer()
                }
                
            }
        }
        .padding(.vertical, 8)
    }
}

struct CollegeExplorerListCellView_Previews: PreviewProvider {
    static var previews: some View {
        CollegeExplorerListCellView(college: CollegeStruct.example)
    }
}
