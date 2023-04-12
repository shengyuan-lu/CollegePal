import SwiftUI

struct CollegeExplorerView: View {
    
    @ObservedObject var viewModel: CollegeExplorerVM = CollegeExplorerVM()
    
    @State private var searchText = ""
    
    @State private var displayStyle = CollegeExplorerViewOptions.Grid
    

    var body: some View {
        
        VStack {
            
            Picker("Display Style", selection: $displayStyle) {
                Text("Grid").tag(CollegeExplorerViewOptions.Grid)
                    .padding()
                Text("List").tag(CollegeExplorerViewOptions.List)
                    .padding()
            }
            .pickerStyle(.segmented)
            .padding(.vertical, 4)
            
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
        .padding()
        
        var filteredColleges: [CollegeStruct] {
            if searchText.isEmpty {
                return viewModel.colleges
            } else {
                return viewModel.colleges.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
            }
        }
        
    }
}
