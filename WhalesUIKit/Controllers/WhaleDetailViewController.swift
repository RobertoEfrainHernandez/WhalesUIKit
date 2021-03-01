//
//  WhaleDetailViewController.swift
//  WhalesUIKit
//
//  Created by Roberto Hernandez on 2/28/21.
//

import UIKit
import SDWebImage

final class WhaleDetailViewController: UIViewController {
  private var whale: Whale
  
  init(whale: Whale) {
    self.whale = whale
    super.init(nibName: nil, bundle: nil)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func loadView() {
    let detailView = WhaleDetailView(whale: whale, action: dismissDetail)
    view = detailView
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func dismissDetail() {
    dismiss(animated: true)
  }
}


