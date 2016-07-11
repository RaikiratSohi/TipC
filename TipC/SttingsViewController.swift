//
//  SttingsViewController.swift
//  TipC
//
//  Created by Raikirat Sohi on 7/11/16.
//  Copyright © 2016 Raikirat Sohi. All rights reserved.
//

import UIKit

class SttingsViewController: UIViewController {

    
    @IBOutlet weak var defaultTipController: UISegmentedControl!
    
    let defaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        defaultTipController.selectedSegmentIndex = defaults.integerForKey("default_tip_percentage")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onDefaultTipChanged(sender: AnyObject) {
        defaults.setInteger(defaultTipController.selectedSegmentIndex, forKey: "default_tip_percentage")
        defaults.synchronize()
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
