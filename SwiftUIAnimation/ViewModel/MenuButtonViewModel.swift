//
//  MenuButtonViewModel.swift
//  SwiftUIAnimation
//
//  Created by Brigette Valdez on 3/22/21.
//

import Foundation
import SwiftUI

struct MenuButtonViewModel: Identifiable {
    var id: UUID
    var btnType: Tabs
    var colorSet: MenuColorSet
    var icon: Image
}


struct MenuColorSet {
    let selectedBckColor: Color = .slateBlue
    let selectedForegroundColor: Color = .white
    let foregroundColor: Color = .lavendarGrey
}
