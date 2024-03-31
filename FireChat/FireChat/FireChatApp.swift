//
//  FireChatApp.swift
//  FireChat
//
//  Created by Jose Folgar on 3/31/24.
//

import SwiftUI
import FirebaseCore

@main
struct FireChatApp: App {
    
    @State private var authManager: AuthManager
    
    init () {
        FirebaseApp.configure()
        authManager = AuthManager()
    }
    
    var body: some Scene {
        WindowGroup {
            if authManager.user != nil { // <-- Check if you have a non-nil user (means there is a logged in user)
                /// We have a logged in user, go to ChatView
                ChatView() // <-- Add ChatView
                    .environment(authManager) // <-- Pass authManager to the environment
            } else {

                // No logged in user, go to LoginView
                LoginView()
                    .environment(authManager)
            }
        }
    }
}
