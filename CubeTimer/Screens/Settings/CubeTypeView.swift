//
//  CubeTypeView.swift
//  CubeTimer
//
//  Created by Ульяна Гритчина on 03.12.2022.
//

import SwiftUI

struct CubeTypeView: View {
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    let type: Cube
    @Binding var selected: Cube
    let color: Color
    @State private var isSelected = false
    var body: some View {
        Button(action: {
            selected = type
            HapticManager.instance.impact(style: .light)
        }) {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: width / 5, height: width / 5)
                    .foregroundColor(color)
                    .overlay(
                        Text(type.rawValue)
                            .foregroundColor(.white)
                            .font(.system(size: height / 35))
                            .bold()
                )
                RoundedRectangle(cornerRadius: 12)
                    .stroke()
                    .frame(width: width / 5 + 5, height: width / 5 + 5)
                    .opacity(type == selected ? 1 : 0)
            }
        }
    }
}

struct CubeTypeView_Previews: PreviewProvider {
    static var previews: some View {
        CubeTypeView(type: .three, selected: .constant(.three), color: .blue)
    }
}
