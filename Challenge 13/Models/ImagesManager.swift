//
//  ImagesManager.swift
//  Challenge 13
//
//  Created by Nikhi on 02/09/20.
//  Copyright © 2020 nikhit. All rights reserved.
//

import Foundation
import SwiftUI
import MapKit

class ImageManager: ObservableObject {
    @Published var savedImages = [ImageModel]() {
        didSet {
            self.saveImages()
        }
    }
    
    init() {
        self.loadSavedImages()
    }
    
    func getDocumentPath() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func loadSavedImages() {
        let path = getDocumentPath().appendingPathComponent("SavedImages")
        do {
            let data = try Data(contentsOf: path)
            self.savedImages = try JSONDecoder().decode([ImageModel].self, from: data)
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
    
    func saveImages() {
        let path = getDocumentPath().appendingPathComponent("SavedImages")
        do {
            let data = try JSONEncoder().encode(self.savedImages)
            try data.write(to: path, options: [.atomicWrite])
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
    
    func getImage(imageName: String) -> UIImage {
        let path = getDocumentPath().appendingPathComponent(imageName)
        do {
            let data = try Data(contentsOf: path)
            let uiImage = UIImage(data: data)!
            return uiImage
        } catch {
            print("Error: \(error.localizedDescription)")
        }
        // Dummy Image
        return UIImage(systemName: "house")!
    }
    
    
    
}
