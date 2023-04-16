//
//  CollegeExploreView.swift
//
//
//  Created by Shengyuan Lu on 4/11/23.
//

import SwiftUI

struct CollegeExploreView: View {
    
    @ObservedObject var viewModel = CollegeExplorerVM()
    
    @StateObject var fm = FilterManager()
    
    @State var showInfo = false
    
    var body: some View {
        
        VStack {
            
            ScrollView(.horizontal, showsIndicators: false) {
                
                HStack {
                    
                    HStack {
                        Text("Type")
                            .bold()
                        
                        Picker("Type", selection: $fm.selectedType) {
                            ForEach(CollegeTypeFilter.allCases) { setting in
                                Text(setting.rawValue).tag(setting)
                                    .foregroundColor(.white)
                            }
                        }
                        .pickerStyle(.menu)
                    }
                    .padding(8)
                    .padding(.horizontal, 8)
                    .foregroundColor(.primary)
                    .background(Color.accentColor.opacity(0.2))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                    HStack {
                        
                        Text("Year")
                            .bold()
                        
                        Picker("Year", selection: $fm.selectedYear) {
                            ForEach(CollegeYearFilter.allCases) { setting in
                                Text(String(setting.rawValue)).tag(setting)
                            }
                        }
                        .pickerStyle(.menu)
                    }
                    .padding(8)
                    .padding(.horizontal, 8)
                    .foregroundColor(.primary)
                    .background(Color.accentColor.opacity(0.2))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                    
                    HStack {
                        
                        Text("Setting")
                            .bold()
                        
                        Picker("Setting", selection: $fm.selectedSetting) {
                            ForEach(CollegeSettingFilter.allCases) { setting in
                                Text(setting.rawValue).tag(setting)
                            }
                        }
                        .pickerStyle(.menu)
                    }
                    .padding(8)
                    .padding(.horizontal, 8)
                    .foregroundColor(.primary)
                    .background(Color.accentColor.opacity(0.2))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                    
                    HStack {
                        Text("Selectivity")
                            .bold()
                        
                        Picker("Selectivity", selection: $fm.selectedSelectivity) {
                            ForEach(CollegeSelectivityFilter.allCases) { setting in
                                Text(String(setting.rawValue)).tag(setting)
                            }
                        }
                        .pickerStyle(.menu)
                    }
                    .padding(8)
                    .padding(.horizontal, 8)
                    .foregroundColor(.primary)
                    .background(Color.accentColor.opacity(0.2))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                
            }
            .padding(.bottom, 4)
            
            if filteredColleges.count == 0 {
                
                Spacer()
                
                CollegeNotFoundView()
                
                Spacer()
                
            } else {
                if fm.displayStyle == .Grid {
                    
                    CollegeExploreGridView(colleges: filteredColleges)
                    
                } else if fm.displayStyle == .List {
                    
                    CollegeExploreListView(colleges: filteredColleges)
                }
            }
            
        }
        .alert(isPresented: $showInfo) {
            Alert(title: Text("Information"), message: Text("For demostration purposes, only Californian universities are included. In the production version of the app, more colleges will be added to the database."), dismissButton: .default(Text("Got it!")))
        }
        .searchable(text: $fm.searchText)
        .navigationTitle("Explore")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Picker("Display Style", selection: $fm.displayStyle) {
                    Image(systemName: "square.grid.2x2").tag(CollegeExplorerViewOptions.Grid)
                        .padding()
                    Image(systemName: "list.bullet").tag(CollegeExplorerViewOptions.List)
                        .padding()
                }
                .pickerStyle(.segmented)
            }
            
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    self.showInfo.toggle()
                } label: {
                    Image(systemName: "info.circle")
                }

            }
        }
        .padding(12)
        
        
        var filteredColleges: [CollegeStruct] {
            
            var currentSelection = viewModel.colleges
            
            if !fm.searchText.isEmpty {
                currentSelection = currentSelection.filter { $0.name.localizedCaseInsensitiveContains(fm.searchText) }
            }
            
            if !CollegeTypeFilter.testEqual(lhs: fm.selectedType, rhs: .AnyType) {
                currentSelection = currentSelection.filter { $0.getCollegeTypeEnum() == fm.selectedType }
            }
            
            if !CollegeYearFilter.testEqual(lhs: fm.selectedYear, rhs: .AnyYear) {
                currentSelection = currentSelection.filter { $0.getCollegeYearEnum() == fm.selectedYear }
            }
            
            if !CollegeSettingFilter.testEqual(lhs: fm.selectedSetting, rhs: .AnySetting) {
                currentSelection = currentSelection.filter { $0.getCollegeSettingEnum() == fm.selectedSetting }
            }
            
            if !CollegeSelectivityFilter.testEqual(lhs: fm.selectedSelectivity, rhs: .AnySelectivity) {
                currentSelection = currentSelection.filter { $0.getCollegeSelectivity() == fm.selectedSelectivity }
            }
            
            return currentSelection
        }
        
    }
}
