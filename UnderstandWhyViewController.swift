//
//  UnderstandWhyViewController.swift
//  ApsSolve
//
//  Created by Rupesh on 5/26/19.
//  Copyright © 2019 Rupesh. All rights reserved.
//

import UIKit

class UnderstandWhyViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UITextViewDelegate,UITextFieldDelegate,UIPickerViewDelegate,UIPickerViewDataSource {
    
    @IBOutlet weak var  tableView : UITableView!
    @IBOutlet weak var  txtTechnicalCause : UITextView!
    @IBOutlet weak var  txtProcessCapture : UITextField!
    @IBOutlet weak var  txtTrainingStep : UITextField!
    let picker = UIPickerView()
    let toolbar = UIToolbar();
    var txtSelected: UITextField!
    var gofArray = ["Guess", "Opinion", "Fact"]
    var processArray = ["Major step (What to do)", "Key Point (How to do)", "Reason for key point (Why to do"]
    var trainingArray = ["Preparation", "Presentation", "Performance trial", "Follow through"]
    var understandwhy  = currentProblem["understandwhy"] as! NSMutableDictionary
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftItemsSupplementBackButton = true
        txtTechnicalCause.text = understandwhy["phrasedescribe"] as? String
        txtTechnicalCause.layer.cornerRadius = 5
        txtTechnicalCause.layer.borderWidth = 1
        txtTechnicalCause.layer.borderColor = UIColor.lightGray.cgColor
        if txtTechnicalCause.text == "" {
            txtTechnicalCause.text = "One phrase to describe the How/Factor/Technical cause"
            txtTechnicalCause.textColor = UIColor.lightGray
        }

                txtProcessCapture.text = understandwhy["processcapture"] as? String
        txtTrainingStep.text = understandwhy["trainingstep"] as? String

        showPicker()
        txtProcessCapture.inputAccessoryView = toolbar
        txtProcessCapture.inputView = picker
        txtTrainingStep.inputAccessoryView = toolbar
        txtTrainingStep.inputView = picker
        txtProcessCapture.layer.borderWidth = 1
        txtProcessCapture.layer.borderColor = UIColor.lightGray.cgColor
        txtTrainingStep.layer.borderWidth = 1
        txtTrainingStep.layer.borderColor = UIColor.lightGray.cgColor
        // Do any additional setup after loading the view.
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
        let lbl = cell!.contentView.viewWithTag(1) as! UILabel
        let textView = cell!.contentView.viewWithTag(2) as! UITextView
        let textField = cell!.contentView.viewWithTag(3) as! UITextField
        let button = cell!.contentView.viewWithTag(4) as! UIButton
        textField.inputAccessoryView = toolbar
        textField.inputView = picker
        var assignHow :NSMutableDictionary!
        if(indexPath.row == 0)
        {
            lbl.text = "1"
            textView.text = understandwhy["cell12"] as? String
            textField.text = understandwhy["cell13"] as? String
            assignHow = currentProblem["assignWhy1"] as? NSMutableDictionary
            if textView.text == "" {
                textView.text = "Why+“Text from Technical cause”+“?” Answer with a single phrase up to 5 words (subject, verb, object)"
                textView.textColor = UIColor.lightGray
            }
        }
        else if(indexPath.row == 1)
        {
            lbl.text = "2"
            textView.text = understandwhy["cell22"] as? String
            textField.text = understandwhy["cell23"] as? String
            assignHow = currentProblem["assignWhy2"] as? NSMutableDictionary
            if textView.text == "" {
                textView.text = "Why+“Because from Why 1”+“?” Answer with a single phrase up to 5 words (subject, verb, object)"
                textView.textColor = UIColor.lightGray
            }
        }
        else if(indexPath.row == 2)
        {
            lbl.text = "3"
            textView.text = understandwhy["cell32"] as? String
            textField.text = understandwhy["cell33"] as? String
            assignHow = currentProblem["assignWhy3"] as? NSMutableDictionary
            if textView.text == "" {
                textView.text = "Why+“Because from Why 2”+“?” Answer with a single phrase up to 5 words (subject, verb, object)"
                textView.textColor = UIColor.lightGray
            }
        }
        else if(indexPath.row == 3)
        {
            lbl.text = "4"
            textView.text = understandwhy["cell42"] as? String
            textField.text = understandwhy["cell43"] as? String
            assignHow = currentProblem["assignWhy4"] as? NSMutableDictionary
            if textView.text == "" {
                textView.text = "Why+“Because from Why 3”+“?” Answer with a single phrase up to 5 words (subject, verb, object)"
                textView.textColor = UIColor.lightGray
            }
        }
        else
        {
            lbl.text = "5"
            textView.text = understandwhy["cell52"] as? String
            textField.text = understandwhy["cell53"] as? String
            assignHow = currentProblem["assignWhy5"] as? NSMutableDictionary
            if textView.text == "" {
                textView.text = "Why+“Because from Why 4”+“?” Answer with a single phrase up to 5 words (subject, verb, object)"
                textView.textColor = UIColor.lightGray
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

    @IBAction func assign(_ sender : UIButton)
    {
        let buttonPosition = sender.convert(CGPoint.zero, to: self.tableView)
        let indexPath = self.tableView.indexPathForRow(at:buttonPosition)
        
        let assignViewController = self.storyboard?.instantiateViewController(withIdentifier: "assignViewController") as! AssignViewController
        
        switch indexPath?.row {
        case 0:
            assignViewController.assign = currentProblem["assignWhy1"] as? NSMutableDictionary
        case 1:
            assignViewController.assign = currentProblem["assignWhy2"] as? NSMutableDictionary
        case 2:
            assignViewController.assign = currentProblem["assignWhy3"] as? NSMutableDictionary
        case 3:
            assignViewController.assign = currentProblem["assignWhy4"] as? NSMutableDictionary
            
        default:
            assignViewController.assign = currentProblem["assignWhy5"] as? NSMutableDictionary
        }
        self.navigationController?.pushViewController(assignViewController, animated: true)

    }
    func textViewDidBeginEditing(_ textView: UITextView) {
        
        if(txtTechnicalCause == textView)
        {
            if  textView.text == "One phrase to describe the How/Factor/Technical cause" {
                textView.text = ""
                textView.textColor = UIColor.black
            }
        }
        else
        {
        let buttonPosition = textView.convert(CGPoint.zero, to: self.tableView)
        let indexPath = self.tableView.indexPathForRow(at:buttonPosition)
        let cell = self.tableView.cellForRow(at: indexPath!)
        if(cell != nil){
            
            
            if(indexPath?.row == 0)
            {
                if  textView.text == "Why+“Text from Technical cause”+“?” Answer with a single phrase up to 5 words (subject, verb, object)" {
                    textView.text = ""
                    textView.textColor = UIColor.black
                }
            }
            else if(indexPath?.row == 1)
            {
                if  textView.text == "Why+“Because from Why 1”+“?” Answer with a single phrase up to 5 words (subject, verb, object)" {
                    textView.text = ""
                    textView.textColor = UIColor.black
                }
               
            }
            else if(indexPath?.row == 2)
            {
                if textView.text == "Why+“Because from Why 2”+“?” Answer with a single phrase up to 5 words (subject, verb, object)" {
                    textView.text = ""
                    textView.textColor = UIColor.black
                }
               
            }
            else if(indexPath?.row == 3)
            {
                if textView.text == "Why+“Because from Why 3”+“?” Answer with a single phrase up to 5 words (subject, verb, object)" {
                    textView.text = ""
                    textView.textColor = UIColor.black
                }
                
            }
            else
            {
                if  textView.text == "Why+“Because from Why 4”+“?” Answer with a single phrase up to 5 words (subject, verb, object)" {
                    textView.text = ""
                    textView.textColor = UIColor.lightGray
                }
            }
            
        }
        }
    }
    func textViewDidEndEditing(_ textView: UITextView)
    {
        if(textView == self.txtTechnicalCause)
        {
            understandwhy["phrasedescribe"] = txtTechnicalCause.text
            if txtTechnicalCause.text == "" {
                txtTechnicalCause.text = "One phrase to describe the How/Factor/Technical cause"
                txtTechnicalCause.textColor = UIColor.lightGray
            }
        }
        else
        {
        let buttonPosition = textView.convert(CGPoint.zero, to: self.tableView)
        let indexPath = self.tableView.indexPathForRow(at:buttonPosition)
        let cell = self.tableView.cellForRow(at: indexPath!)
        if(cell != nil){
            if(indexPath?.row == 0)
            {
                understandwhy["cell12"] = textView.text!
                if textView.text == "" {
                    textView.text = "Why+“Text from Technical cause”+“?” Answer with a single phrase up to 5 words (subject, verb, object)"
                    textView.textColor = UIColor.lightGray
                }
            }
            else if(indexPath?.row == 1)
            {
                understandwhy["cell22"] = textView.text!
                if textView.text == "" {
                    textView.text = "Why+“Because from Why 1”+“?” Answer with a single phrase up to 5 words (subject, verb, object)"
                    textView.textColor = UIColor.lightGray
                }
            }
            else if(indexPath?.row == 2)
            {
                understandwhy["cell32"] = textView.text!
                if textView.text == "" {
                    textView.text = "Why+“Because from Why 2”+“?” Answer with a single phrase up to 5 words (subject, verb, object)"
                    textView.textColor = UIColor.lightGray
                }
            }
            else if(indexPath?.row == 3)
            {
                understandwhy["cell42"] = textView.text!
                if textView.text == "" {
                    textView.text = "Why+“Because from Why 3”+“?” Answer with a single phrase up to 5 words (subject, verb, object)"
                    textView.textColor = UIColor.lightGray
                }
            }
            else
            {
                understandwhy["cell52"] = textView.text!
                if textView.text == "" {
                    textView.text = "Why+“Because from Why 4”+“?” Answer with a single phrase up to 5 words (subject, verb, object)"
                    textView.textColor = UIColor.lightGray
                }
            }
        }
        }
        
    }
    public func textFieldDidBeginEditing(_ textField: UITextField)
    {
        txtSelected = textField;
        picker.reloadAllComponents()
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField)
    {
        if(textField == self.txtTechnicalCause)
        {
             understandwhy["phrasedescribe"] = txtTechnicalCause.text

        }
        else if(textField == self.txtProcessCapture)
        {
            understandwhy["processcapture"] = txtProcessCapture.text

        }
        else if(textField == self.txtTrainingStep)
        {
            understandwhy["trainingstep"] = txtTrainingStep.text

        }
        else
        {
        let buttonPosition = textField.convert(CGPoint.zero, to: self.tableView)
        let indexPath = self.tableView.indexPathForRow(at:buttonPosition)
        let cell = self.tableView.cellForRow(at: indexPath!)
        if(cell != nil){
            if(indexPath?.row == 0)
            {
                understandwhy["cell13"] = textField.text!
                
            }
            else if(indexPath?.row == 1)
            {
                understandwhy["cell23"] = textField.text!
                
            }
            else if(indexPath?.row == 2)
            {
                understandwhy["cell33"] = textField.text!
                
            }
            else if(indexPath?.row == 3)
            {
                understandwhy["cell43"] = textField.text!
                
            }
            else if(indexPath?.row == 4)
            {
                understandwhy["cell53"] = textField.text!
                
            }
            }
        }
    }
    // returns the # of rows in each component..
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

     func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
     {
        if(txtSelected == self.txtProcessCapture)
        {
            return 3

        }
        else if(txtSelected == self.txtTrainingStep)
        {
            return 4

        }
        else
        {
            return 3

        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if(txtSelected == self.txtProcessCapture)
        {
            return processArray[row]
            
        }
        else if(txtSelected == self.txtTrainingStep)
        {
            return trainingArray[row]
            
        }
        else
        {
            return gofArray[row]
            
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        
    }

    func showPicker(){
        
        //ToolBar
        picker.delegate = self
        picker.dataSource = self
        toolbar.sizeToFit()
        
        //done button & cancel button
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donePicker))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelPicker))
        toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)
        
        
    }
    
    @objc func donePicker(){
        if(txtSelected == self.txtProcessCapture)
        {
            txtSelected.text = processArray[picker.selectedRow(inComponent: 0)]
            
        }
        else if(txtSelected == self.txtTrainingStep)
        {
            txtSelected.text = trainingArray[picker.selectedRow(inComponent: 0)]

        }
        else
        {
            txtSelected.text = gofArray[picker.selectedRow(inComponent: 0)]

        }
        //dismiss  picker dialog
        self.view.endEditing(true)
    }
    
    @objc func cancelPicker(){
        //cancel button dismiss picker dialog
        self.view.endEditing(true)
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
