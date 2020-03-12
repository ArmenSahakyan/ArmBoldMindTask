//
//  Login.swift
//  ArmBoldMindProject
//
//  Created by Armen Sahakyan on 3/8/20.
//  Copyright © 2020 ArmBoldMind Team. All rights reserved.
//

import Foundation

struct Login: Codable {
    
    var model:        String?
    var password:     String?
    var deviceId:     String?
    var osTypeId:     String?
    var userPhone:    String?
    var deviceToken:  String?
    var languageName: String?
    
    init(dict: [String: String])
    {
        self.model        = dict["Model"] ?? "parameter1"
        self.deviceId     = dict["DeviceId"] ?? "paramerter2"
        self.osTypeId     = dict["OsTypeId"] ?? "1"
        self.deviceToken  = dict["DeviceToken"] ?? "paramerter3"
        self.languageName = dict["LanguageName"] ?? "hy"

        }
    
//    private enum CodingKeys: String, CodingKey {
//        case model        = "Model"
//        case accept
//        case password
//        case deviceId     = "DeviceId"
//        case osTypeId     = "OsTypeId"
//        case userPhone    = "phoneNumber"
//        case deviceToken  = "DeviceToken"
//        case contentType  = "Content-Type"
//        case languageName = "LanguageName"
//    }
}
