//
//  ChecklistItemDetailView.swift
//  
//
//  Created by Shengyuan Lu on 4/16/23.
//

import SwiftUI

struct ChecklistItemDetailView: View {
    
    @State var item: ChecklistItem
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        List {
            
            Section {
                Text(item.name)
                    .font(.title2)
                    .bold()
                    .padding(12)
            }
            
            Section {
                
                VStack(alignment: .leading, spacing: 12) {
                    Text("Description")
                        .bold()
                    
                    Divider()
                    
                    Text(item.description)
                    
                }
                .padding(12)
                
            }
            
            Section {
                
                HStack {
                    
                    Spacer()
                    
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        
                        Text("Check")
                            .padding(12)
                            .padding(.horizontal, 8)
                            .foregroundColor(.white)
                            .background(Color.accentColor)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        
                    }
                    
                    Spacer()
                }
                
                
            }
            
        }
    }
}
