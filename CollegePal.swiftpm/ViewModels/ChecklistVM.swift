//
//  ChecklistVM.swift
//  
//
//  Created by Shengyuan Lu on 4/16/23.
//

import SwiftUI
import Foundation

class ChecklistVM: ObservableObject {
    
    @Published var items = [
        ChecklistItem(name: "High School Transcript", description: "This is a record of your academic performance in high school. It shows the courses you took and the grades you received in each course.", timeline: "Your high school transcript encompasses your academic performance throughout your entire high school career. Demonstrating strong academic performance on your transcript can greatly enhance your college application, as it suggests that you are likely to continue this positive trend in college as well.", impact: "Very High"),
        ChecklistItem(name: "Standardized Test Scores", description: "Many colleges require either SAT or ACT scores, which are standardized tests that measure a student's proficiency in reading, writing, and math.", timeline: "It's recommended to take standardized tests 3-6 months prior to the application deadline. This allows for ample preparation time and flexibility for potential retakes if your initial score does not meet your expectations. Planning ahead and allowing for retakes can help ensure that you submit the strongest test scores possible with your college application.", impact: "Medium"),
        ChecklistItem(name: "Personal Statement", description: "This is a written statement that tells the college about your background, interests, goals, and why you want to attend their school.", timeline: "Start writing your personal statement about 1 month before the application deadline. This allows for ample time to brainstorm, write, and revise your essay. Giving yourself enough time for multiple rounds of review and revision can help ensure that your personal statement is well-polished and effectively conveys your unique story and experiences to the admissions committee.", impact: "High"),
        ChecklistItem(name: "Extracurricular Activities", description: "This is a list of all the clubs, sports, volunteer work, or other activities you participated in outside of the classroom. Colleges often value well-rounded students who demonstrate a commitment to their interests and contribute to their communities through extracurricular activities. Thus, highlighting your involvement and accomplishments in these areas can greatly enhance your college application.", timeline: "Your extracurricular activities showcase your involvement and achievements throughout your entire high school career.", impact: "High"),
        ChecklistItem(name: "Letters of Recommendation", description: "These are letters written by teachers, counselors, or other adults who can vouch for your academic abilities and personal qualities.", timeline: "As a courtesy, give your recommender at least 1 month of notice, longer if necessary.", impact: "Low"),
        ChecklistItem(name: "Application Fee", description: "This is a fee required by most colleges to process your application. Sometimes, you can ask for an application fee waiver so you don't have to pay this fee.", timeline: "Have a working payment method when you submit your application.", impact: "N/A"),
    ]
    
    init() {}
    
    func isAllItemsChecked() -> Bool {
        return !self.items.contains(where: { !$0.isChecked })
    }

    func toggleCheck(id: UUID) {
        self.items[self.items.firstIndex(where: { $0.id == id })!].isChecked.toggle()
    }

}
