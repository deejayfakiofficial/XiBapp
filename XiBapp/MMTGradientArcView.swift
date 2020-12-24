//
//  MMTGradientArcView.swift
//  XiBapp
//
//  Created by Stanislav Terentyev on 24.12.2020.
//

import Foundation
import UIKit

class MMTGradientArcView: UIView {

    var lineWidth: CGFloat = 600             { didSet { setNeedsDisplay(bounds) } }
    var startColor = UIColor.green          { didSet { setNeedsDisplay(bounds) } }
    var endColor = UIColor.yellow            { didSet { setNeedsDisplay(bounds) } }
    var startAngle:CGFloat = 0              { didSet { setNeedsDisplay(bounds) } }
    var endAngle:CGFloat = 360                { didSet { setNeedsDisplay(bounds) } }

    override func draw(_ rect: CGRect) {

        let gradations = 360
        var startColorR:CGFloat = 0
        var startColorG:CGFloat = 0
        var startColorB:CGFloat = 0
        var startColorA:CGFloat = 0

        var endColorR:CGFloat = 0
        var endColorG:CGFloat = 0
        var endColorB:CGFloat = 0
        var endColorA:CGFloat = 0

        startColor.getRed(&startColorR, green: &startColorG, blue: &startColorB, alpha: &startColorA)
        endColor.getRed(&endColorR, green: &endColorG, blue: &endColorB, alpha: &endColorA)

        let startAngle:CGFloat = 0
        let endAngle:CGFloat = 360
        let center = CGPoint(x: bounds.midX, y: bounds.midY)
        let radius = (min(bounds.width, bounds.height) - lineWidth) / 2
        var angle = startAngle

        for i in 1 ... gradations {
            let extraAngle = (endAngle - startAngle) / CGFloat(gradations)
            let currentStartAngle = angle
            let currentEndAngle = currentStartAngle + extraAngle

            let currentR = ((endColorR - startColorR) / CGFloat(gradations - 1)) * CGFloat(i - 1) + startColorR
            let currentG = ((endColorG - startColorG) / CGFloat(gradations - 1)) * CGFloat(i - 1) + startColorG
            let currentB = ((endColorB - startColorB) / CGFloat(gradations - 1)) * CGFloat(i - 1) + startColorB
            let currentA = ((endColorA - startColorA) / CGFloat(gradations - 1)) * CGFloat(i - 1) + startColorA

            let currentColor = UIColor.init(red: currentR, green: currentG, blue: currentB, alpha: currentA)

            let path = UIBezierPath()
            path.lineWidth = lineWidth
            path.lineCapStyle = .round
            path.addArc(withCenter: center, radius: radius, startAngle: currentStartAngle * CGFloat(Double.pi / 180.0), endAngle: currentEndAngle * CGFloat(Double.pi / 180.0), clockwise: true)
            currentColor.setStroke()
            path.stroke()
            angle = currentEndAngle
        }
    }
}
