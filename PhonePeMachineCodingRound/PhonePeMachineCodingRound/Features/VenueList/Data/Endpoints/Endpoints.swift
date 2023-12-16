//
//  VenuEndPoints.swift
//  PhonePeMachineCodingRound
//
//  Created by Ankur  on 16/12/23.
//

import Foundation


struct VenueEndpoints {
		
	static func getVenues(with venueRequestModel : VenueRequestModel) -> Endpoint<VenueResponseModel> {
		return Endpoint(path: "/2/venues",
						method: .get,
						domain: Domains.api,
						queryParametersEncodable: venueRequestModel)
	}
	
}
