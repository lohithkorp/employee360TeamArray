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
        /*Alamofire.request(url).responseJSON { response in
            switch response.result {
            case .success:
                print(response)
                if let data = response.data {
                    let json = JSON(data: data) as Events
                    callback(json)
                }
                
                else {
                    callback("Empty Data" as AnyObject)
                }
                
            case .failure(let error):
                print("Error \(error)")
                completionHandler(error as AnyObject)
            }
        }*/
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
