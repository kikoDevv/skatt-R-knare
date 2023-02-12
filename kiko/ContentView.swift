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
    @State var btText:String = "starta"
    @State var inkomst:String = ""
    @Binding var userNa:String
    @State var BtCounter:Int = 0
    @State var startBtPressed: Bool = false
    @State var mainView = true
    @State var bpOnSpara:Bool = false
    @State var inkomstView = false
    @State var inkomstbox:Bool = false
    @State var procentView:Bool = false
    @State var sliderValue:Float=0
    @State var procentBox:Bool=false
    
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
                    .animation(.easeInOut)
                    .keyboardType(.decimalPad)
            }
            //=========================Button============================================
            Button(btText){
                withAnimation(){
                    BtCounter += 1
                    startBtPressed = true
                }
                if BtCounter == 1{
                    btText = "Spara"
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.4){
                    mainView = false
                }
                // onSpara inkomst
                if BtCounter == 2 {
                    withAnimation(){
                        bpOnSpara = true
                        btText = "Nästa"
                    }
                    inkomstView = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.4){
                        inkomstbox = true
                    }
                }
                // onNästa för procent
                if BtCounter == 3{
                    btText = "spara"
                    procentView = true
                }
                // on spara Procent
                if BtCounter==4{
                    withAnimation(){
                        btText="räkna"
                        procentView=false
                        procentBox=true
                    }
                }
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(Color.white)
            .cornerRadius(50)
            .offset(x: startBtPressed ? 110:0)
            .offset(x: bpOnSpara ? -100 : 0, y: bpOnSpara ? 300 : 0)
            //======================sparade inkomst view========================
            if inkomstView{
                RoundedRectangle(cornerRadius: 15)
                    .frame(height: 280)
                    .offset(y:-300)
                    .foregroundColor(Color.blue)
                    .transition(.asymmetric(insertion: .move(edge: .top), removal: .scale))
                    .animation(.easeInOut)
                    .shadow(radius: 10)
            }
            if inkomstbox{
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 160, height:130)
                    .offset(x:-90,y:-260)
                    .foregroundColor(Color.white)
                    .transition(.asymmetric(insertion: .move(edge: .leading), removal: .scale))
                    .animation(.easeInOut)
                Text(" din inkomst ")
                    .bold()
                    .padding()
                    .font(.title2)
                    .background(Color.black.opacity(0.1))
                    .cornerRadius(19)
                    .offset(x:-90,y:-295)
                    .transition(.asymmetric(insertion: .move(edge: .leading), removal: .scale))
                    .animation(.easeInOut)
                Text("\(inkomst)kr")
                    .bold()
                    .font(.largeTitle)
                    .offset(x:-90,y:-230)
                    .transition(.asymmetric(insertion: .move(edge: .leading), removal: .scale))
                    .animation(.easeInOut)
            }
            if procentBox{
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 160, height:130)
                    .offset(x:90,y:-260)
                    .foregroundColor(Color.white)
                    .transition(.asymmetric(insertion: .move(edge: .leading), removal: .scale))
                    .animation(.easeInOut)
                Text(" din inkomst ")
                    .bold()
                    .padding()
                    .font(.title2)
                    .background(Color.black.opacity(0.1))
                    .cornerRadius(19)
                    .offset(x:90,y:-295)
                    .transition(.asymmetric(insertion: .move(edge: .leading), removal: .scale))
                    .animation(.easeInOut)
                Text("\(String(format: "%.0f",sliderValue))%")
                    .bold()
                    .font(.largeTitle)
                    .offset(x:90,y:-230)
                    .transition(.asymmetric(insertion: .move(edge: .leading), removal: .scale))
                    .animation(.easeInOut)
            }
            //=============================procent view box==============================
            if procentView {
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 270, height: 340)
                    .offset(y:80)
                    .foregroundColor(Color.blue)
                    .transition(.asymmetric(insertion: .move(edge: .bottom), removal: .scale))
                    .animation(.easeInOut)
                Text("välj antal skatt procent")
                    .bold()
                    .font(.title2)
                    .foregroundColor(Color.white)
                    .offset(y:-50)
                    .transition(.asymmetric(insertion: .move(edge: .bottom), removal: .scale))
                    .animation(.easeInOut)
                Text(String(format: "%.0f", sliderValue))
                    .bold()
                    .padding()
                    .font(.title2)
                    .foregroundColor(Color.white)
                    .background(Color.white.opacity(0.2))
                    .cornerRadius(50)
                    .scaleEffect(3)
                    .offset(y:80)
                    .transition(.asymmetric(insertion: .move(edge: .bottom), removal: .scale))
                    .animation(.easeInOut)
                Slider(value: $sliderValue, in: 0...100)
                    .frame(width:200)
                    .accentColor(Color.white)
                    .offset(y:210)
                    .transition(.asymmetric(insertion: .move(edge: .bottom), removal: .scale))
                    .animation(.easeInOut)
                
            }
        }
    }
}




























//=============================================
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        secondVeiw(userNa: .constant("s"))
    }
}
