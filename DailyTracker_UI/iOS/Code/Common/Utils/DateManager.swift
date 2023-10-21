//
//  DateManager.swift
//  DailyTracker_UI
//
//  Created by Shubham Singh on 21/10/23.
//

import Foundation

struct DateManager {
    var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd"
        return formatter
    }()
    
    var dayFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM"
        return formatter
    }()
    
    
    func getCurrentDate() -> String {
        return dateFormatter.string(from: Date())
    }
    
    func getCurrentDay() -> String {
        return dayFormatter.string(from: Date())
    }
}
