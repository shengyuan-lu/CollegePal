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
                    .padding(8)
            }
            
            Section {
                
                VStack(alignment: .leading, spacing: 12) {
                    Text("Description")
                        .bold()
                    
                    Divider()
                    
                    Text(item.description)
                    
                }
                .padding(8)
                
            }
            
            Section {
                
                HStack {
                    
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        
                        HStack{
                            
                            Text("Mark As Complete")
                                .padding(8)
                                .padding(.horizontal, 8)
                                .foregroundColor(.white)
                                .background(Color.accentColor)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            
                        }
                        
                    }
                    
                    Spacer()
                }
                
                
            }
            
        }
    }
}
