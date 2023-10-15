//
//  SupportViews.swift
//  DailyTracker_UI
//
//  Created by Yashraj jadhav on 14/10/23.
//

import SwiftUI

struct ImageView: View {
    
    var imageName: Image
    var lineWidth: CGFloat
    var borderColor: Color
    
    init(imageName: Image, lineWidth: CGFloat, borderColor: Color) {
        self.imageName = imageName
        self.lineWidth = lineWidth
        self.borderColor = borderColor
    }
    
    var body: some View {
        imageName
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 90.0, height: 90.0)
            .clipShape(Circle())
            .overlay(
                Circle()
                    .stroke(borderColor, lineWidth: lineWidth)
            )
    }
}

#Preview {
        ImageView(imageName: Image("EX"), lineWidth: 6, borderColor: .yellow)
    }


