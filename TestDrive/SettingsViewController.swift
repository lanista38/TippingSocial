//
//  SettingsViewController.swift
//  TestDrive
//
//  Created by Jorge Cruz on 12/29/15.
//  Copyright © 2015 Jorge Cruz. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipSetting: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        var tipPercentages = [0.15, 0.18, 0.2]
        var selectedTip = tipSetting.selectedSegmentIndex
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(selectedTip, forKey: "Choosen_Tip_Setting")
        defaults.synchronize()
        
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let defaults = NSUserDefaults.standardUserDefaults()
        let indexValue = defaults.integerForKey("Choosen_Tip_Setting")
        defaults.synchronize()
        tipSetting.selectedSegmentIndex = indexValue
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
