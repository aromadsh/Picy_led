//
//  ImageSave.swift
//  picy
//
//  Created by DongHuKim on 2021/11/02.
//

import SwiftUI


class ImageSaver: NSObject {
    func writeToPhotoAlbum(image: UIImage) {
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveError), nil)
    }

    @objc func saveError(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        print("Save finished!")
    }
}
struct ImageSave: View {
    @State private var image: Image?
    @State private var inputImage: UIImage?
    
    var body: some View {
        Button("saveImage"){}
    }
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
        
        let imageSaver = ImageSaver()
        imageSaver.writeToPhotoAlbum(image: inputImage)
    }
}

struct ImageSave_Previews: PreviewProvider {
    static var previews: some View {
        ImageSave()
    }
}
