//
//  AboutMeViewFunFactsCellView.swift
//  
//
//  Created by Shengyuan Lu on 4/17/23.
//

import SwiftUI

struct AboutMeViewFunFactsCellView: View {
    
    let key: String
    let value: String
    
    var body: some View {
        
        HStack {
            
            Text(key)
                .bold()
            
            Spacer()
            
            Text(value)
        }
        
    }
}
