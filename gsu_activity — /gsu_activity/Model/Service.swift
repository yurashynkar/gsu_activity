//
//  Service.swift
//  gsu_activity
//
//  Created by юра шинкар on 18.01.23.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseFirestore

class Service {
    static let shared = Service()
    
    init() {}
    
    
    
    func createnewUser(_ data: LoginField, completion: @escaping (ResponceCode)->()) {
        Auth.auth().createUser(withEmail: data.email, password: data.password) { result,
            err in
            if err == nil {
                if result != nil {
                    let userId = result?.user.uid
                    let email = data.email
                    let data: [String: Any] = ["email":email]
                    
                    Firestore.firestore().collection("users").document(userId!).setData(data)
                    completion(ResponceCode(code: 1))
                }
            } else {
                
                completion(ResponceCode(code: 0))
            }
        }
    }
    
    func confrimEmail() {
        Auth.auth().currentUser?.sendEmailVerification(completion: { err in
            if err != nil {
                print(err!.localizedDescription)
            }
        })
    }
    
    func authInApp(_ data: LoginField, completion: @escaping (AuthResponce) -> ()) {
        Auth.auth().signIn(withEmail: data.email, password: data.password) { result, err in
            if err != nil {
                completion(.error)
                print(err?.localizedDescription as Any)
            } else {
                if let result = result {
                    if result.user.isEmailVerified {
                        completion(.success)
                    } else {
                        completion(.noVerify)
                    }
                }
            }
        }
    }
    func getUsersStatus(){
        // is isset
        // auth?
        
    }
}
