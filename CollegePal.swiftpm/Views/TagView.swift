//
//  SwiftUIView.swift
//  
//
//  Created by Shengyuan Lu on 4/11/23.
//

import SwiftUI

struct TagView: View {
    
    let text: String
    let foregroundColor: Color
    let backgroundColor: Color
    
    var body: some View {
        
        Text(text)
            .font(.body)
            .foregroundColor(foregroundColor)
            .bold()
            .padding(8)
            .background(backgroundColor)
            .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
        
    }
}

struct TagView_Previews: PreviewProvider {
    static var previews: some View {
        TagView(text: "Abcd", foregroundColor: Color.white, backgroundColor: Color.accentColor)
            .previewLayout(.sizeThatFits)
    }
}
