//
//  WhaleImageView.swift
//  WhalesUIKit
//
//  Created by Roberto Hernandez on 3/1/21.
//

import UIKit

final class WhaleImageView: UIImageView {
  override init(frame: CGRect) {
    super.init(frame: frame)
    translatesAutoresizingMaskIntoConstraints = false
    contentMode = .scaleAspectFit
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
