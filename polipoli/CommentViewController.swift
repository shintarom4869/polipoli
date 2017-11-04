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
    
    var roomNum = Int()

    var commentItems = [NSDictionary]()
    var countGoodNum = Int()
    
    var uid = Auth.auth().currentUser?.uid
    var ref: DatabaseReference = Database.database().reference(fromURL: "https://polipoli-a5a2f.firebaseio.com/")
    

    var key = String()
    var keyArray = [String]()

    var countUPButton = UIButton()
    

    @IBOutlet weak var commentTableView: UITableView!
    
    let refreshControl = UIRefreshControl()
    
    
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as UITableViewCell
        cell.selectionStyle = UITableViewCellSelectionStyle.gray
        
        let dict = commentItems[(indexPath as NSIndexPath).row]
       
        //コメント
        let commentTextView = cell.viewWithTag(1) as! UITextView
        commentTextView.text = dict["comment"] as? String
        
        //いいね
        let countGoodLabel = cell.viewWithTag(2) as! UILabel
        let option = String(describing: dict["goodCount"])
        let da = option.substring(from: option.index(option.startIndex, offsetBy: 9))
        let go = da.substring(to: da.index(before: da.endIndex))
        countGoodLabel.text = go
        countGoodLabel.textColor = UIColor.red
        
        //いいね!ボタン
        self.countUPButton = cell.viewWithTag(3) as! UIButton
        self.countUPButton.addTarget(self, action: #selector(countUP), for: .touchUpInside)
        
        return cell
    }
    
    //いいねを押した時
    @objc func countUP(sender: UIButton) {
        //row番目のセルのボタンが押された
        let cell = sender.superview?.superview as! UITableViewCell
        let row = commentTableView.indexPath(for: cell)!.row
        print("cell: \(row)")
        //押したボタンのpostkeyをとる
        let dict = self.commentItems[row]
        let key = dict["autoID"] as! String
        print("autoID:\(key)")
        
        let firebase = Database.database().reference().child("Posts\(self.roomNum)")
        firebase.child("\(key)").runTransactionBlock ({ (currentData) -> TransactionResult in
            if var post = currentData.value as? [String : AnyObject] {
                var starCount = post["goodCount"] as? Int ?? 0
                starCount += 1
                post["goodCount"] = starCount as AnyObject?
                print("いいね:\(starCount)")
                // Set value and report transaction success
                currentData.value = post
                return TransactionResult.success(withValue: currentData)
            }

            return TransactionResult.success(withValue: currentData)

        }) { (error, isCommitted, snapshot) in
            if let error = error {
                print(error.localizedDescription)
            }
            //goodCountにアクセス、セルに送信？
            
            //リロード
            self.commentTableView.reloadData()
        }

    }
    
    // 更新
   func loadAllData() {
        //ロード中にくるくるが回る
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        //取ってくる場所の指定
        let firebase = Database.database().reference().child("Posts\(self.roomNum)")
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
    //引っ張って更新
    @objc func refresh(){
        commentItems = [NSDictionary]()
        loadAllData()
        commentTableView.reloadData()
        refreshControl.endRefreshing()
    }

    @IBAction  func toEditComment(){
    performSegue(withIdentifier: "toEditComment", sender: nil)
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toEditComment" {
            let postCommentVC:PostCommentViewController = segue.destination as! PostCommentViewController
            postCommentVC.roomNumm = self.roomNum
        }
    }
    


    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
