//
//  SwiftUIView.swift
//  CodeBankMyApp
//
//  Created by UNIVERSIDAD POLITECNICA DE QUINTANA ROO 02 on 22/05/23.
//

import SwiftUI

struct movement : Identifiable{
    let id = UUID()
    var monto: Int
    var fecha : String
    var concepto : String
    var icon : Image
    var status : Int // 0 pend, 1 comp
    
    var referencia : String
    var cuenta_destino : String
    var destinatario : String
    var id_transaccion :  String
    
}

struct DetailMovementView: View{
    let item: movement
    var body: some View{
        VStack{
            Text(item.concepto)
            Text("Dato2")
            Text("Dato3")
            Text("Dato4")
            Text("Dato5")
        }
    }
}

struct Login_dos: View {
    var body: some View {
        VStack{
            Text("Hola view 3")
            Button("Test de la peticion del API"){
                Task {
                    let rs = try await
                    CentralBankAPI().login(request: LoginRequest(username: "TEST 1", password: "TEST 1"))
                    print(rs)
                }
            }
        }
    }
}

struct MovementsView : View{
    @State var selectedItem : movement?
    @State var dataApi : [Movement] = []
    var body: some View{
    @State var data = [
        movement(monto: 100, fecha: "12/12/2023", concepto: "Pago", icon: Image(systemName: "checkmark.circle.fill"),status: 0, referencia: "Mirsini", cuenta_destino: "00REGION103", destinatario: "Mirse Maribel", id_transaccion: "NUM1"),
        movement(monto: 100, fecha: "12/12/2023", concepto: "Pago", icon: Image(systemName: "checkmark.circle.fill"),status: 0, referencia: "Mirsini", cuenta_destino: "00REGION103", destinatario: "Mirse Maribel", id_transaccion: "NUM1"),
        movement(monto: 100, fecha: "12/12/2023", concepto: "Pago", icon: Image(systemName: "checkmark.circle.fill"),status: 0, referencia: "Mirsini", cuenta_destino: "00REGION103", destinatario: "Mirse Maribel", id_transaccion: "NUM1"),
        movement(monto: 100, fecha: "12/12/2023", concepto: "Pago", icon: Image(systemName: "checkmark.circle.fill"),status: 0, referencia: "Mirsini", cuenta_destino: "00REGION103", destinatario: "Mirse Maribel", id_transaccion: "NUM1"),
        movement(monto: 100, fecha: "12/12/2023", concepto: "Pago", icon: Image(systemName: "checkmark.circle.fill"),status: 0, referencia: "Mirsini", cuenta_destino: "00REGION103", destinatario: "Mirse Maribel", id_transaccion: "NUM1"),
    ]

        NavigationView{
            
                    List(dataApi){mov in
                            VStack(alignment: .leading){
                                Text("ID: \(mov.id)")
                                Text("Cuenta Origen: \(mov.ori_account)")
                                Text("Monto: \(mov.amount)")
                                Text("Monto: \(mov.des_account)")
                                Text("Monto: \(mov.description)")
                            }
                    }.onAppear{
                        CentralBankAPI().fetchMovements{
                            (Movements) in
                            dataApi = Movements
                        }
                    }
                    

        }
        
//        NavigationView{
//            VStack{
//                HStack{
//                    HStack{
//                        Image(systemName: "chevron.backward")
//                        Text("Atrás")
//                    }
//                    Spacer()
//                    Text("Mi CodeBank").font(.headline)
//                    Spacer()
//                    Image(systemName: "gear")
//                }.padding(.horizontal,10)
//                List(data){i in
//                    /*NavigationLink(destination: DetailMovementView(item:i)){*/
//                    VStack{
//                        HStack{
//                            i.icon
//                            Spacer()
//                            Text(i.fecha)
//                                .multilineTextAlignment(.center)
//                            Spacer()
//                            Text(i.concepto)
//                                .foregroundColor(Color.white)
//                        }
//                        HStack{
//                            Text(String(i.monto))
//                            Spacer()
//                            Button(action: {self.selectedItem = i}){Text("Mostrar")}
//                            Text(String(i.status))
//                        }
//                    }.foregroundColor(Color.white)
//
//                        .padding(.horizontal, 5)
//                        .padding(.vertical,2)
//                        .background(i.status == 0 ?
//                                    Color.green : Color.red)
//                }.sheet(item: $selectedItem){item in DetailMovementView(item: item)
//                }
//            }
//            VStack{
//                Text("Debito")
//            }
//
//        }
//        }
}
}

struct SwiftUIView: View {
    var body: some View {
        List(){
            
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        //SwiftUIView()
//        MovementsView()
        Login_dos()
    }
}
