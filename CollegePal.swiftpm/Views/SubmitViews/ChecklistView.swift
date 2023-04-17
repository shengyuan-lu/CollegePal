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
                Text("Just like completing a real college application, tick the checkboxes below to mark off all the components required.")
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
                    
                    SubmittedView()
                    
                } label: {
                    
                    Button {
                        if viewModel.isAllItemsChecked() {
                            
                            submitted.toggle()
                            
                        }
                    } label: {
                        
                        HStack {
                            Image(systemName: "paperplane.fill")
                            Text("Submit")
                        }
                        
                    }
                    .disabled(!viewModel.isAllItemsChecked())
                    
                }
                
            }
            
        }
        .sheet(item: $selectedItem) { item in
            
            NavigationView {
                ChecklistItemDetailView(item: item)
            }
        }
        .navigationTitle("College Application Simulator")
        
    }
    
}



struct CheckListView_Previews: PreviewProvider {
    static var previews: some View {
        ChecklistView()
    }
}
