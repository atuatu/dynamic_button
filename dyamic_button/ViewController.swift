//
//  ViewController.swift
//  dyamic_button
//
//  Created by kiyolab02 on 2019/11/06.
//  Copyright © 2019 2019miraiketai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    class MyButton: UIButton{
        let x:Int
        let y:Int
        init(x:Int,y:Int,frame:CGRect){
            self.x = x
            self.y = y
            super.init(frame:frame)
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let row:Int = 10
        let line :Int = 5
        
        for x in 0 ..< row {
            for y in 0 ..< line{
                let button : UIButton = MyButton(
                    x:x,
                    y:y,
                    frame:CGRect(x: CGFloat(x)*40,y: CGFloat(y)*40+100,width: 20,height: 20))
                button.tag = x + (y*10) + 1 //ボタンにつけるタグを指定
                button.addTarget(self, action: #selector(self.move), for: UIControl.Event.touchUpInside)
                button.backgroundColor = UIColor.red
                //画面に追加
                view.addSubview(button)
            }
        }
    }
    
    @objc func move(button:MyButton){
        print("タグは\(button.tag)です")
        let storyboard: UIStoryboard = self.storyboard!
        let nextView = storyboard.instantiateViewController(withIdentifier: "next")
        present(nextView, animated: true)
        }
}

