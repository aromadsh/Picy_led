//
//  ModifyView2.swift
//  picy
//
//  Created by DongHuKim on 2021/11/02.
//

import SwiftUI
import Combine


struct ModifyView2: View {
    @State private var hasTimeElapsed = false
    @State private var userText: String = "태백산 정상 가슴이 뻥뚤린다"
    @State private var userTag: String = "#속리산 #문장대 #보은 #상주"
    @ObservedObject private var kGuardian = KeyboardGuardian(textFieldCount: 1)
    @State private var name = Array<String>.init(repeating: "", count: 3)
    @State var isNavigationBarHidden: Bool = true
    var body: some View {
        NavigationView{
            VStack {
                HStack{
                Image("main2").resizable()
                    .frame(width: UIScreen.main.bounds.width, height: 350, alignment: .topLeading)
                    .aspectRatio(contentMode: .fit)
                    
                }.padding(.top,-100)
                HStack {
                    HStack{Text("Cancel").foregroundColor(.blue)}
                    Spacer()
                    HStack{
                    NavigationLink(destination:ModifyView3())
                    {
                        Text("Next")
                        .foregroundColor(.blue)
                    }
                }
                    
                }.padding(.horizontal,20)
                Spacer()
                Divider()
                VStack{
                    VStack{
                        HStack {
                            HStack{Text("").foregroundColor(.blue)}
                            Spacer()
                            HStack{
                            NavigationLink(destination:ModifyView3())
                            {
                                Text("Add Text")
                                    .padding(.top,10)
                                .foregroundColor(.blue)
                            }
                        }
                        }.padding(.horizontal,20)
                        Text(hasTimeElapsed ? "태백산 정상 가슴이 뻥뚤린다":"" )
                            .onAppear(perform: delayText)
                            .frame(maxHeight: .infinity)
                            .foregroundColor(.white)
                            .font(.system(size: 20))
                        
                        
                        
                    }
                    Divider()
                    VStack{
                        HStack {
                            HStack{Text("").foregroundColor(.blue)}
                            Spacer()
                            HStack{
                            NavigationLink(destination:ModifyView3())
                            {
                                Text("Add Tag")
                                    .padding(.top,10)
                                .foregroundColor(.blue)
                            }
                        }
                            
                        }.padding(.horizontal,20)
                        Text(hasTimeElapsed ? "\(userTag)":"" )
                            .onAppear(perform: delayText)
                            .frame(maxHeight: .infinity)
                            .foregroundColor(.white)
                            .font(.system(size: 20))
                        VStack {
                                    TextField("", text: $userTag)
                                .foregroundColor(.white)
                                        .textFieldStyle(RoundedBorderTextFieldStyle())
                                        .background(GeometryGetter(rect: $kGuardian.rects[0]))

                                }.offset(y: kGuardian.slide).animation(.easeInOut(duration: 0))
                        
                    }
                    
                }.background(Color.black)
            }
        }.ignoresSafeArea(edges: .top)
            .navigationBarTitle("")
                        .navigationBarHidden(self.isNavigationBarHidden)
                        .onAppear {
                            self.isNavigationBarHidden = true
                        }
    }
    private func delayText() {
           // Delay of 7.5 seconds
           DispatchQueue.main.asyncAfter(deadline: .now() + 0) {
               hasTimeElapsed = true
           }
       }
}

struct ModifyView2_Previews: PreviewProvider {
    static var previews: some View {
        ModifyView()
            .previewDevice("iPhone 12 Pro Max")
    }
}
