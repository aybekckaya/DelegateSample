//
//  ViewController.swift
//  DelegateSample
//
//  Created by aybek can kaya on 24/08/16.
//  Copyright © 2016 aybek can kaya. All rights reserved.
//

import UIKit

// Delegate kullanılacak ise protokolü eklemeliyiz.
class ViewController: UIViewController, TimerModelDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let theTimerModel = TimerModel()
        
        // timerModel in delegate i benim diyorum burada. Yani protokol içinden bir fonksiyon çalışacak ise burada çalışsın . 
        theTimerModel.delegate = self
        
        theTimerModel.startCounting()
        
    }
    
    /**
         Timer Model DELEGATE
     */
    
    
    func timerModelDidStartCounting(timerInstance: TimerModel)
    {
        print("Saymaya başladım .... ")
    }
    
    func timerModelDidEndCounting()
    {
         print("sonunda bitirdim saymayı ... ")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

