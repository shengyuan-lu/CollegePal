//
//  FindFitView.swift
//  
//
//  Created by Shengyuan Lu on 4/16/23.
//

import SwiftUI

struct FindFitView: View {
    
    @ObservedObject var viewModel = FindVM()
    
    @State var showInfo = false
    
    @State var nvLinkActive = false
    
    var body: some View {
        
        List {
            
            Section(header: Text("Instruction")) {
                
                VStack(alignment: .leading) {
                    
                    Text("To maximize your options during the college application process, it's crucial to choose a combination of safety, match, and reach schools.")
                        .padding(.vertical, 4)
                    
                    
                    Text("A safety school is one where your academic qualifications exceed the average requirements for admission and you have a great chance of getting in. A match school is one where your academic qualifications are in line with the standard requirements for admission and you have an average chance of getting in. A reach school is one where your qualifications are below the average requirements for admission, but it is still worth applying because admission is possible. ")
                        .padding(.vertical, 4)
                    
                }
                
                Text("CollegePal can help you by utilizing machine learning to suggest colleges from each category based on your self-assessment below.")
                    .padding(.vertical, 4)
            }
            
            Section(header: Text("Self Evaluation")) {
                
                VStack(spacing: 8) {
                    
                    HStack {
                        
                        VStack {
                            
                            HStack {
                                
                                Text("GPA")
                                    .bold()
                                
                                Spacer()
                                
                                Text(String(format: "%.2f", viewModel.gpa))
                                    .bold()
                                
                            }
                            
                            Slider(value: $viewModel.gpa, in: 0...4)
                            
                        }
                        .padding(8)
                        .padding(.horizontal, 8)
                        .foregroundColor(.primary)
                        .background(Color.accentColor.opacity(0.2))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    
                    HStack {
                        
                        VStack {
                            
                            HStack {
                                
                                Text("Standardized Test")
                                    .bold()
                                
                                Spacer()
                                
                                Text(String(format: "%.0f", viewModel.standardizedTest))
                                    .bold()
                                
                            }
                            
                            Slider(value: $viewModel.standardizedTest, in: 800...1600, step: 10)
                            
                        }
                        .padding(8)
                        .padding(.horizontal, 8)
                        .foregroundColor(.primary)
                        .background(Color.accentColor.opacity(0.2))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    
                    HStack {
                        VStack {
                            
                            HStack {
                                
                                Text("Extracurricular Activities")
                                    .bold()
                                
                                Spacer()
                                
                                Text(viewModel.getClassificationString(value: viewModel.extracurricular))
                                    .bold()
                                
                            }
                            
                            Slider(value: $viewModel.extracurricular, in: 1...5, step: 1)
                            
                        }
                        .padding(8)
                        .padding(.horizontal, 8)
                        .foregroundColor(.primary)
                        .background(Color.accentColor.opacity(0.2))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    
                    HStack {
                        VStack {
                            
                            HStack {
                                
                                Text("Awards")
                                    .bold()
                                
                                Spacer()
                                
                                Text(viewModel.getClassificationString(value: viewModel.awards))
                                    .bold()
                                
                            }
                            
                            Slider(value: $viewModel.awards, in: 1...5, step: 1)
                            
                        }
                        .padding(8)
                        .padding(.horizontal, 8)
                        .foregroundColor(.primary)
                        .background(Color.accentColor.opacity(0.2))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    
                    HStack {
                        VStack {
                            
                            HStack {
                                
                                Text("Letters of Recommendation")
                                    .bold()
                                
                                Spacer()
                                
                                Text(viewModel.getClassificationString(value: viewModel.lor))
                                    .bold()
                                
                            }
                            
                            Slider(value: $viewModel.lor, in: 1...5, step: 1)
                            
                        }
                        .padding(8)
                        .padding(.horizontal, 8)
                        .foregroundColor(.primary)
                        .background(Color.accentColor.opacity(0.2))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                }
                .padding(.vertical, 8)
                
                NavigationLink(isActive: $nvLinkActive) {
                    
                    FindResultView(findVM: viewModel)
                    
                } label: {
                    
                    Button(action: {
                        nvLinkActive.toggle()
                    }) {
                        
                        HStack {
                            Spacer()
                            
                            Image(systemName: "graduationcap.fill")
                            
                            Text("Find My Colleges")
                                .bold()
                            
                            Spacer()
                        }
                        .padding(16)
                        .padding(.horizontal, 16)
                        .foregroundColor(.white)
                        .background(Color.accentColor)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        
                    }
                    .buttonStyle(.plain)
                    
                }

            }
            
        }
        .navigationTitle("Find My Fit")
        .alert(isPresented: $showInfo) {
            Alert(title: Text("Information"), message: Text("Please note that both the training data and all algorithms associated for this prototype CoreML model is entirely fictional and intended only for demonstration purposes."), dismissButton: .default(Text("Got it!")))
        }
        .toolbar {
            
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    self.showInfo.toggle()
                } label: {
                    Image(systemName: "info.circle")
                }
                
            }
        }

        
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        FindFitView()
    }
}
