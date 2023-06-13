//
//  LoginUIView.swift
//  CodeBankMyApp
//
//  Created by UNIVERSIDAD POLITECNICA DE QUINTANA ROO 02 on 18/05/23.
//

import SwiftUI
import LocalAuthentication

struct LoginUIView: View {
    @State var isLogin : Bool = false
    @State var username : String = ""
    @State var password: String = ""
    @State var keep : Bool = false
    var context = LAContext()
    
    func authenticate(){
        var error: NSError?
        if
            context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error){
            context.evaluatePolicy(
                .deviceOwnerAuthenticationWithBiometrics,
                localizedReason: "Acceder con FaceID"){
                    success, authenticationError in
                    if(success){
                        print("User Auth Success")
                        isLogin = true
                    } else if((authenticationError) != nil){
                        print("Auth failed")
                        print(authenticationError?.localizedDescription ?? "No error")
                    } else {
                        print("Biometric unavailable")
                        print(error?.localizedDescription ?? "Error principal")
                    }
            }
        }
    }
    
    var body: some View {
        NavigationView{
            VStack(spacing: 15){
                Text("Login")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.bottom, 30)
                TextField("Name", text: $username)
                TextField("password", text: $password)
//                NavigationLink(destination:MainView()){
//                    Text("Login")
//                }.simultaneousGesture(TapGesture().onEnded{
//                    if(keep){
//                        UserDefaults.standard.set(username, forKey: "username")
//                        UserDefaults.standard.set(password, forKey: "password")
//                        print("Saved")
//                    }else{
//                        UserDefaults.standard.set("", forKey: "username")
//                        UserDefaults.standard.set("", forKey: "password")
//                        print("Saved")
//                    }
//                })
                Button("Login"){
                    authenticate()
                }
                
                Toggle(isOn: $keep){
                    Text("Mantener sesión")
                }
            }
            .padding(.horizontal, 60)
        }
    }
}

struct MainView:View{
    @State var username = UserDefaults.standard.string(forKey: "username") ?? "NA"
    @State var password = UserDefaults.standard.string(forKey: "password") ?? "NA"
    var body: some View{
        VStack{
            Text("Data view")
            Text(username)
            Text(password)
        }.onAppear{
            username = UserDefaults.standard.string(forKey: "username") ?? "NA"
            password = UserDefaults.standard.string(forKey: "password") ?? "NA"
        }
    }
}

struct LoginUIView_Previews: PreviewProvider {
    static var previews: some View {
        LoginUIView()
    }
}
