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
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(college.name)
                        .font(.title3)
                        .lineLimit(1)
                        .foregroundColor(.primary)
                        .bold()
                    
                    Text(college.location)
                        .font(.body)
                        .lineLimit(1)
                        .foregroundColor(.primary)
                }

                Spacer()
                
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    LazyHGrid(rows: [GridItem(.adaptive(minimum: 25, maximum: 75))]) {
                        TagView(text: college.type, foregroundColor: Color.white, backgroundColor: Color.accentColor)
                        
                        TagView(text: college.getYearInString(), foregroundColor: Color.white, backgroundColor: Color.purple)
                        
                        TagView(text: college.setting, foregroundColor: Color.white, backgroundColor: Color.blue)
                        
                        TagView(text: college.getCollegeSelectivityInString(), foregroundColor: Color.white, backgroundColor: Color.mint)
                    }
                    
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
