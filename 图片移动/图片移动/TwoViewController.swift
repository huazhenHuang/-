//
//  TwoViewController.swift
//  图片移动
//
//  Created by 黄振华 on 2017/8/23.
//  Copyright © 2017年 黄振华. All rights reserved.
//

import UIKit

class TwoViewController: UIViewController {
    
    var image : UIImage?
    
    let  imageView = UIImageView()
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        
        imageView.center = self.view.center
        
        self.view.addSubview(imageView)
        
        
        imageView.image = image
    }



}
