//
//  UnderstandViewController.swift
//  ApsSolve
//
//  Created by Rupesh on 5/26/19.
//  Copyright © 2019 Rupesh. All rights reserved.
//

import UIKit

class UnderstandViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UITextViewDelegate  {

    @IBOutlet weak var  tableView : UITableView!
    @IBOutlet weak var  radioBtn1 : UIButton!
    @IBOutlet weak var  radioBtn2 : UIButton!
    @IBOutlet weak var  lblOccurance : UILabel!
    var understandhow  = currentProblem["understandhow"] as! NSMutableDictionary
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftItemsSupplementBackButton = true
        // Do any additional setup after loading the view.
        let gosee  = currentProblem["analyzegosee"] as! NSMutableDictionary
        lblOccurance.text = gosee["whatlikely"] as? String
        radioBtn1.isSelected = understandhow["process"] as! Bool
        radioBtn2.isSelected = understandhow["nondetection"] as! Bool

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableCell(withIdentifier: "header")

        return headerView
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 80
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        let textView1 = cell!.contentView.viewWithTag(1) as! UITextView
        let textView2 = cell!.contentView.viewWithTag(2) as! UITextView
        let textView3 = cell!.contentView.viewWithTag(3) as! UITextView
        let button = cell!.contentView.viewWithTag(4) as! UIButton
        var assignHow :NSMutableDictionary!
        if(indexPath.row == 0)
        {
            textView1.text = understandhow["cell11"] as? String
            textView2.text = understandhow["cell12"] as? String
            textView3.text = understandhow["cell13"] as? String
            assignHow = currentProblem["assignHow1"] as? NSMutableDictionary
          if textView1.text == "" {
            textView1.text = "Manpower"
            textView1.textColor = UIColor.lightGray
          }
          if textView2.text == "" {
            textView2.text = "Who made the Good?"
            textView2.textColor = UIColor.lightGray
          }
          if textView3.text == "" {
            textView3.text = "Who made the Bad?"
            textView3.textColor = UIColor.lightGray
           }
            

        }
        else if(indexPath.row == 1)
        {
            textView1.text = understandhow["cell21"] as? String
            textView2.text = understandhow["cell22"] as? String
            textView3.text = understandhow["cell23"] as? String
            assignHow = currentProblem["assignHow2"] as? NSMutableDictionary

            if textView1.text == "" {
                textView1.text = "Material"
                textView1.textColor = UIColor.lightGray
            }
            if textView2.text == "" {
                textView2.text = "What input (S/N, Lot, Batch) for the Good?"
                textView2.textColor = UIColor.lightGray
            }
            if textView3.text == "" {
                textView3.text = "What input (S/N, Lot, Batch) for the Bad?"
                textView3.textColor = UIColor.lightGray
            }
        }
        else if(indexPath.row == 2)
        {
            textView1.text = understandhow["cell31"] as? String
            textView2.text = understandhow["cell32"] as? String
            textView3.text = understandhow["cell33"] as? String
            assignHow = currentProblem["assignHow3"] as? NSMutableDictionary

            if textView1.text == "" {
                textView1.text = "Method"
                textView1.textColor = UIColor.lightGray
            }
            if textView2.text == "" {
                textView2.text = "How was the Good made? (Drawing, procedure)"
                textView2.textColor = UIColor.lightGray
            }
            if textView3.text == "" {
                textView3.text = "How was the Bad made? (Drawing, procedure)"
                textView3.textColor = UIColor.lightGray
            }
        }
        else if(indexPath.row == 3)
        {
            textView1.text = understandhow["cell41"] as? String
            textView2.text = understandhow["cell42"] as? String
            textView3.text = understandhow["cell43"] as? String
            assignHow = currentProblem["assignHow4"] as? NSMutableDictionary

            if textView1.text == "" {
                textView1.text = "Machinery"
                textView1.textColor = UIColor.lightGray
            }
            if textView2.text == "" {
                textView2.text = "With what machine or tool was the Good made?"
                textView2.textColor = UIColor.lightGray
            }
            if textView3.text == "" {
                textView3.text = "With what machine or tool was the Bad made?"
                textView3.textColor = UIColor.lightGray
            }
           
        }
        else
        {
            textView1.text = understandhow["cell51"] as? String
            textView2.text = understandhow["cell52"] as? String
            textView3.text = understandhow["cell53"] as? String
            assignHow = currentProblem["assignHow5"] as? NSMutableDictionary

            if textView1.text == "" {
                textView1.text = "Environment"
                textView1.textColor = UIColor.lightGray
            }
            if textView2.text == "" {
                textView2.text = "Where was the Good made?"
                textView2.textColor = UIColor.lightGray
            }
            if textView3.text == "" {
                textView3.text = "Where was the Bad made"
                textView3.textColor = UIColor.lightGray
            }
        }
        if((assignHow["status"] as! String) == "1")
        {
            button.setImage(UIImage(named:"progress"), for: .normal)
        }
        else if((assignHow["status"] as! String) == "2")
        {
            button.setImage(UIImage(named:"done"), for: .normal)
            
        }
        else if((assignHow["status"] as! String) == "3")
        {
            button.setImage(UIImage(named:"stop"), for: .normal)
            
        }
        else if((assignHow["status"] as! String) == "4")
        {
            button.setImage(UIImage(named:"reject"), for: .normal)
            
        }

        else
        {
            button.setImage(UIImage(named:"questionAct"), for: .normal)
            
        }
            return cell!
            

        
    }
    @IBAction func radioSelected(_ sender : UIButton)
    {
        sender.isSelected = !sender.isSelected
        understandhow["process"] = radioBtn1.isSelected
        understandhow["nondetection"] = radioBtn2.isSelected

    }

    @IBAction func why(_ sender : UIButton)
    {
        let understandWhyViewController = self.storyboard?.instantiateViewController(withIdentifier: "understandWhyViewController")
        self.navigationController?.pushViewController(understandWhyViewController!, animated: true)
    }
    @IBAction func assign(_ sender : UIButton)
    {
        let buttonPosition = sender.convert(CGPoint.zero, to: self.tableView)
        let indexPath = self.tableView.indexPathForRow(at:buttonPosition)

        let assignViewController = self.storyboard?.instantiateViewController(withIdentifier: "assignViewController") as! AssignViewController
        
        switch indexPath?.row {
        case 0:
            assignViewController.assign = currentProblem["assignHow1"] as? NSMutableDictionary
        case 1:
            assignViewController.assign = currentProblem["assignHow2"] as? NSMutableDictionary
        case 2:
            assignViewController.assign = currentProblem["assignHow3"] as? NSMutableDictionary
        case 3:
            assignViewController.assign = currentProblem["assignHow4"] as? NSMutableDictionary
            
        default:
            assignViewController.assign = currentProblem["assignHow5"] as? NSMutableDictionary
        }
        self.navigationController?.pushViewController(assignViewController, animated: true)

    }
    func textViewDidBeginEditing(_ textView: UITextView) {
        let buttonPosition = textView.convert(CGPoint.zero, to: self.tableView)
        let indexPath = self.tableView.indexPathForRow(at:buttonPosition)
        let cell = self.tableView.cellForRow(at: indexPath!)
        if(cell != nil){
            
            
            if(indexPath?.row == 0)
            {
                if textView.tag == 1 && textView.text == "Manpower" {
                    textView.text = ""
                    textView.textColor = UIColor.black
                }
               else if textView.tag == 2 && textView.text == "Who made the Good?" {
                    textView.text = ""
                    textView.textColor = UIColor.black
                }
               else if textView.tag == 3 && textView.text == "Who made the Bad?" {
                    textView.text = ""
                    textView.textColor = UIColor.black
                }
            }
            else if(indexPath?.row == 1)
            {
                if textView.tag == 1 && textView.text == "Material" {
                    textView.text = ""
                    textView.textColor = UIColor.black
                }
               else if textView.tag == 2 && textView.text == "What input (S/N, Lot, Batch) for the Good?" {
                    textView.text = ""
                    textView.textColor = UIColor.black
                }
               else if textView.tag == 3 && textView.text == "What input (S/N, Lot, Batch) for the Bad?" {
                    textView.text = ""
                    textView.textColor = UIColor.black
                }
            }
            else if(indexPath?.row == 2)
            {
                if textView.tag == 1 && textView.text == "Method" {
                    textView.text = ""
                    textView.textColor = UIColor.black
                }
               else if textView.tag == 2 && textView.text == "How was the Good made? (Drawing, procedure)" {
                    textView.text = ""
                    textView.textColor = UIColor.black
                }
               else if textView.tag == 3 && textView.text == "How was the Bad made? (Drawing, procedure)" {
                    textView.text = ""
                    textView.textColor = UIColor.black
                }
            }
            else if(indexPath?.row == 3)
            {
                if textView.tag == 1 && textView.text == "Machinery" {
                    textView.text = ""
                    textView.textColor = UIColor.black
                }
               else if textView.tag == 2 && textView.text == "With what machine or tool was the Good made?" {
                    textView.text = ""
                    textView.textColor = UIColor.black
                }
               else if textView.tag == 3 && textView.text == "With what machine or tool was the Bad made?" {
                    textView.text = ""
                    textView.textColor = UIColor.black
                }
                
            }
            else
            {
                if textView.tag == 1 && textView.text == "Environment" {
                    textView.text = ""
                    textView.textColor = UIColor.lightGray
                }
                else if textView.tag == 2 && textView.text == "Where was the Good made?" {
                    textView.text = ""
                    textView.textColor = UIColor.lightGray
                }
                else if textView.tag == 3 && textView.text == "Where was the Bad made" {
                    textView.text = ""
                    textView.textColor = UIColor.lightGray
                }
            }        }
    }
    func textViewDidEndEditing(_ textView: UITextView)
    {
        
        let buttonPosition = textView.convert(CGPoint.zero, to: self.tableView)
        let indexPath = self.tableView.indexPathForRow(at:buttonPosition)
        let cell = self.tableView.cellForRow(at: indexPath!)
        if(cell != nil){
            let textView1 = cell!.contentView.viewWithTag(1) as! UITextView
            let textView2 = cell!.contentView.viewWithTag(2) as! UITextView
            let textView3 = cell!.contentView.viewWithTag(3) as! UITextView

            if(indexPath?.row == 0)
            {
                understandhow["cell11"] = textView1.text!
                understandhow["cell12"] = textView2.text!
                understandhow["cell13"] = textView3.text!

                if textView1.text == "" {
                    textView1.text = "Manpower"
                    textView1.textColor = UIColor.lightGray
                }
                if textView2.text == "" {
                    textView2.text = "Who made the Good?"
                    textView2.textColor = UIColor.lightGray
                }
                if textView3.text == "" {
                    textView3.text = "Who made the Bad?"
                    textView3.textColor = UIColor.lightGray
                }
            }
            else if(indexPath?.row == 1)
            {
                understandhow["cell21"] = textView1.text!
                understandhow["cell22"] = textView2.text!
                understandhow["cell23"] = textView3.text!

                if textView1.text == "" {
                    textView1.text = "Material"
                    textView1.textColor = UIColor.lightGray
                }
                if textView2.text == "" {
                    textView2.text = "What input (S/N, Lot, Batch) for the Good?"
                    textView2.textColor = UIColor.lightGray
                }
                if textView3.text == "" {
                    textView3.text = "What input (S/N, Lot, Batch) for the Bad?"
                    textView3.textColor = UIColor.lightGray
                }
            }
            else if(indexPath?.row == 2)
            {
                understandhow["cell31"] = textView1.text!
                understandhow["cell32"] = textView2.text!
                understandhow["cell33"] = textView3.text!
                if textView1.text == "" {
                    textView1.text = "Method"
                    textView1.textColor = UIColor.lightGray
                }
                if textView2.text == "" {
                    textView2.text = "How was the Good made? (Drawing, procedure)"
                    textView2.textColor = UIColor.lightGray
                }
                if textView3.text == "" {
                    textView3.text = "How was the Bad made? (Drawing, procedure)"
                    textView3.textColor = UIColor.lightGray
                }
            }
            else if(indexPath?.row == 3)
            {
                understandhow["cell41"] = textView1.text!
                understandhow["cell42"] = textView2.text!
                understandhow["cell43"] = textView3.text!

                if textView1.text == "" {
                    textView1.text = "Machinery"
                    textView1.textColor = UIColor.lightGray
                }
                if textView2.text == "" {
                    textView2.text = "With what machine or tool was the Good made?"
                    textView2.textColor = UIColor.lightGray
                }
                if textView3.text == "" {
                    textView3.text = "With what machine or tool was the Bad made?"
                    textView3.textColor = UIColor.lightGray
                }
                
            }
            else
            {
                understandhow["cell51"] = textView1.text!
                understandhow["cell52"] = textView2.text!
                understandhow["cell53"] = textView3.text!
                if textView1.text == "" {
                    textView1.text = "Environment"
                    textView1.textColor = UIColor.lightGray
                }
                if textView2.text == "" {
                    textView2.text = "Where was the Good made?"
                    textView2.textColor = UIColor.lightGray
                }
                if textView3.text == "" {
                    textView3.text = "Where was the Bad made"
                    textView3.textColor = UIColor.lightGray
                }
            }
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
