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
    gradientLayer.setUpGradient()
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
  
  private var whaleLabel: UILabel = {
    let label = UILabel()
    label.textColor = .secondarySystemBackground
    label.font = .boldSystemFont(ofSize: 17)
    label.adjustsFontSizeToFitWidth = true
    return label
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
    configureStackView()
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
  
  private func configureIndicator() {
    addSubview(indicator)
    let indicatorConstraints: [NSLayoutConstraint] = [
      indicator.centerXAnchor.constraint(equalTo: centerXAnchor),
      indicator.centerYAnchor.constraint(equalTo: centerYAnchor)
    ]
    NSLayoutConstraint.activate(indicatorConstraints)
  }
}

extension CAGradientLayer {
  func setUpGradient() {
    colors = [#colorLiteral(red: 0.4941176471, green: 0.9098039216, blue: 0.9803921569, alpha: 1).cgColor, #colorLiteral(red: 0.9333333333, green: 0.7529411765, blue: 0.7764705882, alpha: 1).cgColor]
    startPoint = CGPoint(x: 0, y: 0)
    endPoint = CGPoint(x: 1, y: 1)
  }
}
