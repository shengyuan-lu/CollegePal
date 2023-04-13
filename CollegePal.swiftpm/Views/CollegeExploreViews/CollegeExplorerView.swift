import SwiftUI

struct CollegeExplorerView: View {
    
    @ObservedObject var viewModel: CollegeExplorerVM = CollegeExplorerVM()
    
    @State private var searchText = ""
    
    @State private var selectedType: CollegeTypeFilter = .AnyType
    @State private var selectedSetting: CollegeSettingFilter = .AnySetting
    @State private var selectedYear: CollegeYearFilter = .AnyYear
    @State private var selectedSelectivity: CollegeSelectivityFilter = .AnySelectivity

    @State private var displayStyle = CollegeExplorerViewOptions.Grid
    
    var body: some View {
        
        VStack {
            
            HStack {
                
                Picker("Select a Type", selection: $selectedType) {
                    ForEach(CollegeTypeFilter.allCases) { setting in
                        Text(setting.rawValue).tag(setting)
                            .bold()
                    }
                }
                .pickerStyle(.menu)
                
                Picker("Select a Year", selection: $selectedYear) {
                    ForEach(CollegeYearFilter.allCases) { setting in
                        Text(String(setting.rawValue)).tag(setting)
                            .bold()
                    }
                }
                .pickerStyle(.menu)
                
                
                Picker("Select a Setting", selection: $selectedSetting) {
                    ForEach(CollegeSettingFilter.allCases) { setting in
                        Text(setting.rawValue).tag(setting)
                            .bold()
                    }
                }
                .pickerStyle(.menu)
                
                
                Picker("Select a Selectivity", selection: $selectedSelectivity) {
                    ForEach(CollegeSelectivityFilter.allCases) { setting in
                        Text(String(setting.rawValue)).tag(setting)
                            .bold()
                    }
                }
                .pickerStyle(.menu)
                
            }
            
            if filteredColleges.count == 0 {
                
                Spacer()
                
                CollegeNotFoundView()
                
                Spacer()
                
            } else {
                if displayStyle == .Grid {
                    
                    CollegeExploreGridView(colleges: filteredColleges)
                    
                } else if displayStyle == .List {
                    
                    CollegeExplorerListView(colleges: filteredColleges)
                }
            }
            
            
        }
        .searchable(text: $searchText)
        .navigationTitle("Explore")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Picker("Display Style", selection: $displayStyle) {
                    Image(systemName: "square.grid.2x2").tag(CollegeExplorerViewOptions.Grid)
                        .padding()
                    Image(systemName: "list.bullet").tag(CollegeExplorerViewOptions.List)
                        .padding()
                }
                .pickerStyle(.segmented)
                .padding(.vertical, 4)
            }
        }
        .padding()
        
        
        var filteredColleges: [CollegeStruct] {
            
            var currentSelection = viewModel.colleges
            
            if !searchText.isEmpty {
                currentSelection = currentSelection.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
            }
            
            if !CollegeTypeFilter.testEqual(lhs: selectedType, rhs: .AnyType) {
                currentSelection = currentSelection.filter { $0.getCollegeTypeEnum() == selectedType }
            }
            
            if !CollegeYearFilter.testEqual(lhs: selectedYear, rhs: .AnyYear) {
                currentSelection = currentSelection.filter { $0.getCollegeYearEnum() == selectedYear }
            }
            
            if !CollegeSettingFilter.testEqual(lhs: selectedSetting, rhs: .AnySetting) {
                currentSelection = currentSelection.filter { $0.getCollegeSettingEnum() == selectedSetting }
            }
            
            if !CollegeSelectivityFilter.testEqual(lhs: selectedSelectivity, rhs: .AnySelectivity) {
                currentSelection = currentSelection.filter { $0.getCollegeSelectivity() == selectedSelectivity }
            }
            
            return currentSelection
        }
        
    }
}
