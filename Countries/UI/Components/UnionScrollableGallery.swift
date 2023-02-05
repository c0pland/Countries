//
//  RegionScrollableGallery.swift
//  Countries
//
//  Created by Богдан Беннер on 5.02.23.
//

import SwiftUI

struct UnionScrollableGallery: View {
	let unions: [CountryUnion]
    var body: some View {
		ScrollView(.horizontal, showsIndicators: false) {
					HStack(spacing: 20) {
						ForEach(unions, id: \.self) { union in
							CountryUnionCell(union: union)
						}
					}
				}
		.edgesIgnoringSafeArea(.horizontal)
    }
}

struct RegionScrollableGallery_Previews: PreviewProvider {
    static var previews: some View {
		let countryViewModel = CountryUnionViewModel()
		UnionScrollableGallery(unions: [countryViewModel.nato, countryViewModel.europeanUnion])
    }
}
