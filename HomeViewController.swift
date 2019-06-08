//
//  ViewController.swift
//  ApsSolve
//
//  Created by Rupesh on 1/31/19.
//  Copyright © 2019 Rupesh. All rights reserved.
//

import UIKit

var currentProblem : NSMutableDictionary!
var problems = NSMutableArray()

class HomeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var  tableView : UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = UserDefaults.standard
        if((defaults.data(forKey: "problems")) != nil)
        {
            //Getting Encoded Array
            let encodedArray = defaults.data(forKey: "problems")
            
            //Decoding the Array
            problems = try! NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(encodedArray!) as! NSMutableArray

        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
        
        let defaults = UserDefaults.standard
        let encodedArray : NSData =  try! NSKeyedArchiver.archivedData(withRootObject: problems, requiringSecureCoding: true) as NSData
        defaults.setValue(encodedArray, forKey:"problems")
        defaults.synchronize()

    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        if(indexPath.row == 0)
        {
            return 200

        }
        else
        {
            return 200
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return problems.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if(indexPath.row==0)
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "addnewcell")
            return cell!

        }
        else
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "problemcell")
            let problem = problems [ indexPath.row - 1] as! NSMutableDictionary
            let label = cell?.contentView.viewWithTag(1) as! UILabel
            let imageView = cell?.contentView.viewWithTag(2) as! UIImageView
            label.text = (problem["define"] as! NSMutableDictionary)["whatproblem"] as? String
            let photos = (problem["compare"] as! NSMutableDictionary)["badphotos"] as! NSMutableArray
            if(photos.count > 0)
            {
                let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
                let fileURL = documentsDirectory.appendingPathComponent(photos.firstObject as! String)

                imageView.image = UIImage(contentsOfFile:fileURL.path)

            }
            let date = cell?.contentView.viewWithTag(3) as! UILabel
            date.text = (problem["date"] as! String)
            return cell!

        }
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        if(indexPath.row == 0)
        {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd MMM yyyy"
            let date = dateFormatter.string(from: Date())

            currentProblem = NSMutableDictionary()
            let assign1 = NSMutableDictionary(dictionary: ["why" : "","what" : "","who" : "","when" : "","status":"0","assignphotos" : NSMutableArray()])
            let assign2 = NSMutableDictionary(dictionary: ["why" : "","what" : "","who" : "","when" : "","status":"0","assignphotos" : NSMutableArray()])
            let assign3 = NSMutableDictionary(dictionary: ["why" : "","what" : "","who" : "","when" : "","status":"0","assignphotos" : NSMutableArray()])
            let assign4 = NSMutableDictionary(dictionary: ["why" : "","what" : "","who" : "","when" : "","status":"0","assignphotos" : NSMutableArray()])
            let assign5 = NSMutableDictionary(dictionary: ["why" : "","what" : "","who" : "","when" : "","status":"0","assignphotos" : NSMutableArray()])
            let assign6 = NSMutableDictionary(dictionary: ["why" : "","what" : "","who" : "","when" : "","status":"0","assignphotos" : NSMutableArray()])
            let assign7 = NSMutableDictionary(dictionary: ["why" : "","what" : "","who" : "","when" : "","status":"0","assignphotos" : NSMutableArray()])
            let assign8 = NSMutableDictionary(dictionary: ["why" : "","what" : "","who" : "","when" : "","status":"0","assignphotos" : NSMutableArray()])

            let assignHow1 = NSMutableDictionary(dictionary: ["why" : "","what" : "","who" : "","when" : "","status":"0","assignphotos" : NSMutableArray()])
            let assignHow2 = NSMutableDictionary(dictionary: ["why" : "","what" : "","who" : "","when" : "","status":"0","assignphotos" : NSMutableArray()])
            let assignHow3 = NSMutableDictionary(dictionary: ["why" : "","what" : "","who" : "","when" : "","status":"0","assignphotos" : NSMutableArray()])
            let assignHow4 = NSMutableDictionary(dictionary: ["why" : "","what" : "","who" : "","when" : "","status":"0","assignphotos" : NSMutableArray()])
            let assignHow5 = NSMutableDictionary(dictionary: ["why" : "","what" : "","who" : "","when" : "","status":"0","assignphotos" : NSMutableArray()])
            let assignHow6 = NSMutableDictionary(dictionary: ["why" : "","what" : "","who" : "","when" : "","status":"0","assignphotos" : NSMutableArray()])

            let assignWhy1 = NSMutableDictionary(dictionary: ["why" : "","what" : "","who" : "","when" : "","status":"0","assignphotos" : NSMutableArray()])
            let assignWhy2 = NSMutableDictionary(dictionary: ["why" : "","what" : "","who" : "","when" : "","status":"0","assignphotos" : NSMutableArray()])
            let assignWhy3 = NSMutableDictionary(dictionary: ["why" : "","what" : "","who" : "","when" : "","status":"0","assignphotos" : NSMutableArray()])
            let assignWhy4 = NSMutableDictionary(dictionary: ["why" : "","what" : "","who" : "","when" : "","status":"0","assignphotos" : NSMutableArray()])
            let assignWhy5 = NSMutableDictionary(dictionary: ["why" : "","what" : "","who" : "","when" : "","status":"0","assignphotos" : NSMutableArray()])
            let assignWhy6 = NSMutableDictionary(dictionary: ["why" : "","what" : "","who" : "","when" : "","status":"0","assignphotos" : NSMutableArray()])


            currentProblem.setValuesForKeys(["define" : NSMutableDictionary(dictionary: ["whatmaterial" : "","whoasking" : "" ,"whatproblem" : ""]),"gosee" :NSMutableDictionary(dictionary: ["whodetected" : "","wheredetected":"","wherephotos":NSMutableArray(),"whendetected":"","howdetected":"","howphotos":NSMutableArray()]),"evalute" : NSMutableDictionary(dictionary: ["howmany" : "","whyproblem" : ""]),"compare" : NSMutableDictionary(dictionary: ["reference" : "","goodphotos" : NSMutableArray(),"badphotos" : NSMutableArray()]),"react" : NSMutableDictionary(dictionary: ["where" : "","reactphotos" : NSMutableArray()]),"assign1" :assign1 ,"assign2" : assign2,"assign3" :assign3,"assign4" :assign4,"assign5" : assign5,"assign6" : assign6,"assign7" : assign7,"assign8" : assign8,"analyzegosee" :NSMutableDictionary(dictionary: ["whatlikely" : "","who":"","where":"","wherephotos":NSMutableArray(),"whendetected":""]),"stabilize" : NSMutableDictionary(dictionary: ["why" : "","what" : "","who" : "","when" : ""]),"how" : NSMutableDictionary(dictionary: ["how" : ""]),"understandhow" :NSMutableDictionary(dictionary: ["process" : false,"nondetection":false,"cell11":"","cell12":"","cell13":"","cell21":"","cell22":"","cell23":"","cell31":"","cell32":"","cell33":"","cell41":"","cell42":"","cell43":"","cell51":"","cell52":"","cell53":""]),"understandwhy" :NSMutableDictionary(dictionary: ["phrasedescribe" : "","processcapture":"","trainingstep":"","cell11":"","cell12":"","cell13":"","cell21":"","cell22":"","cell23":"","cell31":"","cell32":"","cell33":"","cell41":"","cell42":"","cell43":"","cell51":"","cell52":"","cell53":""]),"assignHow1" :assignHow1 ,"assignHow2" : assignHow2,"assignHow3" :assignHow3,"assignHow4" :assignHow4,"assignHow5" : assignHow5,"assignHow6" : assignHow6,"assignWhy1" :assignWhy1 ,"assignWhy2" : assignWhy2,"assignWhy3" :assignWhy3,"assignWhy4" :assignWhy4,"assignWhy5" : assignWhy5,"assignWhy6" : assignWhy6,"date":date])
            problems.add(currentProblem)
        }
        else
        {
            currentProblem = problems[indexPath.row-1] as! NSMutableDictionary
        }
        let defineViewController = self.storyboard?.instantiateViewController(withIdentifier: "defineViewController")
        self.navigationController?.pushViewController(defineViewController!, animated: true)

    }
    @IBAction func deleteProblemAction(_ sender: UIButton)
    {
        let alert = UIAlertController(title: "Alert", message: "Are you sure to delete?", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Delete", style: .default, handler: { (_) in
            let buttonPosition = sender.convert(CGPoint.zero, to: self.tableView)
            let tableIndexPath = self.tableView.indexPathForRow(at:buttonPosition)
            problems.removeObject(at: tableIndexPath!.row-1)
            self.tableView.reloadData()
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { (_) in
        }))
        
        self.present(alert, animated: true, completion: nil)

    }
    @IBAction func help(_ sender : UIButton)
    {
        let helpViewController = self.storyboard?.instantiateViewController(withIdentifier: "helpViewController")
        self.navigationController?.pushViewController(helpViewController!, animated: true)
    }
    @IBAction func setting(_ sender : UIButton)
    {
        let settingViewController = self.storyboard?.instantiateViewController(withIdentifier: "settingViewController")
        self.navigationController?.pushViewController(settingViewController!, animated: true)

    }
}

