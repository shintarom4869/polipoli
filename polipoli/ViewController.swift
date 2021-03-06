//
//  ViewController.swift
//  polipoli
//
//  Created by 村上真太朗 on 10/31/17.
//  Copyright © 2017 polipoli. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate, UICollectionViewDataSource, UICollectionViewDelegate{
    
    @IBOutlet weak var poliCollection : UICollectionView!
//    @IBOutlet weak var pc: UIPageControl!

    @IBOutlet weak var sv: UIScrollView!
    
    var nowCollectionFaceImage = UIImage()
    var nowCollectionRinenText = String()
//    var nowCollectionMovieText = String()
    var nowCollectionPlanText = String()
    var nowCollectionPerformText = String()
    var nowCollectionFullName = String()
    var nowCollectionSquareFaceImage = String()
    var num = Int()
    
    var items = [NSArray]()
    let vc = UIView()
    var buttonImage:UIImage = UIImage()
    
    var faceItems = [String()]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //上のView
        //スクロールviewを透明に
        poliCollection.backgroundColor = UIColor.clear
        //view生成
        vc.frame = CGRect(x: 0, y: 0, width: 375*4, height: 218)
        
        //uiButtonを作成0~3
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
        
        //下のView
        poliCollection.dataSource = self
        poliCollection.delegate = self
        sv.delegate = self
        
        items = [["11.png","高橋　亮平","元市川市議会議員\n中央大学特任准教授","若い力による力強い改革市民が主役の市民自治モデルを発信しながら、市川を世界に発信できるような自治体運営をしたい。","","①未来志向で子供や若者、女性、子育てに投資する社会に\n②歴史と文化、発展する都市として誇りある市川に \n③市民が困っているところに手が届く温かく暮らしやすいまちに\n④日本で最も最先端を行く地方自治体のモデル都市に ","①18歳選挙権運動を推進し、国会にも招致される。法案成立に貢献\n②市民税1パーセント条例\n③行財政の無駄カット\n④全小中学校へのエアコン設置\n⑤2007-8年には全国若手市議の会会長を務める","高橋.jpg"],
                 ["12.jpg","坂下　しげき","元千葉県議会議員","「政治は市民のためにある」という最も大切で、基本の原理を取り戻す。","動画2-1","①予算見直しと財政再建\n②子育てへの環境整備 \n③医療など福祉の充実\n④社会インフラ整備","市川市議会で2期8年、市川市選出千葉県会議員として2期6年を務めた。\nまた、市議会時代には議員平均の6.7倍、2104分の質問を行い、県議会においても積極的に質問を行った。","坂下.jpg"],
                 ["13.jpg","田中　甲","元衆議院議員\n「こう！と決めたら田中甲」","しがらみのない立場から素直なものの見方を通して脱官僚・地域主権の社会・平和を目指す。「自然豊かな文教都市」を目指す。","動画3-1","①京成電鉄の立体化などの交通体系整備\n②国際大学の誘致\n③災害を想定した人命救急システムの構築\n④電線の地中化","①恒久平和調査局設置法案提出\n②フランス核実験反対抗議運動\n③アフガン戦災孤児救済活動\n④風俗営業法の改正\n⑤児童虐待\n⑥防止法案の改正\n⑦ダンス議員連盟副会長等選択的夫婦別姓制度の推進","こう.jpg"],
                 ["14.jpg","村越　ひろたみ","元衆議院議員\n外務大臣政務官","政治の原点は「困っている人を助けること」であり、市民の不便をひとつひとつ直していく。","動画4-1","①政務活動費廃止\n②市民の健康を守り財政再建に努める\n③小中学生の短期留学制度\n④長期的には、様々な街の不便を解決する「いちかわ超改革」を行う","①千葉県会議員として政界デビュー。その後、衆院議員を2期務め、外務大臣政務官に就任。2010年には民主党（当時）の方針を言論統制的として、一人異を唱えた。","村越.jpg"],
                 ["15.jpg","小泉　文人","元市議会議員","小泉氏の政治理念は「ヒトが主役のマチづくり」です。これは、「ヒトが主役・ヒトと育む、新しいマチ“いちかわ”」を、「マチ」全体「360°のアクションプラン(包括支援政策)」によってより良くしていこうということだそうです","動","①大型保育施設の整備\n②保育士の処遇改善などによる待機児童の解消\n③スポーツ教育の推進\n④プロスポーツの誘致","県会議員として2期。市川市長選で落選し、その後市川市議選挙にて当選し、市議として務める。","小泉.jpg"]]
    }
    
    //スクロール停止時に呼び出されるメソッド
//    private func scrollViewDidEndDecelerating(scrollView: UICollectionView) {
//        //ページコントロールに現在のページ番号を設定する。
//        testPageControl.currentPage = Int( / sv.frame.maxX)
//
//    }
    
    
    //セルの個数
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    //セルの中身(長方形image,name,詳細)
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "poliCell", for: indexPath)
        
        let array = items[(indexPath as NSIndexPath).row]
            
        let imageView = cell.viewWithTag(1) as! UIImageView
        imageView.image = UIImage(named: array[0] as! String)
        
        let nameLabel = cell.viewWithTag(2) as! UILabel
        nameLabel.text = array[1] as? String
        let explainLabel = cell.viewWithTag(3) as! UILabel
        explainLabel.text = array[2] as? String
            
        return cell
    }
    
    // セルを触った時の受け渡しと遷移
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        //num個目のセルを触った
        num = (indexPath as NSIndexPath).row
        //詳細Array
        let array = items[num]
        //人の詳細画面に引き渡すもの
        nowCollectionFullName = array[1] as! String
        nowCollectionRinenText = array[3] as! String
//        nowCollectionMovieText = array[4] as! String//動画わんちゃん
        nowCollectionPlanText = array[5] as! String
        nowCollectionPerformText = array[6] as! String
        nowCollectionSquareFaceImage = array[7] as! String
        
        performSegue(withIdentifier: "toSeizika", sender: nil)
        collectionView.deselectItem(at: indexPath, animated: true)
    }
    
    //tagの番号によって挙動を変える
    @objc func tap(sender: UIButton) {
        if(sender.tag == 0) {
            go2()

        }else if(sender.tag == 1) {
            go1()
            
        }else if(sender.tag == 2) {
            go0()
            
        }else if(sender.tag == 3) {
            go3()
        }

    }
    

    @objc func go0() {
        let next = storyboard!.instantiateViewController(withIdentifier: "event0") as! Event0ViewController
        next.url = "http://polipoli.work/"
        self.present(next,animated: true, completion: nil)
    }
    
    func go1() {
        performSegue(withIdentifier: "event1", sender: nil)

    }
    func go2() {
        performSegue(withIdentifier: "event2", sender: nil)

    }
    
    func go3() {
        performSegue(withIdentifier: "event3", sender: nil)
    }
  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toSeizika" {
            let seizikaVC:SeizikaViewController = segue.destination as! SeizikaViewController
            seizikaVC.faceImage = nowCollectionFaceImage
            seizikaVC.rinenText = nowCollectionRinenText
            seizikaVC.planText = nowCollectionPlanText
            seizikaVC.performText = nowCollectionPerformText
            seizikaVC.fullName = nowCollectionFullName
            seizikaVC.squareFaceImage = nowCollectionSquareFaceImage
            seizikaVC.pathNum = num
        } else if segue.identifier == "event1" {
            
        } else if segue.identifier == "event2" {
            
        } else if segue.identifier == "event3" {
            let event3VC:Event3ViewController = segue.destination as! Event3ViewController
            event3VC.memberFaceIcons = [items[0][7] as! String,items[1][7] as! String,items[2][7] as! String,items[3][7] as! String,items[4][7] as! String]
            event3VC.member = [items[0][1] as! String,items[1][1] as! String,items[2][1] as! String,items[3][1] as! String,items[4][1] as! String]
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
}

