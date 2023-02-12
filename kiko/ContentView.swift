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
    @Binding var userNa:String
    @State var BtCounter:Int = 0
    @State var startBtPressed: Bool = false
    @State var mainView = true
    
    var body: some View{
        ZStack {
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
                            .bold()
                            .font(.title2)
                        Text(userNa)
                            .bold()
                            .font(.largeTitle)
                    }
                }
                .ignoresSafeArea()
            }
            Button("Starta"){
                BtCounter += 1
                if BtCounter == 1{
                    withAnimation(){
                        startBtPressed = true
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                        mainView=false
                    }
                }
            }
            if startBtPressed{
                ZStack{
                    
                }
            }
        }
    }
}






























//=============================================
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
