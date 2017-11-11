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
    var squareFaceImage = String()
    var rinenText = String()
    var planText = String()
    var performText = String()
    var fullName = String()
    
    //0~4のpathが入ってる
    var pathNum = Int()
    
    var urlItems = [String]()
    
    var detailItems = [NSArray]()
    
    var nowDetailRinen = String()
    var nowDetailMovie = String()
    var nowDetailPlan = String()
    var nowDetailPerform = String()
    
    var deviceId = String()
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var rinenTextField: UITextView!
    @IBOutlet weak var planTextField: UITextView!
    @IBOutlet weak var performTextField: UITextView!
    
    @IBOutlet weak var frame1 : UILabel!
    @IBOutlet weak var frame2 : UILabel!
    @IBOutlet weak var frame3 : UILabel!
    @IBOutlet weak var frame4 : UILabel!
    @IBOutlet weak var frame5 : UILabel!
    @IBOutlet weak var frame6 : UILabel!
    @IBOutlet weak var frame7 : UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
       
        frame1.layer.borderColor =  UIColor.init(red: 76.0/255.0, green: 76.0/255.0, blue: 76.0/255.0, alpha: 1.0).cgColor
        frame1.layer.borderWidth = 0.7
        frame1.layer.cornerRadius = 15.0
       
////        frame2.layer.borderColor =  UIColor.init(red: 76.0/255.0, green: 76.0/255.0, blue: 76.0/255.0, alpha: 1.0).cgCo
//        frame2.layer.borderWidth = 0.3
//        frame2.layer.cornerRadius = 10.0
////        
////        frame3.layer.borderColor = UIColor.init(red: 76.0/255.0, green: 76.0/255.0, blue: 76.0/255.0, alpha: 1.0).cgColor
//        frame7.layer.borderWidth = 0.3
//        frame7.layer.cornerRadius = 10.0
////        
////        frame3.layer.borderColor = UIColor.init(red: 76.0/255.0, green: 76.0/255.0, blue: 76.0/255.0, alpha: 1.0).cgColo
//        frame3.layer.borderWidth = 0.3
//        frame3.layer.cornerRadius = 10.0
//        
        frame4.layer.borderColor =  UIColor.init(red: 76.0/255.0, green: 76.0/255.0, blue: 76.0/255.0, alpha: 1.0).cgColor
        frame4.layer.borderWidth = 0.7
        frame4.layer.cornerRadius = 15.0
        
        frame5.layer.borderColor =  UIColor.init(red: 76.0/255.0, green: 76.0/255.0, blue: 76.0/255.0, alpha: 1.0).cgColor
        frame5.layer.borderWidth = 0.7
        frame5.layer.cornerRadius = 15.0
        
        frame6.layer.borderColor =  UIColor.init(red: 76.0/255.0, green: 76.0/255.0, blue: 76.0/255.0, alpha: 1.0).cgColor
        frame6.layer.borderWidth = 0.7
        frame6.layer.cornerRadius = 15.0
        //理念詳細,動画詳細,政策詳細,実績詳細の順番
        detailItems = [[" 高橋氏の活動実績を踏まえると、彼の目指すものは、「子どもや若者がその力を最大限発揮できる社会」「子どもや若者の力を最大限生かす、活気あふれる社会」だといえるでしょう。\n　この理想の実現のため、高橋氏はNPO法人Rightsを大学在学中に立ち上げ、18歳選挙権の運動を推進し、2015年には実現しました。また、年代別におかれた社会的・経済的状況に注目し、「若者とお年寄りなどの世代の間で様々な格差が生じており、その結果、世代の間での意見や利害の対立が激しくなっている」という現状を「世代間格差」という言葉をつくり、世間に広めたといいます。また、子どもへの政治教育の充実も目指しているそうです。\n　このように、高橋氏は「子ども」「若者」に注目したよりよい社会づくりを目指す人物といえそうです。",["https://youtu.be/iIYxP-Gg1kk","https://youtu.be/bRg449ticvs","https://youtu.be/WMxJj3imbK4"]," 出馬会見の場で主に以下の4点の政策を発表しています。\n　①待機児童ゼロ\n　②学力向上と公教育立て直し\n　③中小企業へのコンサルティング支援\n　④地域分権と支所機能の強化これらの政策は、高橋氏がNPO法人や大学での活動を通して培ってきた強みである「教育」「若者」といったポイントを軸にした政策を主としつつも、市川市政全体における経済、地域問題に手を打とうという意図が伺えます。\n　しかしやはり目玉は①と②、すなわち「子ども」「若者」関連の政策のようです。\n　事実、高橋氏は「子ども、若者、女性に投資する社会」を訴え、その上で待機児童ゼロや公教育の立て直しなどの政策を強調しているのです。\n　①に関しては、市川市が待機児童数で全国ワースト4位であることをあげるとともにこれまでの市の対応を批判しています。そして、学校の空き教室を確保したり、保育士が余っている地方からの人材を確保して待機児童ゼロを目指すといいます。\n　また、②に関しては、奨学金制度を充実することで実現を目指すといいます。また、市政全体に関しては、「大久保姿勢は行財政改革を進めた一方、行政サービスを縮減し、福祉の低下を招いた」としており、大久保前市長の行政・財政の改革をさらに進める一方、行政サービスや福祉の回復・拡充を図る政策を今後提案していくのではないでしょうか。","1976年に市川市で生まれた高橋亮平氏は、今までにNPO法人の役員として・大学教員など教育者として・そして政治家、とくに市川市議会議員として実績を積んできました。\n　現在高橋氏が代表理事を務めるNPO法人Rightsは、高橋氏自身が大学在学中の2001年に立ち上げた団体で、設立以来、子供や若者の社会参加・政治参加を推進してきました。\n　その一環として、「18歳選挙権」実現を訴え続け、2015年の公職選挙法改正では中心的役割を果たしたと高橋氏は自負しています。また、若者に注目する姿勢から政策提言も続けており、「世代間格差」という言葉を提起したといいます。\n　また、高橋氏は大学教員としての一面も持っています。中央大学特任准教授として、課題解決型の授業を行い、商学部ガイドブックでも目玉授業として紹介されるなど高い評価を受けています。また、一般社団法人「生徒会活動支援協会」を設立し、松下政経塾と連携して次世代のリーダー育成にも力を入れているそうです。また、高橋氏は市川市議を2期6年務めた経験を持っています。\n　26歳で当時歴代2位の得票数で当選したのち、市民税の使い道を納税者が決める「市民税1パーセント条例」や、総合５ヵ年計画の総合３ヵ年計画への短縮、随意契約(国や地方自治体と企業の間で行われる、価格競争などによらない、任意による契約)の根本的見直し、そして市内全小中学校へのエアコン設置を実現したといいます。\n　そして、市議在任中には、全国若手市議の会長を務めるなど議会改革や全国的な政策提言に力を注いでいたといいます。市議を辞職して臨んだ2009年の市川市長選には惜敗率90パーセント、つまり当選した候補の9割の票を獲得する奮闘を見せましたが惜しくも落選し、それ以降は松戸市や千葉市のブレーン・アドバイザーとして活動してきました。"],
                       ["坂下氏の政治理念とは、「政治は市民のものである」だそうです。\n　その理念のために、市民の意志を行政に反映させるべく市議会・県議会を通して積極的な質問を行ったそうです。しかし、実際政治としては市民のものであるという当然の常識すら通らない場合が多いとの問題意識を持っているそうです。\n　また、坂下氏によると、現在地方政治は大きな転換期を迎えているそうです。なぜなら、国も県も膨大な借金を抱え、もはや頼ることはできない状態にあるからだそうです。\n　そこで、市政の自立を坂下氏は提唱しています。\n　必要なだけの最小の予算で最大の効果をあげることが、今後の財政的見地から必要だそうです。やらなければならないことが山積しているのに対し、財政は絞らなければならない。これが坂下氏の訴える予算の効率化・行政の適正化の根幹だそうです。",["https://youtu.be/fiL7AAc5iOM","https://youtu.be/X9Rkx7jkWDE","https://youtu.be/spTCemtXbao"],"坂下氏は、抜本的な行政改革の必要を訴えています。今後、財源がより制約されることから、市民の税金をより有効に使う必要があり、そのために旧弊を打破する必要があるとのことです。\n　限られた財源でも市民のニーズが強い、または市に必要である事業を実施するためにも行政改革が必要だそうです。\n　具体的には、市川市には特に保育園や高齢者施設の待機・社会保障・都市基盤整備・医療が特に大きな課題であるとしています。これらに必要な膨大なコストを捻出するために、行政改革と予算の効率化を行うそうです。\n　またこれら以外でも、「日々の生活を守り、安心を届ける」「いざという時に市民の生活を守る」「頼りになる行政の再構築」として、教育や福祉の改善、災害対策、行政サービスの向上を掲げています。","坂下しげき氏は1974年生まれで、市川市の出身です。小中学校も市川市の公立学校に通っていました。\n　千葉県立船橋法典高校卒業後は日本文化大学法学部法学科へ入学。大学卒業後は、在学中から関わりがあった千葉県会議員の金子和子議員の事務所に秘書として入りました。\n　そして、２８歳の時に市川市の市議会議員として政界に入りました。２期８年の間に建設委員会の委員長などを務めました。\n　質疑を議員の重要な職務と捉え、必ず行っており、議員平均約6.7倍の質疑時間だったそうです。その後、千葉県議会議員として２期６年を務めました。県議としては、文教常任委員会委員長や自由民主党千葉県連青年局・青年部広報委員長などを務めました。現在では地元市川の消防団や野球チームに所属し、また母校の評議員として活躍しています。\n　市民の声を聞くことを重視するために、坂下氏のホームページでは22の事例で市民の要望を聞き、提案を行ったことを載せています。"],
                        ["田中氏の政治理念は大きく分けて2つあります。\n　一つ目は「政治とは命を守ること」です。田中氏は、日本の21世紀を、命を守ることを何よりも優先するという「尊命の時代」としたいといいます。そうした理念は、田中氏の衆院議員時代の活動実績や、平和・非核関連の著作発行にも見て取れるでしょう。\n　そして2つ目は、しがらみを排除し、自立して素直なものの見方で政治に向き合うということです。田中氏は「私は、正しいと思うことを主張して孤立することを恐れない人間になった」「自分の信じることを貫いた者だけに、人の役に立つという使命が与えられる」と考えているといいます。そして、そうした政治信条から、業界団体や労働組合からの献金や推薦を断ってきたといい、衆院議員時代の2001年には、労働組合の支援を受ける姿勢に反対し、民主党を離党しています。\n　このように、しがらみのない自立した立場から命を守る政治を実現することが、田中氏の政治理念といえるでしょう。",["https://youtu.be/FwjGXw7bYv8","https://youtu.be/50lTnG8s9F8","https://youtu.be/PCmlZ9a4Xr8"],"政策としては\n　①京成電鉄の立体化などの交通体系整備\n　②国際大学の誘致\n　③災害を想定した人命救急システムの構築\n　④電線の地中化の4本が主に提示されています。\n　現在、政策についてこれ以上詳しいことはわかりませんが、今後、発信されてくるのではないでしょうか。\n　この4つの政策について現状を見てみると、これらが「現在も行われつつある政策」と、「今まで行われていない政策」の2つに分かれていることがわかりました。\n　「現在行われつつある政策」としては、①と④があります。①は、近年市川市が近隣住民などの声をまとめ、検討をしている状況にあり、④も本八幡駅や市川駅、市川文化会館の周辺で実現しており、現在は妙典駅周辺などいくつかの地域に広がりつつある状況にあります。一方、「今まで行われていない政策」としては、②と③があります。田中氏は、衆院議員時代やその後の活動、実業家としての活動を通して培った人脈や経験を活かし、「現在も行われつつある政策」をより前進・徹底するとともに、全く新しい政策も提案・実現しようとしているのではないでしょうか。","1957年に市川市で生まれた田中氏は、今まで、実業家(不動産会社勤務・経営)としてのキャリアと、政治家としてのキャリアを歩んできました。\n　大学在学中に宅地建物取引士として市川市の不動産会社に勤務し、大学卒業後の1984年に、同じく不動産会社の内湾開発(株)に入社しました。その後1987年に市川市議に当選すると、それからは長く議員として活動することになりました。1990年には千葉県議に当選し2期務め、1993年には国政に転じ、新党さきがけ所属の衆院議員となりました。その後、民主党所属、そして無所属として計3期衆院議員を務めました。しかし、2003年の衆院選で敗れたのちは、2009，2012年の衆院選で国政復帰を図るも、当選はかなっていません。一方、その間、アメリカのワシントンDCリーダーシップ研究所を卒業したり、内湾開発(株)の代表取締役に就任するなど、キャリアを着実に重ねています。\n　そんな中、今回の市川市長選挙に出馬するに至った理由の一つとしては、「家業が整ってきて」「地元市川市のために働けるようになった」ことを挙げています。衆院議員時代には、信条とする平和・非核を中心に、・恒久平和調査局設置法案提出・フランス核実験反対抗議運動・アフガン戦災孤児救済活動・風俗営業法の改正・児童虐待防止法案の改正・ダンス議員連盟副会長等の実績を重ねてきたといいます。また、衆院議員時代には、企業などの団体とのしがらみを嫌う信条から、労働組合から献金をもらうことを嫌って民主党を離党した過去もあります。その他、議員を退いたのちは6本の著作で平和・非核・子どもの救済などを主張したり、戦争と核(原発)と貧困のない自由な社会を作る会の代表世話人を務めたりしています。"],
                 ["村越氏の政治理念は、「政治の原点は困っている人を助けること」であり、日々の生活面での不満の解消を重要な課題として挙げています。そのため、市民の意志を政治に反映することが重要であり、現在でもサージェリーという市民相談を行い、市民の悩み事を聞き、問題解決に協力する活動を行っているそうです。\n　また、村越氏は「いちかわ超改革」という大きな市川市のこれからの展望を掲げています。多様な価値観とあり方が尊重されるようなまちづくりを目指しているそうです。\n　そのためにも、市民の政治参加によって、市民の力と知恵を引き出していくことが重要だと考えているそうです。","","特に重要な政策として、\n①市長と市民のタウンミーティング」\n②「健康を守りながら財政再建」\n③「小中学生の短期留学制度」を掲げています。\n　出馬表明時のインタビューでも、市民の政治参加と教育、福祉を重要な課題として挙げていました。\n　また、５つの政策郡によって構成される「いちかわ超改革」という構想を持っているそうです。「豊かに」「健やかに」「便利に」「わかりやすく」「わくわくする」という形で分類された政策郡です。具体的には、多様な市民が不便なく生活できる豊かさとして、教育支援や待機児童の解決、通勤の改善、同性パートナーシップ条例や旧姓使用条例。心身の健康の増進として、たばこ対策や医療・介護サービスの改善、スポーツによる健康増進。不便を工夫により解決するとして、交通の改善、利用者負担軽減などの公共施設の運用改善、燃やすゴミの収集回数増加。市政を市民にわかりやすく、参加できるものにするように、行政の可視化と市民参加の機会の増加を提案しています。\n　市川市の魅力を高めるとして、イベントの開催や商店街の活性化などを目指しているそうです。衆院議員としての経験を活かした様々なアイデアによって、地元市川市の活性化を目指すとしています。","村越ひろたみ氏は1974年生まれで、市川市の出身です。市川学園市川中学校・高等学校卒業後、青山学院大学国際政治経済学部に進学しました。卒業後は、早稲田大学大学院法学研究科に進学しましたが、中退し千葉県会議員になり政界へと入りました。\n　そして、7ヶ月後には早くも2003年衆院選に立候補し、初当選しました。次回衆院選では落選するも、2009年衆院選では再選しました。衆院議員としては、野田内閣時に外務大臣政務官を務め、EU、イギリス、アメリカなどの外務プログラムに参加しました。また、ACTA条約交渉にて貢献したそうです。国内では、震災後に液状化現象対策について、党内でまとめ政府に提出したり、党内統治のあり方について積極的に発言を行ったりしたそうです。"],
                 ["小泉氏の政治理念は「ヒトが主役のマチづくり」です。これは、「ヒトが主役・ヒトと育む、新しいマチ“いちかわ”」を、「マチ」全体「360°のアクションプラン(包括支援政策)」によってより良くしていこうということだそうです。また、これに関連して、小泉氏は「つながる」というキーワードを大切にしています。\n　具体的には、「つながる」をキーワードに、以下の8点から市川市をより良くしていこうと考えているそうです。\n　①子育て支援―「地域と家庭がつながるまち市川」\n　②教育―「教育でつながる親子⇔学校⇔地域のまち市川」\n　③環境(清掃)－「ゴミ0(美化)でつながる美しいまち市川」\n　④福祉・医療・介護―「医療とまごころでつながる健康都市！市川」\n　⑤災害・防犯―「安全からつながる安心のまち市川」\n　⑥都市構造と地域コミュニティ―「ヒトから地域につながる便利な空間都市！市川」\n　⑦行財政改革―「ヒト⇔市役所⇔地域がつながるまち市川」\n　⑧産業と市民活動―「仕事と市民活動を前面に！生きがいでつながるまち市川」これらからもわかるように、市民生活のあらゆる面において、様々な要素をつなげることでより良い市政を目指していることがうかがえます","","小泉氏は、\n　①大型保育施設の整備\n　②保育士の処遇改善などによる待機児童の解消\n　③スポーツ教育の推進④プロスポーツの誘致の四点を主要な政策として掲げています。\n　「まち、人、暮らしという軸をもとに360度の包括的なアクションプランを伝えながら、市川市が次のフェーズに進むべく、政策を訴えて戦っていきたい」と出馬表明時のインタビューでは述べています。スポーツ教育の推進、プロスポーツの誘致は、レスリング選手として活躍し、第46回国民体育大会で優勝経験もある小泉氏の経験を反映していると考えられます。\n　また、「市民一人ひとりの意見をくみ上げながら選挙戦を戦いたい」ともインタビューでは述べていました。","小泉氏は1973年に市川市で生まれ、市川市で育ちました。中高大を通してレスリング僭主として活躍し、第46回国民体育大会では優勝、他の大会でも多くの結果を残しています。\n　青山学院大学卒業後、集英社での社会人としての経験を積みました。その後、平成17年千葉県議会議員補欠選挙に立候補し、初当選します。平成19年千葉県議会選挙でも再選しました。平成21年市川市長選には県議を辞職して出馬するも、2位で落選しました。平成23年市川市議会選挙には当選して現在に至ります。\n　切手問題兵庫県の野々村県議から発する政務活動費不正問題は市川市にも波及しました。市議会定数42人中18人の議員に政務活動費の不正疑惑がかかり、平成27年に調査委員会が組織されました。そして、小泉氏についても400万円分の切手等の不正流用が調査の対象となりました。委員会の調べに対し、小泉氏は不正流用の事実を認めませんでしたが、議会からは問責決議が出される事態となりました。\n　しかし、小泉氏は「委員会の調査は私の個人攻撃を目的としたことを物語っており、到底承服できない」と述べています。また、調査委員会組織を不当に政争に用いたとして、一部議員を刑事告発しています。"]]
        
        urlItems = ["http://www.ryohey.jp/","http://gogo-shigeki.com/","https://www.koh-tanaka.jp/","http://www.hirotami.jp/","http://fumito.jp/s/"]
        
        
        imageView.layer.cornerRadius = 60.0
        imageView.clipsToBounds = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //Viewに表示
        fullNameLabel.text = fullName
        imageView.image = UIImage(named: squareFaceImage)
        rinenTextField.text = rinenText
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
//        let detailArray = detailItems[pathNum]
//
//        nowDetailMovie = detailArray[1] as! String

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
        //もしkeyNameをすでに持ってれば取らない
        if UserDefaults.standard.object(forKey: "deviceId") == nil {
            self.deviceId = UIDevice.current.identifierForVendor!.uuidString
            print(self.deviceId )

            UserDefaults.standard.set(self.deviceId as String, forKey: "deviceId")
        }
        print(UserDefaults.standard.object(forKey: "deviceId") as! String)

        self.performSegue(withIdentifier: "toPost", sender: nil)
        
    }
    
    @IBAction func toQA(_ sender: Any) {
        self.performSegue(withIdentifier: "toQA", sender: nil)
    }
    
    @IBAction func toHomePage(_ sender: Any) {
        let next = storyboard!.instantiateViewController(withIdentifier: "event0") as! Event0ViewController
        next.url = "\(self.urlItems[self.pathNum])"
        self.present(next,animated: true, completion: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        if segue.identifier == "rinenDetail" {
            let rinenDetailVC:rinenDetailViewController = segue.destination as! rinenDetailViewController
            rinenDetailVC.rinenDetailText = nowDetailRinen
            
        } else if segue.identifier == "movieDetail" {
            let movieDetailVC:movieDetailViewController = segue.destination as! movieDetailViewController
            movieDetailVC.personNum = self.pathNum
            
            
        } else if segue.identifier == "planDetail" {
            let planDetailVC:planDetailViewController = segue.destination as! planDetailViewController
            planDetailVC.planDetailText = nowDetailPlan
            
            
        }else if segue.identifier == "performDetail" {
            let performDetailVC:performDetailViewController = segue.destination as! performDetailViewController
            performDetailVC.performDetailText = nowDetailPerform
            
            
        }else if segue.identifier == "toPost" {
            let commentVC:CommentViewController = segue.destination as! CommentViewController
            commentVC.roomNum = self.pathNum
            print(commentVC.roomNum)
            
        }else if segue.identifier == "toQA" {
            let qAVC:QAViewController = segue.destination as! QAViewController
            qAVC.qARoomNum = self.pathNum
            print(qAVC.qARoomNum)
        }
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
