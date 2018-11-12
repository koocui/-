//
//  ViewController.swift
//  饼形图
//
//  Created by 小崔 on 2018/10/23.
//  Copyright © 2018年 小崔fasdfff. All rights reserved.
//

import UIKit
private let KEYNSeenW = UIScreen.main.bounds.width
private let KEYNSeenH = UIScreen.main.bounds.height
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setCircle()
        self.setCircle1()
        self.setCircle2()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func setCircle(){
        let  circle = ScaleCircle(frame: CGRect(x: 30, y: 94, width: 200 , height: 200))
        //  四个区域的颜色
        circle.firstColor = UIColor.red
        circle.secondColor = UIColor.red
        circle.thirdColor = UIColor.blue
        circle.fourthColor = UIColor.blue
        //  四个区域所占的比例
        circle.firstScale = 0.1;
        circle.secondScale = 0.3;
        circle.thirdScale = 0.2;
        circle.fourthScale = 0.4;
        //  线宽
        circle.lineWith = 30;
        //  未填充颜色
        circle.unfillColor = UIColor.lightGray
        //  动画时长
        circle.animation_time = 2.0;
        //  中心标签的显示数值
        circle.centerLable?.text = "填写内容";
        self.view.addSubview(circle)
    }
    
    func setCircle1(){
        let  circle = ScaleCircle(frame: CGRect(x: 30, y: 300, width: 200 , height: 200))
        //  四个区域的颜色
        circle.firstColor = UIColor.red
        circle.secondColor = UIColor.yellow
        circle.thirdColor = UIColor.blue
        circle.fourthColor = UIColor.blue
        //  四个区域所占的比例
        circle.firstScale = 0.1;
        circle.secondScale = 0.3;
        circle.thirdScale = 0.3;
        circle.fourthScale = 0.4;
        //  线宽
        circle.lineWith = 30;
        //  未填充颜色
        circle.unfillColor = UIColor.lightGray
        //  动画时长
        circle.animation_time = 2.0;
        //  中心标签的显示数值
        circle.centerLable?.text = "210/500";
        self.view.addSubview(circle)
    }
    func setCircle2(){
        let  circle = ScaleCircle(frame: CGRect(x: 30, y: 510, width: 200 , height: 200))
        //  四个区域的颜色
        circle.firstColor = UIColor.red
        circle.secondColor = UIColor.yellow
        circle.thirdColor = UIColor.blue
        circle.fourthColor = UIColor.cyan
        //  四个区域所占的比例
        circle.firstScale = 0.2;
        circle.secondScale = 0.2;
        circle.thirdScale = 0.3;
        circle.fourthScale = 0.3;
        //  线宽
        circle.lineWith = 30;
        //  未填充颜色
        circle.unfillColor = UIColor.lightGray
        //  动画时长
        circle.animation_time = 2.0;
        //  中心标签的显示数值
        circle.centerLable?.text = "86%";
        self.view.addSubview(circle)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

