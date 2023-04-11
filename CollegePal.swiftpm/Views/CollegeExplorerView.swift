import SwiftUI

struct CollegeExplorerView: View {
    
    @ObservedObject var viewModel: CollegeExplorerVM = CollegeExplorerVM()
    
    var body: some View {
        
        ScrollView {
            
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 350, maximum: 800))], spacing: 16) {
                
                ForEach(viewModel.colleges, id: \.name) { college in
                    CollegeCardView(college: college)
                        .aspectRatio(5/3, contentMode: .fit)
                }
            }
            .padding()
        }
    }
}
