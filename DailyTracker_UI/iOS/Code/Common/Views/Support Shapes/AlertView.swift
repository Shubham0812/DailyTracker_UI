//
//  AlertView.swift
//  DailyTracker_UI
//
//  Created by Mark Golubev on 25/10/2023.
//

import SwiftUI

struct AlertView: View {
    
    // MARK: - Public Properties
    let title: String
    let message: String
    let closeButton: CloseAlertButton?
    let dismissButton: AlertButton?
    let primaryButton: AlertButton?
    let secondaryButton: AlertButton?
    
    // MARK: Private Properties
    @State private var opacity: CGFloat           = 0
    @State private var backgroundOpacity: CGFloat = 0
    @State private var scale: CGFloat             = 0.001
    
    @Environment(\.dismiss) private var dismiss
    
    
    // MARK: - Body
    var body: some View {
        // Main content of the alert view.
        Color.clear
            .overlay(
                ZStack {
                    dimView
                    alertView
                        .scaleEffect(scale)
                        .opacity(opacity)
                }
                    .transition(.opacity)
                
            )
            .ignoresSafeArea()
            .task {
                animate(isShown: true)
            }
    }
    
    // MARK: - Private View
    // MARK: Alert View
    private var alertView: some View {
        VStack(spacing: 20) {
            
            HStack(alignment: .top, content: {
                Spacer()
                closeButtonView
            })
            titleView
            messageView
            buttonsView
        }
        .padding(24)
        .frame(width: 320)
        .background(.white)
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.4), radius: 16, x: 0, y: 12)
    }
    
    // MARK: Title View
    @ViewBuilder
    private var titleView: some View {
        if !title.isEmpty {
            Text(title)
                .font(Font.custom("Degular-Bold", size: 18))
                .foregroundColor(.black)
                .lineSpacing(24 - UIFont.systemFont(ofSize: 18, weight: .bold).lineHeight)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
    
    // MARK: Message View
    @ViewBuilder
    private var messageView: some View {
        if !message.isEmpty {
            Text(message)
                .font(Font.custom("Degular-Regular", size: title.isEmpty ? 18 : 16))
                .foregroundColor(title.isEmpty ? .black : .gray)
                .lineSpacing(24 - UIFont.systemFont(ofSize: title.isEmpty ? 18 : 16).lineHeight)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
    
    // MARK: Buttons View
    private var buttonsView: some View {
        HStack(spacing: 12) {
            if dismissButton != nil {
                dismissButtonView
                
            } else if primaryButton != nil, secondaryButton != nil {
                secondaryButtonView
                primaryButtonView
            }
        }
        .padding(.top, 23)
    }
    
    // MARK: Primary Button View
    @ViewBuilder
    private var primaryButtonView: some View {
        if let button = primaryButton {
            AlertButton(title: button.title, color: button.color) {
                animate(isShown: false) {
                    dismiss()
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                    button.action?()
                }
            }
        }
    }
    
    // MARK: Secondary Button View
    @ViewBuilder
    private var secondaryButtonView: some View {
        if let button = secondaryButton {
            AlertButton(title: button.title, color: button.color) {
                animate(isShown: false) {
                    dismiss()
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                    button.action?()
                }
            }
        }
    }
    
    // MARK: Dismiss Button View
    @ViewBuilder
    private var dismissButtonView: some View {
        if let button = dismissButton {
            AlertButton(title: button.title , color: button.color) {
                animate(isShown: false) {
                    dismiss()
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                    button.action?()
                }
            }
        }
    }
    
    // MARK: Close Button View
    @ViewBuilder
    private var closeButtonView: some View {
        if let button = closeButton {
            CloseAlertButton(systemName: button.systemName) {
                animate(isShown: false) {
                    dismiss()
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                    button.action?()
                }
            }
        }
    }
    
    // MARK: Dim Background View
    private var dimView: some View {
        Color.gray
            .opacity(0.88)
            .opacity(backgroundOpacity)
            .onTapGesture {
                animate(isShown: false) {
                    dismiss()
                }
            }
    }
    
    
    // MARK: - Private Functions
        
        /// Animates the appearance/disappearance of the alert view.
        /// - Parameters:
        ///   - isShown: A boolean indicating whether the alert view should be shown or hidden.
        ///   - completion: A closure to be executed after the animation completes.
    private func animate(isShown: Bool, completion: (() -> Void)? = nil) {
        // Animation logic for showing/hiding the alert view
        switch isShown {
        case true:
            opacity = 1
            
            withAnimation(.spring(response: 0.3, dampingFraction: 0.9, blendDuration: 0).delay(0.4)) {
                backgroundOpacity = 0.5
                scale             = 1
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                completion?()
            }
            
        case false:
            withAnimation(.easeOut(duration: 0.2)) {
                backgroundOpacity = 0
                opacity           = 0
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                completion?()
            }
        }
    }
}

// MARK: - Alert Button
/// Represents a button used in the custom alert view.
struct AlertButton: View {
    
    // MARK: - Public Properties
    let title: LocalizedStringKey
    let color: Color
    var action: (() -> Void)? = nil
    
    
    // MARK: - Body
    var body: some View {
        Button {
            action?()
            
        } label: {
            Text(title)
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(.white)
                .padding(.horizontal, 20)
        }
        .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
        .frame(height: 44)
        .background(color)
        .cornerRadius(8)
        
    }
}

// MARK: - Close Alert Buton
/// Represents a close button used in the custom alert view.
struct CloseAlertButton: View {
    
    // MARK: - Public Properties
    let systemName: String
    var action: (() -> Void)? = nil
    
    
    // MARK: - Body
    var body: some View {
        Button {
            action?()
            
        } label: {
            Image(systemName: systemName)
                .foregroundStyle(.gray, .gray.opacity(0.2))
        }
        .frame(height: 10)
    }
}

// MARK: - Custom Alert Modifier
/// A view modifier for presenting the custom alert view as a full-screen cover.
struct CustomAlertModifier {
    
    // MARK: - Private Properties
    @Binding private var isPresented: Bool
    @State private var internalIsPresented = true
    
    private let title: String
    private let message: String
    private let closeButton: CloseAlertButton?
    private let dismissButton: AlertButton?
    private let primaryButton: AlertButton?
    private let secondaryButton: AlertButton?
}

extension CustomAlertModifier: ViewModifier {
    @ViewBuilder
    func body(content: Content) -> some View {
        // Applies the alert view as a full-screen cover with the specified properties.
        content
            .fullScreenCover(isPresented: $isPresented) {
                ZStack{
                    AlertView(title: title, message: message, closeButton: closeButton, dismissButton: dismissButton, primaryButton: primaryButton, secondaryButton: secondaryButton)
                }
                .presentationBackground(.clear)
                
            }
        
    }
    
    
}

extension CustomAlertModifier {
    
    /// Initializes the modifier with a close button and a dismiss button.
    init(title: String = "", message: String = "", closeButton: CloseAlertButton, dismissButton: AlertButton, isPresented: Binding<Bool>) {
        self.title         = title
        self.message       = message
        self.closeButton   = closeButton
        self.dismissButton = dismissButton
        
        self.primaryButton   = nil
        self.secondaryButton = nil
        
        _isPresented = isPresented
    }
    
    /// Initializes the modifier with a close button, a primary button, and a secondary button.
    init(title: String = "", message: String = "", closeButton: CloseAlertButton, primaryButton: AlertButton, secondaryButton: AlertButton, isPresented: Binding<Bool>) {
        self.title           = title
        self.message         = message
        self.closeButton     = closeButton
        self.primaryButton   = primaryButton
        self.secondaryButton = secondaryButton
        
        self.dismissButton = nil
        
        _isPresented = isPresented
    }
}

#if DEBUG
struct AlertView_Previews: PreviewProvider {
    
    static var previews: some View {
        let dismissButton   = AlertButton(title: "OK", color: .green)
        let primaryButton   = AlertButton(title: "Got it", color: .purple)
        let secondaryButton = AlertButton(title: "Cancel", color: .red)
        let closeButton = CloseAlertButton(systemName: "xmark")
        
        let title = "This is your life. Do what you want and do it often."
        let message = """
                    If you don't like something, change it.
                    If you don't like your job, quit.
                    If you don't have enough time, stop watching TV.
                    """
        
        return VStack {
            AlertView(title: title, message: message, closeButton: closeButton, dismissButton: nil,           primaryButton: nil,           secondaryButton: nil)
            AlertView(title: title, message: message, closeButton: closeButton, dismissButton: dismissButton, primaryButton: nil,           secondaryButton: nil)
            AlertView(title: title, message: message, closeButton: closeButton, dismissButton: nil,           primaryButton: primaryButton, secondaryButton: secondaryButton)
        }
        .previewDevice("iPhone 13 Pro Max")
        .preferredColorScheme(.light)
    }
}
#endif
