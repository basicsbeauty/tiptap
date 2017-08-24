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

    let de = UserDefaults.standard

    
    var ti: Int = 0
    var cs: String = "$"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func loadData() {
        if (de.object(forKey: "tip_index") != nil) {
            ti = de.integer(forKey: "tip_index")
        }
    }
    
    func saveBillAmount() {
        let bill = Double(txtBillAmount.text!) ?? 0
        de.set(bill, forKey: "bill_amount")
        // Also save timestamp
        print(NSDate().timeIntervalSince1970)
        print(Int(NSDate().timeIntervalSince1970))
        de.set(Int(NSDate().timeIntervalSince1970), forKey:"bill_ts")
        de.synchronize()
    }
    
    func isValidBillAmountSaved() -> Bool {
        let cur_ts:Int = Int(NSDate().timeIntervalSince1970)
        if de.object(forKey: "bill_ts") != nil {
            let saved_ts:Int = de.integer(forKey: "bill_ts")
            let CUTOFF_IN_SECONDS:Int = 10 * 60
            if cur_ts-saved_ts < CUTOFF_IN_SECONDS {
                return true
            }
        }
        return false
    }

    override func viewDidAppear(_ animated: Bool) {
        loadData()
        
        // Tip
        segcTipPercentage.selectedSegmentIndex = ti

        setCurrentcyLables()
        
        // Bill Amount
        if isValidBillAmountSaved() {
            if de.object(forKey: "bill_amount") != nil {
                txtBillAmount.text = String(format: "%.2f", de.double(forKey: "bill_amount"))
            }
            compute()
        }
        txtBillAmount.becomeFirstResponder()
    }
    
    func setAnimations() {
        let animation: CATransition = CATransition()
        animation.duration = 0.2
        animation.type = kCATransitionFade
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        
        lblCurrency1.layer.add(animation, forKey: "changeTextTransition")
        lblCurrency2.layer.add(animation, forKey: "changeTextTransition")
        lblCurrency3.layer.add(animation, forKey: "changeTextTransition")
        
        lblTipAmount.layer.add(animation, forKey: "changeTextTransition")
        lblTipAmount.layer.add(animation, forKey: "changeTextTransition")
    }
        
    func setCurrentcyLables() {

        let region: String = NSLocale.current.regionCode ?? "US"
        print("RC:", region)
        
        let currencyMap: [String: String] = ["US":"$", "FR":"€", "IN":"₹", "GB":"£"]
        
        cs = currencyMap[region] ?? "$"
        print("RC:", cs)
        
        // Currency Symbol
        lblCurrency1.text = cs
        lblCurrency2.text = cs
        lblCurrency3.text = cs
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBAction func processBill(_ sender: AnyObject) {
        compute()
    }
    
    func compute() {
        let tipPercentages = [0.10, 0.15, 0.20]
        
        loadData()
        
        let bill = Double(txtBillAmount.text!) ?? 0
        let tip = bill * tipPercentages[segcTipPercentage.selectedSegmentIndex]
        let total = bill + tip
     
        setAnimations()
        
        lblTipAmount.text = String(format: "%.2f", tip)
        lblTotalAmount.text = String(format: "%.2f", total)
        
        // Save Bill Ammount
        saveBillAmount()
        
    }

    func addCommas(ammount: String, currenty:String) -> String {
        return "Test"
    }
}

