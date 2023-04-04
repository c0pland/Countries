//
//  Router.swift
//  Countries
//
//  Created by Богдан Беннер on 27.03.23.
//

import Foundation
import SwiftUI

final class Router: ObservableObject {
	@Published var countriesPath = NavigationPath()
	@Published var unionsPath = NavigationPath()
	@Published var favoritesPath = NavigationPath()
	@Published var selectedTab = 0
	@Published var navigationTitle = "Countries"
}
