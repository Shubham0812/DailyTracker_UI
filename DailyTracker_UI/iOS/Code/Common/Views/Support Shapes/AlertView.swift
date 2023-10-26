//
//  AlertView.swift
//  DailyTracker_UI
//
//  Created by Mark Golubev on 25/10/2023.
//

import SwiftUI

struct DemoView: View {

    // MARK: - Value
    // MARK: Private
    @State private var isAlertPresented = false


    // MARK: - View
    // MARK: Public
    var body: some View {
        ZStack {
            Button {
                isAlertPresented = true

            } label: {
                Text("Alert test")
            }
        }
        .alert(title: "title", message: "message",
           primaryButton: AlertButton(title: "Yes", action: { }),
           secondaryButton: AlertButton(title: "No", action: {  }),
           isPresented: $isAlertPresented)
    }
}

struct AlertView: View {

    // MARK: - Value
    // MARK: Public
    let title: String
    let message: String
    let closeButton: CloseAlertButton?
    let dismissButton: AlertButton?
    let primaryButton: AlertButton?
    let secondaryButton: AlertButton?
    
    // MARK: Private
    @State private var opacity: CGFloat           = 0
    @State private var backgroundOpacity: CGFloat = 0
    @State private var scale: CGFloat             = 0.001

    @Environment(\.dismiss) private var dismiss


    // MARK: - View
    // MARK: Public
    var body: some View {

        ZStack {
            dimView
            alertView
                .scaleEffect(scale)
                .opacity(opacity)
        }
        .ignoresSafeArea()
        .transition(.opacity)
        .task {
            animate(isShown: true)
        }
    }

    // MARK: Private
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

    @ViewBuilder
    private var titleView: some View {
        if !title.isEmpty {
            Text(title)
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(.black)
                .lineSpacing(24 - UIFont.systemFont(ofSize: 18, weight: .bold).lineHeight)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }

    @ViewBuilder
    private var messageView: some View {
        if !message.isEmpty {
            Text(message)
                .font(.system(size: title.isEmpty ? 18 : 16))
                .foregroundColor(title.isEmpty ? .black : .gray)
                .lineSpacing(24 - UIFont.systemFont(ofSize: title.isEmpty ? 18 : 16).lineHeight)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }

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

    @ViewBuilder
    private var primaryButtonView: some View {
        if let button = primaryButton {
            AlertButton(title: button.title) {
                animate(isShown: false) {
                    dismiss()
                }
            
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                    button.action?()
                }
            }
        }
    }

    @ViewBuilder
    private var secondaryButtonView: some View {
        if let button = secondaryButton {
            AlertButton(title: button.title) {
                animate(isShown: false) {
                    dismiss()
                }
        
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                    button.action?()
                }
            }
        }
    }

    @ViewBuilder
    private var dismissButtonView: some View {
        if let button = dismissButton {
            AlertButton(title: button.title) {
                animate(isShown: false) {
                    dismiss()
                }
        
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                    button.action?()
                }
            }
        }
    }
    
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

    private var dimView: some View {
        Color.gray
            .opacity(0.88)
            .opacity(backgroundOpacity)
    }


    // MARK: - Function
    // MARK: Private
    private func animate(isShown: Bool, completion: (() -> Void)? = nil) {
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

struct AlertButton: View {

    // MARK: - Value
    // MARK: Public
    let title: LocalizedStringKey
    var action: (() -> Void)? = nil
    
    
    // MARK: - View
    // MARK: Public
    var body: some View {
        Button {
          action?()
        
        } label: {
            Text(title)
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(.white)
                .padding(.horizontal, 20)
        }
        .frame(height: 30)
        .background(Color.purple)
        .cornerRadius(10)
    }
}

struct CloseAlertButton: View {

    // MARK: - Value
    // MARK: Public
    let systemName: String
    var action: (() -> Void)? = nil
    
    
    // MARK: - View
    // MARK: Public
    var body: some View {
        Button {
          action?()
        
        } label: {
            Image(systemName: systemName)
//                .font(.system(.title, design: .rounded))
//                .symbolRenderingMode(.palette)
                .foregroundStyle(.gray, .gray.opacity(0.2))
        }
        .frame(height: 10)
    }
}

struct CustomAlertModifier {

    // MARK: - Value
    // MARK: Private
    @Binding private var isPresented: Bool

    // MARK: Private
    private let title: String
    private let message: String
    private let closeButton: CloseAlertButton?
    private let dismissButton: AlertButton?
    private let primaryButton: AlertButton?
    private let secondaryButton: AlertButton?
}


extension CustomAlertModifier: ViewModifier {

    func body(content: Content) -> some View {
        content
            .fullScreenCover(isPresented: $isPresented) {
                AlertView(title: title, message: message, closeButton: closeButton, dismissButton: dismissButton, primaryButton: primaryButton, secondaryButton: secondaryButton)
            }
    }
}

extension CustomAlertModifier {

    init(title: String = "", message: String = "", closeButton: CloseAlertButton, dismissButton: AlertButton, isPresented: Binding<Bool>) {
        self.title         = title
        self.message       = message
        self.closeButton   = closeButton
        self.dismissButton = dismissButton
    
        self.primaryButton   = nil
        self.secondaryButton = nil
    
        _isPresented = isPresented
    }

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
        let dismissButton   = AlertButton(title: "OK")
        let primaryButton   = AlertButton(title: "Got it")
        let secondaryButton = AlertButton(title: "Cancel")
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

//#Preview(body: {
//    DemoView()
//})
