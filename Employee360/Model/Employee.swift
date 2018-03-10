//
//  Employee.swift
//  Employee360
//
//  Created by Lohith Krishna Korupolu on 10/03/2018.
//  Copyright © 2018 Colruyt Group. All rights reserved.
//

import Foundation
import ObjectMapper

class Employee: Mappable {
    
    var employeeList: [EmployeeDetails]?
    func mapping(map: Map) {
        employeeList <- map["employeeList"]
    }
    
    required init?(map: Map){
        mapping(map: map)
    }
}

class EmployeeDetails: Mappable {
    var address: String?
    var empId: String?
    var isManager: Bool?
    var manager: String?
    var mobileNumber: String?
    var name: String?
    var password: String?
    var professionalExperience: String?
    var qualification : String?
    var role: String?
    
    func mapping(map: Map) {
        address <- map["address"]
        empId <- map["empId"]
        isManager <- map["isManager"]
        manager <- map["manager"]
        mobileNumber <- map["mobileNumber"]
        name <- map["name"]
        password <- map["password"]
        professionalExperience <- map["professionalExperience"]
        qualification <- map["qualification"]
        role <- map["role"]
    }
    
    required init?(map: Map){
        mapping(map: map)
    }
}
