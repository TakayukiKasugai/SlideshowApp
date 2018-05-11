//
//  ZoomViewController.swift
//  SlideshowApp
//
//  Created by Takyuki Kasugai on 2018/05/11.
//  Copyright © 2018年 Takyuki Kasugai. All rights reserved.
//

import UIKit

class ZoomViewController: UIViewController {

    var  imageName:String = ""
    
    @IBOutlet weak var zoomImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        zoomImageView.image = UIImage(named: imageName)
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
