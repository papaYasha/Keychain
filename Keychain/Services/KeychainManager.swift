//
//  KeychainManager.swift
//  Keychain
//
//  Created by Macbook on 5.12.21.
//

import Foundation
import KeychainAccess

protocol KeychainManager {
    func validatePassword(_ password: String, _ login: String) -> Bool
    func setPassword(_ password: String, _ login: String)
    func getPassword(_ login: String) -> String?
}
class KeychainManagerImp: KeychainManager {
    static let shared = KeychainManagerImp()
    private lazy var keychain = Keychain(service: "com.NYIT.Keychain")
    private init() { }
    
    func validatePassword(_ password: String, _ login: String) -> Bool {
        do {
            let storedPassword = try keychain.get(login)
            return password == storedPassword
        } catch {
            print(error.localizedDescription)
            return false
        }
    }
    
    func setPassword(_ password: String, _ login: String) {
        do {
            try keychain.set(password, key: login)
            print("Password (\(password)) saved")
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func getPassword(_ login: String) -> String? {
        do {
            return try keychain.get(login)
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}
