//
//  FirstView.swift
//  Challenge 13
//
//  Created by Nikhi on 02/09/20.
//  Copyright © 2020 nikhit. All rights reserved.
//

import Foundation
import SwiftUI
import MapKit

struct FirstView: View {
    
    @EnvironmentObject var imageManager: ImageManager
    
    @State private var selectedImage: UIImage?
    @State private var displayImage: Image?
    @State private var name = ""
    @State private var showingImagePicker = false
    
    
    
    let locationFetcher = LocationFetcher()
    
    var body: some View {
        NavigationView {
            GeometryReader { geo in
                Form {
                    Section(header: Text("Image Details")) {
                        TextField("Image Name", text: self.$name)
                    }
                    Section(header: Text("Image")) {
                        ZStack {
                            Rectangle()
                                .fill(Color.secondary.opacity(0.4))
                            if self.displayImage !=  nil {
                                self.displayImage?
                                    .resizable()
                                    .scaledToFit()
                            } else {
                                Text("Tap to upload an image")
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                            }
                            
                        }
                        .frame(height: geo.size.height / 2)
                        .onTapGesture {
                            self.showingImagePicker = true
                        }
                    }
                }
            }.sheet(isPresented: $showingImagePicker, onDismiss: loadImageToContentView) {
                ImagePicker(selectedImage: self.$selectedImage)
            }
            .navigationBarItems(trailing: Button("Save") {
                guard let safeImage = self.selectedImage, self.name.count != 0, self.locationFetcher.lastKnownLocation != nil else{return}
                
                self.saveImage(image: safeImage)
            })
                .navigationBarTitle("ImageSaver")
            
            
        }
    }
    
    func saveImage(image: UIImage) {
        let imageModel = ImageModel(name: name, coordinate: locationFetcher.lastKnownLocation)
        let imagePath = imageManager.getDocumentPath().appendingPathComponent(imageModel.imageName)
        imageModel.imagePath = imagePath.path
        
        if let jpegData = image.jpegData(compressionQuality: 1) {
            do {
                try jpegData.write(to: imagePath, options: [.atomic, .completeFileProtection])
                imageManager.savedImages.append(imageModel)
            } catch {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func loadImageToContentView() {
        guard let selectedImage = selectedImage else {return}
        displayImage = Image(uiImage: selectedImage)
    }
    
}

