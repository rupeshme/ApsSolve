//
//  CompareViewController.swift
//  ApsSolve
//
//  Created by Rupesh on 2/8/19.
//  Copyright © 2019 Rupesh. All rights reserved.
//

import UIKit
import QuickLook
class PreviewItem: NSObject, QLPreviewItem {
    var previewItemURL: URL?
    var previewItemTitle: String?
}

class CompareViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UITextViewDelegate,QLPreviewControllerDataSource {
    

    @IBOutlet weak var  tableView : UITableView!
    var compare  = currentProblem["compare"] as! NSMutableDictionary
    var isGoodPartPhoto = true
    var doneButtonOnKeyboard = UIToolbar()
    let item = PreviewItem()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftItemsSupplementBackButton = true
        doneButtonOnKeyboard.sizeToFit()
        let btnDoneOnKeyboard = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneBtnFromKeyboardClicked))
        doneButtonOnKeyboard.items = [btnDoneOnKeyboard]
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        if(indexPath.row == 1)
        {
            return 110
            
        }
        else
        {
            return 140
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if(indexPath.row==1)
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell2")
            let textView = cell!.contentView.viewWithTag(1) as! UITextView
            let backgroundView = cell!.contentView.viewWithTag(3) as! UIView
            textView.text = compare["reference"] as? String
            textView.layer.cornerRadius = 5
            textView.layer.borderWidth = 1
            textView.layer.borderColor = UIColor.lightGray.cgColor
            if textView.text == "" {
                textView.text = "-Acceptance criteria, nominal value, unit, tolerance"
                textView.textColor = UIColor.lightGray
            }
            backgroundView.layer.borderColor = UIColor.blue.cgColor
            backgroundView.layer.borderWidth = 2.0
            textView.inputAccessoryView = doneButtonOnKeyboard

            return cell!
            
        }
        else
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell1")
            let collectionView = cell!.contentView.viewWithTag(1) as! UICollectionView
            let label = cell!.contentView.viewWithTag(2) as! UILabel
            let backgroundView = cell!.contentView.viewWithTag(3) as! UIView
            if(indexPath.row == 0)
            {
                label.text = "Good";
                backgroundView.layer.borderColor = UIColor.green.cgColor
                backgroundView.layer.borderWidth = 2.0

            }
            else
            {
                label.text = "Bad";
                backgroundView.layer.borderColor = UIColor.red.cgColor
                backgroundView.layer.borderWidth = 2.0

            }
            collectionView.reloadData()
            return cell!
            
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let buttonPosition = collectionView.convert(CGPoint.zero, to: self.tableView)
        let tableIndexPath = self.tableView.indexPathForRow(at:buttonPosition)
        if(tableIndexPath?.row == 2)
        {
            return (compare["badphotos"] as! [String]).count
            
        }
        else
        {
            return (compare["goodphotos"] as! [String]).count
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCell", for: indexPath)
        cell.backgroundColor = UIColor.red
        let imageView = cell.contentView.viewWithTag(1) as! UIImageView
        let buttonPosition = collectionView.convert(CGPoint.zero, to: self.tableView)
        let tableIndexPath = self.tableView.indexPathForRow(at:buttonPosition)
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        if(tableIndexPath?.row == 2)
        {
            let fileURL = documentsDirectory.appendingPathComponent((compare["badphotos"] as! [String])[indexPath.row])
            imageView.image = UIImage(contentsOfFile: fileURL.path)
            
        }
        else
        {
            let fileURL = documentsDirectory.appendingPathComponent((compare["goodphotos"] as! [String])[indexPath.row])
            imageView.image = UIImage(contentsOfFile: fileURL.path)
            
        }
        cell.backgroundColor = UIColor.red
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        
        let buttonPosition = collectionView.convert(CGPoint.zero, to: self.tableView)
        let tableIndexPath = self.tableView.indexPathForRow(at:buttonPosition)
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        var fileURL:URL!
        if(tableIndexPath?.row == 2)
        {
             fileURL = documentsDirectory.appendingPathComponent((compare["badphotos"] as! [String])[indexPath.row])
            
        }
        else
        {
             fileURL = documentsDirectory.appendingPathComponent((compare["goodphotos"] as! [String])[indexPath.row])
            
        }
        
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
        let buttonPosition = sender.convert(CGPoint.zero, to: self.tableView)
        let indexPath = self.tableView.indexPathForRow(at:buttonPosition)
        if(indexPath?.row == 2)
        {
            isGoodPartPhoto = false
        }
        else
        {
            isGoodPartPhoto = true
            
        }
        
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
        if(tableIndexPath?.row == 2)
        {
            let array = compare["badphotos"] as! NSMutableArray
            array.removeObject(at: indexPath!.row)
        }
        else
        {
            let array = compare["goodphotos"] as! NSMutableArray
            array.removeObject(at:indexPath!.row)
            
            
        }
        collectionView.reloadData()
        
    }
    @IBAction func react(_ sender : UIButton)
    {
        let reactViewController = self.storyboard?.instantiateViewController(withIdentifier: "reactViewController")
        self.navigationController?.pushViewController(reactViewController!, animated: true)
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
                if(isGoodPartPhoto)
                {
                    let array = compare["goodphotos"] as! NSMutableArray
                    array.add(fileName)
                    
                }
                else
                {
                    let array = compare["badphotos"] as! NSMutableArray
                    array.add(fileName)
                    
                }
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
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == "-Acceptance criteria, nominal value, unit, tolerance" {
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
        compare["reference"] = textView.text!
        
        if textView.text == "" {
            textView.text = "-Measured value(unit,value,\ntolerance)"
            textView.textColor = UIColor.lightGray
        }

    }
    @IBAction func doneBtnFromKeyboardClicked (sender: Any) {
        print("Done Button Clicked.")
        //Hide Keyboard by endEditing or Anything you want.
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
