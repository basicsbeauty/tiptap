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
    let defaults = UserDefaults.standard
    
    var ti: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tipValueChanged(_ sender: AnyObject) {
        
        defaults.set(secTip.selectedSegmentIndex, forKey: "tip_index")
        defaults.synchronize()
    }
    
    
    func loadData() {
        let de = UserDefaults.standard
        
        if (de.object(forKey: "tip_index") != nil) {
            ti = de.integer(forKey: "tip_index")
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        loadData()
                
        // Tip
        secTip.selectedSegmentIndex = ti
    }
}
