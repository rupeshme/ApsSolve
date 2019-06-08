//
//  ReactViewController.swift
//  ApsSolve
//
//  Created by Rupesh on 2/9/19.
//  Copyright © 2019 Rupesh. All rights reserved.
//

import UIKit
import QuickLook
class ReactViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UITextFieldDelegate,QLPreviewControllerDataSource {

    @IBOutlet weak var  tableView : UITableView!
    var react  = currentProblem["react"] as! NSMutableDictionary
    let item = PreviewItem()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftItemsSupplementBackButton = true

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        if(indexPath.row == 0 )
        {
            return 370
            
        }
        else if(indexPath.row == 1)
        {
            return 155
            
        }
        else
        {
            return 90
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if(indexPath.row==0)
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell1")
            let button1 = cell!.contentView.viewWithTag(1) as! UIButton
            let button2 = cell!.contentView.viewWithTag(2) as! UIButton
            let button3 = cell!.contentView.viewWithTag(3) as! UIButton
            let button4 = cell!.contentView.viewWithTag(4) as! UIButton
            let button5 = cell!.contentView.viewWithTag(5) as! UIButton
            let button6 = cell!.contentView.viewWithTag(6) as! UIButton
            let button7 = cell!.contentView.viewWithTag(7) as! UIButton
            let button8 = cell!.contentView.viewWithTag(8) as! UIButton
            button7.layer.borderWidth = 5
            button7.layer.borderColor = UIColor.blue.cgColor
            button8.layer.borderWidth = 5
            button8.layer.borderColor = UIColor.black.cgColor

            let assign1 = currentProblem["assign1"] as! NSMutableDictionary
            if((assign1["status"] as! String) == "1")
            {
                button1.setImage(UIImage(named:"progress"), for: .normal)
            }
            else if((assign1["status"] as! String) == "2")
            {
                button1.setImage(UIImage(named:"done"), for: .normal)

            }
            else if((assign1["status"] as! String) == "3")
            {
                button1.setImage(UIImage(named:"stop"), for: .normal)
                
            }
            else if((assign1["status"] as! String) == "4")
            {
                button1.setImage(UIImage(named:"reject"), for: .normal)
                
            }
            else
            {
                button1.setImage(UIImage(named:"mapicon"), for: .normal)

            }
            let assign2 = currentProblem["assign2"] as! NSMutableDictionary
            if((assign2["status"] as! String) == "1")
            {
                button2.setImage(UIImage(named:"progress"), for: .normal)
            }
            else if((assign2["status"] as! String) == "2")
            {
                button2.setImage(UIImage(named:"done"), for: .normal)
                
            }
            else if((assign2["status"] as! String) == "3")
            {
                button2.setImage(UIImage(named:"stop"), for: .normal)
                
            }
            else if((assign2["status"] as! String) == "4")
            {
                button2.setImage(UIImage(named:"reject"), for: .normal)
                
            }
            else
            {
                button2.setImage(UIImage(named:"rightarrow"), for: .normal)
                
            }
            let assign3 = currentProblem["assign3"] as! NSMutableDictionary
            if((assign3["status"] as! String) == "1")
            {
                button3.setImage(UIImage(named:"progress"), for: .normal)
            }
            else if((assign3["status"] as! String) == "2")
            {
                button3.setImage(UIImage(named:"done"), for: .normal)
                
            }
            else if((assign3["status"] as! String) == "3")
            {
                button3.setImage(UIImage(named:"stop"), for: .normal)
                
            }
            else if((assign3["status"] as! String) == "4")
            {
                button3.setImage(UIImage(named:"reject"), for: .normal)
                
            }
            else
            {
                button3.setImage(UIImage(named:"leftarrow"), for: .normal)
                
            }

            let assign4 = currentProblem["assign4"] as! NSMutableDictionary
            if((assign4["status"] as! String) == "1")
            {
                button4.setImage(UIImage(named:"progress"), for: .normal)
            }
            else if((assign4["status"] as! String) == "2")
            {
                button4.setImage(UIImage(named:"done"), for: .normal)
                
            }
            else if((assign4["status"] as! String) == "3")
            {
                button4.setImage(UIImage(named:"stop"), for: .normal)
                
            }
            else if((assign4["status"] as! String) == "4")
            {
                button4.setImage(UIImage(named:"reject"), for: .normal)
                
            }
            else
            {
                button4.setImage(UIImage(named:"mapicon"), for: .normal)
                
            }
            
            
            let assign5 = currentProblem["assign5"] as! NSMutableDictionary
            if((assign5["status"] as! String) == "1")
            {
                button5.setImage(UIImage(named:"progress"), for: .normal)
            }
            else if((assign5["status"] as! String) == "2")
            {
                button5.setImage(UIImage(named:"done"), for: .normal)
                
            }
            else if((assign5["status"] as! String) == "3")
            {
                button5.setImage(UIImage(named:"stop"), for: .normal)
                
            }
            else if((assign5["status"] as! String) == "4")
            {
                button5.setImage(UIImage(named:"reject"), for: .normal)
                
            }
            else
            {
                button5.setImage(UIImage(named:"rightarrow"), for: .normal)
                
            }
            let assign6 = currentProblem["assign6"] as! NSMutableDictionary
            if((assign6["status"] as! String) == "1")
            {
                button6.setImage(UIImage(named:"progress"), for: .normal)
            }
            else if((assign6["status"] as! String) == "2")
            {
                button6.setImage(UIImage(named:"done"), for: .normal)
                
            }
            else if((assign6["status"] as! String) == "3")
            {
                button6.setImage(UIImage(named:"stop"), for: .normal)
                
            }
            else if((assign6["status"] as! String) == "4")
            {
                button6.setImage(UIImage(named:"reject"), for: .normal)
                
            }
            else
            {
                button6.setImage(UIImage(named:"leftarrow"), for: .normal)
                
            }
            let assign7 = currentProblem["assign7"] as! NSMutableDictionary
            if((assign7["status"] as! String) == "1")
            {
                button7.setImage(UIImage(named:"progress"), for: .normal)
                button7.setTitle(nil, for: .normal)
            }
            else if((assign6["status"] as! String) == "2")
            {
                button7.setImage(UIImage(named:"done"), for: .normal)
                button7.setTitle(nil, for: .normal)

            }
            else if((assign7["status"] as! String) == "3")
            {
                button7.setImage(UIImage(named:"stop"), for: .normal)
                button7.setTitle(nil, for: .normal)

            }
            else if((assign7["status"] as! String) == "4")
            {
                button7.setImage(UIImage(named:"reject"), for: .normal)
                button7.setTitle(nil, for: .normal)

            }
            else
            {
                button7.setImage(nil, for: .normal)
                button7.setTitle("Define Standard", for: .normal)
            }
            let assign8 = currentProblem["assign8"] as! NSMutableDictionary
            if((assign8["status"] as! String) == "1")
            {
                button8.setImage(UIImage(named:"progress"), for: .normal)
                button8.setTitle(nil, for: .normal)

            }
            else if((assign8["status"] as! String) == "2")
            {
                button8.setImage(UIImage(named:"done"), for: .normal)
                button8.setTitle(nil, for: .normal)

            }
            else if((assign8["status"] as! String) == "3")
            {
                button8.setImage(UIImage(named:"stop"), for: .normal)
                button8.setTitle(nil, for: .normal)

            }
            else if((assign8["status"] as! String) == "4")
            {
                button8.setImage(UIImage(named:"reject"), for: .normal)
                button8.setTitle(nil, for: .normal)

            }
            else
            {
                button8.setImage(UIImage(named:"solution"), for: .normal)
                button8.setTitle("Obvious Solution", for: .normal)
            }

            return cell!
            
        }
        else if(indexPath.row==1)
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell2")
            let collectionView = cell!.contentView.viewWithTag(1) as! UICollectionView
            collectionView.reloadData()
            return cell!
            
        }
        else
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell3")
            let textField1 = cell!.contentView.viewWithTag(1) as! UITextField
            textField1.text! = react["where"] as! String

            return cell!
            
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (react["reactphotos"] as! [String]).count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCell", for: indexPath)
        let imageView = cell.contentView.viewWithTag(1) as! UIImageView
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            let fileURL = documentsDirectory.appendingPathComponent((react["reactphotos"] as! [String])[indexPath.row])
            imageView.image = UIImage(contentsOfFile: fileURL.path)
        return cell
        
    }
     func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        
        let buttonPosition = collectionView.convert(CGPoint.zero, to: self.tableView)
        let tableIndexPath = self.tableView.indexPathForRow(at:buttonPosition)
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let fileURL = documentsDirectory.appendingPathComponent((react["reactphotos"] as! [String])[indexPath.row])

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
        let array = react["reactphotos"] as! NSMutableArray
        array.removeObject(at: indexPath!.row)

        collectionView.reloadData()
        
    }
    @IBAction func analyze(_ sender : UIButton)
    {
        let analyzeGoSeeViewController = self.storyboard?.instantiateViewController(withIdentifier: "analyzeGoSeeViewController")
        self.navigationController?.pushViewController(analyzeGoSeeViewController!, animated: true)
    }
    @IBAction func assign(_ sender : UIButton)
    {
        let assignViewController = self.storyboard?.instantiateViewController(withIdentifier: "assignViewController") as! AssignViewController
        switch sender.tag {
        case 1:
            assignViewController.assign = currentProblem["assign1"] as? NSMutableDictionary
        case 2:
            assignViewController.assign = currentProblem["assign2"] as? NSMutableDictionary
        case 3:
            assignViewController.assign = currentProblem["assign3"] as? NSMutableDictionary
        case 4:
            assignViewController.assign = currentProblem["assign4"] as? NSMutableDictionary
        case 5:
            assignViewController.assign = currentProblem["assign5"] as? NSMutableDictionary
        case 6:
            assignViewController.assign = currentProblem["assign6"] as? NSMutableDictionary
        case 7:
            assignViewController.assign = currentProblem["assign7"] as? NSMutableDictionary

        default:
            assignViewController.assign = currentProblem["assign8"] as? NSMutableDictionary
        }
        self.navigationController?.pushViewController(assignViewController, animated: true)
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
                let array = react["reactphotos"]  as! NSMutableArray
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

        let textField1 = cell!.contentView.viewWithTag(1) as! UITextField
        react["where"] = textField1.text!
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
