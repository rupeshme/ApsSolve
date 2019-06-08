//
//  HelpViewController.swift
//  ApsSolve
//
//  Created by Rupesh on 2/2/19.
//  Copyright © 2019 Rupesh. All rights reserved.
//

import UIKit

class HelpViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
       self.title = "About"
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if(indexPath.row == 0)
        {
            cell?.textLabel?.text = "See our Youtube channel"

        }
        else if(indexPath.row == 1)
        {
            cell?.textLabel?.text = "Terms and conditions"

        }
        else if(indexPath.row == 2)
        {
            cell?.textLabel?.text = "Cookies usage"

        }
          else
        {
            cell?.textLabel?.text = "Third-party softwares"

        }
        return cell!
        
        
    }
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
