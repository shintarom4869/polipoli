//
//  QAViewController.swift
//  polipoli
//
//  Created by 村上真太朗 on 11/6/17.
//  Copyright © 2017 polipoli. All rights reserved.
//

import UIKit
import Firebase

class QAViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var qARoomNum = Int()

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var QAItems = [NSDictionary]()
    
//    var answerMember = [String]()
    
    
    let answerMember = ["toTakahashi","toSakashita","toTanaka","toMurakoshi","toKoizumi"]

    let labelText = ["高橋 良平さんに対するQ&A","坂下 しげきさんに対するQ&A","田中 甲さんに対するQ&A","村越 ひろたみさんに対するQ&A","小泉 文人さんに対するQ&A"]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
        loadAllData()
        nameLabel.text = labelText[qARoomNum]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.QAItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let dict = QAItems[(indexPath as NSIndexPath).row]
        
        //色々指定
        let questionTextField = cell.viewWithTag(1) as! UITextView
        questionTextField.text = dict["question"] as? String
        
        let answerTextField = cell.viewWithTag(2) as! UITextView
        answerTextField.text = dict["answer"] as? String
        
        return cell
    }
    
    func loadAllData() {
        //ロード中にくるくるが回る
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        //取ってくる場所の指定
        let firebase = Database.database().reference().child("QA")
        firebase.child(self.answerMember[self.qARoomNum]).observeSingleEvent(of: .value) { (snapshot) in
            var tempItems = [NSDictionary]()
            for QAItem in (snapshot.children) {
                let child = QAItem as! DataSnapshot
                let dict = child.value
                tempItems.append(dict as! NSDictionary)
            }
            self.QAItems = tempItems
//          self.commentItems = self.commentItems.reversed()
            
            self.tableView.reloadData()
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            
        }
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
