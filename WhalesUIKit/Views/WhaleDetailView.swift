//
//  WhaleDetailView.swift
//  WhalesUIKit
//
//  Created by Roberto Hernandez on 3/1/21.
//

import UIKit

final class WhaleDetailView: UIView {
  private let closeButton = CloseButton(UIImage(systemName: "chevron.down")!)
  var action: (() -> Void)!
  
  private lazy var gradientView: CAGradientLayer = {
    let gradientLayer = CAGradientLayer()
    gradientLayer.setUpGradient()
    layer.insertSublayer(gradientLayer, at: 0)
    return gradientLayer
  }()
  
  private var whaleImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.contentMode = .scaleAspectFit
    return imageView
  }()
  
  private var whaleLabel: UILabel = {
    let label = UILabel()
    label.textColor = .secondarySystemBackground
    label.font = .boldSystemFont(ofSize: 17)
    label.adjustsFontSizeToFitWidth = true
    return label
  }()
  
  var whale: Whale! {
    didSet {
      whaleLabel.text = whale.name
      whaleImageView.sd_setImage(with: whale.image)
    }
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    configureStackView()
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
  
  @objc func handleDismiss() {
    action()
  }
  
  private func configureStackView() {
    let stackView = UIStackView(arrangedSubviews: [whaleImageView, whaleLabel, UIView()])
    stackView.axis = .vertical
    stackView.distribution = .fill
    stackView.alignment = .center
    stackView.spacing = 16
    stackView.translatesAutoresizingMaskIntoConstraints = false
    
    addSubview(stackView)
    
    let ivConstraints: [NSLayoutConstraint] = [
      stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
      stackView.topAnchor.constraint(equalTo: topAnchor),
      stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
      stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
      stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
    ]
    
    NSLayoutConstraint.activate(ivConstraints)
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
