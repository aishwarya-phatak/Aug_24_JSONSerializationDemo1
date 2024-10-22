//
//  User.swift
//  Aug_24_JSONSerializationDemo1
//
//  Created by Vishal Jagtap on 22/10/24.
//

import Foundation

struct APIResponse{
    var users : [User]
}

struct User{
    var id : Int
    var name : String
    var company : String
    var username : String
    var email : String
    var address : String
    var zip : String
    var state : String
    var country : String
    var phone : String
    var photo : String
}
