//
//  AnimatedTouchID.swift
//  SwiftUIAnimation
//
//  Created by Brigette Valdez on 3/19/21.
//

import SwiftUI

struct AnimatedTouchID: View {
    
    @State private var on: Bool = false
    // Initial animation states
    @State private var showThumb = 1
    @State private var drawRing = 1/99
    @State private var showCircle = 0
    @State private var rotateCheckMark = 30
    @State private var scaleCheckmark = 0.0
    
    let lineRatio: CGFloat = 0.03
    let imageRatio: CGFloat = 0.7
    let duration: Double = 0.5
    
    var body: some View {
        
        ZStack {
            GeometryReader { geo in
                // Inactive
                Circle()
                    .stroke(style: StrokeStyle(lineWidth: getCircleThickness(geo.size), lineCap: .round, lineJoin: .round))
                    .frame(width: geo.size.width, height: geo.size.width, alignment: .center)
                    .foregroundColor(Color.lavendarGrey)
                
                // Active
                Circle()
                    .trim(from: 0, to: CGFloat(drawRing))
                    .stroke(style: StrokeStyle(lineWidth: (geo.size.width * lineRatio), lineCap: .round, lineJoin: .round))
                    .frame(width: geo.size.width, height: geo.size.width, alignment: .center)
                    .rotationEffect(.degrees(-90))
                    .foregroundColor(Color.aqua)
                    .animation(Animation.easeInOut(duration: duration).delay(duration))
                
                //base thumb print
                Image(systemName: "touchid")
                    .resizable()
                    .frame(width: getImgWidth(geo.size), height: getImgWidth(geo.size), alignment: .center)
                    .offset(x: getImgPadding(geo.size), y: getImgPadding(geo.size))
                    
                    .font(.system(size: 80))
                    .foregroundColor(.lavendarGrey)
                
                //overlay thumb print
                Image(systemName: "touchid")
                    .resizable()
                    .frame(width: getImgWidth(geo.size), height: getImgWidth(geo.size), alignment: .center)
                    .padding([.leading, .top], getImgPadding(geo.size))
                    .font(.system(size: 80))
                    .clipShape(Rectangle().offset(y: getOffset(geo.size)) )
                    .foregroundColor(.waterBlue)
                    .animation(Animation.easeInOut(duration: duration))
                
                ExpandingCheckMark(shapeColor: .white, duration: duration * 0.8, screenWidth: square(geo.size), scaleCheckmark: $scaleCheckmark, rotateCheckmark: $rotateCheckMark)
                    .frame(width: square(geo.size), height: square(geo.size), alignment: .center)
            }
            // .padding(.all, (geo.size.width * lineRatio))
            .onTapGesture {
                on.toggle()
                if on {
                    // Final animation states
                    showThumb = 100
                    drawRing = 1
                    showCircle = 1
                    DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                        scaleCheckmark = 1.0
                        rotateCheckMark = 0
                    }
                } else {
                    rotateCheckMark = 30
                   
                    showCircle = 0
                    drawRing = 1/99
                    showThumb = 1
                    scaleCheckmark = 0.01
                   
                }
                
            }
        }.padding(.all, 10)
    }
    
    
    private func getOffset(_ geo: CGSize) -> CGFloat {
        let e = 1.0 / CGFloat(showThumb)
        return e * square(geo)
    }
    
    private func getImgPadding(_ geo: CGSize) -> CGFloat {
        let w = square(geo)
        let a = getCircleThickness(geo)
        let a1 = a * 2
        let b = getImgWidth(geo)
        let c = w - a1 - b
        let d =  c / 2
        return d + a
    }
    
    private func getImgWidth(_ geo: CGSize) -> CGFloat {
        return square(geo) * imageRatio
    }
    
    private func getCircleThickness(_ geo: CGSize) -> CGFloat {
        return square(geo) * lineRatio
    }
    
    private func square(_ geo: CGSize) -> CGFloat {
        if geo.width < geo.height { return geo.width }
        return geo.height
    }
}

struct AnimatedTouchID_Previews: PreviewProvider {
    static var previews: some View {
        AnimatedTouchID()
    }
}
