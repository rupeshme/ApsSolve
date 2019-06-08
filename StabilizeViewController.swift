//
//  StabilizeViewController.swift
//  ApsSolve
//
//  Created by Rupesh on 5/11/19.
//  Copyright © 2019 Rupesh. All rights reserved.
//

import UIKit

class StabilizeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate {
        
    @IBOutlet weak var  tableView : UITableView!
    var assign  = currentProblem["stabilize"] as! NSMutableDictionary
    let datePicker = UIDatePicker()
    let toolbar = UIToolbar();
    var txtSelected: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftItemsSupplementBackButton = true
        showDatePicker()
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 91
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if(indexPath.row==0)
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell1")
            let textField = cell!.contentView.viewWithTag(1) as! UITextField
            textField.layer.borderWidth = 1
            textField.layer.borderColor = UIColor.lightGray.cgColor
            textField.text = assign["why"] as? String
            return cell!
            
        }
        if(indexPath.row==1)
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell2")
            let textField = cell!.contentView.viewWithTag(1) as! UITextField
            textField.layer.borderWidth = 1
            textField.layer.borderColor = UIColor.lightGray.cgColor
            textField.text = assign["what"] as? String
            return cell!
            
        }
        if(indexPath.row==2)
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell3")
            let textField = cell!.contentView.viewWithTag(1) as! UITextField
            textField.layer.borderWidth = 1
            textField.layer.borderColor = UIColor.lightGray.cgColor
            textField.text = assign["who"] as? String
            return cell!
            
        }
            
        else
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell4")
            let textField = cell!.contentView.viewWithTag(1) as! UITextField
            textField.layer.borderWidth = 1
            textField.layer.borderColor = UIColor.lightGray.cgColor
            textField.text = assign["when"] as? String
            textField.inputAccessoryView = toolbar
            // add datepicker to textField
            textField.inputView = datePicker
            
            return cell!
            
        }
        
    }
    public func textFieldDidBeginEditing(_ textField: UITextField)
    {
        txtSelected = textField;
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
        let textField = cell!.contentView.viewWithTag(1) as! UITextField
        if(indexPath?.row == 0)
        {
            assign["why"] = textField.text!
            
        }
        else if(indexPath?.row == 1)
        {
            assign["what"] = textField.text!
            
        }
        else if(indexPath?.row == 2)
        {
            assign["who"] = textField.text!
            
        }
        else if(indexPath?.row == 3)
        {
            assign["when"] = textField.text!
            
        }
        
        
    }
    func showDatePicker(){
        //Formate Date
        datePicker.datePickerMode = .dateAndTime
        
        //ToolBar
        toolbar.sizeToFit()
        
        //done button & cancel button
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneDatePicker))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker))
        toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)
        
        
    }
    
    @objc func doneDatePicker(){
        //For date formate
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy hh:mm"
        txtSelected.text = formatter.string(from: datePicker.date)
        //dismiss date picker dialog
        self.view.endEditing(true)
    }
    
    @objc func cancelDatePicker(){
        //cancel button dismiss datepicker dialog
        self.view.endEditing(true)
    }
    @IBAction func validate(_ sender : UIButton)
    {
        self.navigationController?.popViewController(animated: true)

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
