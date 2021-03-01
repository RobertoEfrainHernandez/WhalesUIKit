//
//  CompositionalLayout.swift
//  WhalesUIKit
//
//  Created by Roberto Hernandez on 2/28/21.
//

import UIKit

protocol CompositionalLayout {
  func createLayout() -> UICollectionViewLayout
  func configureCollectionView()
  func configureDataSource()
  func submitChanges()
}

extension CompositionalLayout where Self: WhalesViewController {
  func createLayout() -> UICollectionViewLayout {
    let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                          heightDimension: .fractionalHeight(1.0))
    let item = NSCollectionLayoutItem(layoutSize: itemSize)
    
    let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                           heightDimension: .fractionalHeight(0.4))
    let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
    let spacing = CGFloat(10)
    group.interItemSpacing = .fixed(spacing)
    
    let section = NSCollectionLayoutSection(group: group)
    section.interGroupSpacing = spacing
    section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
    
    let layout = UICollectionViewCompositionalLayout(section: section)
    return layout
  }
}
