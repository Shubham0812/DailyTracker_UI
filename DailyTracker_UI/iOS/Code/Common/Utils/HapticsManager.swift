//
//  HapticsManager.swift
//  DailyTracker_UI
//
//  Created by Mark Golubev on 23/10/2023.
//

import Foundation
import UIKit

/// `HapticsManager` provides methods for generating haptic feedback in the application.
final class HapticsManager {
    
    static let shared = HapticsManager()
    private init() { }
    
    /// Triggers impact haptic feedback with the specified style.
    ///
    /// - Parameter style: The style of impact feedback to be generated.
    func impactFeedback(_ style: UIImpactFeedbackGenerator.FeedbackStyle = .light) {
        let impact = UIImpactFeedbackGenerator(style: style)
        impact.impactOccurred()
    }
    
    /// Triggers notification haptic feedback with the specified type.
    ///
    /// - Parameter type: The type of notification feedback to be generated.
    func notificationFeedback(_ type: UINotificationFeedbackGenerator.FeedbackType) {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
    }
}

