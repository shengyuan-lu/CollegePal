//
//  AboutMe.swift
//  
//
//  Created by Shengyuan Lu on 4/15/23.
//

import SwiftUI

struct AboutMe: View {
    
    var body: some View {
        
        List {
            
            Section {
                
                HStack(alignment: .center, spacing: 16) {
                    
                    Image("shengyuan")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 4))
                        .padding(4)
                    
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Hi There 👋")
                            .font(.title3)
                            .bold()
                        
                        Text("I am Shengyuan Lu")
                            .font(.title)
                            .bold()
                    }
                    
                    Spacer()
                }
                .padding(20)
                .padding(.leading, 8)
                
            }
            .edgesIgnoringSafeArea(.all)
            .background(Color.accentColor.opacity(0.3))
            
            Section(header: Text("HashTags")) {
                
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    LazyHGrid(rows: [GridItem(.adaptive(minimum: 25, maximum: 75))]) {
                        TagView(text: "#Programmer", foregroundColor: Color.white, backgroundColor: Color.accentColor)
                        
                        TagView(text: "#Designer", foregroundColor: Color.white, backgroundColor: Color.purple)
                        
                        TagView(text: "#Creator", foregroundColor: Color.white, backgroundColor: Color.blue)
                        
                        TagView(text: "#Maker", foregroundColor: Color.white, backgroundColor: Color.mint)
                    }
                    
                }
                .padding(8)
            }
            
            Section(header: Text("Fun Facts")) {
                
                HStack {
                    
                    Text("Majoring...")
                        .bold()
                    
                    Spacer()
                    
                    Text("Computer Science")
                }
                
                HStack {
                    
                    Text("Studying At...")
                        .bold()
                    
                    Spacer()
                    
                    Text("UC Irvine")
                }
                
                HStack {
                    
                    Text("Learning Next...")
                        .bold()
                    
                    Spacer()
                    
                    Text("HealthKit, PencilKit")
                }
                
                HStack {
                    
                    Text("Hoping To Visit...")
                        .bold()
                    
                    Spacer()
                    
                    Text("Apple Park")
                }
                
                HStack {
                    
                    Text("Favorite Apple Product...")
                        .bold()
                    
                    Spacer()
                    
                    Text("MacBook Pro")
                }
                
            }
            
            Section("Detail") {
                Text("I am an engineer by training, a software developer by profession, and a creative artist by heart. If what I want doesn’t exist, I build it from scratch. From the chemistry board game I designed in high school to my newest iOS app ZotMeal, I am obsessed with turning ideas into reality. In my free time, I like to attend Hackathons to meet people with ambitious vision. I wake up every day with a sense of excitement and purpose, eager to make a difference in the world.")
                    .padding(8)
            }
            
            
        }
        .scrollContentBackground(.hidden)
        .navigationTitle("About Me")
        .navigationBarTitleDisplayMode(.inline)
    }
    
}


struct AboutMe_Previews: PreviewProvider {
    static var previews: some View {
        AboutMe()
    }
}
