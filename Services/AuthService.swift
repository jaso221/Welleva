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
    @Published var currentUser: User? = nil

    private var authStateHandle: AuthStateDidChangeListenerHandle?

    init() {
        // Synchronous: know immediately on launch if a session exists.
        let existing = Auth.auth().currentUser
        isSignedIn = existing != nil
        currentUser = existing

        // Listener: keep state in sync for sign-in / sign-out events.
        authStateHandle = Auth.auth().addStateDidChangeListener { [weak self] _, user in
            DispatchQueue.main.async {
                self?.isSignedIn = user != nil
                self?.currentUser = user
            }
        }
    }

    deinit {
        if let handle = authStateHandle {
            Auth.auth().removeStateDidChangeListener(handle)
        }
    }

    func signUp(email: String, password: String) async -> String? {
        do {
            try await Auth.auth().createUser(withEmail: email, password: password)
            return nil
        } catch {
            return friendlyError(error)
        }
    }

    func signIn(email: String, password: String) async -> String? {
        do {
            try await Auth.auth().signIn(withEmail: email, password: password)
            return nil
        } catch {
            return friendlyError(error)
        }
    }

    func signOut() {
        try? Auth.auth().signOut()
    }

    private func friendlyError(_ error: Error) -> String {
        let nsError = error as NSError
        print("Auth error \(nsError.code): \(nsError.localizedDescription)")
        if nsError.code == AuthErrorCode.internalError.rawValue {
            return "Sign-in setup issue: make sure Email/Password is enabled in the Firebase Console."
        }
        return nsError.localizedDescription
    }
}
