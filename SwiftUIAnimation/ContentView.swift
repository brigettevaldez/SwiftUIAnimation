//
//  ContentView.swift
//  SwiftUIAnimation
//
//  Created by Brigette Valdez on 3/19/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
     Rectangle()
        .foregroundColor(.space)
        
            VStack {
                AnimatedTouchID()
                    .padding([.leading, .trailing], 100)
              
            }
    }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
