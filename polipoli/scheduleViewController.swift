//
//  scheduleViewController.swift
//  polipoli
//
//  Created by 村上真太朗 on 11/7/17.
//  Copyright © 2017 polipoli. All rights reserved.
//

import UIKit
import Firebase

class scheduleViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var personNum = Int()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var eventItems = [NSDictionary]()
    
    var memberName = [String]()
    
    var memberNameString = [String]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .singleLine
        memberName = ["takahashi","sakashita","tanaka","murakoshi","koizumi"]
        nameLabel.text = memberNameString[personNum]
        //情報を取ってくる
        loadAllData()
    }

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.eventItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let dict = eventItems[(indexPath as NSIndexPath).row]

        //色々指定
        let whatLabel = cell.viewWithTag(1) as! UILabel
        whatLabel.text = dict["what"] as? String

        let whenLabel = cell.viewWithTag(2) as! UILabel
        whenLabel.text = dict["when"] as? String

        let whereLabel = cell.viewWithTag(3) as! UILabel
        whereLabel.text = dict["where"] as? String

        
        return cell
    }
    
    
    
    func loadAllData() {
        //ロード中にくるくるが回る
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        //取ってくる場所の指定
        let firebase = Database.database().reference().child("EventSchedule")
        
        firebase.child("\(self.memberName[self.personNum])").observeSingleEvent(of: .value) { (snapshot) in
            var tempItems = [NSDictionary]()
            for eventItem in (snapshot.children) {
                let child = eventItem as! DataSnapshot
                let dict = child.value
                tempItems.append(dict as! NSDictionary)
            }
            self.eventItems = tempItems
//          self.commentItems = self.commentItems.reversed()

            self.tableView.reloadData()
            
            UIApplication.shared.isNetworkActivityIndicatorVisible = false

        }
        UIApplication.shared.isNetworkActivityIndicatorVisible = false


    }

    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
