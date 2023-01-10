//
//  CountriesListView.swift
//  Countries
//
//  Created by Богдан Беннер on 9.01.23.
//

import SwiftUI

struct CountriesListView: View {
	@State private var countries = [Country]()

	var body: some View {
		List(countries) { country in
			Text("\(country.name.common) \(country.flag)")
		}
		.onAppear(perform: loadData)
	}

	func loadData() {
		guard let url = Bundle.main.url(forResource: "countries", withExtension: "json") else { return }

		do {
			let data = try Data(contentsOf: url)
			let decoder = JSONDecoder()
			countries = try decoder.decode([Country].self, from: data)
		} catch {
			print(error)
		}
	}
}

struct CountriesListView_Previews: PreviewProvider {
    static var previews: some View {
        CountriesListView()
    }
}
