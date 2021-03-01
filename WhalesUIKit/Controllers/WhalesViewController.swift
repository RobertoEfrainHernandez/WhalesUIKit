//
//  ViewController.swift
//  WhalesUIKit
//
//  Created by Roberto Hernandez on 2/28/21.
//

import UIKit
import Combine

final class WhalesViewController: UIViewController {
  private let whales = Whale.whales
  private var whalesCollectionView: UICollectionView! = nil
  private var dataSource: UICollectionViewDiffableDataSource<WhalesSection, Whale>! = nil
  
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationController?.navigationBar.prefersLargeTitles = true
    navigationItem.title = "Whales"
    configureCollectionView()
    configureDataSource()
  }
}

//MARK:- Collection View Configuration

extension WhalesViewController: CompositionalLayout {
  func configureCollectionView() {
    whalesCollectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())
    whalesCollectionView.backgroundColor = .systemBackground
    whalesCollectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    whalesCollectionView.delegate = self
    view.addSubview(whalesCollectionView)
  }
  
  func configureDataSource() {
    dataSource = .init(collectionView: whalesCollectionView, cellProvider: { (collectionView, indexPath, whale) -> UICollectionViewCell? in
      let cellRegistration = UICollectionView.CellRegistration<WhaleCell, Whale> { (cell, _, whale) in
        cell.whale = whale
      }
      return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: whale)
    })
    
    submitChanges()
  }
  
  func submitChanges() {
    var snapshot = NSDiffableDataSourceSnapshot<WhalesSection, Whale>()
    snapshot.appendSections([.main])
    snapshot.appendItems(whales)
    dataSource.apply(snapshot, animatingDifferences: true)
  }
}

//MARK:- CollectionView Delegate

extension WhalesViewController: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let whale = whales[indexPath.item]
    let detailViewController = WhaleDetailViewController(whale: whale)
    detailViewController.modalPresentationStyle = .overFullScreen
    present(detailViewController, animated: true)
  }
}
