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
            
            Section {
                Image("Banner")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }
            
            Section(header: Text("Background Story")) {
                Text("As an international student, the college application process was one of the most challenging times of my life. I felt lost and overwhelmed, with little guidance or support. Despite my best efforts, I struggled to navigate the complexities of the system. I knew that I wasn't alone. Many students, especially those who are first-generation and underrepresented, face even more challenges due to limited resources at their high school.")
                    .padding(.vertical, 8)
                
                Text("That's why I decide to create CollegePal, a college Application Assistant. The goal of CollegePal is to provide students with the tools and resources they need to make informed decisions about their college choices and to ensure that all students have equal access to college data.")
            }
            
            Section(header: Text("CollegePal Features")) {
                
                VStack(alignment: .leading) {
                    Text("Feature 1")
                        .bold()
                        .padding(.bottom, 4)
                    
                    Text("Explore College Options Through Filters")
                }
                
                VStack(alignment: .leading) {
                    Text("Feature 2")
                        .bold()
                        .padding(.bottom, 4)
                    
                    Text("Find Your Reach, Match, Safety Colleges Through Machine Learning")
                }
                
                VStack(alignment: .leading) {
                    Text("Feature 3")
                        .bold()
                        .padding(.bottom, 4)
                    
                    Text("Simulate College Application Submission Process To Learn About Required Materials")
                }
            }

        }
        //.scrollContentBackground(.hidden)
        .navigationTitle("Getting Started")
        
    }
}

struct IntroductionView_Previews: PreviewProvider {
    static var previews: some View {
        IntroductionView()
    }
}
