//
//  Haptics.swift
//  AuthApp
//
//  Created by Haneen on 16/11/1444 AH.
//

import SwiftUI
class HapticManager {
    static let instance = HapticManager()
    func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
    let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
    }
    func impact(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
        
    }
}
struct Haptics: View {
    var body: some View {
        VStack(spacing: 20) {
            Button("success") { HapticManager.instance.notification(type: .success)}
            Button("warning") { HapticManager.instance.notification(type: .warning)}
            Button("error") { HapticManager.instance.notification(type: .error)}
                
            
        }
    }
}

struct Haptics_Previews: PreviewProvider {
    static var previews: some View {
        Haptics()
    }
}
