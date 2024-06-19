//
//  RemoteConfigManager.swift
//  TzJunior
//
//  Created by kripsenqq on 19.06.2024.
//

import Foundation
import FirebaseRemoteConfig

class RemoteConfigManager {
    static let shared = RemoteConfigManager()
    private let remoteConfig = RemoteConfig.remoteConfig()

    private init() {
        let settings = RemoteConfigSettings()
        settings.minimumFetchInterval = 0 // Установите на 0 для тестирования
        remoteConfig.configSettings = settings
        remoteConfig.setDefaults(["needForceUpdate": false as NSObject]) // Значение по умолчанию
    }

    func fetchConfig(completion: @escaping (Bool) -> Void) {
        remoteConfig.fetch { [weak self] status, error in
            guard error == nil else {
                print("Error fetching remote config: \(error?.localizedDescription ?? "No error description")")
                completion(false)
                return
            }

            self?.remoteConfig.activate { _, _ in
                completion(true)
            }
        }
    }

    func getForceUpdate() -> Bool {
        return remoteConfig["needForceUpdate"].boolValue
    }
}
