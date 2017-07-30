//
//  ViewController.swift
//  ITuneSearchAPITest
//
//  Created by moon on 2017/7/29.
//  Copyright © 2017年 Marvin Lin. All rights reserved.
//

import UIKit
import iTunesSearchAPI
import SwiftyJSON


// 基本上完成了
class ViewController: UIViewController {

    @IBOutlet weak var contentLabel: UILabel!
    
    @IBAction func startButton(_ sender: UIButton) {
        
        print("Start Searching")
        
        let itunes = iTunes()
        
        itunes.search(for: "周杰倫") { (result) in
        
            print("這是 result.value ")
            
            
            let testIt = result.value as! [String:Any]
            
//            print(testIt)
            print(type(of: testIt))
            
            let testSecond = testIt["results"] as! NSArray
            
            print("這是第二層")
            
//            print(testSecond)
            print(type(of: testSecond))
            
            print("Count of array \(testSecond.count)")
            print(type(of: testSecond[0]))
            
            let testThird = testSecond[0] as! [String:Any]
            
            print("這是第三層")
            print(type(of: testThird))
            
            let previewURL = testThird["previewUrl"]
            
            print(previewURL)
            print(type(of: previewURL))
            
            print("===== 以下是測試 =====")
            
            for each in testSecond {
                let targetOutside = each as! [String: Any]
                
                let targetInside = targetOutside["previewUrl"]
                
                print(targetInside)
            }
//            print(testThird)
//            print(result.value)
//            
//            print(type(of: result.value))
            
            

        }

    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("Starting iTune Search API test")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

