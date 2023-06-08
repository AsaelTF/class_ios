//
//  Movement.swift
//  CodeBankMyApp
//
//  Created by UNIVERSIDAD POLITECNICA DE QUINTANA ROO 02 on 01/06/23.
//

import Foundation

struct Movement: Codable, Identifiable{
        var id : Int
        var ori_account : String
        var amount : String
        var des_account : String
        var description : String
}

struct LoginRequest: Codable {
    var username : String
    var password : String
}

struct LoginResponse : Codable{
    var status : String
    var message : String
    var token : String
}
