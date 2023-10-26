//
//  ViewExtensions.swift
//  DailyTracker_UI
//
//  Created by Shubham Singh on 07/10/23.
//

import SwiftUI

extension View {
    @ViewBuilder func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
    
    func alert(title: String = "", message: String = "", closeButton: CloseAlertButton = CloseAlertButton(systemName: "xmark"), dismissButton: AlertButton = AlertButton(title: "ok"), isPresented: Binding<Bool>) -> some View {
        let title   = NSLocalizedString(title, comment: "")
        let message = NSLocalizedString(message, comment: "")
    
        return modifier(CustomAlertModifier(title: title, message: message, closeButton: closeButton, dismissButton: dismissButton, isPresented: isPresented))
    }

    func alert(title: String = "", message: String = "", closeButton: CloseAlertButton = CloseAlertButton(systemName: "xmark"), primaryButton: AlertButton, secondaryButton: AlertButton, isPresented: Binding<Bool>) -> some View {
        let title   = NSLocalizedString(title, comment: "")
        let message = NSLocalizedString(message, comment: "")
    
        return modifier(CustomAlertModifier(title: title, message: message, closeButton: closeButton, primaryButton: primaryButton, secondaryButton: secondaryButton, isPresented: isPresented))
    }
}
