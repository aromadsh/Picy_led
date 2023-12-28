//
//  GridView.swift
//  picy
//
//  Created by DongHuKim on 2021/10/28.
//

import SwiftUI

struct GridView: View {
    
    var myData = Array(1...25).map{"\($0)"}
    
    var flexibleColumn3 = Array(repeating: GridItem(.flexible(), spacing: 2), count: 3)
    
    var body: some View {
            
            VStack(){
                ScrollView {
                    LazyVGrid(columns: flexibleColumn3, spacing: 2){
                        ForEach(self.myData, id: \.self){ data in
                            Text(data)
                                .foregroundColor(Color.white)
                                .padding()
                                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 135)
                                .background(Color.white)
                        }
                    }
                }
            }
        }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView()
            .previewDevice("iPhone 11 Pro Max")
    }
}
