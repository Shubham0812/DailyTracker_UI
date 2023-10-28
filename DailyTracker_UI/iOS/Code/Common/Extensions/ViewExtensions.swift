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
    
    /// Presents  a customized alert view with a given title, message, close button, dismiss button.
    func alert(title: String = "", message: String = "", closeButton: CloseAlertButton = CloseAlertButton(systemName: "xmark"), dismissButton: AlertButton = AlertButton(title: "OK", color: .purple), isPresented: Binding<Bool>) -> some View {
        // Localize the title and message for internationalization.
        let title   = NSLocalizedString(title, comment: "")
        let message = NSLocalizedString(message, comment: "")
    
        // Apply the custom alert modifier to the view.
        return modifier(CustomAlertModifier(title: title, message: message, closeButton: closeButton, dismissButton: dismissButton, isPresented: isPresented))
    }

    /// Presents  a customized alert view with a given title, message, close button, primary button, secondary button.
    func alert(title: String = "", message: String = "", closeButton: CloseAlertButton = CloseAlertButton(systemName: "xmark"), primaryButton: AlertButton, secondaryButton: AlertButton, isPresented: Binding<Bool>) -> some View {
        // Localize the title and message for internationalization.
        let title   = NSLocalizedString(title, comment: "")
        let message = NSLocalizedString(message, comment: "")
    
        // Apply the custom alert modifier to the view.
        return modifier(CustomAlertModifier(title: title, message: message, closeButton: closeButton, primaryButton: primaryButton, secondaryButton: secondaryButton, isPresented: isPresented))
    }
}
