//
//  Extensions.swift
//  WhalesUIKit
//
//  Created by Roberto Hernandez on 3/1/21.
//

import UIKit

//MARK:- UIView

extension UIView {
  @discardableResult
  func stack(_ axis: NSLayoutConstraint.Axis = .vertical, views: [UIView], spacing: CGFloat = 0, alignment: UIStackView.Alignment = .fill, distribution: UIStackView.Distribution = .fill) -> UIStackView {
    let stackView = UIStackView(arrangedSubviews: views)
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.axis = axis
    stackView.spacing = spacing
    stackView.alignment = alignment
    stackView.distribution = distribution
    addSubview(stackView)
    
    let stackConstraints: [NSLayoutConstraint] = [
      stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
      stackView.topAnchor.constraint(equalTo: topAnchor),
      stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
      stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
      stackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
    ]
    
    NSLayoutConstraint.activate(stackConstraints)
    stackView.layoutMargins = .init(top: 16, left: 16, bottom: 16, right: 16)
    stackView.isLayoutMarginsRelativeArrangement = true
    return stackView
  }
}

//MARK:- CAGradientLayer

extension CAGradientLayer {
  func setUpGradient() {
    colors = [UIColor(named: "TopColor")!.cgColor, UIColor(named: "BottomColor")!.cgColor]
    startPoint = CGPoint(x: 0, y: 0)
    endPoint = CGPoint(x: 1, y: 1)
  }
}
