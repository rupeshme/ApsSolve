//
//  EvaluteViewController.swift
//  ApsSolve
//
//  Created by Rupesh on 2/7/19.
//  Copyright © 2019 Rupesh. All rights reserved.
//

import UIKit

class EvaluteViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate,UITextViewDelegate {

    @IBOutlet weak var  tableView : UITableView!
    var evalute  = currentProblem["evalute"] as! NSMutableDictionary

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftItemsSupplementBackButton = true
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        if(indexPath.row == 0)
        {
            return 90
            
        }
        else
        {
            return 160
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if(indexPath.row==0)
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell1")
            let textField1 = cell!.contentView.viewWithTag(1) as! UITextField
            let textField2 = cell!.contentView.viewWithTag(2) as! UITextField
            textField1.layer.borderWidth = 1
            textField1.layer.borderColor = UIColor.lightGray.cgColor
            textField2.layer.borderWidth = 1
            textField2.layer.borderColor = UIColor.lightGray.cgColor

            textField1.text = evalute["howmanygood"] as? String
            textField2.text = evalute["howmanybad"] as? String

            return cell!
            
        }
        else
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell2")
            let textView1 = cell!.contentView.viewWithTag(1) as! UITextView
//            let textField2 = cell!.contentView.viewWithTag(2) as! UITextField
//            let textField3 = cell!.contentView.viewWithTag(3) as! UITextField
            textView1.text = (evalute["whyproblem"] as? String)
            textView1.layer.cornerRadius = 5
            textView1.layer.borderWidth = 1
            textView1.layer.borderColor = UIColor.lightGray.cgColor
            if textView1.text == "" {
                textView1.text = "Impact for the customer\nInternal-Safety or People\nExternal-Quality Cost Delivery"
                textView1.textColor = UIColor.lightGray
            }
//            let fullNameArr = (evalute["whyproblem"] as? String)!.components(separatedBy: "<br>")
//            if(fullNameArr.count > 1)
//            {
//                textView1.text = fullNameArr[0]
//                textField2.text = fullNameArr[1]
//                textField3.text = fullNameArr[2]
           // }
            

            return cell!
            
        }
        
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
//        if(indexPath?.row == 0)
//        {
            let textField1 = cell!.contentView.viewWithTag(1) as! UITextField
            let textField2 = cell!.contentView.viewWithTag(2) as! UITextField

            evalute["howmanygood"] = textField1.text!
            evalute["howmanybad"] = textField2.text!

       // }
//        else
//        {
//            let textField1 = cell!.contentView.viewWithTag(1) as! UITextField
//            let textField2 = cell!.contentView.viewWithTag(2) as! UITextField
//            let textField3 = cell!.contentView.viewWithTag(3) as! UITextField
//
//            evalute["whyproblem"] = textField1.text!  + "<br>" + textField2.text! + "<br>" + textField3.text!
//        }
        
    }
    func textViewDidBeginEditing(_ textView: UITextView) {
                if textView.text == "Impact for the customer\nInternal-Safety or People\nExternal-Quality Cost Delivery" {
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
         evalute["whyproblem"] = textView.text!
        if textView.text == "" {
            textView.text = "Impact for the customer\nInternal-Safety or People\nExternal-Quality Cost Delivery"
            textView.textColor = UIColor.lightGray
        }

        
    }
    
    @IBAction func compare(_ sender : UIButton)
    {
        let compareViewController = self.storyboard?.instantiateViewController(withIdentifier: "compareViewController")
        self.navigationController?.pushViewController(compareViewController!, animated: true)
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
