//
//  DefineViewController.swift
//  ApsSolve
//
//  Created by Rupesh on 2/2/19.
//  Copyright © 2019 Rupesh. All rights reserved.
//

import UIKit

class DefineViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate,UITextViewDelegate {

    @IBOutlet weak var  tableView : UITableView!
    var define  = currentProblem["define"] as! NSMutableDictionary
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftItemsSupplementBackButton = true


        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        if(indexPath.row == 0)
        {
            return 88
            
        }
        else if(indexPath.row == 1)
        {
            return 90
            
        }
        else
        {
            return 200
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if(indexPath.row==0)
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell1")
            let textField1 = cell!.contentView.viewWithTag(1) as! UITextField
            textField1.layer.borderWidth = 1
            textField1.layer.borderColor = UIColor.lightGray.cgColor
            let fullNameArr = (define["whatmaterial"] as? String)!.components(separatedBy: "<br>")
//            if(fullNameArr.count > 2)
//            {
                textField1.text = fullNameArr[0]
            //}

            return cell!
            
        }
        else if(indexPath.row==1)
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell2")
            let textField = cell!.contentView.viewWithTag(1) as! UITextField
            textField.text = define["whoasking"] as? String
            textField.layer.borderWidth = 1
            textField.layer.borderColor = UIColor.lightGray.cgColor
            return cell!
            
        }

        else
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell3")
            let textView = cell!.contentView.viewWithTag(1) as! UITextView
            textView.text = define["whatproblem"] as? String
            textView.layer.cornerRadius = 5
            textView.layer.borderWidth = 1
            textView.layer.borderColor = UIColor.lightGray.cgColor
            if textView.text == "" {
                textView.text = "Let the detecter explain\n\nThen ask to describe in one simple phrase with upto 5 words"
                textView.textColor = UIColor.lightGray
            }

            return cell!

        }
        
    }

    @IBAction func goSee(_ sender : UIButton)
    {
        let goSeeViewController = self.storyboard?.instantiateViewController(withIdentifier: "goSeeViewController")
        self.navigationController?.pushViewController(goSeeViewController!, animated: true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField)
    {
        let buttonPosition = textField.convert(CGPoint.zero, to: self.tableView)
        let indexPath = self.tableView.indexPathForRow(at:buttonPosition)
        let cell = self.tableView.cellForRow(at: indexPath!)
        if(indexPath?.row == 0)
        {
            let textField1 = cell!.contentView.viewWithTag(1) as! UITextField
//            let textField2 = cell!.contentView.viewWithTag(2) as! UITextField
//            let textField3 = cell!.contentView.viewWithTag(3) as! UITextField
            
            define["whatmaterial"] = textField1.text!
//                + "<br>" + textField2.text! + "<br>" + textField3.text!
            

        }
        else
        {
            let textField = cell!.contentView.viewWithTag(1) as! UITextField
            define["whoasking"] = textField.text!
        }

    }
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == "Let the detecter explain\n\nThen ask to describe in one simple phrase with upto 5 words" {
            textView.text = ""
            textView.textColor = UIColor.black
        }
    }
    func textViewDidEndEditing(_ textView: UITextView)
    {

        let buttonPosition = textView.convert(CGPoint.zero, to: self.tableView)
        let indexPath = self.tableView.indexPathForRow(at:buttonPosition)
        let cell = self.tableView.cellForRow(at: indexPath!)
        let textView = cell!.contentView.viewWithTag(1) as! UITextView
        define["whatproblem"] = textView.text!
        
        if textView.text == "" {
            textView.text = "Let the detecter explain\n\nThen ask to describe in one simple phrase with upto 5 words"
            textView.textColor = UIColor.lightGray
        }


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
