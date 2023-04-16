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
        ChecklistItem(name: "High School Transcript", description: "This is a record of your academic performance in high school. It shows the courses you took and the grades you received in each course."),
        ChecklistItem(name: "Standardized Test Scores", description: "Most colleges require either SAT or ACT scores, which are standardized tests that measure a student's proficiency in reading, writing, and math."),
        ChecklistItem(name: "Letters of Recommendation", description: "These are letters written by teachers, counselors, or other adults who can vouch for your academic abilities and personal qualities."),
        ChecklistItem(name: "Personal Statement", description: "This is a written statement that tells the college about your background, interests, goals, and why you want to attend their school."),
        ChecklistItem(name: "Extracurricular Activities List", description: "This is a list of all the clubs, sports, volunteer work, or other activities you participated in outside of the classroom."),
        ChecklistItem(name: "Application Fee", description: "This is a fee required by most colleges to process your application."),
    ]
    
    init() {}
    
    func isAllItemsChecked() -> Bool {
        return !self.items.contains(where: { !$0.isChecked })
    }

    func toggleCheck(id: UUID) {
        self.items[self.items.firstIndex(where: { $0.id == id })!].isChecked.toggle()
    }

}
