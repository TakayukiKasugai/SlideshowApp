//
//  ViewController.swift
//  SlideshowApp
//
//  Created by Takyuki Kasugai on 2018/05/11.
//  Copyright © 2018年 Takyuki Kasugai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //タイトル
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    
    //画像
    @IBOutlet weak var subImageView1: UIImageView!
    @IBOutlet weak var subImageView2: UIImageView!
    @IBOutlet weak var imageView: UIImageView!
    
    //ボタン
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var backBottun: UIButton!
    @IBOutlet weak var nextBottun: UIButton!
    
    //タップ
    @IBAction func zoomImage(_ sender: Any) {
        // セグエを使用して画面を遷移
        performSegue(withIdentifier: "zoom", sender: nil)
    }
    
    /// 一定の間隔で処理を行うためのタイマー
    var timer: Timer?
    
    //参照しているページ数
    var page:Int = 1
    
    //再生か停止かを示すフラグ
    var playFlag = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 画像ファイルを読み込み
        subImageView1.image = UIImage(named: "SubImage1")
        subImageView2.image = UIImage(named: "SubImage2")
        imageView.image = UIImage(named: "Image1.jpg")
        page = 1
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func backSlide(_ sender: Any) {
        page -= 1
        if(page < 1){
         page = 5
        }
        
        let imageName:String = "Image" + page.description + ".jpg"
        imageView.image = UIImage(named: imageName)
    }
    @IBAction func nextSlide(_ sender: Any) {
        page += 1
        if(page > 5){
            page = 1
        }
        
        let imageName:String = "Image" + page.description + ".jpg"
        imageView.image = UIImage(named: imageName)
    }
    
    @IBAction func playSlide(_ sender: Any) {
        playFlag = !playFlag
        if(playFlag){
            playButton.setTitle("停止", for: .normal)
            backBottun.isEnabled = false
            nextBottun.isEnabled = false
            // タイマーを設定
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(onTime), userInfo: nil, repeats: true)
        }else{
            playButton.setTitle("再生", for: .normal)
            backBottun.isEnabled = true
            nextBottun.isEnabled = true
            // タイマーを止める
            self.timer?.invalidate()
        }
    }
    /// Timerによって、一定の間隔で呼び出される関数
    @objc func onTime() {
        self.nextSlide((Any).self)
        // 関数が呼ばれていることを確認
        //print("onTimer")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(playFlag){
            self.playSlide((Any).self)
        }
        // segueから遷移先のResultViewControllerを取得する
        let zoomViewController:ZoomViewController = segue.destination as! ZoomViewController
        // 遷移先のResultViewControllerで宣言しているx, yに値を代入して渡す
        zoomViewController.imageName = "Image" + page.description + ".jpg"
    }

    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        
    }
}

