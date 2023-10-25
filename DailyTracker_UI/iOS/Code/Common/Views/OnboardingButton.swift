//
//  OnboardingButton.swift
//  DailyTracker_UI
//
//  Created by Yashraj jadhav on 24/10/23.
//

import SwiftUI

struct OnboardingButton: View {
    
    @State private var from: CGFloat = 0.0
    @State private var to: CGFloat = 1.5
    
    let color: Color
    
    var body: some View {
        Button(action: {
                from += 0.5
            
        }) {
            ZStack {
                Rectangle()
                    .stroke(color.opacity(0.07), lineWidth: 20)
                    .frame(width: 80, height: 80)
                    .cornerRadius(20.0)
                    .foregroundColor(.black)
                    .shadow(radius: 100)
                
                Rectangle()
                    .trim(from: 0, to: from / to)
                    .stroke(color, style: StrokeStyle(lineWidth: 25, lineCap: .square))
                    .frame(width: 80, height: 80)
                    .cornerRadius(20.0)
                    .foregroundColor(.gray)
                    
                Rectangle()
                    .frame(width: 70, height: 70)
                    .foregroundColor(.white)
                    .cornerRadius(20.0)
                    .shadow(radius: 10)
                
                Rectangle()
                    .frame(width: 60, height: 60)
                    .cornerRadius(15.0)
                    .foregroundColor(.black)
                    .shadow(radius: 10)
                
                Image(systemName: "chevron.right")
                    .foregroundColor(.white)
            }
        }
    }
}

#Preview {
    OnboardingButton(color: .black)
}
