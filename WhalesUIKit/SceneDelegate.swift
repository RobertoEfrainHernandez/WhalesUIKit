//
//  SceneDelegate.swift
//  WhalesUIKit
//
//  Created by Roberto Hernandez on 2/28/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  var window: UIWindow?


  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    setRootVC(with: scene)
  }
  
  private func setRootVC(with scene: UIScene) {
    guard let windowScene = (scene as? UIWindowScene) else { return }
    window = UIWindow(frame: windowScene.coordinateSpace.bounds)
    window?.windowScene = windowScene
    
    //Styling for UINavigationBar
    let style = UINavigationBarAppearance()
    style.backgroundColor = .systemBackground
    
    //Configuration Root Controller as well as applying styling to Navigation Controller
    let rootController = WhalesViewController()
    let navController = UINavigationController(rootViewController: rootController)
    navController.navigationBar.standardAppearance = style
    navController.navigationBar.compactAppearance = style
    navController.navigationBar.scrollEdgeAppearance = style
    window?.rootViewController = navController
    window?.makeKeyAndVisible()
  }

  func sceneDidDisconnect(_ scene: UIScene) { }

  func sceneDidBecomeActive(_ scene: UIScene) { }

  func sceneWillResignActive(_ scene: UIScene) { }

  func sceneWillEnterForeground(_ scene: UIScene) { }

  func sceneDidEnterBackground(_ scene: UIScene) { }
}

