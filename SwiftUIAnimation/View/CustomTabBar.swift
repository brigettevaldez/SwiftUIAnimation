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
    
    var btnBuilderSet: [MenuButtonViewModel]
    
    init(activeTab: Binding<Tabs>) {
        self._activeTab = activeTab
        let colorSet = MenuColorSet()
        let fingerprint = MenuButtonViewModel(id: UUID(), btnType: .touchID, colorSet: colorSet, icon: Image(systemName: "touchid"))
        let triangle = MenuButtonViewModel(id: UUID(), btnType: .triangles, colorSet: colorSet, icon: Image.triangleIcon)
        let wave = MenuButtonViewModel(id: UUID(), btnType: .waveFill, colorSet: colorSet, icon: Image.waveIcon)
        btnBuilderSet = [fingerprint, triangle, wave]
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15.0)
                .foregroundColor(.white)
            HStack {
                ForEach(btnBuilderSet) { viewModel in
                    MenuButton(viewModel: viewModel, activeTab: $activeTab)
                }
            }
        }.frame(maxHeight: 65)
    }
    
    

}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBar(activeTab: .constant(.triangles))
    }
}

