//
//  ViewController.swift
//  TipC
//
//  Created by Raikirat Sohi on 6/30/16.
//  Copyright © 2016 Raikirat Sohi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    
    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    @IBOutlet weak var split2Label: UILabel!
    
    @IBOutlet weak var split3Label: UILabel!
    
    @IBOutlet weak var split4Label: UILabel!
    
    
    let defaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        split2Label.text = "0.00"
        split3Label.text = "0.00"
        split4Label.text = "0.00"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        tipControl.selectedSegmentIndex = defaults.integerForKey("default_tip_percentage")
        
            self.computeTip()
        print("view will appear")
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        print("view did disappear")
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will dissapear")
        
    }
    
    func computeTip(){
        let billAmount = NSString(string: billField.text!).doubleValue
        
        let tipPercentages = [0.18, 0.2, 0.22]
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        let tip = billAmount * tipPercentage
        let total = billAmount + tip
        let two = 2.00
        let three = 3.00
        let four = 4.00
        let split2 = total/two
        let split3 = total/three
        let split4 = total/four
        
        tipLabel.text = String(format: "$%.2F" , tip)
        totalLabel.text = String(format: "$%.2F",total)
        split2Label.text = String(format: "%.2F", split2)
        split3Label.text = String(format:"%.2F",split3)
        split4Label.text = String(format: "%.2F",split4)
        
    }
    @IBAction func onEditingChanged(sender: AnyObject) {
        
        self.computeTip()
    }
    
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
}

