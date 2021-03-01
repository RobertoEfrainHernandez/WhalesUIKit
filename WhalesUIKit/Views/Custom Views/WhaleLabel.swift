//
//  WhaleLabel.swift
//  WhalesUIKit
//
//  Created by Roberto Hernandez on 3/1/21.
//

import UIKit

final class WhaleLabel: UILabel {
  private let height: CGFloat
  
  init(_ height: CGFloat) {
    self.height = height
    super.init(frame: .zero)
    translatesAutoresizingMaskIntoConstraints = false
    heightAnchor.constraint(equalToConstant: height).isActive = true
    sizeToFit()
    textColor = .secondarySystemBackground
    font = .boldSystemFont(ofSize: 17)
    adjustsFontSizeToFitWidth = true
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
