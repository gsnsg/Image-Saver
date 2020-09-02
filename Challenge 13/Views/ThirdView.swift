//
//  ThirdView.swift
//  Challenge 13
//
//  Created by Nikhi on 02/09/20.
//  Copyright © 2020 nikhit. All rights reserved.
//

import SwiftUI

struct ThirdView: View {
    
    @State private var showDetailView = false
    @State private var displayImage: Image?
    
    var body: some View {
        MapView(showDetailView: $showDetailView, displayImage: $displayImage)
            .sheet(isPresented: $showDetailView) {
                DetailView(displayImage: self.displayImage!)
        }
    }
}

struct ThirdView_Previews: PreviewProvider {
    static var previews: some View {
        ThirdView()
    }
}
