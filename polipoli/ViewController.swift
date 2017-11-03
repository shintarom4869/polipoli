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
//    var nowCollectionMovieText = String()
    var nowCollectionPlanText = String()
    var nowCollectionPerformText = String()
    
    var num = Int()
    
    var items = [NSArray]()
    let vc = UIView()
    var buttonImage:UIImage = UIImage()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        //スクロールviewを透明に
        poliCollection.backgroundColor = UIColor.clear
        //view生成
        vc.frame = CGRect(x: 0, y: 0, width: 375*4, height: 218)
        
        //uiButtonを作成0~4
        for i in 0..<4 {
            let button: UIButton = UIButton()
            button.frame = CGRect(x: (375*i), y: 0, width: 375, height: 218)
            button.tag = i
            let buttonImage:UIImage = UIImage(named: String(i) + ".png")!
            button.setImage(buttonImage, for: UIControlState.normal);
            button.addTarget(self, action: #selector(tap), for: .touchUpInside)
            vc.addSubview(button)
        }
        
        sv.addSubview(vc)
        sv.contentSize = vc.bounds.size
        sv.isPagingEnabled = true
        
        poliCollection.dataSource = self
        poliCollection.delegate = self
        
        items = [["11.jpg","高橋　亮平","元市川市議会議員、中央大学特任准教授","「若者」というキーワードを中心に、日本のこれからを多面的な方向で良くしていく","動画1-1","①市民税1%条例\n②随意契約の根本的見直し\n③小中学校へのエアコン設置","①１８歳選挙権の実現\n②地方議会改革\n③中央大学にて教育に携わる"],
                 ["12.jpg","坂下　しげき","元千葉県議会議員、自民党推薦","「政治は誰のためにあるのか？」この一番大切で、基本的なことがおろそかになっているのが今の政治ではないでしょうか?しがらみや既得権を断ち切り、政治を抜本的に変えていかなくてはなりません。 坂下しげきは、「誰のための政治であるのか？」という問いを常に心において、一切の妥協を許さない政治姿勢で挑戦し続けます。","動画2-1","①みんなが汗を流して収めた税金を無駄なく有効に使う\n②未来への投資 安心してこどもを産み育てる環境づくり\n③生活重視の未来に受け継ぐ環境づくり\n④県民ニーズを反映した人にやさしい環境づくり","市川市議会2期8年の間に市川市で4つある全ての委員会に所属し、委員長（1回）・副委員長（1回）も経験させていただき、多くの提案・議論を行ってまいりました。"],
                 ["13.jpg","田中　甲","元衆議院議員、こう！と決めたら田中甲","政治とは命を守ること","動画3-1","持続可能な社会の実現/直接民主制の導入/人材育成の機関を作る\n業界団体・労働組合からの献金、推薦は断ってきた\n核（原発）への反対運動","①恒久平和調査局設置法案提出\n②フランス核実験反対抗議運動\n③アフガン戦災孤児救済活動\n④風俗営業法の改正\n⑤児童虐待\n⑥防止法案の改正\n⑦ダンス議員連盟副会長等選択的夫婦別姓制度の推進"],
                 ["14.jpg","村越　ひろたみ","元衆議院議員、外務大臣政務官","もっと豊かに、健やかに、便利に、わかりやすく、ワクワク","動画4-1","①政務活動費廃止\n②市民の健康を守り財政再建に努める\n③小中学生の短期留学制度","①外務大臣政務官\n②民間企業の顧問を複数努める"]]
    }
    
   
    
    //セルの個数
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    //セルの中身
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
    
    // セルを触った時の受け渡しと遷移
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        num = (indexPath as NSIndexPath).row
        
        
        let dict = items[num]
        
        nowCollectionFaceImage = UIImage(named: dict[0] as! String)!
        nowCollectionRinenText = dict[3] as! String
//        nowCollectionMovieText = dict[4] as! String
        nowCollectionPlanText = dict[5] as! String
        nowCollectionPerformText = dict[6] as! String
        
        performSegue(withIdentifier: "toSeizika", sender: nil)
        collectionView.deselectItem(at: indexPath, animated: true)

        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toSeizika" {
            let seizikaVC:SeizikaViewController = segue.destination as! SeizikaViewController
            seizikaVC.faceImage = nowCollectionFaceImage
            seizikaVC.rinenText = nowCollectionRinenText
            seizikaVC.planText = nowCollectionPlanText
            seizikaVC.performText = nowCollectionPerformText
//            seizikaVC.detailText = nowCollectionDetailText
            seizikaVC.pathNum = num
            
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
  
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}

