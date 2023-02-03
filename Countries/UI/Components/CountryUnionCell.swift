//
//  CountryUnionCell.swift
//  Countries
//
//  Created by Богдан Беннер on 3.02.23.
//

import SwiftUI

struct CountryUnionCell: View {
	let union: CountryUnion
    var body: some View {
		ZStack {
			RoundedRectangle(cornerRadius: 10)
				.fill(Color.blue)
			HStack {
				Image(union.abbreviation.lowercased())
					.resizable()
					.scaledToFit()
				Text(union.abbreviation)
					.font(.title3)
					.bold()
					.foregroundColor(.white)
			}
			.padding()
		}
		.frame(width: 200, height: 80)
    }
}

struct CountryUnionCell_Previews: PreviewProvider {
    static var previews: some View {
		CountryUnionCell(union: CountryUnionViewModel().nato)
    }
}
