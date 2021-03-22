//
//  ContentView.swift
//  SwiftUIAnimation
//
//  Created by Brigette Valdez on 3/19/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var tab: Tabs = .touchID
    
    
    var body: some View {
        ZStack {
            Rectangle().foregroundColor(.space)
            visibleTab
                .padding(.all, 75)
            VStack {
                Spacer()
                CustomTabBar(activeTab: $tab)
            }.padding([.leading, .trailing, .bottom], 30)
        }.edgesIgnoringSafeArea([.top, .bottom])
    }
        
        var visibleTab: some View {
            switch tab {
            case .touchID:
                return AnyView(AnimatedTouchID())
            case .triangles:
                return AnyView(ExpandingTriangles())
            case .waveFill:
                return AnyView(WaveView())
            }
        }
        
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

enum Tabs {
    case touchID, triangles, waveFill
}
