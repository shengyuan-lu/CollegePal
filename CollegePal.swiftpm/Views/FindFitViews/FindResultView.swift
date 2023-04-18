//
//  FindResultView.swift
//  
//
//  Created by Shengyuan Lu on 4/18/23.
//

import SwiftUI



struct FindResultView: View {
    
    let findVM: FindVM
    
    var body: some View {
        Text("\(findVM.getPrediction())")
    }
}
