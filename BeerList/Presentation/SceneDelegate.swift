//
//  SceneDelegate.swift
//  BeerList
//
//  Created by Gustavo Henrique on 11/06/19.
//  Copyright © 2019 Gustavo Henrique. All rights reserved.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = UIHostingController(
            rootView: BeerListView().environmentObject(BeerData())

        )
        self.window = window
        window.makeKeyAndVisible()
    }


}

