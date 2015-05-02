//
//  DetailViewController.swift
//  SampleFadeInTransition
//
//  Created by FUJISAWAHIROYUKI on 2015/05/02.
//  Copyright (c) 2015年 swift-studying. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var image:UIImage?
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imageView.image = image
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: "close"))
    }
    
    func close(){
        dismissViewControllerAnimated(true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
