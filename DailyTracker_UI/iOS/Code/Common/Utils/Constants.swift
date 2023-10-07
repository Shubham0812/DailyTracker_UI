//
//  Constants.swift
//  DailyTracker_UI
//
//  Created by Shubham Singh on 07/10/23.
//

import Foundation

struct Constants {
    private let itemFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .medium
        return formatter
    }()
}
