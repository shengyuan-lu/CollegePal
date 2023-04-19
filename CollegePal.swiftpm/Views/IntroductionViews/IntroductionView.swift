//
//  IntroductionView.swift
//  
//
//  Created by Shengyuan Lu on 4/12/23.
//

import SwiftUI

struct IntroductionView: View {
    var body: some View {
        
        List {
            
            Section(header: Text("")) {
                Image("Banner")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 12))

            }

            Section(header: Text("Background Story")) {
                Text("As an international student, the American college application process was one of the most challenging times of my life. I felt lost and overwhelmed, with little guidance or support. Despite my best efforts, I struggled to navigate the complexities of the system. I knew that I wasn't alone. Many students, especially those who are first-generation and underrepresented, face even more challenges due to limited resources availble to them.")
                    .padding(.vertical, 8)
                
                Text("That's why I decide to create CollegePal, a college application assistant. The goal of CollegePal is to provide students with the tools and resources they need to make informed decisions about their college choices and to ensure that all students have equal access to college data.")
                    .padding(.vertical, 8)
            }
            
            Section(header: Text("Feature Preview")) {
                
                IntroductionViewFeatureListCellView(title: "Feature 1", description: "Explore College Options Through Filters")
                
                IntroductionViewFeatureListCellView(title: "Feature 2", description: "Use College Application Checklist To Learn More About Required Materials")
                
                IntroductionViewFeatureListCellView(title: "Feature 3", description: "Find Your Reach, Match, Safety Colleges Through Machine Learning")
                
            }

        }
        .navigationTitle("Getting Started")
        
    }
}

struct IntroductionView_Previews: PreviewProvider {
    static var previews: some View {
        IntroductionView()
    }
}
