//
//  FavouritesView.swift
//  Countries
//
//  Created by Богдан Беннер on 24.02.23.
//

import SwiftUI

struct FavouritesView: View {
	@ObservedObject var favoriteCountriesViewModel = FavoriteCountriesViewModel()

	var body: some View {
		NavigationView {
			VStack {
				List(favoriteCountriesViewModel.favoriteCountries.sorted(by: { $0.id < $1.id }), id: \.id) { country in
					NavigationLink(destination: CountryDetailView(country: country)) {
						CountryListCell(country: country)
					}
				}
			}
			.navigationTitle("Favorites")
		}
		.onAppear {
			favoriteCountriesViewModel.loadFavorites()
		}
		.onReceive(favoriteCountriesViewModel.$favoriteCountries) { _ in
			print("Favorite countries set has changed.")
			// Force the view to update when the favoriteCountries set changes
		}
	}
}

struct FavouritesView_Previews: PreviewProvider {
	static var previews: some View {
		FavouritesView()
	}
}
