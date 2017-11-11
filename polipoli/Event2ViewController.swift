//
//  Event2ViewController.swift
//  polipoli
//
//  Created by 村上真太朗 on 11/1/17.
//  Copyright © 2017 polipoli. All rights reserved.
//

import UIKit

class Event2ViewController: UIViewController {

    
    @IBOutlet weak var sv: UIScrollView!
    var iv = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        iv.frame = CGRect(x: 0, y: 0, width: 375*6, height: 270)
        
        //uiButtonを作成0~5
        for i in 0..<6 {
            let view: UIImageView = UIImageView()
            view.frame = CGRect(x: (375*i), y: 0, width: 375, height: 270)
            let viewImage:UIImage = UIImage(named: String(format: "%02d", i) + ".png")!
            view.image = viewImage
            iv.addSubview(view)
        }
        
        sv.addSubview(iv)
        sv.contentSize = iv.bounds.size
        sv.isPagingEnabled = true

        // Do any additional setup after loading the view.
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
