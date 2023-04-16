//
//  CollegeExploreDetailView.swift
//  
//
//  Created by Shengyuan Lu on 4/11/23.
//

import SwiftUI
import Charts

struct CollegeExploreDetailView: View {
    
    let college: CollegeStruct
    
    var body: some View {
        
        
        List {
            
            Section {
                
                VStack(alignment: .leading, spacing: 16) {
                    
                    Text("In A Nutshell ")
                        .font(.title3)
                        .bold()
                    
                    Divider()
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        
                        LazyHGrid(rows: [GridItem(.adaptive(minimum: 25, maximum: 75))]) {
                            TagView(text: college.type, foregroundColor: Color.white, backgroundColor: Color.accentColor)
                            
                            TagView(text: college.getYearInString(), foregroundColor: Color.white, backgroundColor: Color.purple)
                            
                            TagView(text: college.setting, foregroundColor: Color.white, backgroundColor: Color.blue)
                            
                            TagView(text: college.getCollegeSelectivityInString(), foregroundColor: Color.white, backgroundColor: Color.mint)
                        }
                        
                    }
                }
                .padding(8)
                
            }
            
            Section {
                
                VStack(alignment: .leading, spacing: 16) {
                    
                    Text("Top Majors")
                        .font(.title3)
                        .bold()
                    
                    Divider()
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        
                        LazyHGrid(rows: [GridItem(.adaptive(minimum: 25, maximum: 75))]) {
                            
                            ForEach(college.topMajors, id: \.self) { major in
                                TagView(text: major, foregroundColor: Color.white, backgroundColor: Color.orange)
                            }
                            
                        }
                        
                        Spacer()
                    }
                }
                .padding(8)
                
            }
            
            Section {
                
                VStack(alignment: .leading, spacing: 16) {
                    
                    Text("Description")
                        .font(.title3)
                        .bold()
                    
                    Divider()
                    
                    Text(college.description)
                }
                .padding(8)
                
            }
           
            CollegeExploreDetailDataView(college: college)
            
            Section {
                
                VStack(alignment: .leading, spacing: 16) {
                    
                    Text("Acceptance Rate VS National Average")
                        .font(.title3)
                        .padding(.top, 8)
                        .bold()
                    
                    Chart {
                        
                        BarMark(x: .value("Acceptance Rate", college.acceptanceRate * 100),
                                y: .value("College", college.name))
                        .annotation(position: .trailing, alignment: .trailing, spacing: 5) {
                            Text("\(Int(college.acceptanceRate * 100)) %")
                                .font(.footnote)
                                .foregroundColor(.primary)
                                .fontWeight(.bold)
                            
                        }
                        
                        
                        BarMark(x: .value("Acceptance Rate", 0.68 * 100),
                                y: .value("College", "National Average"))
                        .annotation(position: .trailing, alignment: .trailing, spacing: 5) {
                            Text("\(Int(0.68 * 100)) %")
                                .font(.footnote)
                                .foregroundColor(.primary)
                                .fontWeight(.bold)
                            
                        }
                        
                        
                    }
                    .chartXScale(domain: 0...100)
                    .chartXAxisLabel("Acceptance Rate %")
                    .padding(16)
                    
                }
                
                
            }
            
            Section {
                
                VStack(alignment: .leading, spacing: 16) {
                    
                    Text("Graduation Rate VS National Average")
                        .font(.title3)
                        .padding(.top, 8)
                        .bold()
                    
                    Chart {
                        
                        BarMark(x: .value("Graduation Rate", college.graduationRate * 100),
                                y: .value("College", college.name))
                        .annotation(position: .trailing, alignment: .trailing, spacing: 5) {
                            Text("\(Int(college.graduationRate * 100)) %")
                                .font(.footnote)
                                .foregroundColor(.primary)
                                .fontWeight(.bold)
                            
                        }
                        
                        
                        BarMark(x: .value("Graduation Rate", 0.64 * 100),
                                y: .value("College", "National Average"))
                        .annotation(position: .trailing, alignment: .trailing, spacing: 5) {
                            Text("\(Int(0.64 * 100)) %")
                                .font(.footnote)
                                .foregroundColor(.primary)
                                .fontWeight(.bold)
                            
                        }
                        
                    }
                    .chartXScale(domain: 0...100)
                    .chartXAxisLabel("Graduation Rate %")
                    .padding(16)
                    
                }
                
            }
            
            
        }
        .navigationTitle(college.name)
        .navigationBarTitleDisplayMode(.inline)
        
    }
    
}

struct CollegeExploreDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CollegeExploreDetailView(college: CollegeStruct.example)
    }
}
