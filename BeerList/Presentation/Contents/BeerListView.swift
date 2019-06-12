//
//  BeerListView.swift
//  BeerList
//
//  Created by Gustavo Henrique on 11/06/19.
//  Copyright © 2019 Gustavo Henrique. All rights reserved.
//

import SwiftUI

struct BeerListView : View {

    @EnvironmentObject private var beerData: BeerData

    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(beerData.beers) { beer in
                        BeerRow(beer: beer)
                            .frame(height: 320)
                            .listRowInsets(EdgeInsets())
                    }
                }
            }.navigationBarTitle(Text("Beers"))
        }
    }
}

#if DEBUG
 struct BeerListView_Previews : PreviewProvider {
    static var previews: some View {
        BeerListView().environmentObject(BeerData())
    }
 }
 #endif
