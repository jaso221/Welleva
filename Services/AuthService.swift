//
//  AuthService.swift
//  Welleva
//
//  Created by Ojas Satarkar on 20/7/2026.
//

import FirebaseAuth
import Foundation
import Combine

class AuthService: ObservableObject {
    @Published var isSignedIn: Bool = false
    @Published var errorMessage: String?

    init() {
        isSignedIn = Auth.auth().currentUser != nil
    }

    func signUp(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            DispatchQueue.main.async {
                if let error = error {
                    self?.errorMessage = error.localizedDescription
                } else {
                    self?.isSignedIn = true
                }
            }
        }
    }

    func signIn(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] result, error in
            DispatchQueue.main.async {
                if let error = error {
                    self?.errorMessage = error.localizedDescription
                } else {
                    self?.isSignedIn = true
                }
            }
        }
    }

    func signOut() {
        try? Auth.auth().signOut()
        isSignedIn = false
    }
}
