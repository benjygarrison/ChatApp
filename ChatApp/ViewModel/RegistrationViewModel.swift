//
//  RegistrationViewModel.swift
//  ChatApp
//
//  Created by Ben Garrison on 1/22/22.
//

import Foundation


struct RegistrationViewModel {
    
    var userName: String?
    var name: String?
    var email: String?
    var password: String?
    
    var validForm: Bool {
        return userName?.isEmpty == false
        && name?.isEmpty == false
        && email?.isEmpty == false
        && password?.isEmpty == false
    }
    
}
