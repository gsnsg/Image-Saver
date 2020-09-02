//
//  ContentView.swift
//  Challenge 13
//
//  Created by Nikhi on 01/09/20.
//  Copyright © 2020 nikhit. All rights reserved.
//

import SwiftUI




struct ContentView: View {
    var body: some View {
        TabView {
            FirstView()
                .tabItem {
                    Image(systemName: "house.fill")
                    
            }
            
            SecondView()
                .tabItem {
                    Image(systemName: "list.dash")
                    
            }
            
            ThirdView().tabItem {
                Image(systemName: "map")
                
            }
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
