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
    
    func getEmployeeDetailsRequest(url: String, callback: @escaping (Result<[EmployeeDetails]>) -> ()) {
        Alamofire.request(url).validate().responseObject{ (responseData: DataResponse<Employee>) in
            switch responseData.result {
            case .success(let employee):
                if let employeeDetails = employee.employeeList {
                    callback(.success(employeeDetails))
                }
                
            case .failure(let error):
                callback(.failure(error))
            }
        }
    }
    
    func getPdfFile(url: String, callback: @escaping (Result<Data>) -> ()) {
        
        var myRequest = URLRequest(url: URL(string: url)!)
        myRequest.httpMethod = "GET"
        myRequest.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        
        Alamofire.request(myRequest).responseData { response in
            switch response.result {
            case .success(let fileData):
                print("\(fileData)")
                callback(.success(fileData))
            case .failure(let error):
                callback(.failure(error))
            }
        }
    }
}
