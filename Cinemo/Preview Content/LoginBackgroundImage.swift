//
//  LoginBackgroundImage.swift
//  Cinemo
//
//  Created by BS00484 on 23/5/24.
//

import SwiftUI

struct LoginBackgroundImage: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: rect.height * 0.75))
        path.addCurve(to: CGPoint(x: rect.width, y: rect.height * 0.75),
                      control1: CGPoint(x: rect.width * 0.25, y: rect.height),
                      control2: CGPoint(x: rect.width * 0.75, y: rect.height * 0.5))
        path.addLine(to: CGPoint(x: rect.width, y: rect.height))
        path.addLine(to: CGPoint(x: 0, y: rect.height))
        path.closeSubpath()
        return path
    }
}



#Preview {
    LoginBackgroundImage()
}
