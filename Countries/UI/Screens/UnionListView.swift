//
//  CountryUnionsListView.swift
//  Countries
//
//  Created by Богдан Беннер on 22.02.23.
//

import SwiftUI

struct UnionListView: View {
	@EnvironmentObject private var unionViewModel: UnionViewModel
	@EnvironmentObject private var router: Router
	@State private var searchText = ""
	
	var body: some View {
		List {
			if !searchResults.isEmpty {
				ForEach(searchResults) { union in
					UnionListCell(union: union)
						.onTapGesture {
							router.unionsPath.append(union)
						}
						.id(ScrollAnchor.unions)
				}
			} else {
				Text("Nothing found for ***\(searchText)***")
			}
		}
		.navigationDestination(for: Union.self) { union in
			UnionDetailView(union: union)
		}
		.navigationTitle(router.navigationTitle)
		.searchable(text: $searchText)
	}
	
	var searchResults: [Union] {
		if searchText.isEmpty {
			return unionViewModel.unions
		} else {
			return unionViewModel.unions.filter { union in
				union.abbreviation.lowercased().contains(searchText.lowercased()) ||
				union.fullName.lowercased().contains(searchText.lowercased())
			}
		}
	}
}

struct UnionListView_Previews: PreviewProvider {
	static var previews: some View {
		let countryUnionViewModel = UnionViewModel()
		countryUnionViewModel.loadData(fileName: "unions")
		return UnionListView()
			.environmentObject(countryUnionViewModel)
			.environmentObject(Router())
	}
}
