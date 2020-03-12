//
//  User.swift
//  ArmBoldMindProject
//
//  Created by Armen Sahakyan on 3/10/20.
//  Copyright © 2020 ArmBoldMind Team. All rights reserved.
//

import Foundation

    struct LoginSuccess: Codable {
        let data: String?
        let message: String?
        let success: Int
        
        init(dict: [String: Any])
          {
            self.data    = dict["data"] as? String
            self.message = dict["message"] as? String
            self.success = dict["success"] as? Int ?? 0
        }

    private enum CodingKeys: String, CodingKey {
        case data,message,success
    }
}
