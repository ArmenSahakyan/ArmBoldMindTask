//
//  HomeViewController.swift
//  ArmBoldMindProject
//
//  Created by Armen Sahakyan on 3/7/20.
//  Copyright © 2020 ArmBoldMind Team. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var menuHeaderView: UIView!
    @IBOutlet weak var moneyLabel: UILabel!
    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var donateButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var footerView: UIView!
    @IBOutlet weak var footerLeftButton: UIButton!
    @IBOutlet weak var footerCentralButton: UIButton!
    @IBOutlet weak var footerRightButton: UIButton!
    @IBOutlet weak var userView: UIView!
    @IBOutlet weak var historyView: UIView!
    @IBOutlet weak var notificationsView: UIView!
    
   // weak var btnImageView: CustomButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName: "ComradesTableViewCell", bundle: nil), forCellReuseIdentifier: "ongoingCellID")
        tableView.register(UINib(nibName: "OngoingTableViewCell", bundle: nil), forCellReuseIdentifier: "ongoingCellTitle")

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.configViews()
    }

    func configViews() {
        
        tableView.allowsSelection = false
        self.menuHeaderView.setupBackground()
        itemsStyle(view: menuView)
        itemsStyle(view: footerCentralButton, shadowColor: Theme.Colors.greenButtonColor)

        footerView.layer.cornerRadius = 20
        footerView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        footerView.layer.shadowColor = UIColor.black.cgColor
        footerView.layer.shadowOffset = Theme.Sizes.shadow
        footerView.layer.shadowRadius = 3
        footerView.layer.shadowOpacity = 0.3
        footerCentralButton.layer.cornerRadius = footerCentralButton.frame.height/2
        donateButton.layer.cornerRadius = 6
        
        let userTap = UITapGestureRecognizer(target: self, action: #selector(profileTap))
        userView.addGestureRecognizer(userTap)
        let historyTaped = UITapGestureRecognizer(target: self, action: #selector(historyTap))
        historyView.addGestureRecognizer(historyTaped)
        let notificationsTaped = UITapGestureRecognizer(target: self, action: #selector(self.notificationsTap))
        notificationsView.addGestureRecognizer(notificationsTaped)

    }
    
    // MARK: - TableView

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ongoingCellTitle", for: indexPath) as! OngoingTableViewCell

                   return cell
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ongoingCellID", for: indexPath) as! ComradesTableViewCell

        return cell
        }
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.alpha = 0
        
        UIView.animate(
            withDuration: 0.5,
            delay: 0.05 * Double(indexPath.row),
            animations: {
                cell.alpha = 1
        })
    }
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        if indexPath.row == 0 {
//            return 150.0
//        }else {
//            return 180
//        }
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func donateButtonTap(_ sender: Any) {
    }
    @IBAction func footerLeftButtonTap(_ sender: Any) {
    }
    @IBAction func footerCentralButtonTap(_ sender: Any) {
    }
    @IBAction func footerRightButtonTap(_ sender: Any) {
    }
    @objc func profileTap() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let secondVC = storyboard.instantiateViewController(identifier: "profileIdentifier")
        show(secondVC, sender: self)

    }
    @objc func historyTap() {
    }
    @objc func notificationsTap() {
    }
    
}
