//
//  GradientCircleView.swift
//  newApp1
//
//  Created by Анастасия on 14.01.2026.
//

import UIKit

final class CustomRoundedView: UIView {
    
    private let gradientLayer = CAGradientLayer()
    private let maskLayer = CAShapeLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupGradient()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupGradient()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
        applyCustomCorners()
    }
}

private extension CustomRoundedView {

    func setupGradient() {
        gradientLayer.colors = [
            UIColor(red: 0.77, green: 0.64, blue: 0.91, alpha: 0.9).cgColor, 
            UIColor(red: 0.93, green: 0.945, blue: 0.96, alpha: 0.8).cgColor  // светло-серый
        ]

        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)

        layer.insertSublayer(gradientLayer, at: 0)
        gradientLayer.mask = maskLayer
    }

    func applyCustomCorners() {
        let width = bounds.width
        let height = bounds.height

        let bottomRadius: CGFloat = 22
        let topRadius: CGFloat = width / 2

        let path = UIBezierPath()

        path.move(to: CGPoint(x: 0, y: height - bottomRadius))

        path.addArc(
            withCenter: CGPoint(x: bottomRadius, y: height - bottomRadius),
            radius: bottomRadius,
            startAngle: .pi,
            endAngle: .pi / 2,
            clockwise: false
        )

        path.addLine(to: CGPoint(x: width - bottomRadius, y: height))

        path.addArc(
            withCenter: CGPoint(x: width - bottomRadius, y: height - bottomRadius),
            radius: bottomRadius,
            startAngle: .pi / 2,
            endAngle: 0,
            clockwise: false
        )

        path.addLine(to: CGPoint(x: width, y: topRadius))

        path.addArc(
            withCenter: CGPoint(x: width - topRadius, y: topRadius),
            radius: topRadius,
            startAngle: 0,
            endAngle: -.pi / 2,
            clockwise: false
        )

        path.addLine(to: CGPoint(x: topRadius, y: 0))

        path.addArc(
            withCenter: CGPoint(x: topRadius, y: topRadius),
            radius: topRadius,
            startAngle: -.pi / 2,
            endAngle: .pi,
            clockwise: false
        )

        path.close()

        maskLayer.path = path.cgPath
    }
}
