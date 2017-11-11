//
//  Event3ViewController.swift
//  polipoli
//
//  Created by 村上真太朗 on 11/1/17.
//  Copyright © 2017 polipoli. All rights reserved.
//

import UIKit
import Firebase

class Event3ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    
    var member = [String]()
    
    var memberFaceIcons = [String]()
    
    var num = Int()

    var ref: DatabaseReference = Database.database().reference(fromURL: "https://polipoli-a5a2f.firebaseio.com/")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(self.member.count)
        return self.member.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.selectionStyle = UITableViewCellSelectionStyle.gray
        
        let eventLabel = cell.viewWithTag(1) as! UILabel
        eventLabel.text = member[indexPath.row]
        
        let seizikaIconImage = cell.viewWithTag(2) as! UIImageView
        seizikaIconImage.image = UIImage(named: self.memberFaceIcons[indexPath.row])
        
        return cell
    }
    
    //セルをさわった時、遷移
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        num = (indexPath as NSIndexPath).row

        performSegue(withIdentifier: "toSchedule", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // 処理を実行したいsegueを指定
        if segue.identifier == "toSchedule" {
//            let nextViewController: scheduleViewController = segue.destination as! scheduleViewController
            let nextVC:scheduleViewController = segue.destination as! scheduleViewController
            nextVC.personNum = self.num
            nextVC.memberNameString = self.member
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
