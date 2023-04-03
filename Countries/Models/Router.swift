//
//  Router.swift
//  Countries
//
//  Created by Богдан Беннер on 27.03.23.
//

import Foundation
import SwiftUI

final class Router: ObservableObject {
	static let shared = Router()
	@Published var selectedTab = 0
	@Published var path = NavigationPath()
}
