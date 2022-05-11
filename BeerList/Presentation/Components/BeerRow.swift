//
//  BeerRow.swift
//  BeerList
//
//  Created by Gustavo Henrique on 11/06/19.
//  Copyright © 2019 Gustavo Henrique. All rights reserved.
//

import SwiftUI

struct BeerRow: View {

    var beer: Beer

    var body: some View {
        VStack(alignment: .center, spacing: 16) {
            BeerRowImage(beerImage: BeerImage(beerUrl: beer.getUrl()))
            VStack(alignment: .leading, spacing: 4) {
                Text(beer.name)
                    .font(.largeTitle)
                    .foregroundColor(.black)
                    .bold()
                Text(beer.description)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .foregroundColor(.orange)
                    .font(.system(size: 10))
                    .frame(height: 60)
            }
        }
    }

}

struct BeerRowImage: View {

    @State var beerImage: BeerImage?

    var body: some View {
        ZStack(alignment: .center) {
            if self.beerImage!.image != nil {
                Image(uiImage: self.beerImage!.image!)
                    .resizable()
                    .renderingMode(.original)
                    .frame(width: 200, height: 200)
                    .cornerRadius(5)
                    .aspectRatio(contentMode: .fit)
                    .shadow(radius: 10)

            } else {
                Rectangle()
                    .foregroundColor(.gray)
                    .frame(width: 200, height: 200)
                    .cornerRadius(5)
                    .shadow(radius: 10)
            }
        }.onAppear {
            self.beerImage!.downloadImage()
        }
    }
}

#if DEBUG
struct BeerRow_Previews : PreviewProvider {
    static var previews: some View {
        BeerRow(beer: .fixture)
    }
}
#endif
