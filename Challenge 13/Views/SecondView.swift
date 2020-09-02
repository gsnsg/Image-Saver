//
//  SecondView.swift
//  Challenge 13
//
//  Created by Nikhi on 02/09/20.
//  Copyright © 2020 nikhit. All rights reserved.
//

import SwiftUI

struct SecondView: View {
    

    @EnvironmentObject var imageManager: ImageManager
    
    var body: some View {
        NavigationView {
            List(imageManager.savedImages, id: \.id) { image in
                NavigationLink(destination: DetailView(displayImage: Image(uiImage: self.imageManager.getImage(imageName: image.imageName)))) {
                    HStack(alignment: .top) {
                         Image(uiImage: self.imageManager.getImage(imageName: image.imageName))
                            .resizable()
                            .frame(width: 100, height: 100)
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                        Text(image.name).font(.system(size: 20))
                    }
                }


            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle("Saved Images")
        }
        
    }
    
}


struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView()
    }
}
