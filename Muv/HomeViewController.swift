//
//  HomeViewController.swift
//  Muv
//
//  Created by Ben Thrasher on 4/6/17.
//  Copyright © 2017 Ben Thrasher. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    //MARK: Actions

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let logoImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
        logoImageView.contentMode = .scaleAspectFit
        
        let logoImage = UIImage(named: "logoPlain44")
        logoImageView.image = logoImage
        
        navigationItem.titleView = logoImageView
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
