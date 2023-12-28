//
//  UploadView.swift
//  picy
//
//  Created by DongHuKim on 2021/10/28.
//

import SwiftUI
import PhotosUI

struct UploadView: View {
    
    var myData = Array(1...25).map{"\($0)"}
    
    var flexibleColumn3 = Array(repeating: GridItem(.flexible(), spacing: 2), count: 3)
    
    @State private var isPresented: Bool = false
    @State var pickerResult: [UIImage] = []
    var config: PHPickerConfiguration  {
       var config = PHPickerConfiguration(photoLibrary: PHPhotoLibrary.shared())
        config.filter = .images //videos, livePhotos...
        config.selectionLimit = 0 //0 => any, set 1-2-3 for har limit
        return config
    }
    var body: some View {
        NavigationView{
        VStack(alignment:.center) {
            
            VStack{
                ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack{
                ForEach(pickerResult, id: \.self) { image in
                    Image.init(uiImage: image)
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width, height: 350, alignment: .topLeading)
                        .aspectRatio(contentMode: .fit)
                }
                }.padding(.top,40)
                }
            }
            HStack {
                HStack{Text("Cancel").foregroundColor(.blue)}
                Spacer()
                HStack{
                NavigationLink(destination:ModifyView())
                {
                    Text("Next")
                    .foregroundColor(.blue)
                }
            }
                
            }.padding(.horizontal,20)
            Divider().padding(.top, 5)
//            ScrollView {
//                LazyVGrid(columns: flexibleColumn3, spacing: 2){
//                    ForEach(pickerResult, id: \.self){ data in
//                        Image.init(uiImage: data)
//                            .resizable()
//                            .frame(width: 141.0, height: 135.0)
//                            .clipShape(Rectangle())
//
//                    }
//                }
//            }.background(Color.black)
            
            
//            VStack{
//                Button("Present Picker") {
//                    isPresented.toggle()
//                }.sheet(isPresented: $isPresented) {
                    PhotoPicker(configuration: self.config,
                                pickerResult: $pickerResult,
                                isPresented: $isPresented)
//                }
//            }
        }.ignoresSafeArea(edges: .bottom).navigationBarTitle("")
            .navigationBarBackButtonHidden(true)
            .navigationBarTitle("")
            .padding(.top,-160)
        }.padding(.top,-180)
            .navigationBarBackButtonHidden(true)
            .navigationBarTitle("")
            .ignoresSafeArea(edges: .top)
    }
}

struct PhotoPicker: UIViewControllerRepresentable {
    let configuration: PHPickerConfiguration
    @Binding var pickerResult: [UIImage]
    @Binding var isPresented: Bool
    func makeUIViewController(context: Context) -> PHPickerViewController {
        let controller = PHPickerViewController(configuration: configuration)
        controller.delegate = context.coordinator
        return controller
    }
    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) { }
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    /// PHPickerViewControllerDelegate => Coordinator
    class Coordinator: PHPickerViewControllerDelegate {
        
        private let parent: PhotoPicker
        
        init(_ parent: PhotoPicker) {
            self.parent = parent
        }
        
        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            
            for image in results {
                if image.itemProvider.canLoadObject(ofClass: UIImage.self)  {
                    image.itemProvider.loadObject(ofClass: UIImage.self) { (newImage, error) in
                        if let error = error {
                            print(error.localizedDescription)
                        } else {
                            self.parent.pickerResult.append(newImage as! UIImage)
                        }
                    }
                } else {
                    print("Loaded Assest is not a Image")
                }
            }
            // dissmiss the picker
            parent.isPresented = false
        }
    }
}

struct UploadView_Previews: PreviewProvider {
    static var previews: some View {
        UploadView()
            .previewDevice("iPhone 12 Pro Max")
    }
}
