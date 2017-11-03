//
//  CommentViewController.swift
//  polipoli
//
//  Created by 村上真太朗 on 11/2/17.
//  Copyright © 2017 polipoli. All rights reserved.
//

import UIKit
import Firebase

class CommentViewController: UIViewController,UITextFieldDelegate,UINavigationControllerDelegate,
UITableViewDelegate,UITableViewDataSource{

    var commentItems = [NSDictionary]()
    var countGoodNum = Int()
    
    var numm = Int()
    
    var uid = Auth.auth().currentUser?.uid
    var post = [NSDictionary]()
    var ref: DatabaseReference = Database.database().reference(fromURL: "https://polipoli-a5a2f.firebaseio.com/")
    

    

    @IBOutlet weak var commentTableView: UITableView!
    
    let refreshControl = UIRefreshControl()
    
//    var nowtableViewComment = String()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        commentTableView.delegate = self
        commentTableView.dataSource = self
        refreshControl.attributedTitle = NSAttributedString(string: "引っ張って更新")
        refreshControl.addTarget(self, action:#selector(refresh), for:UIControlEvents.valueChanged)
        commentTableView.addSubview(refreshControl)
        
        commentItems = [NSDictionary]()
        loadAllData()
        commentTableView.reloadData()

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
//        if UserDefaults.standard.object(forKey: "login") != nil {
//
//        } else {
//            let loginViewController = self.storyboard?.instantiateViewController(withIdentifier: "loginView")
//            self.present(loginViewController!, animated: true, completion: nil)
//        }
        
        self.commentItems = [NSDictionary]()
        loadAllData()
        self.commentTableView.reloadData()
        self.refreshControl.endRefreshing()
        
        
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.commentItems.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.selectionStyle = UITableViewCellSelectionStyle.gray
        
        var numm = (indexPath as NSIndexPath).row
        
        let dict = commentItems[(indexPath as NSIndexPath).row]
       
        //コメント
        let commentTextView = cell.viewWithTag(1) as! UITextView
        commentTextView.text = dict["comment"] as? String
        //日時
        //        let dateLabel = cell.viewWithTag(5) as! UILabel
        //dateLabel.text = self.posts[indexPath.row].date
        //いいね
        let countGoodLabel = cell.viewWithTag(2) as! UILabel
        countGoodLabel.text = dict["goodCount"] as? String
        //いいねb
        let goodButton = cell.viewWithTag(3) as! UIButton
        goodButton.addTarget(self, action: Selector(("countUP")), for: .touchUpInside)
        
        func countUP() {
        }

        return cell
    }
    


    func loadAllData() {
        //ロード中にくるくるが回る
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        //取ってくる場所の指定
        let firebase = Database.database().reference().child("Posts")
        //最新のものN個とってくる
        firebase.queryLimited(toLast: 100).observe(.value) { (snapshot,error) in
            var tempItems = [NSDictionary]()
            for item in (snapshot.children) {
                let child = item as! DataSnapshot
                let dict = child.value
                tempItems.append(dict as! NSDictionary)
            }
            self.commentItems = tempItems
            self.commentItems = self.commentItems.reversed()
            self.commentTableView.reloadData()
            
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
        }
        
    }
    
    @objc func refresh(){
        commentItems = [NSDictionary]()
        loadAllData()
        commentTableView.reloadData()
        refreshControl.endRefreshing()
    }
    
//    @IBAction func back(_ sender: Any) {
//        dismiss(animated: true, completion: nil)
//    }
    

    @IBAction  func toEditComment(){
    performSegue(withIdentifier: "toComment", sender: nil)
    
    }
    


    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
