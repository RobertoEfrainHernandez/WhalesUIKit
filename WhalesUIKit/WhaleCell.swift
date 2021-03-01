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
  
  private lazy var gradientView: CAGradientLayer = {
    let gradientLayer = CAGradientLayer()
    gradientLayer.colors = [#colorLiteral(red: 0.4941176471, green: 0.9098039216, blue: 0.9803921569, alpha: 1).cgColor, #colorLiteral(red: 0.9333333333, green: 0.7529411765, blue: 0.7764705882, alpha: 1).cgColor]
    gradientLayer.startPoint = CGPoint(x: 0, y: 0)
    gradientLayer.endPoint = CGPoint(x: 1, y: 1)
    gradientLayer.cornerRadius = 12
    layer.insertSublayer(gradientLayer, at: 0)
    return gradientLayer
  }()
  
  private var whaleImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.contentMode = .scaleAspectFit
    return imageView
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
      whaleImageView.sd_setImage(with: whale.image) { [self] (_, _, _, _) in
        stopIndicator()
      }
    }
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    configureImageView()
    configureIndicator()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    gradientView.frame = bounds
    layer.cornerRadius = 12
  }
  
  //MARK:- Private Methods
  
  private func stopIndicator() {
    indicator.stopAnimating()
    indicator.hidesWhenStopped = true
  }
  
  private func configureImageView() {
    addSubview(whaleImageView)
    
    let ivConstraints: [NSLayoutConstraint] = [
      whaleImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
      whaleImageView.topAnchor.constraint(equalTo: topAnchor),
      whaleImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
      whaleImageView.bottomAnchor.constraint(equalTo: bottomAnchor)
    ]
    
    NSLayoutConstraint.activate(ivConstraints)
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
