//
//  OneController.swift
//  图片移动
//
//  Created by 黄振华 on 2017/8/23.
//  Copyright © 2017年 黄振华. All rights reserved.
//

import UIKit

class OneController: UIViewController {
    
    var index : IndexPath?
    
    
    
    let tableview = UITableView()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableview.delegate = self
        self.tableview.dataSource = self
        self.tableview.frame = self.view.bounds
        self.tableview.register(UITableViewCell.self, forCellReuseIdentifier: "cellID")
        view.addSubview(tableview)
        self.navigationController?.delegate = self
        
        
    }


}
extension OneController:UITableViewDataSource,UITableViewDelegate{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 12
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "cellID")
        
        cell?.imageView?.image = UIImage(named: (indexPath.row+1).description)
        
       return cell!
        
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        let vc = TwoViewController()
        
        vc.image = UIImage(named: (indexPath.row+1).description)
        
        self.index = indexPath
        
        self.navigationController?.pushViewController(vc, animated: true)
    }


}
extension OneController:UINavigationControllerDelegate{


    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning?{
    
         let animatedTransitio = AnimatedTransitio()
         animatedTransitio.time = 1
        if operation == .push {
            animatedTransitio.animatedTransitiotype = .push
            
        }else{
            animatedTransitio.animatedTransitiotype = .pop
        }
        return animatedTransitio
        
      
    
    }




}
