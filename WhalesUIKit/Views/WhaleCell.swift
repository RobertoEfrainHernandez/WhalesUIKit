//
//  WhaleCell.swift
//  WhalesUIKit
//
//  Created by Roberto Hernandez on 2/28/21.
//

import UIKit
import SDWebImage

enum WhalesSection {
  case main
}

final class WhaleCell: UICollectionViewCell {
  
  private let whaleImageView = WhaleImageView(frame: .zero)
  private let whaleLabel = WhaleLabel(20)
  
  private lazy var gradientView: CAGradientLayer = {
    let gradientLayer = CAGradientLayer()
    gradientLayer.setUpGradient()
    gradientLayer.cornerRadius = 12
    layer.insertSublayer(gradientLayer, at: 0)
    return gradientLayer
  }()
  
  private var indicator: UIActivityIndicatorView = {
    let indicator = UIActivityIndicatorView(style: .medium)
    indicator.translatesAutoresizingMaskIntoConstraints = false
    indicator.color = .black
    indicator.startAnimating()
    return indicator
  }()
  
  var whale: Whale! {
    didSet {
      whaleLabel.text = whale.name
      whaleImageView.sd_setImage(with: whale.image) { [self] (_, _, _, _) in
        stopIndicator()
      }
    }
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    stack(views: [whaleImageView, whaleLabel], spacing: 12, alignment: .center)
    configureIndicator()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    gradientView.frame = bounds
    layer.cornerRadius = 16
  }
  
  //MARK:- Private Methods
  
  private func stopIndicator() {
    indicator.stopAnimating()
    indicator.hidesWhenStopped = true
  }
  
  private func configureIndicator() {
    addSubview(indicator)
    let indicatorConstraints: [NSLayoutConstraint] = [
      indicator.centerXAnchor.constraint(equalTo: centerXAnchor),
      indicator.centerYAnchor.constraint(equalTo: centerYAnchor)
    ]
    NSLayoutConstraint.activate(indicatorConstraints)
  }
}
