//
//  TodayView.swift
//  DailyTracker_UI
//
//  Created by Shubham Singh on 21/10/23.
//

import SwiftUI

struct TodayView: View {
    
    // MARK: - Variables
    let dateManager: DateManager = DateManager()
    
    // MARK: - Views
    var body: some View {
        VStack(spacing: 0) {
            Text(dateManager.getCurrentDate())
                .foregroundColor(.label)
                .font(TypefaceOne.regular.font(size: 20))
            
            Text(dateManager.getCurrentDay())
                .foregroundColor(.label)
                .font(TypefaceTwo.regular.font(size: 16))
            
        }
        .frame(width: 44, height: 44)
        .padding(6)
        .overlay {
            RoundedRectangle(cornerRadius: 8)
                .stroke(lineWidth: 1)
        }
    }
}

struct TodayView_Previews: PreviewProvider {
    static var previews: some View {
        TodayView()
    }
}
