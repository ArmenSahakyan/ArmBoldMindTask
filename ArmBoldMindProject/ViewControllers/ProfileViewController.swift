//
//  ProfileViewController.swift
//  ArmBoldMindProject
//
//  Created by Armen Sahakyan on 3/7/20.
//  Copyright © 2020 ArmBoldMind Team. All rights reserved.
//

import UIKit
import Alamofire
import Kingfisher

class ProfileViewController: UIViewController, CustomAlertProtocol ,UINavigationControllerDelegate, UIImagePickerControllerDelegate{

    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var nameButton: UIButton!
    @IBOutlet weak var genderButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var individualLabel: UILabel!
    @IBOutlet weak var birthDateButton: UIButton!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var personalInfoLabel: UILabel!
    @IBOutlet weak var saveChangesButton: UIButton!
    
    var imagePicker = UIImagePickerController()
    var imageData:Data?
    let afManager:AlamofireManager = AlamofireManager()
    var userInfoDict:[String:Any] = [
    "accountTypeEnumValue": 2,
    "companyName": "bfghfg",
    "dateOfBirth": 2,
    "fullName": "",
    "genderEnumValue": 2,
    "password": "password",
    "phoneNumber": "37495807672",
    "taxNumber": "no number",
    "userTypeEnumValue": 1,
    "vehicleNumber": "",
    "vehicleTypeEnumValue": 1]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CustomAlertViewController.sharedInstace = self
        self.userInfoButtonsStyle(button: nameButton)
        self.userInfoButtonsStyle(button: birthDateButton)
        self.userInfoButtonsStyle(button: genderButton)
        self.configViews()

    }
    func userInfoButtonsStyle(button:UIButton) {
        let customColor = UIColor(red:0.75, green:0.75, blue:0.75, alpha:1.0)
        button.backgroundColor = .clear
        button.layer.cornerRadius = 12
        button.layer.borderWidth = 1
        button.layer.borderColor = customColor.cgColor
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 19, bottom: 0, right: 0)
    }
    func configViews() {
        nameButton.setTitle(user.fullName, for: .normal)
        phoneNumberLabel.text = user.phoneNumber

        saveChangesButton.layer.cornerRadius = 12
        imageView.layer.cornerRadius = imageView.frame.height/2
        itemsStyle(view: headerView , radius: false)
        imageView.isUserInteractionEnabled = true
        let changeImageTap = UITapGestureRecognizer(target: self, action: #selector(profileImageTap))
        imageView.addGestureRecognizer(changeImageTap)
        let url = user.imageUrl
        guard let fileUrl = URL(string: url!) else { return  }
        KingfisherManager.shared.retrieveImage(with: fileUrl, options: nil, progressBlock: nil, completionHandler: { image, error, cacheType, imageURL in
            self.imageView.image = image
        })
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! CustomAlertViewController

        if (segue.identifier == "alertIDengerdentifier") {
            vc.titles = ["Male","Female"]
        }else if (segue.identifier == "photoSegueIdentifier") {
            vc.titles = ["Change picture","Delete picture"]
        }
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }

    @IBAction func backButtonTap(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func nameButtonTap(_ sender: Any) {
    }
    @IBAction func birthDateButtonTap(_ sender: Any) {
    }
    @IBAction func genderButtonTap(_ sender: Any) {
    }
    @IBAction func saveChangesButtonTap(_ sender: Any) {
     //   afManager.editUserInfoRequest(url: userUpdateInfo, parameters: userInfoDict)
    }
    @objc func profileImageTap() {
        self.performSegue(withIdentifier: "photoSegueIdentifier", sender: self)
    }
    
    func AlertButtonsTap(methodType:String) {
        
        switch methodType {
        case "Change picture":
            loadImage()
        case "Delete picture":
            loadImage()
        case "Male":
            genderButton.setTitle(methodType, for: .normal)
        case "Female":
            genderButton.setTitle(methodType, for: .normal)
        default:
            return
        }
    }
    
    func loadImage() {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
                imagePicker.delegate = self
                imagePicker.sourceType = .photoLibrary
                imagePicker.allowsEditing = false
                imagePicker.modalPresentationStyle = .fullScreen
                present(imagePicker, animated: true, completion: nil)
            }
        }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
          picker.dismiss(animated: true, completion: nil)
          guard let image = info[.originalImage] as? UIImage else {
              fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
          }
        imageView.image = image
        imageData  = image.jpegData(compressionQuality: 0.3)
        afManager.uploadImageRequest(url: uploadImageAddress, imageData: imageData)
      }
}
