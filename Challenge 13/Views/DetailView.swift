//
//  DetailView.swift
//  Challenge 13
//
//  Created by Nikhi on 02/09/20.
//  Copyright © 2020 nikhit. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    var displayImage: Image
    var body: some View {
        VStack {
            GeometryReader { reader in
                self.displayImage
                    .resizable()
                    .scaledToFill()
                    .padding()
                    .frame(width: reader.size.width)
            }
        }
        .background(Color.secondary.opacity(0.25))
    }
}

struct DetailView_Previews: PreviewProvider {
    static let image = Image(systemName: "map")
    static var previews: some View {
        DetailView(displayImage: image)
    }
}
