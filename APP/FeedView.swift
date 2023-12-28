//
//  FeedView.swift
//  picy
//
//  Created by DongHuKim on 2021/11/02.
//

import SwiftUI

struct FeedView: View {
    @State var isNavigationBarHidden: Bool = true
    
    var body: some View {
        
        NavigationView{
            VStack {
                ScrollView{
                    VStack{
                        Group{
                        ZStack{
                        HStack{}
                            Rectangle()
                                .fill(Color.white)
                                .frame(width: 380, height: 500)
                        VStack{
                            Image("main4")
                                .resizable()
                                .frame(width:350.0, height: 350.0)
                            Text("경복궁 야간개장 아름다운 불빛이 너무 아름다워요")
                                .font(.system(size: 22))
                                .multilineTextAlignment(.center)
                            Text("#경복궁 #경회루 #야경")
                                .foregroundColor(Color.gray)
                        }
                        Divider()
                        }
                    }
                    Text("")
                        .padding(.bottom,40)
                    }
                    
                    VStack{
                        Group{
                        ZStack{
                        HStack{}
                            Rectangle()
                                .fill(Color.white)
                                .frame(width: 380, height: 500)
                        VStack{
                            Image("main1")
                                .resizable()
                                .frame(width:350.0, height: 350.0)
                            Text("오늘의 제주바다 이런날이 너무많았다 그래도 여전히예쁘네는 언제나설렌다")
                                .font(.system(size: 22))
                                .multilineTextAlignment(.center)
                            Text("#일상 #바다 #데일리 #셀카")
                                .foregroundColor(Color.gray)
                        }
                        Divider()
                        }
                    }
                    Text("")
                        .padding(.bottom,40)
                    }
                    
                    VStack{
                        Group{
                        ZStack{
                        HStack{}
                            Rectangle()
                                .fill(Color.white)
                                .frame(width: 380, height: 500)
                        VStack{
                            Image("main2")
                                .resizable()
                                .frame(width:350.0, height: 350.0)
                            Text("태백산 정상 가슴이 뻥뚤린다")
                                .font(.system(size: 22))
                                .multilineTextAlignment(.center)
                            Text("#속리산 #문장대 #보은 #상주")
                                .foregroundColor(Color.gray)
                        }
                        Divider()
                        }
                    }
                    Text("")
                        .padding(.bottom,40)
                    }
                    
                    VStack{
                        Group{
                        ZStack{
                        HStack{}
                            Rectangle()
                                .fill(Color.white)
                                .frame(width: 380, height: 500)
                        VStack{
                            Image("main3")
                                .resizable()
                                .frame(width:350.0, height: 350.0)
                            Text("롯데타워가 하늘은 해줘야지때")
                                .font(.system(size: 22))
                                .multilineTextAlignment(.center)
                            Text("#롯데타워")
                                .foregroundColor(Color.gray)
                        }
                        Divider()
                        }
                    }
                    Text("")
                        .padding(.bottom,40)
                    }
                    
                    VStack{
                        Group{
                        ZStack{
                        HStack{}
                            Rectangle()
                                .fill(Color.white)
                                .frame(width: 380, height: 500)
                        VStack{
                            Image("main5")
                                .resizable()
                                .frame(width:350.0, height: 350.0)
                            Text("오늘도 정성스럽게 준비했어요")
                                .font(.system(size: 22))
                                .multilineTextAlignment(.center)
                            Text("#간식 #식당")
                                .foregroundColor(Color.gray)
                        }
                        Divider()
                        }
                    }
                    Text("")
                        .padding(.bottom,40)
                    }
                    
                    VStack{
                        Group{
                        ZStack{
                        HStack{}
                            Rectangle()
                                .fill(Color.white)
                                .frame(width: 380, height: 500)
                        VStack{
                            Image("default")
                                .resizable()
                                .frame(width:350.0, height: 350.0)
                            Text("눈호강해서왔다")
                                .font(.system(size: 22))
                                .multilineTextAlignment(.center)
                            Text("#간식 #카페")
                                .foregroundColor(Color.gray)
                        }
                        Divider()
                        }
                    }
                    Text("")
                        .padding(.bottom,40)
                    }
                    
                }
                VStack{
                    NavigationLink(destination:ProfileView2()){
                        Text("back to profile")
//                    Image(systemName: "home")
//                        .padding(.vertical, 2.0)
//                        .imageScale(.large)
//                        .font(Font.system(size: 25,weight:.bold))
//                        .foregroundColor(Color.black)
//                        .overlay(
//                            RoundedRectangle(cornerRadius:5)
//                                .stroke(Color.black, lineWidth: 1.5)
//
//                        )
                        }
                }.frame(maxWidth: .infinity).background(Color.white)
                
            }.background(Color.black).ignoresSafeArea(edges: .top)
        }.navigationBarTitle("")
            .navigationBarHidden(self.isNavigationBarHidden)
            .onAppear {
                self.isNavigationBarHidden = true
            }
    }
}

//struct FeedView_Previews: PreviewProvider {
//    static var previews: some View {
//        FeedView()
//            .previewDevice("iPhone 11 Pro Max")
//    }
//}
