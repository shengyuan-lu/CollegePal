//
//  MainNavigationView.swift
//  CollegePal
//
//  Created by Shengyuan Lu on 4/11/23.
//

import SwiftUI

struct MainNavigationView: View {
    
    @State private var showIntro = false
    
    var body: some View {
        
        NavigationView {
            
            List {
                
                Section {
                    
                    NavigationLink(destination: IntroductionView(), isActive: $showIntro) {
                        Label("Introduction", systemImage: "arrow.forward.circle")
                    }
                    
                } header: {
                    Text("Introduction")
                }

                Section(header: Text("Explore")) {
                    NavigationLink(destination: CollegeExplorerView()) {
                        Label("Explore Colleges", systemImage: "globe.desk")
                    }
                }
                
                Section(header: Text("Find My Fit")) {

                    
                }
                
                Section(header: Text("Submit")) {

                    
                }
                
                Section(header: Text("About")) {

                    
                }
            }
            .navigationTitle("CollegePal")
            .onAppear {
                self.showIntro = true
            }
        }
    }
}

struct MainNavigation_Previews: PreviewProvider {
    static var previews: some View {
        MainNavigationView()
    }
}
