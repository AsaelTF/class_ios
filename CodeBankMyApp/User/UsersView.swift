//
//  UsersView.swift
//  CodeBankMyApp
//
//  Created by UNIVERSIDAD POLITECNICA DE QUINTANA ROO 02 on 29/05/23.
//

import SwiftUI

struct UsersView: View {
    @StateObject var uvm: UserViewModel = UserViewModel()
    @State var update: Bool = false
    @State var toUpdate: UserEntity?
    var body: some View {
        VStack{
            Text("Users")
                .font(.title)
            HStack{
                TextField("Username",text: $uvm.c_username)
                    .padding(.horizontal,8)
                    .padding(.vertical,2)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.accentColor, lineWidth: 1)
                        )
                TextField("Password",text: $uvm.c_password)
                    .padding(.horizontal,8)
                    .padding(.vertical,2)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.accentColor, lineWidth: 1)
                        )
                if(update){
                    Button("Edit"){
                        uvm.updateUser(user: toUpdate!)
                        uvm.clearState()
                        update = false
                    }
                }else{
                    Button("Save"){
                        uvm.createUser()
                        uvm.clearState()
                    }
                }
            }
            .padding(20)
            if(uvm.users.count == 0){
                Text("No hay items")
            }
            else{
                List (uvm.users) { user in
                    VStack(alignment: .leading){
                        HStack{
                            Text(user.username ?? "")
                            Text(user.password ?? "")
                            
                        }
                        HStack{
                            VStack{
                                Button("Delete"){
                                    uvm.deteleUser(user: user)
                                }
                                .buttonStyle(.bordered)
                            }
                            VStack{
                                Button("Edit"){
                                    update = true
                                    toUpdate = user
                                    uvm.c_username = user.username ?? ""
                                    uvm.c_password = user.password ?? ""
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

//struct UserListView:View{
//    @StateObject var items: [UserEntity] = []
//    var body: some View{
//        List(items){ item in
//            VStack{
//                HStack{
//                    Text(item.)
//                    Text("1")
//                }
//                HStack{
//
//                }
//            }
//        }
//    }
//}

struct UsersView_Previews: PreviewProvider {
    static var previews: some View {
        UsersView()
    }
}
