//
//  NetworkController.swift
//  Employee360
//
//  Created by Lohith Krishna Korupolu on 09/03/2018.
//  Copyright © 2018 Colruyt Group. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class NetworkController {
    func getEventsRequest(url: String, callback: @escaping (Result<[EventsList]>) -> ()) {
        
        Alamofire.request(url).validate().responseObject{ (responseData: DataResponse<Events>) in
            switch responseData.result {
            case .success(let events):
                
                if let eventsList = events.eventsList {
                    callback(.success(eventsList))
                }
                
            case .failure(let error):
                callback(.failure(error))
            }
        }
    }
    
    func getEmployeeDetailsRequest(url: String, callback: @escaping (Result<Employee>) -> ()) {
        Alamofire.request(url).validate().responseObject{ (responseData: DataResponse<Employee>) in
        switch responseData.result {
        case .success(let employeeDetails):
            
            callback(.success(employeeDetails))
            
        case .failure(let error):
            callback(.failure(error))
        }
    }
    }
    
}
