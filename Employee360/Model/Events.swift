//
//  Events.swift
//  Employee360
//
//  Created by Lohith Krishna Korupolu on 10/03/2018.
//  Copyright © 2018 Colruyt Group. All rights reserved.
//

import Foundation
import ObjectMapper

public enum Result<Value> {
    case success(Value)
    case failure(Error)
}

enum ServiceError {
    
    case configurationError(message: String)
    
    case general
    
    case errorMessage(message: String)
    
}

class Events: Mappable {
    var eventsList: [EventsList]?
    func mapping(map: Map) {
        eventsList <- map["eventsList"]
    }
    
    required init?(map: Map){
        mapping(map: map)
    }
}

class EventsList: Mappable {
    var description: String?
    var eventId: String?
    var title : String?
    
    func mapping(map: Map) {
        description <- map["description"]
        eventId <- map["eventId"]
        title <- map["title"]
    }
    
    required init?(map: Map){
        mapping(map: map)
    }
    
}



