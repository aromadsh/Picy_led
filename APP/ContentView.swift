//
//  ContentView.swift
//  picy
//
//  Created by DongHuKim on 2021/10/27.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            VStack {
                NavigationLink(destination:ProfileView()){
                Text("P  I  C  Y")
                .font(.system(size: 60))
                .fontWeight(.thin)
                .padding(.bottom,100)
            .multilineTextAlignment(.center)
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 12 Pro Max")
    }
}
