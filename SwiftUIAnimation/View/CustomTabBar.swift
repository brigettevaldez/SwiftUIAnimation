//
//  customTabBar.swift
//  SwiftUIAnimation
//
//  Created by Brigette Valdez on 3/22/21.
//

import SwiftUI

struct CustomTabBar: View {
    
    let selectedBckColor: Color = .slateBlue
    let selectedForegroundColor: Color = .white
    let foregroundColor: Color = .lavendarGrey
    
    @Binding var activeTab: Tabs
    
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15.0)
                .foregroundColor(.white)
            HStack {
                //touchID
                Button(action: {
                    activeTab = .touchID
                }, label: {
                    touchIDIcon
                }).aspectRatio(1, contentMode: .fit)
                
                //expanding triangles
                Button(action: {
                    activeTab = .triangles
                }, label: {
                    triangleIcon
                }).aspectRatio(1, contentMode: .fit)
                
                //expanding triangles
                Button(action: {
                    activeTab = .waveFill
                }, label: {
                    waveIcon
                }).aspectRatio(1, contentMode: .fit)
            }
        }.frame(maxHeight: 65)
    }
    
    
    var touchIDIcon: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(activeTab == .touchID ? selectedBckColor : .clear)
                .padding(.all, 10)
            Image(systemName: "touchid")
                .resizable()
                .renderingMode(.template)
                .foregroundColor(activeTab == .touchID ? selectedForegroundColor : foregroundColor)
                .padding(.all, 15)
        }
    }
    
    var triangleIcon: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(activeTab == .triangles ? selectedBckColor : .clear)
                .padding(.all, 10)
            Image.triangleIcon
                .resizable()
                .renderingMode(.template)
                .foregroundColor(activeTab == .triangles ? selectedForegroundColor : foregroundColor)
                .padding(.all, 15)
        }
    }
    
    var waveIcon: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(activeTab == .waveFill ? selectedBckColor : .clear)
                .padding(.all, 10)
            Image.waveIcon
                .resizable()
                .renderingMode(.template)
                .foregroundColor(activeTab == .waveFill ? selectedForegroundColor : foregroundColor)
                .padding(.all, 15)
        }
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBar(activeTab: .constant(.triangles))
    }
}
