//
//  MainNavigation.swift
//  CollegePal
//
//  Created by Shengyuan Lu on 4/11/23.
//

import SwiftUI

struct MainNavigation: View {
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Introduction")) {

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
        }
    }
}

struct MainNavigation_Previews: PreviewProvider {
    static var previews: some View {
        MainNavigation()
    }
}
