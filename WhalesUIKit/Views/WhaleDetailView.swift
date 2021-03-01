//
//  WhaleDetailView.swift
//  WhalesUIKit
//
//  Created by Roberto Hernandez on 3/1/21.
//

import UIKit

final class WhaleDetailView: UIView {
  
  private let whale: Whale
  private let action: (() -> Void)
  private let whaleImageView = WhaleImageView(frame: .zero)
  private let whaleLabel = WhaleLabel(30)
  private let closeButton = CloseButton(UIImage(systemName: "chevron.down")!)
  
  
  private lazy var gradientView: CAGradientLayer = {
    let gradientLayer = CAGradientLayer()
    gradientLayer.setUpGradient()
    layer.insertSublayer(gradientLayer, at: 0)
    return gradientLayer
  }()
  
  
  
  init(whale: Whale, action: @escaping () -> Void) {
    self.whale = whale
    self.action = action
    super.init(frame: .zero)
    stack(views: [whaleImageView, whaleLabel, UIView()], spacing: 12, alignment: .center)
    whaleLabel.text = whale.name
    whaleImageView.sd_setImage(with: whale.image)
    configureButton()
    closeButton.addTarget(self, action: #selector(handleDismiss), for: .touchUpInside)
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    gradientView.frame = bounds
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  @objc private func handleDismiss() {
    action()
  }
  
  private func configureButton() {
    addSubview(closeButton)
    let buttonContriants: [NSLayoutConstraint] = [
      closeButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
      closeButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16)
    ]
    NSLayoutConstraint.activate(buttonContriants)
  }
}
