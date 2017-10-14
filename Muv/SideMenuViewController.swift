//
//  SideMenuViewController.swift
//  Muv
//
//  Created by Ben on 10/9/17.
//  Copyright © 2017 Ben Thrasher. All rights reserved.
//

import UIKit

class SideMenuViewController: UITableViewController {

    //MARK: UI Items
    @IBOutlet weak var SideMenuHeader: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        UserService.getAppUser(then: {appUser in
            self.SideMenuHeader.title = appUser!.firstName
        })
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
