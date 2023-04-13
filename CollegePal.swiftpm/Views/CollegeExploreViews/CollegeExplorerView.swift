import SwiftUI

struct CollegeExplorerView: View {
    
    @ObservedObject var viewModel = CollegeExplorerVM()
    
    @StateObject var fm = FilterManager()
    
    var body: some View {
        
        ScrollView {
            
            HStack {
                
                VStack {
                    Text("Type")
                        .bold()
                    
                    Picker("Type", selection: $fm.selectedType) {
                        ForEach(CollegeTypeFilter.allCases) { setting in
                            Text(setting.rawValue).tag(setting)
                        }
                    }
                    .pickerStyle(.menu)
                }
                
                
                VStack {
                    
                    Text("Year")
                        .bold()
                    
                    Picker("Year", selection: $fm.selectedYear) {
                        ForEach(CollegeYearFilter.allCases) { setting in
                            Text(String(setting.rawValue)).tag(setting)
                        }
                    }
                    .pickerStyle(.menu)
                }
                
                
                VStack {
                    
                    Text("Setting")
                        .bold()
                    
                    Picker("Setting", selection: $fm.selectedSetting) {
                        ForEach(CollegeSettingFilter.allCases) { setting in
                            Text(setting.rawValue).tag(setting)
                        }
                    }
                    .pickerStyle(.menu)
                }
                
                
                VStack {
                    Text("Selectivity")
                        .bold()
                    
                    Picker("Selectivity", selection: $fm.selectedSelectivity) {
                        ForEach(CollegeSelectivityFilter.allCases) { setting in
                            Text(String(setting.rawValue)).tag(setting)
                        }
                    }
                    .pickerStyle(.menu)
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
                    
                    CollegeExplorerListView(colleges: filteredColleges)
                }
            }
            
            
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
        }
        .padding()
        
        
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