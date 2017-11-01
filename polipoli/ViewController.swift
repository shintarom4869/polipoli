//
//  ViewController.swift
//  polipoli
//
//  Created by 村上真太朗 on 10/31/17.
//  Copyright © 2017 polipoli. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var poliCollection : UICollectionView!
    
    @IBOutlet weak var sv: UIScrollView!
    
    var nowCollectionFaceImage = UIImage()
    var nowCollectionRinenText = String()
    var nowCollectionDetailText = String()
    
    var items = [NSArray]()
    let vc = UIView()
    var buttonImage:UIImage = UIImage()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        //スクロールviewを透明に
        poliCollection.backgroundColor = UIColor.clear
        //view生成
        vc.frame = CGRect(x: 0, y: 0, width: 375*5, height: 218)
        
        //uiButtonを作成0~4
        for i in 0..<5 {
            let button: UIButton = UIButton()
            button.frame = CGRect(x: (375*i), y: 0, width: 375, height: 218)
            button.tag = i
            let buttonImage:UIImage = UIImage(named: String(i) + ".jpg")!
            button.setImage(buttonImage, for: UIControlState.normal);
            button.addTarget(self, action: #selector(tap), for: .touchUpInside)
            vc.addSubview(button)
        }
        
        sv.addSubview(vc)
        sv.contentSize = vc.bounds.size
        sv.isPagingEnabled = true
        
        poliCollection.dataSource = self
        poliCollection.delegate = self
        
        items = [["11.jpg","高橋","無所属","理念1", "詳細1"],["12.jpg","松下","自民党推薦","理念2", "詳細2"],["13.jpg","田中","無所属","理念3", "詳細3"],["14.jpg","村越","無所属","理念4", "詳細4"]]
    }
    
   
    
    //セルの個数
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "poliCell", for: indexPath)
        
        let dict = items[(indexPath as NSIndexPath).row]

            
        let imageView = cell.viewWithTag(1) as! UIImageView
        imageView.image = UIImage(named: dict[0] as! String)
        
        let nameLabel = cell.viewWithTag(2) as! UILabel
        nameLabel.text = dict[1] as? String
        let explainLabel = cell.viewWithTag(3) as! UILabel
        explainLabel.text = dict[2] as? String
            
        return cell
    }
    
    // MARK: - CollectionView Delegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        let dict = items[(indexPath as NSIndexPath).row]

        nowCollectionFaceImage = UIImage(named: dict[0] as! String)!
        nowCollectionRinenText = dict[3] as! String
        nowCollectionDetailText = dict[4] as! String
        performSegue(withIdentifier: "toSeizika", sender: nil)
        collectionView.deselectItem(at: indexPath, animated: true)
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toSeizika" {
            let seizikaVC:SeizikaViewController = segue.destination as! SeizikaViewController
            seizikaVC.faceImage = nowCollectionFaceImage
            
            seizikaVC.rinenText = nowCollectionRinenText

            seizikaVC.detailText = nowCollectionDetailText
            
        }
    }

    
//    var uv = UIView()

    
    //tagの番号によって挙動を変える
    @objc func tap(sender: UIButton) {
        if(sender.tag == 0) {
            go0()
  
        }else if(sender.tag == 1) {
            go1()
   
            
        }else if(sender.tag == 2) {
            go2()
            
        }else if(sender.tag == 3) {
            go3()
            
        }else if(sender.tag == 4) {
            go4()
        }
    }
    

    func go0() {
        let storyboard: UIStoryboard = self.storyboard!
        let event0View = storyboard.instantiateViewController(withIdentifier: "event0") as! Event0ViewController
        self.present(event0View, animated: true, completion: nil)
    }
    
    func go1() {
        let storyboard: UIStoryboard = self.storyboard!
        let event1View = storyboard.instantiateViewController(withIdentifier: "event1") as! Event1ViewController
        self.present(event1View, animated: true, completion: nil)
    }
    func go2() {
        let storyboard: UIStoryboard = self.storyboard!
        let event2View = storyboard.instantiateViewController(withIdentifier: "event2") as! Event2ViewController
        self.present(event2View, animated: true, completion: nil)
    }
    
    func go3() {
        let storyboard: UIStoryboard = self.storyboard!
        let event3View = storyboard.instantiateViewController(withIdentifier: "event3") as! Event3ViewController
        self.present(event3View, animated: true, completion: nil)
    }
    
    func go4() {
        let storyboard: UIStoryboard = self.storyboard!
        let event4View = storyboard.instantiateViewController(withIdentifier: "event4") as! Event4ViewController
        self.present(event4View, animated: true, completion: nil)
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}

