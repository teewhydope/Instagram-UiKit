//
//  RegistrationService.swift
//  instagram
//
//  Created by Animasahun Ibrahim on 27/06/2022.
//

import Foundation
import Firebase

struct RegistrationService {
    func registerUser(withCredential credentials: RegistrationRequestApiModel, completion: @escaping (Bool, Error?) -> Void) {
        
        guard let profileImage = UIImage(data: credentials.profileImage) else { return }
        
        ImageUploader.uploadImage(image: profileImage) { imageUrl, _ in
            Auth.auth().createUser(withEmail: credentials.email, password: credentials.password){
                (result, error) in
                
                if let error = error {
                    print("DEBUG: Failed to register user \(error.localizedDescription)")
                    completion(false, error)
                    return
                }
                else {
                    print("DEBUG: Success \(result?.credential ?? nil)")
                    completion(true, error)
                }
                
                guard let uid = result?.user.uid else { return }
                
                let data: [String: Any] = ["email": credentials.email,
                                           "fullname": credentials.fullname,
                                           "profileImageUrl": imageUrl,
                                           "uid": uid,
                                           "username": credentials.username]
                
                Firestore.firestore().collection("users").document(uid).setData(data){ err in
                    
                    if let err = err {
                        print("$-- error uploading transaction data \(err)")
                        completion(false, err)
                    } else {
                        print("$-- upload transaction data successfully")
                        completion(true, nil)
                    }
                }
            }
        }
    }
}
