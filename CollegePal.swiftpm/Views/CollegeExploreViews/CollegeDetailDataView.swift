//
//  CollegeDetailDataView.swift
//  
//
//  Created by Shengyuan Lu on 4/16/23.
//

import SwiftUI

struct CollegeDetailDataView: View {
    
    let college: CollegeStruct
    
    var body: some View {
        Section {
            
            VStack(alignment: .leading, spacing: 16) {
                
                Text("Data")
                    .font(.title3)
                    .bold()
                
                Divider()
                
                VStack {
                HStack {
                    
                    Text("Acceptance Rate")
                        .bold()
                    
                    Spacer()
                    
                    Text(college.getAcceptanceRateInString())
                }
                
                Divider()
                
                HStack {
                    
                    Text("Graduation Rate")
                        .bold()
                    
                    Spacer()
                    
                    Text(college.getGraduationRateInString())
                }
                
                Divider()
                
                HStack {
                    
                    Text("Annual Tuition")
                        .bold()
                    
                    Spacer()
                    
                    Text("$" + String(college.tuitionFee))
                }
                
                Divider()
                
                HStack {
                    
                    Text("Undergraduate Enrollment")
                        .bold()
                    
                    Spacer()
                    
                    Text(String(college.undergraduateEnrollment) + " Students")
                }
                
                Divider()
                
                HStack {
                    
                    Text("Location")
                        .bold()
                    
                    Spacer()
                    
                    Text(String(college.location))
                }
            }
            
        }
        .padding(8)
        
    }
    }
}
