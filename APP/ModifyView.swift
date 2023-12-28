//
//  ModifyView.swift
//  picy
//
//  Created by DongHuKim on 2021/11/02.
//

import SwiftUI
import Combine

final class KeyboardGuardian: ObservableObject {
    public var rects: Array<CGRect>
    public var keyboardRect: CGRect = CGRect()

    // keyboardWillShow notification may be posted repeatedly,
    // this flag makes sure we only act once per keyboard appearance
    public var keyboardIsHidden = true

    @Published var slide: CGFloat = 0

    var showField: Int = 0 {
        didSet {
            updateSlide()
        }
    }

    init(textFieldCount: Int) {
        self.rects = Array<CGRect>(repeating: CGRect(), count: textFieldCount)

    }

    func addObserver() {
NotificationCenter.default.addObserver(self, selector: #selector(keyBoardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardDidHide(notification:)), name: UIResponder.keyboardDidHideNotification, object: nil)
}

func removeObserver() {
 NotificationCenter.default.removeObserver(self)
}

    deinit {
        NotificationCenter.default.removeObserver(self)
    }



    @objc func keyBoardWillShow(notification: Notification) {
        if keyboardIsHidden {
            keyboardIsHidden = false
            if let rect = notification.userInfo?["UIKeyboardFrameEndUserInfoKey"] as? CGRect {
                keyboardRect = rect
                updateSlide()
            }
        }
    }

    @objc func keyBoardDidHide(notification: Notification) {
        keyboardIsHidden = true
        updateSlide()
    }

    func updateSlide() {
        if keyboardIsHidden {
            slide = 0
        } else {
            let tfRect = self.rects[self.showField]
            let diff = keyboardRect.minY - tfRect.maxY

            if diff > 0 {
                slide += diff
            } else {
                slide += min(diff, 0)
            }

        }
    }
}
struct GeometryGetter: View {
    @Binding var rect: CGRect

    var body: some View {
        GeometryReader { geometry in
            Group { () -> AnyView in
                DispatchQueue.main.async {
                    self.rect = geometry.frame(in: .global)
                }

                return AnyView(Color.clear)
            }
        }
    }
}

struct ModifyView: View {
    @State private var hasTimeElapsed = false
    @State private var userText: String = "경복궁 야간개장 아름다운 불빛이 너무 아름다워요"
    @State private var userTag: String = "#경복궁 #경회루"
    @ObservedObject private var kGuardian = KeyboardGuardian(textFieldCount: 1)
    @State private var name = Array<String>.init(repeating: "", count: 3)
    @State var isNavigationBarHidden: Bool = true
    var body: some View {
        NavigationView{
            VStack {
                HStack{
                Image("main4").resizable()
                    .frame(width: UIScreen.main.bounds.width, height: 350, alignment: .topLeading)
                    .aspectRatio(contentMode: .fit)
                    
                }.padding(.top,-100)
                HStack {
                    HStack{Text("Cancel").foregroundColor(.blue)}
                    Spacer()
                    HStack{
                    NavigationLink(destination:ModifyView1())
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
                            NavigationLink(destination:ModifyView1())
                            {
                                Text("Add Text")
                                    .padding(.top,10)
                                .foregroundColor(.blue)
                            }
                        }
                        }.padding(.horizontal,20)
                        Text(hasTimeElapsed ? "경복궁 야간개장 아름다운 불빛이 너무 아름다워요":"" )
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
                            NavigationLink(destination:ModifyView1())
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

struct ModifyView_Previews: PreviewProvider {
    static var previews: some View {
        ModifyView()
            .previewDevice("iPhone 12 Pro Max")
    }
}



