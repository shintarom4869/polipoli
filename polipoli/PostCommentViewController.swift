//
//  PostCommentViewController.swift
//  polipoli
//
//  Created by 村上真太朗 on 11/2/17.
//  Copyright © 2017 polipoli. All rights reserved.
//

import UIKit
import Firebase

class PostCommentViewController: UIViewController,UITextViewDelegate,UINavigationControllerDelegate {
    
    @IBOutlet var commentTextView: UITextView!
    @IBOutlet weak var postButton: UIBarButtonItem!
    
    var uid = Auth.auth().currentUser?.uid
    
    var ref: DatabaseReference = Database.database().reference(fromURL: "https://polipoli-a5a2f.firebaseio.com/")

    override func viewDidLoad() {
        super.viewDidLoad()
        
        commentTextView.delegate = self
        
        commentTextView.layer.borderColor =  UIColor.init(red: 76.0/255.0, green: 76.0/255.0, blue: 76.0/255.0, alpha: 1.0).cgColor
        commentTextView.layer.borderWidth = 0.7
        commentTextView.layer.cornerRadius = 15.0
        
    }

    
    
    
    func postAll() {
        
        let rootRef = ref.child("Posts")
        
        
        //uuid
        let uuid: NSString = NSUUID().uuidString as NSString

        //コメント
        let message = commentTextView.text
        
        //いいねカウント
        let goodCount = String(0)
//        let likeCount = Int()
        var autoid = rootRef.childByAutoId().key

        print(rootRef.childByAutoId().key)

        AppDelegate.instance().showIndicator()
        

        
        let feed:[String : AnyObject] = ["comment":message as AnyObject,"fullName":uuid,"goodCount":goodCount as AnyObject,"autoID":autoid as AnyObject]
        
        rootRef.child("\(autoid)").setValue(feed)
  

        

     
        
        AppDelegate.instance().dismissActivityIndicator()
        
        
    }

    
    @IBAction func tweet(_ sender: Any) {
        
        
        if commentTextView.text.count < 5 {
            let alertViewControler = UIAlertController(title: "もっと書こう", message: "少なすぎです", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            
            alertViewControler.addAction(okAction)
            present(alertViewControler, animated: true, completion: nil)
            
        } else {
            let alertController:UIAlertController = UIAlertController(title: "確認", message: "質問を投稿します", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: { (action) in
                self.postAll()
                _ = self.navigationController?.popViewController(animated: true)
            })
            let cancelAction = UIAlertAction(title: "キャンセル", style: .cancel, handler: { (action) in
                //何もしない
                
            })
            alertController.addAction(okAction)
            alertController.addAction(cancelAction)
            
            self.present(alertController, animated: true, completion: nil)
        }
    }
    

    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if commentTextView.isFirstResponder {
            commentTextView.resignFirstResponder()
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
