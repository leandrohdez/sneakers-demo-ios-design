//
//  NikeApp.swift
//  Nike
//
//  Created by Leandro Hernandez on 28/2/22.
//

import SwiftUI

@main
struct NikeApp: App {
    
    // Adaptors
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    // Environments
    @Environment(\.scenePhase) var scenePhase
    
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
        .onChange(of: self.scenePhase) { phase in
            
            switch phase {
            
            case .background:
                // app in background
                break
                
            case .inactive:
                // app inactive
                break
                
            case .active:
                // app active
                break
                
            @unknown default:
                // should never happen
                break
            }
        }
    }
    
    //
    init() {
        self.setup()
    }
    
    private func setup() {
        
    }
}
