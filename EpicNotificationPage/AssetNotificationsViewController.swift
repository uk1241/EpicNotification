//
//  AssetNotificationsViewController.swift
//  EpicNotificationPage
//
//  Created by R.Unnikrishnan on 13/04/23.
//

import UIKit
//structre for tableview scetion and the corressponding data
class NnotificationSections {
   var dates: String?
   var data: [String]?
    var colors: [UIColor] = []
     
    init(notificationDates: String, notificationData: [String], notificationStatus :[UIColor]) {
       self.dates = notificationDates
       self.data = notificationData
       self.colors = notificationStatus
   }
}

class AssetNotification: UIViewController {
    
    
    @IBOutlet weak var notificationTableView: UITableView!
    
    var notificationSectionArray = [NnotificationSections]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        notificationTableView.dataSource = self
        notificationTableView.delegate = self
        notificationTableView.rowHeight = UITableView.automaticDimension
        notificationTableView.estimatedRowHeight = 75
        
        
        //appending the struct to the array
        //section1
        notificationSectionArray.append(NnotificationSections.init(notificationDates: "Today", notificationData: ["Akhil Raj return 3 quantity new asset for Monitor","Lydia Young requested to confirm of existing asset for Mac Book Pro"],notificationStatus: [UIColor.green,UIColor.blue]))
        
        //section2
        notificationSectionArray.append(NnotificationSections.init(notificationDates: "13-18th Jan2020", notificationData: ["Lydia Young requested new asset for Monitor","Arham Jackson requested maintance asset for MacBook Pro"],notificationStatus: [UIColor.blue,UIColor.yellow]))
        
      //section3
        notificationSectionArray.append(NnotificationSections.init(notificationDates: "20-24th Jan2020", notificationData: ["Akhil Raj return 3 quantity new asset for Monitor","Lydia Young requested to confirm of existing asset for Mac Book Pro"],notificationStatus: [UIColor.orange,UIColor.yellow]))

    }


}

extension AssetNotification : UITableViewDelegate,UITableViewDataSource
{
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return notificationSectionArray.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return notificationSectionArray[section].data?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AssetNotificationTableViewCell", for: indexPath) as! AssetNotificationTableViewCell
        cell.notificationLabel?.text = notificationSectionArray[indexPath.section].data?[indexPath.row]
        cell.statusView.backgroundColor = notificationSectionArray[indexPath.section].colors[indexPath.row]
        cell.notificationLabel.sizeToFit()
         return cell
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return notificationSectionArray[section].dates
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return UITableView.automaticDimension
        }
    
    
}

