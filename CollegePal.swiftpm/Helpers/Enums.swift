//
//  Enums.swift
//  
//
//  Created by Shengyuan Lu on 4/11/23.
//

import Foundation

enum CollegeExplorerViewOptions {
    case Grid
    case List
}

enum CollegeTypeFilter: String, CaseIterable, Identifiable {
    
    case AnyType = "Any"
    case PublicU = "Public"
    case PrivateU = "Private"
    
    var id: String { self.rawValue }
}

extension CollegeTypeFilter: Equatable {
    
    public static func testEqual(lhs: CollegeTypeFilter, rhs: CollegeTypeFilter) -> Bool {
        
        switch (lhs,rhs) {
        case (.AnyType, .AnyType):
            return true
        case (.PublicU, .PublicU):
            return true
        case (.PrivateU,.PrivateU):
            return true
        default:
            return false
        }
    }
}

enum CollegeSettingFilter: String, CaseIterable, Identifiable  {
    
    case AnySetting = "Any"
    case City = "City"
    case Urban = "Urban"
    case Suburban = "Suburban"
    case Rural = "Rural"
    
    
    var id: String { self.rawValue }
}

extension CollegeSettingFilter: Equatable {
    
    public static func testEqual(lhs: CollegeSettingFilter, rhs:CollegeSettingFilter) -> Bool {
        
        switch (lhs,rhs) {
        case (.AnySetting, .AnySetting):
            return true
        case (.City,.City):
            return true
        case (.Suburban,.Suburban):
            return true
        case (.Urban,.Urban):
            return true
        case (.Rural,.Rural):
            return true
        default:
            return false
        }
    }
}

enum CollegeYearFilter: String, CaseIterable, Identifiable {
    
    case AnyYear = "Any"
    case FourYear = "4"
    case TwoYear = "2"
    
    var id: String { self.rawValue }
}

extension CollegeYearFilter: Equatable {
    
    public static func testEqual(lhs: CollegeYearFilter, rhs: CollegeYearFilter) -> Bool {
        
        switch (lhs,rhs) {
        case (.AnyYear, .AnyYear):
            return true
        case (.FourYear, .FourYear):
            return true
        case (.TwoYear,.TwoYear):
            return true
        default:
            return false
        }
    }
}

enum CollegeSelectivityFilter: String, CaseIterable, Identifiable {
    
    case AnySelectivity = "Any"
    case VerySelective = "Very Selective"
    case Selective = "Selective"
    case LessSelective = "Less Selective"
    
    var id: String { self.rawValue }
}

extension CollegeSelectivityFilter: Equatable {
    
    public static func testEqual(lhs: CollegeSelectivityFilter, rhs: CollegeSelectivityFilter) -> Bool {
        
        switch (lhs,rhs) {
        case (.AnySelectivity, .AnySelectivity):
            return true
        case (.VerySelective, .VerySelective):
            return true
        case (.Selective,.Selective):
            return true
        case (.LessSelective,.LessSelective):
            return true
        default:
            return false
        }
    }
}
