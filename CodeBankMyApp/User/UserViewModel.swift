//
//  UserViewModel.swift
//  CodeBankMyApp
//
//  Created by UNIVERSIDAD POLITECNICA DE QUINTANA ROO 02 on 29/05/23.
//

import Foundation

class UserViewModel: ObservableObject {
    @Published var users: [UserEntity] = []
    
    let dataService = UserController.shared
    
//    Variables para update
    @Published var c_username :String = ""
    @Published var c_password :String = ""
    
    init(){
        
    }
    
    func getAllUsers(){
        users = dataService.read()
    }
    
    func createUser(){
        dataService.create(username: c_username, password: c_password)
        getAllUsers()
    }
    
    func updateUser(user: UserEntity){
        dataService.update(entity: user,username: c_username, password: c_password)
        getAllUsers()
    }
    
    func deteleUser(user:UserEntity){
        dataService.delete(entity: user)
        getAllUsers()
    }
    
    func clearState(){
        c_password = ""
        c_username = ""
    }
}
