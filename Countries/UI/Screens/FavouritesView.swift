//
//  FavouritesView.swift
//  Countries
//
//  Created by Богдан Беннер on 24.02.23.
//

import SwiftUI

struct FavouritesView: View {
	@ObservedObject var favoriteCountriesViewModel = FavouriteCountriesViewModel()
	
    var body: some View {
		Text("Placeholder")
//		NavigationView {
//			VStack {
//				List(favoriteCountries.getCountries(), id: \.self) { country in
//					NavigationLink(destination: CountryDetailView(country: country)) {
//						CountryListCell(country: country)
//					}
//				}
//			}
//		}
//		.navigationTitle("Countries")
    }
}

struct FavouritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavouritesView()
    }
}
