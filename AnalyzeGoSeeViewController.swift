//
//  AnalyzeGoSeeViewController.swift
//  ApsSolve
//
//  Created by Rupesh on 5/11/19.
//  Copyright © 2019 Rupesh. All rights reserved.
//

import UIKit
import QuickLook
class AnalyzeGoSeeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UITextFieldDelegate,UITextViewDelegate,QLPreviewControllerDataSource {
        
    @IBOutlet weak var  tableView : UITableView!
    var gosee  = currentProblem["analyzegosee"] as! NSMutableDictionary
    var isWherePhotos = true
    let datePicker = UIDatePicker()
    let toolbar = UIToolbar();
    var txtSelected: UITextField!
    let item = PreviewItem()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftItemsSupplementBackButton = true
        showDatePicker()
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        if(indexPath.row == 0 || indexPath.row == 4)
        {
            return 90
            
        }
        else if(indexPath.row == 3)
        {
            return 120
            
        }
            
        else
        {
            return 124
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if(indexPath.row==0)
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell1")
            let textField = cell!.contentView.viewWithTag(1) as! UITextField
            textField.layer.borderWidth = 1
            textField.layer.borderColor = UIColor.lightGray.cgColor
            textField.text = gosee["whatlikely"] as? String
            return cell!
            
        }
        else if(indexPath.row==1)
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell2")
            let textView1 = cell!.contentView.viewWithTag(1) as! UITextView
            textView1.text =  (gosee["who"] as? String)
            textView1.layer.cornerRadius = 5
            textView1.layer.borderWidth = 1
            textView1.layer.borderColor = UIColor.lightGray.cgColor
            if textView1.text == "" {
                textView1.text = "-is the empowered pilot\n-was in charge of the likely occurrence"
                textView1.textColor = UIColor.lightGray
            }
            
            return cell!
            
        }
        else if(indexPath.row==2)
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell3")
            let textView1 = cell!.contentView.viewWithTag(1) as! UITextView
            textView1.text =  (gosee["where"] as? String)
            textView1.layer.cornerRadius = 5
            textView1.layer.borderWidth = 1
            textView1.layer.borderColor = UIColor.lightGray.cgColor
            if textView1.text == "" {
                textView1.text = "-in the plant\n-in the machine/bench"
                textView1.textColor = UIColor.lightGray
            }
            
            return cell!
            
        }

//        else if(indexPath.row==2)
//        {
//            let cell = tableView.dequeueReusableCell(withIdentifier: "cell3")
//            let collectionView = cell!.contentView.viewWithTag(1) as! UICollectionView
//            collectionView.reloadData()
//            return cell!
//
//        }
//
        else if(indexPath.row==4)
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell5")
            let textField = cell!.contentView.viewWithTag(1) as! UITextField
            textField.layer.borderWidth = 1
            textField.layer.borderColor = UIColor.lightGray.cgColor
            textField.text = gosee["whendetected"] as? String
            // add toolbar to textField
            textField.inputAccessoryView = toolbar
            // add datepicker to textField
            textField.inputView = datePicker
            
            return cell!
            
       }
//        else if(indexPath.row==4)
//        {
//            let cell = tableView.dequeueReusableCell(withIdentifier: "cell5")
//            let textView1 = cell!.contentView.viewWithTag(1) as! UITextView
//            textView1.text = (gosee["howdetected"] as? String)
//            if textView1.text == "" {
//                textView1.text = "-process step/operation\n-device(sense or instrument)"
//                textView1.textColor = UIColor.lightGray
//            }
//
//
//            return cell!
//
//        }
//
        else
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell4")
            let collectionView = cell!.contentView.viewWithTag(1) as! UICollectionView
            collectionView.reloadData()
            return cell!
            
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let buttonPosition = collectionView.convert(CGPoint.zero, to: self.tableView)
//        let tableIndexPath = self.tableView.indexPathForRow(at:buttonPosition)
//        if(tableIndexPath?.row == 2)
       // {
            return (gosee["wherephotos"] as! [String]).count
            
//        }
//        else
//        {
//            return (gosee["howphotos"] as! [String]).count
//
//        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCell", for: indexPath)
        let imageView = cell.contentView.viewWithTag(1) as! UIImageView
        let buttonPosition = collectionView.convert(CGPoint.zero, to: self.tableView)
      //  let tableIndexPath = self.tableView.indexPathForRow(at:buttonPosition)
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
       // if(tableIndexPath?.row == 2)
       // {
            let fileURL = documentsDirectory.appendingPathComponent((gosee["wherephotos"] as! [String])[indexPath.row])
            imageView.image = UIImage(contentsOfFile: fileURL.path)
            
//        }
//        else
//        {
//            let fileURL = documentsDirectory.appendingPathComponent((gosee["howphotos"] as! [String])[indexPath.row])
//            imageView.image = UIImage(contentsOfFile: fileURL.path)
//
//        }
        cell.backgroundColor = UIColor.red
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        
        let buttonPosition = collectionView.convert(CGPoint.zero, to: self.tableView)
        //let tableIndexPath = self.tableView.indexPathForRow(at:buttonPosition)
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        var fileURL:URL!
       // if(tableIndexPath?.row == 2)
        //{
             fileURL = documentsDirectory.appendingPathComponent((gosee["wherephotos"] as! [String])[indexPath.row])
            
//        }
//        else
//        {
//             fileURL = documentsDirectory.appendingPathComponent((gosee["howphotos"] as! [String])[indexPath.row])
//
//        }

        item.previewItemTitle = ""
        item.previewItemURL = fileURL
        
        let previewQL = QLPreviewController() // 4
        previewQL.dataSource = self // 5
        show(previewQL, sender: nil) // 7
        
    }
    
    
    func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
        return 1
        
    }
    
    func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
        
        return item
    }

    @IBAction func deletePhotoAction(_ sender: UIButton)
    {
        var buttonPosition = sender.convert(CGPoint.zero, to: self.tableView)
        let tableIndexPath = self.tableView.indexPathForRow(at:buttonPosition)
        let cell = self.tableView.cellForRow(at: tableIndexPath!)
        let collectionView = cell!.contentView.viewWithTag(1) as! UICollectionView
        buttonPosition = sender.convert(CGPoint.zero, to: collectionView)
        let indexPath = collectionView.indexPathForItem(at: buttonPosition)
//        if(tableIndexPath?.row == 2)
//        {
            let array = gosee["wherephotos"] as! NSMutableArray
            array.removeObject(at: indexPath!.row)
//        }
//        else
//        {
//            let array = gosee["howphotos"] as! NSMutableArray
//            array.removeObject(at:indexPath!.row)
//
//
//        }
        collectionView.reloadData()
        
    }
    //MARK:- Image Picker
    @IBAction func addPhotoAction(_ sender: UIButton)
    {
        let buttonPosition = sender.convert(CGPoint.zero, to: self.tableView)
        let indexPath = self.tableView.indexPathForRow(at:buttonPosition)
//        if(indexPath?.row == 2)
//        {
//            isWherePhotos = true
//        }
//        else
//        {
//            isWherePhotos = false
//
//        }
        
        let alert = UIAlertController(title: "Choose Image", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { _ in
            self.openCamera()
        }))
        
        alert.addAction(UIAlertAction(title: "Gallery", style: .default, handler: { _ in
            self.openGallery()
        }))
        
        alert.addAction(UIAlertAction.init(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
    func openCamera()
    {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerController.SourceType.camera
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        }
        else
        {
            let alert  = UIAlertController(title: "Warning", message: "You don't have camera", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    func openGallery()
    {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary){
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
            self.present(imagePicker, animated: true, completion: nil)
        }
        else
        {
            let alert  = UIAlertController(title: "Warning", message: "You don't have perission to access gallery.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func howScreen(_ sender : UIButton)
    {
        let howViewController = self.storyboard?.instantiateViewController(withIdentifier: "howScreenViewController")
        self.navigationController?.pushViewController(howViewController!, animated: true)
    }
    @IBAction func understandScreen(_ sender : UIButton)
    {
        let understandViewController = self.storyboard?.instantiateViewController(withIdentifier: "understandViewController")
        self.navigationController?.pushViewController(understandViewController!, animated: true)
    }

    //MARK:-- ImagePicker delegate
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.originalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        if( picker.sourceType == UIImagePickerController.SourceType.camera)
        {
            UIImageWriteToSavedPhotosAlbum(selectedImage, nil, nil, nil);
        }

        self.saveImageInDocDir(image: selectedImage)
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated:  true, completion: nil)
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
        if(cell != nil){

        if(indexPath?.row == 0)
        {
            let textField = cell!.contentView.viewWithTag(1) as! UITextField
            gosee["whatlikely"] = textField.text!
            
        }
        else if(indexPath?.row == 3)
        {
            let textField = cell!.contentView.viewWithTag(1) as! UITextField
            gosee["whendetected"] = textField.text!
            
        }
        }
        
    }
    func textViewDidBeginEditing(_ textView: UITextView) {
        let buttonPosition = textView.convert(CGPoint.zero, to: self.tableView)
        let indexPath = self.tableView.indexPathForRow(at:buttonPosition)
        let cell = self.tableView.cellForRow(at: indexPath!)
        if(cell != nil){
            
            let textView = cell!.contentView.viewWithTag(1) as! UITextView
            if(indexPath?.row == 1)
            {
                
                if textView.text == "-is the empowered pilot\n-was in charge of the likely occurrence" {
                    textView.text = ""
                    textView.textColor = UIColor.black
                }
            }
            else if(indexPath?.row == 2)
            {
                if textView.text == "-in the plant\n-in the machine/bench" {
                    textView.text = ""
                    textView.textColor = UIColor.black
                }
            }
        }
    }
    func textViewDidEndEditing(_ textView: UITextView)
    {
        
        let buttonPosition = textView.convert(CGPoint.zero, to: self.tableView)
        let indexPath = self.tableView.indexPathForRow(at:buttonPosition)
        let cell = self.tableView.cellForRow(at: indexPath!)
        if(cell != nil){
            let textView = cell!.contentView.viewWithTag(1) as! UITextView
            if(indexPath?.row == 1)
            {
                //            let textField2 = cell!.contentView.viewWithTag(2) as! UITextField
                
                gosee["who"] = textView.text!
                //+ "<br>" + textField2.text!
                if textView.text == "" {
                    textView.text = "-is the empowered pilot\n-was in charge of the likely occurrence"
                    textView.textColor = UIColor.lightGray
                }
            }
            else if(indexPath?.row == 2)
            {
                gosee["where"] = textView.text!
                if textView.text == "" {
                    textView.text = "-in the plant\n-in the machine/bench"
                    textView.textColor = UIColor.lightGray
                }
            }
            
        }
        
    }
    
    func saveImageInDocDir(image  : UIImage)
    {
        // get the documents directory url
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        // choose a name for your image
        let fileName = self.uniqueFilename()
        // create the destination file url to save your image
        let fileURL = documentsDirectory.appendingPathComponent(fileName)
        // get your UIImage jpeg data representation and check if the destination file url already exists
        if let data = image.jpegData(compressionQuality: 1.0),
            !FileManager.default.fileExists(atPath: fileURL.path) {
            do {
                // writes the image data to disk
                try data.write(to: fileURL)
                print("file saved")
               // if(isWherePhotos)
               // {
                    let array = gosee["wherephotos"] as! NSMutableArray
                    array.add(fileName)
                    
              //  }
//                else
//                {
//                    let array = gosee["howphotos"] as! NSMutableArray
//                    array.add(fileName)
//
//                }
                self.tableView.reloadData()
                
            } catch {
                print("error saving file:", error)
            }
        }
        
    }
    // Create a unique filename, added to a starting string or not
    func uniqueFilename() -> String {
        let uniqueString = ProcessInfo.processInfo.globallyUniqueString
        return uniqueString + ".png"
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
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */

}
