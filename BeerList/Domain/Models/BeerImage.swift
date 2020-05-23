//
//  ImageBeerImage.swift
//  BeerList
//
//  Created by Gustavo Henrique on 11/06/19.
//  Copyright © 2019 Gustavo Henrique. All rights reserved.
//

import SwiftUI
import Combine
import UIKit

final class BeerImage: ObservableObject {

    private static let imageCache = NSCache<AnyObject, AnyObject>()

    let didChange = PassthroughSubject<BeerImage, Never>()
    private let beerUrl: URL

    var image: UIImage? = nil {
        didSet {
            didChange.send(self)
        }
    }

    init(beerUrl: URL) {
        self.beerUrl = beerUrl
    }

    public func downloadImage() {

        if let imageFromCache = BeerImage.imageCache.object(forKey: self.beerUrl.absoluteString as AnyObject) as? UIImage {
            self.image = imageFromCache
            return
        }

        do {

            let data = try Data(contentsOf: self.beerUrl)

            guard let image = UIImage(data: data) else {
                return
            }

            BeerImage.imageCache.setObject(image, forKey: self.beerUrl.absoluteString  as AnyObject)
            DispatchQueue.main.async { [weak self] in
                self?.image = image
            }

        }catch {
            print(error.localizedDescription)
        }



    }



    
}
