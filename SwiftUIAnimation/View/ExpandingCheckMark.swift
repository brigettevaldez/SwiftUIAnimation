//
//  ExpandingCheckMark.swift
//  SwiftUIAnimation
//
//  Created by Brigette Valdez on 3/19/21.
//

import SwiftUI

struct ExpandingCheckMark: View {
    
    let shapeColor: Color
    let duration: Double
    let screenWidth: CGFloat
    let checkRatio: CGFloat = 1.0/3.0
    
    @Binding var scaleCheckmark: Double
    @Binding var rotateCheckmark: Int
    
        var body: some View {
            ZStack {
                Rectangle()
                    .foregroundColor(.clear)
            Image(systemName: "checkmark")
                .resizable()
                .renderingMode(.template)
                .frame(width: screenWidth * checkRatio, height: screenWidth * checkRatio, alignment: .center)
                .foregroundColor(shapeColor)
                .scaleEffect(CGFloat(scaleCheckmark), anchor: .center)
                .rotationEffect(.degrees(Double(rotateCheckmark)))
                .animation(Animation.interpolatingSpring(stiffness: 170, damping: 15))

            }
        }
    
    }

struct ExpandingCheckMark_Previews: PreviewProvider {
    static var previews: some View {
        ExpandingCheckMark(shapeColor: .space, duration: 1.0, screenWidth: 300, scaleCheckmark: .constant(1.0), rotateCheckmark: .constant(30))
    }
}
