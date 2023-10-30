//
//  Emotions.swift
//  DailyTracker_UI
//
//  Created by Andrew Muniz on 10/30/23.
//

import Foundation
import UIKit

enum Emotion: String, CaseIterable {
    case excited
    case relaxed
    case proud
    case hopeful
    case happy
    case enthusiastic
    case refreshed
    case gloomy
    case lonely
    case anxious
    case sad
    case angry
    case burdensome
    case annoyed
    case tired

    var emotionImage: UIImage {
        switch self {
        case .excited:
            return UIImage(systemName: "star.fill")!
        case .relaxed:
            return UIImage(systemName: "moon.stars.fill")!
        case .proud:
            return UIImage(systemName: "checkmark.seal")!
        case .hopeful:
            return UIImage(systemName: "arrow.up")!
        case .happy:
            return UIImage(systemName: "sun.min.fill")!
        case .enthusiastic:
            return UIImage(systemName: "sparkles")!
        case .refreshed:
            return UIImage(systemName: "leaf")!
        case .gloomy:
            return UIImage(systemName: "cloud.rain.fill")!
        case .lonely:
            return UIImage(systemName: "figure.wave")!
        case .anxious:
            return UIImage(systemName: "heart.fill")!
        case .sad:
            return UIImage(systemName: "eye.fill")!
        case .angry:
            return UIImage(systemName: "face.angry")!
        case .burdensome:
            return UIImage(systemName: "person.2.fill")!
        case .annoyed:
            return UIImage(systemName: "face.smiling.police")!
        case .tired:
            return UIImage(systemName: "zzz")!
        }
    }
}
