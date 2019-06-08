//
//  AssignViewController.swift
//  ApsSolve
//
//  Created by Rupesh on 2/9/19.
//  Copyright © 2019 Rupesh. All rights reserved.
//

import UIKit
import QuickLook
class AssignViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UITextFieldDelegate,QLPreviewControllerDataSource {

    @IBOutlet weak var  tableView : UITableView!
    var assign : NSMutableDictionary!
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
        if(indexPath.row==4)
        {
            return 143

        }
            return 91
        
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
            textField.text = assign["why"] as? String
            return cell!
            
        }
        else if(indexPath.row==1)
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell2")
            let textField = cell!.contentView.viewWithTag(1) as! UITextField
            textField.layer.borderWidth = 1
            textField.layer.borderColor = UIColor.lightGray.cgColor
            textField.text = assign["what"] as? String
            return cell!
            
        }
        else if(indexPath.row==2)
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell3")
            let textField = cell!.contentView.viewWithTag(1) as! UITextField
            textField.layer.borderWidth = 1
            textField.layer.borderColor = UIColor.lightGray.cgColor
            textField.text = assign["who"] as? String
            return cell!
            
        }

        else if(indexPath.row==3)
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
        else
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell5")
            let collectionView = cell!.contentView.viewWithTag(1) as! UICollectionView
            collectionView.reloadData()
            return cell!
            
        }

    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (assign["assignphotos"] as! [String]).count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCell", for: indexPath)
        let imageView = cell.contentView.viewWithTag(1) as! UIImageView
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let fileURL = documentsDirectory.appendingPathComponent((assign["assignphotos"] as! [String])[indexPath.row])
        imageView.image = UIImage(contentsOfFile: fileURL.path)
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        
        let buttonPosition = collectionView.convert(CGPoint.zero, to: self.tableView)
        let tableIndexPath = self.tableView.indexPathForRow(at:buttonPosition)
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let fileURL = documentsDirectory.appendingPathComponent((assign["assignphotos"] as! [String])[indexPath.row])
        
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
    
    //MARK:- Image Picker
    @IBAction func addPhotoAction(_ sender: UIButton)
    {
        
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
    @IBAction func deletePhotoAction(_ sender: UIButton)
    {
        var buttonPosition = sender.convert(CGPoint.zero, to: self.tableView)
        let tableIndexPath = self.tableView.indexPathForRow(at:buttonPosition)
        let cell = self.tableView.cellForRow(at: tableIndexPath!)
        let collectionView = cell!.contentView.viewWithTag(1) as! UICollectionView
        buttonPosition = sender.convert(CGPoint.zero, to: collectionView)
        let indexPath = collectionView.indexPathForItem(at: buttonPosition)
        let array = assign["assignphotos"] as! NSMutableArray
        array.removeObject(at: indexPath!.row)
        
        collectionView.reloadData()
        
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
                let array = assign["assignphotos"]  as! NSMutableArray
                array.add(fileName)
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
    @IBAction func progress(_ sender : UIButton)
    {
        assign["status"] = "1"
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func stop(_ sender : UIButton)
    {
        assign["status"] = "3"
        self.navigationController?.popViewController(animated: true)
    }

    @IBAction func done(_ sender : UIButton)
    {
        assign["status"] = "2"
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func reject(_ sender : UIButton)
    {
        assign["status"] = "4"
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
