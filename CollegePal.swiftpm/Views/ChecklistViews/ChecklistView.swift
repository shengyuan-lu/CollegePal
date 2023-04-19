//
//  ChecklistView.swift
//
//
//  Created by Shengyuan Lu on 4/16/23.
//

import SwiftUI

struct ChecklistView: View {
    
    @ObservedObject var viewModel = ChecklistVM()
    
    @State var selectedItem: ChecklistItem? = nil
    
    @State var submitted = false
    
    var body: some View {
        
        List {
            
            Section(header: Text("")) {
                Image("Checklist Banner")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }
            
            Section(header: Text("Instruction")) {
                
                Text("Understand the components that make up a college application is essential to navigate your application season. Please check the boxes below to learn about each component and mark it off once you've read and understood the descriptions.")
                    .padding(.top, 6)
                
            }
            
            Section(header: Text("Check List")) {
                
                ForEach(viewModel.items, id: \.id) { item in
                    
                    HStack {
                        
                        Button {
                            
                            if !item.isChecked {
                                selectedItem = item
                            }
                            
                            viewModel.toggleCheck(id: item.id)
                            
                            
                        } label: {
                            HStack {
                                Image(systemName: item.isChecked ? "checkmark.square.fill" : "square")
                                    .font(.title)
                            }
                        }
                        
                        Text(item.name)
                    }
                    .padding(.vertical, 8)
                    
                }
            }
            
            Section {
                
                NavigationLink {
                    
                    ChecklistSubmittedView()
                    
                } label: {
                    
                    HStack {
                        Spacer()
                        
                        Image(systemName: "paperplane.fill")
                        Text("Finish Checklist")
                            .bold()
                        
                        Spacer()
                    }
                    .padding(16)
                    .padding(.horizontal, 16)
                    .foregroundColor(.white)
                    .background(Color.accentColor)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                }
                .buttonStyle(.plain)
                .disabled(!viewModel.isAllItemsChecked())
                
            }
            
        }
        .navigationTitle("Application Checklist")
        .sheet(item: $selectedItem) { item in
            NavigationView {
                ChecklistItemDetailView(item: item)
            }
        }
        
    }
    
}



struct CheckListView_Previews: PreviewProvider {
    static var previews: some View {
        ChecklistView()
    }
}
