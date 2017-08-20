//
//  SettingsViewController.swift
//  TipTap
//
//  Created by Beauty on 8/20/17.
//  Copyright © 2017 Enlaps. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var secTip: UISegmentedControl!
    @IBOutlet weak var secCurrency: UISegmentedControl!
    let defaults = NSUserDefaults.standardUserDefaults()
    
    var ti: Int = 0
    var cs: String = "$"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tipValueChanged(sender: AnyObject) {
        
        defaults.setInteger(secTip.selectedSegmentIndex, forKey: "tip_index")
        defaults.synchronize()
    }
    
    @IBAction func currencyValueChanged(sender: AnyObject) {
        let symbol: String = secCurrency.titleForSegmentAtIndex(secCurrency.selectedSegmentIndex)!
        defaults.setValue(symbol, forKey: "currency_symbol")
        defaults.synchronize()
    }
    
    func loadData() {
        let de = NSUserDefaults.standardUserDefaults()
        
        if (de.objectForKey("tip_index") != nil) {
            ti = de.integerForKey("tip_index")
        }
        
        if de.objectForKey("currency_symbol") != nil {
            cs = de.objectForKey("currency_symbol") as! String
        }
    }        
    
    override func viewDidAppear(animated: Bool) {
        
        loadData()
        
        let currencyMap: [String: Int] = ["$":0, "€":1, "₹":2, "£":3]
        
        // Tip
        secTip.selectedSegmentIndex = ti
        
        // Currency Symbol
        secCurrency.selectedSegmentIndex = currencyMap[cs]!
    }
}
