//
//  ContentView.swift
//  kiko
//
//  Created by Kiko on 2023-02-12.
//

import SwiftUI

struct ContentView: View {
    @State var userN:String = ""
    
    var body: some View {
        NavigationView{
            ZStack{
                Circle()
                    .scale(3)
                    .foregroundColor(Color.blue)
                Circle()
                    .scale(1.7)
                    .foregroundColor(Color.white.opacity(0.5))
                    .offset(y:-34)
                Circle()
                    .scale(1.3)
                    .offset(y:-34)
                    .foregroundColor(Color.white)
                 RoundedRectangle(cornerRadius: 20)
                        .frame(width: 330, height:250)
                        .offset(y:-34)
                        .foregroundColor(Color.white)
                        .shadow(radius: 5)
                VStack {
                    TextField("skriv ditt namn", text: $userN)
                        .padding(8)
                        .background(Color.black.opacity(0.2))
                        .cornerRadius(10)
                        .padding(45)
                        .offset(y:-50)
                    NavigationLink("secondView", destination: secondVeiw(userNa: $userN))
                        .padding()
                        .foregroundColor(Color.white)
                        .background(Color.blue)
                        .cornerRadius(40)
                        .offset(y:-80)
                }
            }
            .ignoresSafeArea(.keyboard)
        }
    }
}
//===============================Second view=======================================
struct secondVeiw: View{
    @State var inkomst:String = ""
    @Binding var userNa:String
    @State var BtCounter:Int = 0
    @State var startBtPressed: Bool = false
    @State var mainView = false
    
    var body: some View{
        ZStack{
            if mainView {
                ZStack{
                    Circle()
                        .scale(3)
                        .foregroundColor(Color.blue)
                        .ignoresSafeArea()
                    Circle()
                        .scale(1.7)
                        .foregroundColor(Color.white.opacity(0.3))
                    Circle()
                        .scale(1.3)
                        .foregroundColor(Color.white.opacity(0.5))
                    Circle()
                        .scale(startBtPressed ? 3 : 0.9)
                        .foregroundColor(Color.white)
                    VStack{
                        Text("välkommen")
                            .scaleEffect(startBtPressed ? 0 : 2)
                            .offset(y:-70)
                        Text("\(userNa)")
                            .bold()
                            .scaleEffect(startBtPressed ? 0 : 1)
                            .font(.largeTitle)
                            .offset(y:-60)
                    }
                }
                .ignoresSafeArea(.keyboard)
            }
        //==========inomst textField=
            if BtCounter == 1{
                TextField("skriv din inkomst", text: $inkomst)
                    .padding()
                    .background(Color.black.opacity(0.3))
                    .frame(width: 310)
                    .cornerRadius(20)
                    .transition(.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .leading)))
            }
            //=========================
            Button("starta"){
                BtCounter += 1
                withAnimation(){
                    startBtPressed = true
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.4){
                    mainView = false
                }
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(Color.white)
            .cornerRadius(50)
            .offset(x: startBtPressed ? 110:0)
        }
    }
}




























//=============================================
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        secondVeiw(userNa: .constant("s"))
    }
}
