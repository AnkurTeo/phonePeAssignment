//
//  Venue.swift
//  PhonePeMachineCodingRound
//
//  Created by Ankur  on 16/12/23.
//

import Foundation

struct VenueResponseModel: Codable {
	var venues : [Venue]?
}

struct Venue: Codable {
	let nameV2, name: String?
	let url: String?
	let score: Int?
	let location: Location?
	let country: String?
	let hasUpcomingEvents: Bool?
	let numUpcomingEvents: Int?
	let city, slug, extendedAddress: String?
	let stats: Stats?
	let id, popularity, metroCode, capacity: Int?
	let displayLocation: String?
	
	enum CodingKeys: String, CodingKey {
		case nameV2 = "name_v2"
		case name, url, score, location, country
		case hasUpcomingEvents = "has_upcoming_events"
		case numUpcomingEvents = "num_upcoming_events"
		case city, slug
		case extendedAddress = "extended_address"
		case stats, id, popularity
		case metroCode = "metro_code"
		case capacity
		case displayLocation = "display_location"
	}
}

// MARK: - Location
struct Location: Codable {
	let lat, lon: Double
}

// MARK: - Stats
struct Stats: Codable {
	let eventCount: Int
	
	enum CodingKeys: String, CodingKey {
		case eventCount = "event_count"
	}
}
