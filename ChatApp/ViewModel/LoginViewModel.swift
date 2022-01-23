//
//  LoginViewModel.swift
//  ChatApp
//
//  Created by Ben Garrison on 1/22/22.
//

import Foundation


struct LoginViewModel {
    var email: String?
    var password: String?
    
    var validForm: Bool {
        return email?.isEmpty == false && password?.isEmpty == false
    }
    
}
