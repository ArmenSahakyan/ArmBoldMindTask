//
//  AlamofireManager.swift
//  ArmBoldMindProject
//
//  Created by Armen Sahakyan on 3/10/20.
//  Copyright © 2020 ArmBoldMind Team. All rights reserved.
//

import Foundation
import Alamofire

class AlamofireManager: NSObject {
    
    internal typealias RequestCompletion = (Int?, Error?) -> ()?
    private var completionBlock: RequestCompletion!
    var afManager : SessionManager!
    static var sharedInstace : LoginProtocol?

    func loginRequest(url :String, parameters:[String:Any]) {
        
        let dicton:[String: String] = ["Model": "new model"]
        let headersLogin:Login = Login(dict: dicton)
        let headers : HTTPHeaders = convertDictionary(data: headersLogin)
      //  let jsonData = try? JSONSerialization.data(withJSONObject: headersDict, options: [])
     //   let headers = String(data: jsonData!, encoding: .utf8)
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default , headers: headers).responseJSON { response in switch response.result {
            case .success(let jsonData):
                // loginSuccessData = try? JSONDecoder().decode(LoginSuccess.self, from: jsonData as! Data )
                let response = jsonData as! NSDictionary
                let userId = response.object(forKey: "data")
            //    let loginSuccess = LoginSuccess(dict: response as! [String : Any])

                let respSuccess:Int = response.object(forKey: "success") as! Int
                if respSuccess == 1 {
                    let dataResponse = userId as! NSDictionary
                    let tokenStr = dataResponse.object(forKey: "token") as? String
                    token = "Bearer " + tokenStr!
                    self.getProfile()
                }else {
                    AlamofireManager.sharedInstace?.loginSuccess()
            }
            case .failure(let error):
                print("error: \(error)")
            }
        }
    }
    
    func getProfile() {
        let headers : HTTPHeaders = ["Authorization": token]
        
        Alamofire.request(getUserDetalisAddress, method: .get, encoding: JSONEncoding.default , headers:headers).responseJSON { response in switch response.result {
            case .success(let jsonData):
                let response = jsonData as! NSDictionary
                let respSuccess:Int = response.object(forKey: "success") as! Int
                let userDictinary = jsonData as! NSDictionary
                let userDataDictinary = userDictinary.object(forKey: "data")
                user = User(dict: userDataDictinary as! [String : Any])
                print(user.imageUrl!)
                AlamofireManager.sharedInstace?.autorizationSuccess(success: respSuccess)
                print(jsonData)

            case .failure(let error):
                print("error: \(error)")
            }
        }
    }
    func editUserInfoRequest(url :String,parameters:[String:Any]){
        let headers : HTTPHeaders = ["Authorization": token]
        
        Alamofire.request(url, method: .put,parameters: parameters, encoding: JSONEncoding.default , headers:headers).responseJSON { response in switch response.result {
                   case .success(let jsonData):
                      // let response = jsonData as! NSDictionary
                     //  let respSuccess:Int = response.object(forKey: "success") as! Int
                       let userDictinary = jsonData as! NSDictionary
                       let userDataDictinary = userDictinary.object(forKey: "data")
                       user = User(dict: userDataDictinary as! [String : Any])
                   case .failure(let error):
                       print("error: \(error)")
            }
        }
    }
    func uploadImageRequest(url :String,imageData:Data!){
        let headers : HTTPHeaders = ["Authorization": token]
        
        Alamofire.upload(multipartFormData: { multipartFormData in
                
                multipartFormData.append(imageData!, withName: "profilepic",fileName: "profilepic.jpeg", mimeType: "image/jpeg")
    
            },
                         usingThreshold: UInt64.init(),   to:url, method: .post , headers: headers)
            { (result) in
                switch result {
                case .success(let upload, _, _):
                    upload.responseJSON { response in
                        print(response)
                        if (response.error != nil){
                            return
                        }else {
                            print("Succesfully uploaded")
                        }
                    }
                case .failure(let encodingError):
                    print(encodingError)
            }
        }
    }
    
    func convertDictionary(data: Login) -> [String : String]  {
        let  dictionary = [
            "Model" : data.model,
            "OsTypeId" : data.osTypeId,
            "LanguageName" : data.languageName,
            "DeviceId" : data.deviceId,
            "DeviceToken" : data.deviceToken,
            ]
    return dictionary as! [String : String]
    }
}
