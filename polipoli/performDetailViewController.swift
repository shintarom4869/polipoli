//
//  performDetailViewController.swift
//  polipoli
//
//  Created by 村上真太朗 on 11/2/17.
//  Copyright © 2017 polipoli. All rights reserved.
//

import UIKit

class performDetailViewController: UIViewController {

    var performDetailText = String()
    
    @IBOutlet weak var performDetailLabel: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        performDetailLabel.text = performDetailText
        
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
