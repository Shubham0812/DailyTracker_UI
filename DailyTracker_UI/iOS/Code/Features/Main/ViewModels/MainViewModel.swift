//
//  MainViewModel.swift
//  DailyTracker_UI
//
//  Created by Shubham Singh on 21/10/23.
//

import Foundation

class MainViewModel: ObservableObject {
    
    // MARK: - Variables
    var userName: String = ""
    
    
    init() {
        // Default userName
        userName = "User"
    }
    
}
