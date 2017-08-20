//
//  ViewController.swift
//  TipTap
//
//  Created by Beauty on 8/19/17.
//  Copyright © 2017 Enlaps. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblTipAmount: UILabel!
    @IBOutlet weak var lblTotalAmount: UILabel!
    @IBOutlet weak var txtBillAmount: UITextField!
    @IBOutlet weak var segcTipPercentage: UISegmentedControl!
    
    @IBOutlet weak var lblCurrency1: UILabel!
    @IBOutlet weak var lblCurrency2: UILabel!
    @IBOutlet weak var lblCurrency3: UILabel!
    
    var ti: Int = 0
    var cs: String = "$"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewDidAppear(animated: Bool) {
        loadData()
        
        // Tip
        segcTipPercentage.selectedSegmentIndex = ti

        // Currency Symbol
        lblCurrency1.text = cs
        lblCurrency2.text = cs
        lblCurrency3.text = cs
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
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
    
    @IBAction func processBill(sender: AnyObject) {
        
        let tipPercentages = [0.10, 0.15, 0.20]
        
        loadData()
        
        let bill = Double(txtBillAmount.text!) ?? 0
        let tip = bill * tipPercentages[segcTipPercentage.selectedSegmentIndex]
        let total = bill + tip
        
        print()

        lblTipAmount.text = String(format: "%.2f", tip)
        lblTotalAmount.text = String(format: "%.2f", total)
    }
        
}

