//
//  VenuesInteractorProtocol.swift
//  PhonePeMachineCodingRound
//
//  Created by Ankur  on 16/12/23.
//

import Foundation


protocol VenuesInteractorProtocol  {
	@discardableResult
	func getVenues(venueRequestModel: VenueRequestModel, apiSuccess: @escaping (VenueResponseModel) -> (), apiFailure: (([String : Any]) -> ())?, otherError: ((Error) -> ())?) -> NetworkCancellable?
	
	var venuesNetworkService : VenuesNetworkService { get set }
}


class VenuesInteractor : VenuesInteractorProtocol {
	var venuesNetworkService: VenuesNetworkService
	init(venuesNetworkService: VenuesNetworkService) {
		self.venuesNetworkService = venuesNetworkService
	}
	
	func getVenues(venueRequestModel: VenueRequestModel, apiSuccess: @escaping (VenueResponseModel) -> (), apiFailure: (([String : Any]) -> ())?, otherError: ((Error) -> ())?) -> NetworkCancellable? {
		return venuesNetworkService.getVenues(venueRequestModel: venueRequestModel, apiSuccess: apiSuccess, apiFailure: apiFailure, otherError: otherError)
	}
	
}
