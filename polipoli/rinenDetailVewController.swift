//
//  MainViewController.swift
//  polipoli
//
//  Created by 村上真太朗 on 11/1/17.
//  Copyright © 2017 polipoli. All rights reserved.
//

import UIKit

class rinenDetailViewController: UIViewController {
    
    var rinenDetailText = String()
    
    @IBOutlet weak var rinenDetailLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()


        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        rinenDetailLabel.text = rinenDetailText
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