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
                        .offset(y:-40)
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
