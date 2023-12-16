//
//  VenuesNetworkServiceProtocol.swift
//  PhonePeMachineCodingRound
//
//  Created by Ankur  on 16/12/23.
//

import Foundation

protocol VenuesNetworkServiceProtocol {
	func getVenues(venueRequestModel : VenueRequestModel, apiSuccess : @escaping (VenueResponseModel) -> (), apiFailure : (([String:Any]) -> ())?, otherError : ((Error) -> ())? ) -> NetworkCancellable?
}
