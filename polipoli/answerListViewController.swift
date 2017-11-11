//
//  answerListViewController.swift
//  polipoli
//
//  Created by 村上真太朗 on 11/8/17.
//  Copyright © 2017 polipoli. All rights reserved.
//

import UIKit

class answerListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var questionLabel: UILabel!
    
    var answerNum = Int()
    var answerItems = [NSDictionary]()
    
    var answerPerson = [NSArray]()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        let dict = answerItems[self.answerNum]

        questionLabel.text = dict["question"] as? String
        
        answerPerson = [["takahashiAnswer","高橋.jpg","高橋 亮平"],["sakashitaAnswer","坂下.jpg","坂下 しげき"],["tanakaAnswer","こう.jpg","田中 甲"],["murakoshiAnswer","村越.jpg","村越 ひろたみ"],["koizumiAnswer","小泉.jpg","小泉 文人"]]
    
        
    }
  
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as UITableViewCell
        cell.selectionStyle = UITableViewCellSelectionStyle.gray
        
        let num = indexPath.row
        
        let dict = answerItems[self.answerNum]
        
        //画像
        let imageView = cell.viewWithTag(1) as! UIImageView
        imageView.image = UIImage(named: answerPerson[num][1] as! String)
        
        //name
        let nameLabel = cell.viewWithTag(2) as! UILabel
        nameLabel.text = self.answerPerson[num][2] as! String
        
        //答え
        let answerTextField = cell.viewWithTag(3) as! UITextView
        answerTextField.text = dict[self.answerPerson[num][0]] as? String

        

        
        return cell
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
