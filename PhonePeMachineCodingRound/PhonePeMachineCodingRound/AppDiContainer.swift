//
//  AppDiContainer.swift
//  PhonePeMachineCodingRound
//
//  Created by Ankur  on 16/12/23.
//

import Foundation

var globalHeaders : [String:String] = [:]


@objc
public class AppDIContainer : NSObject {
	var apiDataNetworkConfig : ApiDataNetworkConfig?
	lazy var appConfiguration = AppConfiguration()
	
	/// api failure interceptor closure for api's giving error code other than 200 to 299
	///
	///
	/// - Parameters:
	///     - apiFailureResponse: Server api failure response
	///     - statusCode: api status code
	///     - isErrorHandlingBeingDoneByClient: Signifies whether client is handling the error using api failure block
	var apiFailureInterceptor : (_ apiFailureResponse : Any?,_ statusCode : Int, _ isErrorHandlingBeingDoneByClient: Bool, _ urlRequest : URLRequest?) -> () = { apiFailureResponse,statusCode,isErrorHandlingBeingDoneByClient,urlRequest in
	}
	
	var networkAndOtherErrorIntercepter : ((DataTransferError, Bool, URLRequest?) -> ()) = { error, isErrorHandlingBeingDoneByClient, urlRequest in
		
	}
	
	lazy var apiDataTransferService: DataTransferService = {
		apiDataNetworkConfig = ApiDataNetworkConfig(baseURL: URL(string: appConfiguration.apiBaseURL)!,
													headers: globalHeaders,
													queryParameters: [:])
		let apiDataNetwork = DefaultNetworkService(config: apiDataNetworkConfig!)
		return DefaultDataTransferService(with: apiDataNetwork, apiFailureInterceptor: apiFailureInterceptor, networkAndOtherErrorIntercepter: networkAndOtherErrorIntercepter)
	}()
	
}
