//
//  TzJuniorApp.swift
//  TzJunior
//
//  Created by kripsenqq on 18.06.2024.
//

import SwiftUI
import FirebaseCore
import FirebaseRemoteConfig

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}

@main
struct TzJuniorApp: App {
    @State private var needForceUpdate = false
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            ContentView(needForceUpdate: $needForceUpdate)
        }
    }
}

struct ContentView: View {
    @Binding var needForceUpdate: Bool
    @State private var charactersView = false

    var body: some View {
        Group {
            if needForceUpdate {
                UpdateView()
            } else if charactersView {
                MainMenu()
                    .fullScreenCover(isPresented: $charactersView, content: {
                        MainMenu()
                    })
            } else {
                MainMenu()
            }
        }
        .onAppear {
            RemoteConfigManager.shared.fetchConfig { success in
                if success {
                    needForceUpdate = RemoteConfigManager.shared.getForceUpdate()
                } else {
                    print("Failed to fetch remote config")
                }
            }
        }
    }
}
