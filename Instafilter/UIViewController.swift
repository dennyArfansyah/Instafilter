//
//  UIViewController.swift
//  Instafilter
//
//  Created by Denny Arfansyah on 29/01/23.
//

import SwiftUI

struct UIViewController: View {
    @State private var image: Image?
    @State private var inputImage: UIImage?
    @State private var showingImagePicker = false
    
    var body: some View {
        VStack {
            image?.resizable()
                .scaledToFit()
            
            Button("Select Image") {
                showingImagePicker.toggle()
            }
            
            Button("Save Image") {
                guard let inputImage = inputImage else { return }
                
                let imageSaver = ImageSaver()
                imageSaver.writetoPhotoAlbum(image: inputImage)
                
            }
        }
        .sheet(isPresented: $showingImagePicker) {
            ImagePicker(image: $inputImage)
        }
        .onChange(of: inputImage) { _ in
            loadImage()
        }
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
        
        UIImageWriteToSavedPhotosAlbum(inputImage, nil,nil, nil)
        
        
    }
}

struct UIViewController_Previews: PreviewProvider {
    static var previews: some View {
        UIViewController()
    }
}
