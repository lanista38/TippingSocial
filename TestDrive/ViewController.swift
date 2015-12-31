//
//  ViewController.swift
//  TestDrive
//
//  Created by Jorge Cruz on 12/7/15.
//  Copyright © 2015 Jorge Cruz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billTxtField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipChooserSegment: UISegmentedControl!
    var total = 0.0
    var tip = 0.0
    @IBOutlet weak var shareButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }

    @IBAction func onTextChange(sender: AnyObject) {
        
        var tipPercentages = [0.15, 0.18, 0.2]
        var selectedTip = tipPercentages[tipChooserSegment.selectedSegmentIndex]
        
        var billAmount = NSString(string: billTxtField.text!).doubleValue
        tip = billAmount * selectedTip
         total = billAmount + tip
        
        tipLabel.text = String(format: "$%.2f" , tip)
        totalLabel.text = String(format: "$%.2f", total)
    }

    @IBAction func onShareButtonPressed(sender: UIBarButtonItem) {
        var str = "The Bill total is: " + String(total) + " and the tip is: " + String(tip)
        shareText(str)
        
    }
    func shareText(sharingText: String?) {
        var sharingItems = [AnyObject]()
        
        if let text = sharingText {
            sharingItems.append(text)
        }
        
        
        let activityViewController = UIActivityViewController(activityItems: sharingItems, applicationActivities: nil)
        self.presentViewController(activityViewController, animated: true, completion: nil)
    }
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        let defaults = NSUserDefaults.standardUserDefaults()
        let indexValue = defaults.integerForKey("Choosen_Tip_Setting")
        defaults.synchronize()
        tipChooserSegment.selectedSegmentIndex = indexValue
        billTxtField.becomeFirstResponder()
    }
}

