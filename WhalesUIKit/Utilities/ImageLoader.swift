//
//  ImageLoader.swift
//  WhalesUIKit
//
//  Created by Roberto Hernandez on 2/28/21.
//

import UIKit
import Combine

//MARK:- My attempt at Creating an Image Laoder class with a Image Cache
final class ImageLoader {
  private var loadedImages = [UUID: UIImage]()
  
  func loadImage(for whale: Whale) -> AnyPublisher<UIImage?, Never> {
    URLSession.shared.dataTaskPublisher(for: whale.image)
      .map(\.data)
      .replaceError(with: Data())
      .compactMap { UIImage(data: $0) }
      .receive(on: DispatchQueue.main)
      .eraseToAnyPublisher()
  }
  
  func addToLoaded(_ id: UUID, _ image: UIImage) {
    loadedImages.updateValue(image, forKey: id)
  }
  
  func checkImage(for id: UUID) -> UIImage? {
    return loadedImages[id]
  }
}
