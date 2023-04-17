//
//  ChecklistSubmittedView.swift
//  
//
//  Created by Shengyuan Lu on 4/16/23.
//

import Foundation

import SwiftUI
import UIKit
import ConfettiSwiftUI

struct ChecklistSubmittedView: View {
    
    @State private var counter: Int = 0
    
    var body: some View {
        
        VStack(spacing: 20) {
            Text("🎉 Congratulations 🎉")
                .bold()
                .font(.title)
                .onAppear(perform: {
                    counter += 1
                    
                })
            
            Text("You've completed this checklist and got to know all the components for a college application!")
        }
        .navigationTitle("")
        .confettiCannon(counter: $counter, radius: 600, repetitions: 3, repetitionInterval: 0.7)
       
    }
    
}
