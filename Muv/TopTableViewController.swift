//
//  TopViewController.swift
//  Muv
//
//  Created by Ben Thrasher on 4/11/17.
//  Copyright © 2017 Ben Thrasher. All rights reserved.
//

import UIKit

class TopTableViewController: UITableViewController {
    
    var muvs = [Muv]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //get muvs to populate from muvservice
        muvs = MuvService.getSampleMuvs()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: Table View data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //returns the amount of cells that should be in each section
        return muvs.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TopTableViewCell", for: indexPath) as? TopTableViewCell else {
            fatalError("the dead cell is not a top table view cell")
        }
        
        //get the right muv
        let muv = muvs[indexPath.row]
        
        //configure the cell
        cell.nameLabel.text = muv.name
        cell.descriptionLabel.text = muv.description
        
        return cell
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
