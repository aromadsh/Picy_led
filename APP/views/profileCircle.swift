//
//  profileCircle.swift
//  picy
//
//  Created by DongHuKim on 2021/10/28.
//

import SwiftUI

struct profileCircle: View {
    var body: some View {
        Image("testprofile")
            .resizable()
            .frame(width: 100.0, height: 100.0)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.black, lineWidth: 1))
            .shadow(radius: 2)
    }
}

struct profileCircle_Previews: PreviewProvider {
    static var previews: some View {
        profileCircle()
            .previewDevice("iPhone 11 Pro Max")
    }
}
