//
//  CountryUnionDetailView.swift
//  Countries
//
//  Created by Богдан Беннер on 22.02.23.
//

import SwiftUI

struct UnionDetailView: View {
	@EnvironmentObject private var countryUnionViewModel: UnionViewModel
	@EnvironmentObject private var unionViewModel: UnionViewModel
	
	let union: Union
	var body: some View {
		ScrollView {
			VStack(alignment: .leading, spacing: 10) {
				// Display the emblem of the country
				UnionEmblem(union: union)
				// Display the full name of the union
				Text(union.fullName)
					.font(.largeTitle)
				// Display the official name of the country (if it differs)
				Text("aka \(union.abbreviation)")
					.font(.headline)
					.fontDesign(.monospaced)
					.italic()
				Text("Date of creation: \(union.dateOfCreation)")
				Text("Number of members: \(union.numberOfMembers)")
				Text("Headquarters: \(union.hqCity), \(union.hqCountry)")
				let members = unionViewModel.getMembers(for: union)
				CountriesScrollableGallery(countries: members)
				Text(union.description)
			}
			.padding()
		}
		
	}
}

struct UnionDetailView_Previews: PreviewProvider {
	static var previews: some View {
		let unionViewModel = UnionViewModel()
		unionViewModel.loadData(fileName: "unions")
		return UnionDetailView(union: unionViewModel.unions.randomElement()!)
			.environmentObject(unionViewModel)
	}
}
