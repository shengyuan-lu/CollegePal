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
            
            Section(header: Text("Instruction")) {
                Text("Understand the components that make up a college application is essential to gain admission. Please check the boxes below to learn about each component and mark it off once you've read the descriptions.")
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
                
                NavigationLink(isActive: $submitted) {
                    
                    ChecklistSubmittedView()
                    
                } label: {
                    
                    Button {
                        if viewModel.isAllItemsChecked() {
                            
                            submitted.toggle()
                            
                        }
                    } label: {
                        
                        HStack {
                            Spacer()
                            Image(systemName: "paperplane.fill")
                            Text("Finish Checklist")
                            Spacer()
                        }
                        .padding(16)
                        .padding(.horizontal, 16)
                        .foregroundColor(.white)
                        .background(Color.accentColor)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        
                    }
                    .disabled(!viewModel.isAllItemsChecked())
                    
                }
                
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
