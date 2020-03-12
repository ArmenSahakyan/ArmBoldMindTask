//
//  ApiUrls.swift
//  ArmBoldMindProject
//
//  Created by Armen Sahakyan on 3/10/20.
//  Copyright © 2020 ArmBoldMind Team. All rights reserved.
//

import Foundation

let addressBase: String           = "https://api.tapon.am/api/"
let loginAddress: String          = addressBase + "/auth/signIn" //post
let userUpdateInfo: String        = addressBase + "/user" //put
let uploadImageAddress:String     = addressBase + "/user/uploadImage" //post
let getUserDetalisAddress:String  = addressBase + "/user/getUserDetails" //get
