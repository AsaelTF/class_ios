//
//  ContentView.swift
//  CodeBankMyApp
//
//  Created by UNIVERSIDAD POLITECNICA DE QUINTANA ROO 02 on 18/05/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var name : String = ""
    
    var body: some View {
        VStack{
            Text("Hola mirsinini")
                .padding(10)
                .font(.title).foregroundColor(.purple)
                .border(Color.purple)
            Spacer()
            TextField("Texto", text:$name).font(.caption).padding(10)
            Spacer()
            Button("Texto"){
                print("Hola mirsin")
            }.font(.title3)
                .padding(15)
                .background(Color.blue)
                .foregroundColor(Color.white)
                .cornerRadius(10)
            Spacer()
            Image(systemName: "person").resizable()
                .frame(width: 300,height: 300)
                .aspectRatio(contentMode: .fit)
                .font(.title).foregroundColor(Color.gray)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
//        ContentView()
        LoginUIView()
    }
}
