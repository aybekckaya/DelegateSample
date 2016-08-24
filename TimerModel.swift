//
//  TimerModel.swift
//  DelegateSample
//
//  Created by aybek can kaya on 24/08/16.
//  Copyright © 2016 aybek can kaya. All rights reserved.
//

import UIKit

/**
    Delegate tanımlaması . Delegate aslında bir protokoldür ve bunun bir alt classta eklenmesi gerekir eğer kullanılacak ise.
 */
protocol TimerModelDelegate
{
    // saymaya başlayınca
    func timerModelDidEndCounting()
    
    // saydık saydık ve bitti
    func timerModelDidStartCounting(timerInstance:TimerModel)
}


class TimerModel: NSObject
{
    // delegate nil olabilir o yüzden optional (?) olarak tanımlıyoruz.
    var delegate:TimerModelDelegate?
    
    
    func startCounting()
    {
         NSTimer.scheduledTimerWithTimeInterval(3, target: self, selector: #selector(notifyCounterStop), userInfo: nil, repeats: false)
       
        // eger delegate nil değilse yani var ise
        if let theDelegate = self.delegate
        {
            // delegate classında (bizim durumumuz için burası ViewController classı ) timerModelDidStartCounting fonksiyonunu çalıştır. parametre olarak kendi instance ımı göndereyim. 
            theDelegate.timerModelDidStartCounting(self)
        }
        
    }
    
    func notifyCounterStop(timerInstance:NSTimer?)
    {
        
        if let theDelegate = self.delegate
        {
            theDelegate.timerModelDidEndCounting()
        }
    }
    
}
