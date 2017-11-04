//
//  SeizikaViewController.swift
//  polipoli
//
//  Created by 村上真太朗 on 11/1/17.
//  Copyright © 2017 polipoli. All rights reserved.
//

import UIKit

class SeizikaViewController: UIViewController {
    
    var faceImage = UIImage()
    var rinenText = String()
    var planText = String()
    var performText = String()
//    var detailText = String()
    
    //0~3のpathをいれる
    var pathNum = Int()
    
    var numm = Int()
    
    var detailItems = [NSArray]()
    
    var nowDetailRinen = String()
    var nowDetailMovie = String()
    var nowDetailPlan = String()
    var nowDetailPerform = String()
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var rinenTextField: UITextView!
    @IBOutlet weak var planTextField: UITextView!
    @IBOutlet weak var performTextField: UITextView!
    
//    @IBOutlet weak var detailTextField: UITextView!
    
    
    
    @IBOutlet weak var frame1 : UILabel!
    @IBOutlet weak var frame2 : UILabel!
    @IBOutlet weak var frame3 : UILabel!
    @IBOutlet weak var frame4 : UILabel!
    @IBOutlet weak var frame5 : UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
       
        frame1.layer.borderColor =  UIColor.init(red: 76.0/255.0, green: 76.0/255.0, blue: 76.0/255.0, alpha: 1.0).cgColor
        frame1.layer.borderWidth = 0.7
        frame1.layer.cornerRadius = 15.0
       
        frame2.layer.borderColor =  UIColor.init(red: 76.0/255.0, green: 76.0/255.0, blue: 76.0/255.0, alpha: 1.0).cgColor
        frame2.layer.borderWidth = 0.7
        frame2.layer.cornerRadius = 15.0
        
        frame3.layer.borderColor = UIColor.init(red: 76.0/255.0, green: 76.0/255.0, blue: 76.0/255.0, alpha: 1.0).cgColor
        frame3.layer.borderWidth = 0.7
        frame3.layer.cornerRadius = 15.0
        
        frame3.layer.borderColor = UIColor.init(red: 76.0/255.0, green: 76.0/255.0, blue: 76.0/255.0, alpha: 1.0).cgColor
        frame3.layer.borderWidth = 0.7
        frame3.layer.cornerRadius = 15.0
        
        frame4.layer.borderColor =  UIColor.init(red: 76.0/255.0, green: 76.0/255.0, blue: 76.0/255.0, alpha: 1.0).cgColor
        frame4.layer.borderWidth = 0.7
        frame4.layer.cornerRadius = 15.0
        
        frame5.layer.borderColor =  UIColor.init(red: 76.0/255.0, green: 76.0/255.0, blue: 76.0/255.0, alpha: 1.0).cgColor
        frame5.layer.borderWidth = 0.7
        frame5.layer.cornerRadius = 15.0
        
        
        // Do any additional setup after loading the view.
        
        detailItems = [["理念1-2","動画1-2","政策1-2","実績1-2"],
                 ["理念2-2","動画2-2","政策2-2","実績2-2"],
                 ["理念3-2","動画3-2","政策3-2","実績3-2"],
                 ["理念4-2","動画4-2","政策4-2","実績4-2"]]
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        imageView.image = faceImage
        rinenTextField.text = rinenText
//        detailTextField.text = detailText
        planTextField.text = planText
        performTextField.text = performText
        
    }
    
    
    @IBAction func toRinenDetail(_ sender: Any) {
        //受け渡し
        let detailArray = detailItems[pathNum]
        nowDetailRinen = detailArray[0] as! String

        
        self.performSegue(withIdentifier: "rinenDetail", sender: nil)

        

    }
    
    @IBAction func toMovieDetail(_ sender: Any) {
        let detailArray = detailItems[pathNum]

        nowDetailMovie = detailArray[1] as! String

        self.performSegue(withIdentifier: "movieDetail", sender: nil)
    }
    
    @IBAction func toPlanDetail(_ sender: Any) {
        let detailArray = detailItems[pathNum]

        nowDetailPlan = detailArray[2] as! String
        
        self.performSegue(withIdentifier: "planDetail", sender: nil)
    }
    
    @IBAction func toPerformDetail(_ sender: Any) {
        let detailArray = detailItems[pathNum]

        nowDetailPerform = detailArray[3] as! String
        self.performSegue(withIdentifier: "performDetail", sender: nil)
    }
    
    @IBAction func toPostRoom(_ sender: Any) {
        self.performSegue(withIdentifier: "toPost", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        if segue.identifier == "rinenDetail" {
            let rinenDetailVC:rinenDetailViewController = segue.destination as! rinenDetailViewController
            rinenDetailVC.rinenDetailText = nowDetailRinen
            
        } else if segue.identifier == "movieDetail" {
            let movieDetailVC:movieDetailViewController = segue.destination as! movieDetailViewController
            movieDetailVC.movieDetailText = nowDetailMovie
            
            
        } else if segue.identifier == "planDetail" {
            let planDetailVC:planDetailViewController = segue.destination as! planDetailViewController
            planDetailVC.planDetailText = nowDetailPlan
            
            
        }else if segue.identifier == "performDetail" {
            let performDetailVC:performDetailViewController = segue.destination as! performDetailViewController
            performDetailVC.performDetailText = nowDetailPerform
            
            
        }else if segue.identifier == "toPost" {
            let commentVC:CommentViewController = segue.destination as! CommentViewController
            commentVC.roomNum = self.pathNum
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
