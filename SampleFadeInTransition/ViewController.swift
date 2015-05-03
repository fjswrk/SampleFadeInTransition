//
//  ViewController.swift
//  SampleFadeInTransition
//
//  Created by FUJISAWAHIROYUKI on 2015/05/02.
//  Copyright (c) 2015年 swift-studying. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIViewControllerTransitioningDelegate {
    @IBOutlet weak var topBtn: UIButton!
    @IBOutlet weak var centerBtn: UIButton!
    @IBOutlet weak var bottomBtn: UIButton!
    
    // アニメータクラスをプロパティとしてもつ
    let fadeInAnimator = FadeInAnimator()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func pressBtn(sender: UIButton) {
        
        // ボタンに表示されている画像の取得
        let selectedImage = sender.imageView?.image
        
        performSegueWithIdentifier("ShowFullImage", sender: selectedImage)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if let image = sender as? UIImage{
            let controller = segue.destinationViewController as! DetailViewController
            controller.image = image
            
            // 画面遷移するときにカスタムのアニメーションを使うか問い合わせる
            controller.transitioningDelegate = self
        }
    }

    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        // アニメータクラスを返すと、画面遷移するときにアニメータクラスを使う。nilだとデフォルトの画面遷移アニメーションとなる
        return fadeInAnimator
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        // アニメータクラスを返すと、遷移後に画面を閉じたときにアニメータクラスを使う。nilだとデフォルトの画面遷移アニメーションとなる
        return nil
    }
    
}

