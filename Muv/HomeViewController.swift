//
//  HomeViewController.swift
//  Muv
//
//  Created by Ben Thrasher on 4/6/17.
//  Copyright © 2017 Ben Thrasher. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationViewController = segue.destination as? MenuViewController {
            destinationViewController.transitioningDelegate = self
        }
    }
    //MARK: Actions
    
    
    //this is a second comment
    
    //this is a third comment
}

extension HomeViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return PresentMenuAnimator()
    }
}


/*
 NOTES:
 Side bar comes out, but:
    1) no animation (might be lag)
    2) snapshot doesnt appear to display ( just white to right of green )
 */
