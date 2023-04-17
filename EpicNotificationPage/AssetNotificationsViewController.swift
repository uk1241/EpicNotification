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
        notificationTableView.sizeToFit()
        
        
        //appending the struct to the array
        //section1
        notificationSectionArray.append(NnotificationSections.init(notificationDates: "Today", notificationData: ["Name return 3 quantity new asset for Monitor","Name requested to confirm of existing asset for Mac Book Pro"],notificationStatus: [UIColor.green,UIColor.blue]))
        
        //section2
        notificationSectionArray.append(NnotificationSections.init(notificationDates: "13-18th Jan2020", notificationData: ["Name requested new asset for Monitor","Name requested maintance asset for MacBook Pro"],notificationStatus: [UIColor.blue,UIColor.yellow]))
        
      //section3
        notificationSectionArray.append(NnotificationSections.init(notificationDates: "20-24th Jan2020", notificationData: ["Name return 3 quantity new asset for Monitor","Name requested to confirm of existing asset for Mac Book Pro"],notificationStatus: [UIColor.orange,UIColor.yellow]))

    }
    
    func makeNumbersBlue(in string: String) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: string)
        let pattern = "\\d+"
        let regex = try! NSRegularExpression(pattern: pattern, options: [])
        let matches = regex.matches(in: string, options: [], range: NSRange(location: 0, length: string.utf16.count))
        for match in matches {
            let range = match.range
            attributedString.addAttribute(.foregroundColor, value: UIColor.blue, range: range)
        }
        return attributedString
    }
    
    func colorFirstElementBlue(in array: [String]) -> [NSAttributedString] {
        var attributedArray: [NSAttributedString] = []
        
        // Loop through each string in the array
        for (index, string) in array.enumerated() {
            let attributedString = NSMutableAttributedString(string: string)
            
            // If it's the first string, color it blue
            if index == 0 {
                attributedString.addAttribute(.foregroundColor, value: UIColor.blue, range: NSRange(location: 0, length: string.count))
            }
            
            attributedArray.append(attributedString)
        }
        
        return attributedArray
    }

    func highlightNames(in array: [String]) -> [NSAttributedString] {
        let blueAttributes: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.blue]
        let normalAttributes: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.black]

        return array.map { string in
            if string.hasPrefix("Name") {
                let attributedString = NSMutableAttributedString(string: string, attributes: blueAttributes)
                attributedString.addAttributes(normalAttributes, range: NSRange(location: 0, length: 4)) // Sets the "Name" portion of the string to black
                return attributedString
            } else {
                return NSAttributedString(string: string, attributes: normalAttributes)
            }
        }
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
        
        let string = notificationSectionArray[indexPath.section].data?[indexPath.row]
        let attributedString = makeNumbersBlue(in: string!)
   
        cell.notificationLabel.attributedText = attributedString
        cell.notificationLabel.sizeToFit()
        cell.sizeToFit()
        let stringTwo = notificationSectionArray[indexPath.section].data?[indexPath.row]
        let attributedStringTwo = highlightNames(in: [stringTwo ?? ""])
        
   
//    Œ
        
        

        cell.statusView.backgroundColor = notificationSectionArray[indexPath.section].colors[indexPath.row]
        cell.notificationLabel.sizeToFit()
        
           let formatter = DateFormatter()
           formatter.timeStyle = .short
           let currentTime = Date()
           let timeString = formatter.string(from: currentTime)
            cell.dateLabel.text = timeString
        
         return cell
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return notificationSectionArray[section].dates
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return UITableView.automaticDimension
        }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        
        
        let titleLabel = UILabel()
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        titleLabel.textColor = .black
        titleLabel.text = self.tableView(tableView, titleForHeaderInSection: section)
        titleLabel.sizeToFit()
        headerView.addSubview(titleLabel)
        
        return headerView
    }
    
}

