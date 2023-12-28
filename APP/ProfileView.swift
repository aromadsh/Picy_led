//
//  ProfileView.swift
//  picy
//
//  Created by DongHuKim on 2021/10/27.
//

import SwiftUI




struct ProfileView: View {
    
    var myData = Array(1...1).map{"\($0)"}
    
    var flexibleColumn3 = Array(repeating: GridItem(.flexible(), spacing: 2), count: 3)
    var body: some View {
        NavigationView{
            VStack {
                bgImage()
                    .ignoresSafeArea(edges: .top)
                    .frame(height: 30)
                    .aspectRatio(contentMode: .fit)
                
                profileCircle()
                    .offset(y: -80)
                    .padding(.bottom, -130)
                
                VStack {
                    Text("@donghukim")
                        .font(.system(size: 22))
                        .padding(20.0)
                    Text("Hi my name is dhkim ...")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(.bottom, 10)
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                        Text("Subscribe")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .padding(4.2)
                            .overlay(
                                RoundedRectangle(cornerRadius:16)
                                    .stroke(Color.black, lineWidth: 1.5)
                            )
                    }
                    
                }
                Spacer()
                Divider().padding(.top, 5)
                VStack {
                                ScrollView {
                                    LazyVGrid(columns: flexibleColumn3, spacing: 2){
                                        ForEach(self.myData, id: \.self){ data in
                                            Image("default")
                                                .resizable()
                                                .frame(width: 141.0, height: 135.0)
                                                .clipShape(Rectangle())
                    
                                        }
                                    }
                                }
                }
                VStack{
                    NavigationLink(destination:UploadView()){
                    Image(systemName: "plus")
                        .padding(.vertical, 2.0)
                        .imageScale(.large)
                        .font(Font.system(size: 25,weight:.bold))
                        .foregroundColor(Color.black)
                        .overlay(
                            RoundedRectangle(cornerRadius:5)
                                .stroke(Color.black, lineWidth: 1.5)
                            
                        )
                        }
                }
        }
        }
        .navigationBarTitle("")
        .navigationBarBackButtonHidden(true)
    }
    }


struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .previewDevice("iPhone 12 Pro Max")
    }
}
