//
//  NavigationButtonView.swift
//  DailyTracker_UI
//
//  Created by Mark Golubev on 29/10/2023.
//

import SwiftUI

struct NavigationButtonView: View {
    
    let navigationButton: NavigationButton?
    
    var body: some View {
        navigationButtonView
    }
    
    init(navigationButton: NavigationButton? = NavigationButton(size: 25)) {
        self.navigationButton = navigationButton
    }
    
    // MARK: Primary Button View
    @ViewBuilder
    private var navigationButtonView: some View {
        if let button = navigationButton {
            NavigationButton(size: button.size) {
                // animation here
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    button.action?()
                }
            }
        }
    }
}

struct NavigationButton: View {
    let size: CGFloat
    var action: (() -> Void)? = nil
    
    var body: some View {
        Button(action: {
            action?()
        }, label: {
                ZStack{
                    Color.clear.opacity(0.7)
                    VStack(alignment: .leading, spacing: 5, content: {
                        RoundedRectangle(cornerRadius: 25.0, style: .continuous)
                            .frame(width: size, height: 2)
                        RoundedRectangle(cornerRadius: 25.0, style: .continuous)
                            .frame(width: size / 2, height: 2)
                    })
                }
                .frame(width: 44, height: 44)
                .padding(6)
                .overlay {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(lineWidth: 1)
                }
                .foregroundStyle(.black)
        })
    }
}

#Preview {
    NavigationButtonView()
}
