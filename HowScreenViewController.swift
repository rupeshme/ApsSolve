//
//  HowScreenViewController.swift
//  ApsSolve
//
//  Created by Rupesh on 5/11/19.
//  Copyright © 2019 Rupesh. All rights reserved.
//

import UIKit

class HowScreenViewController: UIViewController,UITextViewDelegate {
    @IBOutlet weak var  textView : UITextView!
    var how  = currentProblem["how"] as! NSMutableDictionary
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftItemsSupplementBackButton = true
      textView.text = how["how"] as? String
        // Do any additional setup after loading the view.
    }
    
    @IBAction func stabilizeScreen(_ sender : UIButton)
    {
        let stabilizeViewController = self.storyboard?.instantiateViewController(withIdentifier: "stabilizeViewController")
        self.navigationController?.pushViewController(stabilizeViewController!, animated: true)
    }
    func textViewDidBeginEditing(_ textView: UITextView) {
    }
    func textViewDidEndEditing(_ textView: UITextView)
    {
        
                how["how"] = textView.text!
        
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
