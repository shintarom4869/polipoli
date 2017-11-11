//
//  Detail2ViewController.swift
//  polipoli
//
//  Created by 村上真太朗 on 11/1/17.
//  Copyright © 2017 polipoli. All rights reserved.
//

import UIKit
import Firebase

class movieDetailViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    var personNum = Int()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var eventItems = [NSDictionary]()
    
    let memberName = ["takahashi","sakashita","tanaka","murakoshi","koizumi"]
    
    let name = ["高橋 涼平","坂下 しげき","田中 甲","村越 ひろたみ","小泉 文人"]

    var memberNameString = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .singleLine
        nameLabel.text = name[personNum]+"さんの動画一覧"
        //情報を取ってくる
        loadAllData()
        
//        nameLabel.text = memberName[personNum]
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
        let titleLabel = cell.viewWithTag(1) as! UILabel
        titleLabel.text = dict["title"] as? String
        
        let urlButton = cell.viewWithTag(2) as! UIButton
        urlButton.addTarget(self, action: #selector(toMovie), for: .touchUpInside)
        
        return cell
    }
    
    @objc func toMovie(sender: UIButton) {
        
        //row番目のセルのボタンが押された
        let cell = sender.superview?.superview as! UITableViewCell
        let row = tableView.indexPath(for: cell)!.row
        print(row)
        
        //押したボタンのurlをとる
        let dict = self.eventItems[row]
        let url = dict["url"] as! String
        print(url)
        let next = storyboard!.instantiateViewController(withIdentifier: "event0") as! Event0ViewController
        next.url = url
        self.present(next,animated: true, completion: nil)
    }
    
    
    
    func loadAllData() {
        //ロード中にくるくるが回る
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        //取ってくる場所の指定
        let firebase = Database.database().reference().child("movie")
        
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


    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        movieDetailLabel.text = movieDetailText
        
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
