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
    var detailText = String()

    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var rinenTextField: UITextView!
    @IBOutlet weak var detailTextField: UITextView!
    
    
    
    @IBOutlet weak var frame1 : UILabel!
    @IBOutlet weak var frame2 : UILabel!
    @IBOutlet weak var frame3 : UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
       
        frame1.layer.borderColor =  UIColor.init(red: 0/255.0, green: 128/255.0, blue: 255.0/255.0, alpha: 1.0).cgColor
        frame1.layer.borderWidth = 0.7
        frame1.layer.cornerRadius = 15.0
       
        frame2.layer.borderColor =  UIColor.init(red: 0/255.0, green: 128/255.0, blue: 255.0/255.0, alpha: 1.0).cgColor
        frame2.layer.borderWidth = 0.7
        frame2.layer.cornerRadius = 15.0
        
        frame3.layer.borderColor =  UIColor.init(red: 0/255.0, green: 128/255.0, blue: 255.0/255.0, alpha: 1.0).cgColor
        frame3.layer.borderWidth = 0.7
        frame3.layer.cornerRadius = 15.0
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        imageView.image = faceImage
        rinenTextField.text = rinenText
        detailTextField.text = detailText
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
