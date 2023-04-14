//
//  CollegeNotFoundView.swift
//  
//
//  Created by Shengyuan Lu on 4/11/23.
//

import SwiftUI

struct CollegeNotFoundView: View {
    var body: some View {
        
        VStack(alignment: .center) {
            
            Image(systemName: "questionmark.folder.fill")
                .font(.largeTitle)
                .padding()
            
            Text("There are no colleges in the database that fit your filter.")
                .font(.title2)
                .bold()
            
        }
        .foregroundColor(.accentColor)

    }
}

struct CollegeNotFoundView_Previews: PreviewProvider {
    static var previews: some View {
        CollegeNotFoundView()
    }
}
