//
//  bgImage.swift
//  picy
//
//  Created by DongHuKim on 2021/10/28.
//

import SwiftUI

struct bgImage: View {
    var body: some View {
        Image("samplebg")
            .resizable()
            
            
    }
}

struct bgImage_Previews: PreviewProvider {
    static var previews: some View {
        bgImage()
            .previewDevice("iPhone 11 Pro Max")
    }
}
