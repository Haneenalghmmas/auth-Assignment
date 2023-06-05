//
//  AuthAppApp.swift
//  AuthApp
//
//  Created by Haneen on 16/11/1444 AH.
//

import SwiftUI
import FirebaseCore

@main
struct AuthAppApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
