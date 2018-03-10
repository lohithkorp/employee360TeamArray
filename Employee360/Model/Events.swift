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

class Employee: Mappable {
    var employeeId: String?
    var employeeName: String?
    var qualification : String?
    var totalexperience: String?
    var organaigationexp: String?
    
    func mapping(map: Map) {
        employeeId <- map["employeeId"]
        employeeName <- map["employeeName"]
        qualification <- map["qualification"]
        totalexperience <- map["totalexperience"]
        organaigationexp <- map["organaigationexp"]
    }
    
    required init?(map: Map){
        mapping(map: map)
    }
}

