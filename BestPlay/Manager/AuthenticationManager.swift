//
//  AuthenticationManager.swift
//  BestPlay
//
//  Created by 홍재민 on 8/29/24.
//

import Foundation

final class AuthenticationManager {
    static let shared: AuthenticationManager = AuthenticationManager()
    private var isLoggedin: Bool
    
    public var loggedin: Bool { isLoggedin }
    
    private init() {
        isLoggedin = false
    }
    
    public func setLoggedinTrue() {
        isLoggedin = true
    }
}
