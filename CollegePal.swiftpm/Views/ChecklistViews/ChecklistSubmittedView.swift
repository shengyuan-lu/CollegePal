//
//  ChecklistSubmittedView.swift
//  
//
//  Created by Shengyuan Lu on 4/16/23.
//

import Foundation

import SwiftUI
import UIKit

struct ChecklistSubmittedView: View {
    
    var body: some View {
        
        VStack(spacing: 20) {
            Text("🎉 Congratulations 🎉")
                .bold()
                .font(.title)
            
            Text("You've completed this checklist and got to know all the components for a college application!")
        }
        .navigationTitle("")
       
    }
    
}
