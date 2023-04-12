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
                .aspectRatio(contentMode: .fill)
                .frame(minWidth: 25, maxWidth: 150, minHeight: 50)
                .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                .padding(.trailing, 8)
            
            VStack(alignment: .leading) {
                
                Text(college.name)
                    .font(.title3)
                    .foregroundColor(.black)
                    .bold()
                
                Spacer()
                
                HStack {
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Image(systemName: "graduationcap.fill")
                            Text("Type")
                                .bold()
                        }
                        .font(.body)
                        .padding(.bottom, 4)
                        .foregroundColor(.accentColor)
                        
                        Text(college.type)
                            .font(.body)
                            .foregroundColor(.black)
                    }
                    
                    Spacer()
                }
                
                
            }
            .padding(.vertical, 8)
            
        }
        .padding(8)
    }
}

struct CollegeExplorerListCellView_Previews: PreviewProvider {
    static var previews: some View {
        CollegeExplorerListCellView(college: CollegeStruct.example)
    }
}
