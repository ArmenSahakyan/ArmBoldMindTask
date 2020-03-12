//
//  User.swift
//  ArmBoldMindProject
//
//  Created by Armen Sahakyan on 3/10/20.
//  Copyright © 2020 ArmBoldMind Team. All rights reserved.
//

import Foundation

struct User: Codable {

    var id:                       Int?
    var email:                    String?
    var balance:                  Int?
    var fullName:                 String?
    var imageUrl:                 String?
    var taxNumber:                String?
    var companyName:              String?
    var dateOfBirth:              String?
    var phoneNumber:              String?
    var vehicleNumber:            String?
    var passportVerified:         Int?
    var userTypeEnumValue:        Int?
    var percentToNextLevel:       Int?
    var userGenderEnumValue:      Int?
    var userStatusEnumValue:      Int?
    var vehicleTypeEnumValue:     String?
    var sellerStatusEnumValue:    Int?
    var enableOrderNotification:  Int?
    var userAccountTypeEnumValue: Int?
    var enableGlobalNotification: Int?

    init(dict: [String: Any]) {
        
        self.id                       = dict["id"] as? Int
        self.email                    = dict["email"] as? String
        self.balance                  = dict["balance"] as? Int
        self.fullName                 = dict["fullName"] as? String
        self.imageUrl                 = dict["imageUrl"] as? String
        self.taxNumber                = dict["taxNumber"] as? String
        self.companyName              = dict["companyName"] as? String
        self.dateOfBirth              = dict["dateOfBirth"] as? String
        self.phoneNumber              = dict["phoneNumber"] as? String
        self.vehicleNumber            = dict["vehicleNumber"] as? String
        self.passportVerified         = dict["passportVerified"] as? Int
        self.userTypeEnumValue        = dict["userTypeEnumValue"] as? Int
        self.percentToNextLevel       = dict["percentToNextLevel"] as? Int
        self.userGenderEnumValue      = dict["userGenderEnumValue"] as? Int
        self.userStatusEnumValue      = dict["userStatusEnumValue"] as? Int
        self.vehicleTypeEnumValue     = dict["vehicleTypeEnumValue"] as? String
        self.sellerStatusEnumValue    = dict["sellerStatusEnumValue"] as? Int
        self.enableOrderNotification  = dict["enableOrderNotification"] as? Int
        self.enableGlobalNotification = dict["enableGlobalNotification"] as? Int
        self.userAccountTypeEnumValue = dict["userAccountTypeEnumValue"] as? Int

    }
}
