//
//  FirestoreService.swift
//  Welleva
//
//  Created by Ojas Satarkar on 20/7/2026.
//

import FirebaseFirestore
import FirebaseAuth

class FirestoreService {
    private let db = Firestore.firestore()

    func saveScanResult(_ result: ScanResult) {
        guard let userId = Auth.auth().currentUser?.uid else { return }
        do {
            try db.collection("users").document(userId)
                .collection("scans").document(result.id)
                .setData(from: result)
        } catch {
            print("Error saving scan: \(error)")
        }
    }

    func fetchScanHistory(completion: @escaping ([ScanResult]) -> Void) {
        guard let userId = Auth.auth().currentUser?.uid else { return }
        db.collection("users").document(userId)
            .collection("scans")
            .order(by: "timestamp", descending: true)
            .getDocuments { snapshot, error in
                let results = snapshot?.documents.compactMap {
                    try? $0.data(as: ScanResult.self)
                } ?? []
                completion(results)
            }
    }
}
