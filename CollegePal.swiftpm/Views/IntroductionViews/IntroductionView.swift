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
                Text("CollegePal")
            }

        }
        .navigationTitle("Introduction")
        
    }
}

struct IntroductionView_Previews: PreviewProvider {
    static var previews: some View {
        IntroductionView()
    }
}
