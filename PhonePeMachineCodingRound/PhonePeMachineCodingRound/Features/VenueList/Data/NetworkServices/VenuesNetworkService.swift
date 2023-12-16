//
//  VenuesNetworkService.swift
//  PhonePeMachineCodingRound
//
//  Created by Ankur  on 16/12/23.
//

import Foundation

class VenuesNetworkService : VenuesNetworkServiceProtocol {

	var dataTransferService : DataTransferService
	init(dataTransferService : DataTransferService) {
		self.dataTransferService = dataTransferService
	}
	
	func getVenues(venueRequestModel: VenueRequestModel, apiSuccess: @escaping (VenueResponseModel) -> (), apiFailure: (([String : Any]) -> ())?, otherError: ((Error) -> ())?) -> NetworkCancellable? {
		let endPoint = VenueEndpoints.getVenues(with: venueRequestModel)
		return dataTransferService.request(with: endPoint, apiSuccess: apiSuccess, apiFailure: apiFailure, otherError: otherError)
		
	}
}
