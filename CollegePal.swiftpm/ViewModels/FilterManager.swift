//
//  FilterEngine.swift
//
//
//  Created by Shengyuan Lu on 4/12/23.
//

import Foundation
import SwiftUI

class FilterManager: ObservableObject {
    
    @Published var selectedType: CollegeTypeFilter = .AnyType
    @Published var selectedSetting: CollegeSettingFilter = .AnySetting
    @Published var selectedYear: CollegeYearFilter = .AnyYear
    @Published var selectedSelectivity: CollegeSelectivityFilter = .AnySelectivity
    
    @Published var searchText = ""

    @Published var displayStyle = CollegeExplorerViewOptions.Grid
    
    init() {}
}
