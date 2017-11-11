//
//  Event1ViewController.swift
//  polipoli
//
//  Created by 村上真太朗 on 11/1/17.
//  Copyright © 2017 polipoli. All rights reserved.
//

import UIKit
import Firebase

class Event1ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    
    var questionItems = [NSDictionary]()
    
    //セルの番号を入れる
    var num = Int()


    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self

        //questionItemsに問題を入れる
        loadAllData()
        
    }

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.questionItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.selectionStyle = UITableViewCellSelectionStyle.gray
                
        let dict = questionItems[(indexPath as NSIndexPath).row]

        let mondaiLabel = cell.viewWithTag(1) as! UILabel
        
        mondaiLabel.text = dict["question"] as? String
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.num = (indexPath as NSIndexPath).row

        print(self.num)

        performSegue(withIdentifier: "toAnswers", sender: nil)
    }
    
    func loadAllData() {
        //ロード中にくるくるが回る
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        //取ってくる場所の指定
        let firebase = Database.database().reference().child("Question")
        
        firebase.observeSingleEvent(of: .value) { (snapshot) in
            var tempItems = [NSDictionary]()
            for eventItem in (snapshot.children) {
                let child = eventItem as! DataSnapshot
                let dict = child.value
                tempItems.append(dict as! NSDictionary)
            }
            self.questionItems = tempItems
            //          self.commentItems = self.commentItems.reversed()
            
            self.tableView.reloadData()
            
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toAnswers" {
            let answerListVC: answerListViewController = segue.destination as! answerListViewController
            answerListVC.answerNum = self.num
            answerListVC.answerItems = self.questionItems
        }
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
