//
//  NKBootController.swift
//  NKClosureTest
//
//  Created by nanoka____ on 2015/07/09.
//  Copyright (c) 2015年 nanoka____. All rights reserved.
//

/*--------------------------------------------------------------------
; import : FrameworkやObjective-cを読み込む場合に使用
---------------------------------------------------------------------*/
import UIKit

/*=====================================================================
; NKBootController
======================================================================*/
class NKBootController : UIViewController {
    
    //delegateを保持する変数(アクセス修飾子privateで同じファイル内からしかアクセスできないようにする)
    private var bootHandler:((NKBootController,Bool) -> Void)!
    
    /*-----------------------------------------------------------------
    ; init coder : StoryBoardでの実装を許可しないようにするために必須のメソッド
    ;         in : aDecoder(NSCoder)
    ;        out :
    ------------------------------------------------------------------*/
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /*-----------------------------------------------------------------
    ; init : 初期化メソッド(必須)
    ;   in :
    ;  out :
    ------------------------------------------------------------------*/
    init() {
        //インスタンス生成
        super.init(nibName: nil, bundle: nil)
    }
    
    /*-----------------------------------------------------------------
    ; init : init()の補助メソッド。初期化時にhandlerを設定できる
    ;   in : handler:(NKBootController,Bool) -> Void)
    ;  out :
    ------------------------------------------------------------------*/
    convenience init(handler:((NKBootController,Bool) -> Void)) {
        //初期化メソッドを呼ぶ
        self.init()
        //handlerの引き渡し
        bootHandler = handler
    }
    
    /*-----------------------------------------------------------------
    ; viewDidLoad : 初回Viewの読み込み時に呼び出される
    ;          in :
    ;         out :
    ------------------------------------------------------------------*/
    override func viewDidLoad() {
        //背景を黒色にする
        self.view.backgroundColor = UIColor.blackColor()
        
        //白い円形のViewを画面中央に配置
        var circleView: UIView = UIView(frame: CGRectMake(0, 0, 0, 0))
        circleView.center = self.view.center
        circleView.backgroundColor = UIColor.whiteColor()
        circleView.layer.cornerRadius = circleView.frame.size.width/2
        self.view.addSubview(circleView)
        
        //アニメーション
        UIView.animateWithDuration(0.3,
            delay: 0,
            options: UIViewAnimationOptions.CurveEaseInOut,
            animations: { () -> Void in
                //アニメーションの処理
                
                //circleViewを拡大
                circleView.frame = CGRectMake(0, 0, self.view.frame.size.height, self.view.frame.size.height)
                circleView.center = self.view.center
                circleView.layer.cornerRadius = circleView.frame.size.width/2
            }, completion: { finished in
                //アニメーションの終了
                
                //起動時処理の終了を通知
                self.bootHandler(self,true)
            }
        )
    }
}
