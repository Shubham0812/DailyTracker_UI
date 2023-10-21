//
//  FontManager.swift
//  DailyTracker_UI
//
//  Created by Shubham Singh on 21/10/23.
//

import SwiftUI

enum TypefaceOne {
    case regular
    
    
    func font(size: CGFloat) -> Font {
        switch self {
        case .regular:
            return .custom("BungeeLayers-Regular", size: size)
        }
    }
}

enum TypefaceTwo {
    case regular
    case medium
    case semibold
    case bold
    
    func font(size: CGFloat) -> Font {
        switch self {
        case .regular:
            return .custom("Degular-Regular", size: size)
        case .medium:
            return .custom("Degular-Medium", size: size)
        case .semibold:
            return .custom("Degular-SemiBold", size: size)
        case .bold:
            return .custom("Degular-Bold", size: size)
            
        }
    }
}
