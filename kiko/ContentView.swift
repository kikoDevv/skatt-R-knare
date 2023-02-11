//
//  ContentView.swift
//  kiko
//
//  Created by Kiko on 2023-02-12.
//

import SwiftUI

struct ContentView: View {
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
