//
//  MenuButton.swift
//  SwiftUIAnimation
//
//  Created by Brigette Valdez on 3/22/21.
//

import SwiftUI

struct MenuButton: View {
    
    var viewModel: MenuButtonViewModel
    @Binding var activeTab: Tabs
    
    var body: some View {
        Button(action: {
            activeTab = viewModel.btnType
        }, label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(activeTab == viewModel.btnType ? viewModel.colorSet.selectedBckColor : .clear)
                    .padding(.all, 10)
                viewModel.icon
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(activeTab == viewModel.btnType ? viewModel.colorSet.selectedForegroundColor : viewModel.colorSet.foregroundColor)
                    .padding(.all, 15)
            }
        }).aspectRatio(1, contentMode: .fit)
       
    }
}

struct MenuButton_Previews: PreviewProvider {
    static var previews: some View {
        MenuButton(viewModel: MenuButtonViewModel(id: UUID(), btnType: .waveFill, colorSet: MenuColorSet(), icon: Image.waveIcon), activeTab: .constant(.waveFill))
    }
}


