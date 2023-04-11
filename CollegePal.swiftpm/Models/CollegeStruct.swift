//
//  CollegeStruct.swift
//  CollegePal
//
//  Created by Shengyuan Lu on 4/10/23.
//

import Foundation

struct CollegeStruct: Decodable {
    let name: String
    let photo: [String]
    let location: String
    let type: String
    let setting: String
    let topMajors: [String]
    let tuitionFee: Int
    let acceptanceRate: Double
    let graduationRate: Double
    let undergraduateEnrollment: Int
    let description: String
    
    
    static let example = CollegeStruct(name: "Stanford University", photo: ["stanford1"], location: "Palo Alto, CA", type: "Private 4-Year", setting: "City", topMajors: ["Computer Science", "Business"], tuitionFee: 45000, acceptanceRate: 0.04, graduationRate: 0.95, undergraduateEnrollment: 7000, description: "Example University is a private research university located in New York City. With a diverse student body and top-ranked programs in computer science, biology, and psychology, Example University is a great choice for ambitious students seeking a challenging academic environment.")
}
