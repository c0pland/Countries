//
//  FavouritesView.swift
//  Countries
//
//  Created by Богдан Беннер on 24.02.23.
//

import SwiftUI

struct FavouritesView: View {
	@ObservedObject var favoriteCountriesViewModel = FavoriteCountriesViewModel()
	@ObservedObject var router = Router()
	
	var body: some View {
		List(favoriteCountriesViewModel.favoriteCountries.sorted(by: { $0.id < $1.id }), id: \.id) { country in
			CountryListCell(country: country)
				.onTapGesture {
					router.favoritesPath.append(country)
				}
				.id(ScrollAnchor.favorites)
		}
		.navigationDestination(for: Union.self) { union in
			UnionDetailView(union: union)
		}
		.navigationTitle(router.navigationTitle)
		.navigationDestination(for: Country.self) { country in
			CountryDetailView(country: country)
		}
	}
}

struct FavouritesView_Previews: PreviewProvider {
	static var previews: some View {
		FavouritesView()
	}
}
