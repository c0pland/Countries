import Foundation

struct Name: Codable {
	let common: String
	let official: String
}

struct Currency: Codable {
	let name: String
	let symbol: String
}

struct Country: Codable, Identifiable {
	var id: String { cca3 }
	let name: Name
	let tld: [String]
	let cca2: String
	let ccn3: String
	let cca3: String
	let independent: Bool?
	let status: String
	let unMember: Bool
	let currencies: [String: Currency]
	let capital: [String]
	let altSpellings: [String]
	let region: String
	let subregion: String
	let languages: [String: String]
	let latlng: [Double]
	let landlocked: Bool
	let borders: [String]
	let area: Double
	let flag: String
}
