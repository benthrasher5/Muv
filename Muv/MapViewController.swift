//
//  MapViewController.swift
//  Muv
//
//  Created by Ben Thrasher on 4/9/17.
//  Copyright © 2017 Ben Thrasher. All rights reserved.
//

import UIKit

class MapViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func goHome(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func logoutButtonPressed(_ sender: Any) {
        AuthService.logout(then: {
            self.performSegue(withIdentifier: "logoutSegue", sender: nil)
        })
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
