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
                
                Section(header: Text("")) {
                    Image("Banner")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(RoundedRectangle(cornerRadius: 12))

                }
                
                Section(header: Text("Introduction")) {
                    
                    NavigationLink(destination: IntroductionView()) {
                        Label("Getting Started", systemImage: "arrow.forward.circle")
                    }
                    
                }
                
                Section(header: Text("Explore")) {
                    NavigationLink(destination: CollegeExploreView()) {
                        Label("Explore Colleges", systemImage: "globe.desk")
                    }
                }
                
                Section(header: Text("Checklist")) {
                    NavigationLink(destination: ChecklistView()) {
                        Label("Application Checklist", systemImage: "checklist")
                    }
                }
                
                Section(header: Text("Find")) {
                    NavigationLink(destination: FindMyFitView()) {
                        Label("Find My Fit", systemImage: "magnifyingglass")
                    }
                }
                
                Section(header: Text("About")) {
                    NavigationLink(destination: AboutMeView()) {
                        Label("About Me", systemImage: "person")
                    }
                    
                    NavigationLink(destination: AcknowledgementView()) {
                        Label("Acknowledgement", systemImage: "star")
                    }
                }
            }
            .navigationTitle("CollegePal")
            
        }
        .navigationViewStyle(.stack)
    }
}

struct MainNavigation_Previews: PreviewProvider {
    static var previews: some View {
        MainNavigationView()
    }
}
