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
                .frame(width: 150, height: 100)
                .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                .padding(.trailing, 8)
            
            VStack(alignment: .leading) {
                Text(college.name)
                    .font(.title)
                    .bold()
                
                Spacer()
                
                HStack {
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Image(systemName: "graduationcap.fill")
                            Text("Type")
                                .bold()
                        }
                        .font(.title2)
                        .padding(.bottom, 4)
                        .foregroundColor(.accentColor)
                        
                        Text(college.type)
                            .font(.body)
                            .bold()
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
