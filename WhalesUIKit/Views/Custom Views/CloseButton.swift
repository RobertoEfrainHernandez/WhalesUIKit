//
//  CloseButton.swift
//  WhalesUIKit
//
//  Created by Roberto Hernandez on 3/1/21.
//

import UIKit

final class CloseButton: UIButton {
  private var imageIcon: UIImage
  private let size: CGFloat = 44
  
  init(_ imageIcon: UIImage) {
    self.imageIcon = imageIcon
    super.init(frame: .zero)
    translatesAutoresizingMaskIntoConstraints = false
    backgroundColor = .black
    setImage(imageIcon.withTintColor(.systemTeal, renderingMode: .alwaysOriginal), for: .normal)
    heightAnchor.constraint(equalToConstant: size).isActive = true
    widthAnchor.constraint(equalToConstant: size).isActive = true
    layer.cornerRadius = size * 0.5
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
