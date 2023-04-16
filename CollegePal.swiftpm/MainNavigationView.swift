//
//  MainNavigationView.swift
//  CollegePal
//
//  Created by Shengyuan Lu on 4/11/23.
//

import SwiftUI

struct MainNavigationView: View {
    
    var body: some View {
        
        NavigationView {
            
            List {
                
                Section(header: Text("Introduction")) {
                    
                    NavigationLink(destination: IntroductionView()) {
                        Label("Introduction", systemImage: "arrow.forward.circle")
                    }
                    
                }
                
                Section(header: Text("Explore")) {
                    NavigationLink(destination: CollegeExploreView()) {
                        Label("Explore Colleges", systemImage: "globe.desk")
                    }
                }
                
                Section(header: Text("Find My Fit")) {
                    
                    
                }
                
                Section(header: Text("Submit")) {
                    
                    
                }
                
                Section(header: Text("About")) {
                    NavigationLink(destination: AboutMe()) {
                        Label("About Me", systemImage: "person")
                    }
                    
                    NavigationLink(destination: AcknowledgementView()) {
                        Label("Acknowledgement", systemImage: "star")
                    }
                }
            }
            .navigationTitle("CollegePal")
            
        }
    }
}

struct MainNavigation_Previews: PreviewProvider {
    static var previews: some View {
        MainNavigationView()
    }
}
