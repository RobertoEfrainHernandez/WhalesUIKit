//
//  WhalesViewPreview.swift
//  WhalesUIKit
//
//  Created by Roberto Hernandez on 3/3/21.
//

import SwiftUI

struct WhalesViewPreview: UIViewControllerRepresentable {
  func makeUIViewController(context: Context) -> UIViewController {
    WhalesViewController()
  }
  
  func updateUIViewController(_ uiViewController: UIViewController, context: Context) { }
}

struct WhalesViewPreview_Previews: PreviewProvider {
  static var previews: some View {
    WhalesViewPreview()
  }
}
