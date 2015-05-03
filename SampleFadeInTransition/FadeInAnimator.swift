//
//  FadeInAnimator.swift
//  SampleFadeInTransition
//
//  Created by FUJISAWAHIROYUKI on 2015/05/02.
//  Copyright (c) 2015年 swift-studying. All rights reserved.
//

import UIKit

class FadeInAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    // 画面遷移にかかる時間を返す
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        return 1.0
    }
    
    // 画面遷移のアニメーション内容を書く
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        // アニメーションが実行されるコンテナビューの取得
        let containerView = transitionContext.containerView()
        
        // 遷移先画面の取得
        let toView = transitionContext.viewForKey(UITransitionContextToViewKey)!
        toView.alpha = 0.0
        
        // 遷移先画面をコンテナビューに追加
        containerView.addSubview(toView)
        
        // 遷移先画面のalpha値をアニメーション
        UIView.animateWithDuration(self.transitionDuration(transitionContext), animations: { () -> Void in
            
                // alpha値を0.0から1.0に変化させることでフェードインしているように見せる
                toView.alpha = 1.0
            
            }, completion: {
                _ in
                // アニメーションが終了したことを通知する
                transitionContext.completeTransition(true)
        })
    }
}
