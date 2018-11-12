//
//  ScaleCircle.swift
//  饼形图
//
//  Created by 小崔 on 2018/10/23.
//  Copyright © 2018年 小崔fasdfff. All rights reserved.
//

import UIKit
private let KEYNSeenW = UIScreen.main.bounds.width
private let KEYNSeenH = UIScreen.main.bounds.height
class ScaleCircle: UIView {

    //中心数据显示标签
    var centerLable : UILabel?
    
    //线宽.
    var lineWith : Float?
    //基准圆环颜色
    var unfillColor : UIColor?
  
    //  四个区域的颜色
    var firstColor:UIColor?
    var secondColor:UIColor?
    var thirdColor:UIColor?
    var fourthColor:UIColor?
    //  四个区域所占的百分比
    var firstScale:Float?
    var secondScale:Float?
    var thirdScale:Float?
    var fourthScale:Float?
    //动画时长
    var animation_time:Float?
    
    
    var  radius:Float? //  半径
    
    var first_animation_time:Float?
    var second_animation_time:Float?
    var third_animation_time:Float?
    var fourth_animation_time:Float?
    
    var CGPoinCerter:CGPoint?
    var endAngle:Float?
    var clockwise:Bool?
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.initCenterLabel()
        self.lineWith = 10.0;
        self.unfillColor = UIColor.lightGray
        self.clockwise = true
        self.backgroundColor = UIColor.clear
        
        self.firstColor = UIColor.red
        self.secondColor = UIColor.green
        self.thirdColor = UIColor.yellow
        self.fourthColor = UIColor.blue
        
        self.animation_time = 5.0;
        
        self.centerLable?.text = "请初始化..."
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func draw(_ rect: CGRect) {
        // Drawing code
        self.initData()
        self.drawMiddlecircle()
        let queue = DispatchQueue.init(label: "zjfaeQueue")//创建队列
        let mainQueue = DispatchQueue.main
        queue.async {
            mainQueue.async {
                self.drawOutCCircle_first()
            }
        }
        queue.async {
            Thread.sleep(forTimeInterval: Double(self.first_animation_time!))
            mainQueue.async {
               self.drawOutCCircle_second()
            }
           
        }
        queue.async {
            Thread.sleep(forTimeInterval: Double(self.second_animation_time!))
            mainQueue.async {
            self.drawOutCCircle_third()
            }
        }
        queue.async {
            Thread.sleep(forTimeInterval: Double(self.third_animation_time!))
            mainQueue.async {
            self.drawOutCCircle_fourth()
            }
        }

    }
    
    /*
     *中心标签设置
     */
   func initCenterLabel(){
        let center =  min(self.bounds.size.width/2, self.bounds.size.width/2)
        self.CGPoinCerter = CGPoint(x: center, y: center)
        self.centerLable = UILabel(frame:CGRect(x: 0, y: 0, width: 2*center, height: 2*center))
        self.centerLable?.textAlignment = .center
        self.centerLable?.backgroundColor = UIColor.clear
        self.centerLable?.adjustsFontSizeToFitWidth = true
        self.centerLable?.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        self.contentMode = .redraw
        self.addSubview(self.centerLable!)
    }

    /*
     参数配置
    */
    func initData(){
        //计算animation时间
        first_animation_time = self.animation_time! * self.firstScale!
        second_animation_time = self.animation_time! * self.secondScale!
        third_animation_time = self.animation_time! * self.thirdScale!
        fourth_animation_time = self.animation_time! * self.fourthScale!
        //半径计算
        let x = (Float(self.bounds.size.height/2))-(self.lineWith!/2)
        let y = (Float(self.bounds.size.width/2))-(self.lineWith!/2)
        radius = min(x, y)
        self.centerLable?.font = UIFont.systemFont(ofSize: CGFloat(radius!/3))
    }
    /**
     *  显示圆环 -- first
     */
    func drawOutCCircle_first(){
        let bPath_first:UIBezierPath = UIBezierPath.init(arcCenter: self.CGPoinCerter!, radius: CGFloat(radius!), startAngle: CGFloat(Double.pi * 0), endAngle: CGFloat(Double.pi * Double(self.firstScale! * 2)), clockwise: self.clockwise!)
        let lineLayer_first = CAShapeLayer.init(layer: layer)
        lineLayer_first.frame = (self.centerLable?.frame)!
        lineLayer_first.fillColor = UIColor.clear.cgColor
        lineLayer_first.path = bPath_first.cgPath
        lineLayer_first.strokeColor = self.firstColor?.cgColor
        lineLayer_first.lineWidth  = CGFloat(self.lineWith!)
        let ani:CABasicAnimation = CABasicAnimation.init(keyPath: "strokeEnd")
        ani.fromValue = 0
        ani.toValue = 1;
        ani.duration = Double(first_animation_time!)
        lineLayer_first.add(ani, forKey: "strokeEnd")
        self.layer.addSublayer(lineLayer_first)
    }
    
    /**
     *  显示圆环 -- second
     */
    func drawOutCCircle_second(){
        
        let bPath_second:UIBezierPath = UIBezierPath.init(arcCenter: self.CGPoinCerter!, radius: CGFloat(radius!), startAngle: CGFloat(Double.pi * Double(2 * self.firstScale!)), endAngle: CGFloat(Double.pi * Double(2 * (self.firstScale! + self.secondScale!))), clockwise: self.clockwise!)

        let lineLayer_second = CAShapeLayer.init(layer: layer)
        lineLayer_second.frame = self.centerLable!.frame
        lineLayer_second.fillColor = UIColor.clear.cgColor
        lineLayer_second.path = bPath_second.cgPath
        lineLayer_second.strokeColor = self.secondColor?.cgColor
        lineLayer_second.lineWidth = CGFloat(self.lineWith!)
        
        let ani = CABasicAnimation(keyPath: "strokeEnd")
        ani.fromValue = 0
        ani.toValue = 1
        ani.duration = Double(second_animation_time!)
        lineLayer_second.add(ani, forKey: "strokeEnd")
        self.layer.addSublayer(lineLayer_second)
    }
    /**
     *  显示圆环 -- third
     */
    func drawOutCCircle_third(){
        let bPath_third = UIBezierPath.init(arcCenter: self.CGPoinCerter!, radius: CGFloat(radius!), startAngle: CGFloat(Double.pi * Double(2 * (self.firstScale! + self.secondScale!))), endAngle: CGFloat(Double.pi * Double(2 * (self.firstScale! + self.secondScale! + self.thirdScale!))), clockwise: self.clockwise!)
        
        let lineLayer_third = CAShapeLayer.init(layer: layer)
        lineLayer_third.frame = self.centerLable!.frame
        lineLayer_third.fillColor = UIColor.clear.cgColor
        lineLayer_third.path = bPath_third.cgPath
        lineLayer_third.strokeColor = self.thirdColor?.cgColor
        lineLayer_third.lineWidth = CGFloat(self.lineWith!)
        
        let ani = CABasicAnimation.init(keyPath: "strokeEnd")
        ani.fromValue = 0
        ani.toValue = 1
        ani.duration = Double(third_animation_time!)
        lineLayer_third.add(ani, forKey: "strokeEnd")
        self.layer.addSublayer(lineLayer_third)
    }
    /**
     *  显示圆环 -- fourth
     */
    func drawOutCCircle_fourth(){
        let bPath_fourth = UIBezierPath.init(arcCenter: self.CGPoinCerter!, radius: CGFloat(radius!), startAngle: CGFloat(Double.pi * Double(2 * (self.firstScale! + self.secondScale! + self.thirdScale!))), endAngle: CGFloat(Double.pi * Double(2 * (self.firstScale! + self.secondScale! + self.thirdScale! + self.fourthScale!))), clockwise: self.clockwise!)
        let lineLayer_fourth = CAShapeLayer.init(layer: layer)
        lineLayer_fourth.frame = self.centerLable!.frame
        lineLayer_fourth.fillColor = UIColor.clear.cgColor
        lineLayer_fourth.path = bPath_fourth.cgPath
        lineLayer_fourth.strokeColor = self.fourthColor?.cgColor
        lineLayer_fourth.lineWidth = CGFloat(self.lineWith!)
        
        let ani = CABasicAnimation.init(keyPath: "strokeEnd")
        ani.fromValue = 0
        ani.toValue = 1
        ani.duration = Double(fourth_animation_time!)
        lineLayer_fourth.add(ani, forKey: "strokeEnd")
        self.layer.addSublayer(lineLayer_fourth)
        
        
    }
    /**
     *  辅助圆环
     */
    func drawMiddlecircle(){
        let cPath = UIBezierPath.init(arcCenter: self.CGPoinCerter!, radius: CGFloat(radius!), startAngle: CGFloat(Double.pi * 0), endAngle: CGFloat(Double.pi * 2 ), clockwise: self.clockwise!)
        cPath.lineWidth = CGFloat(self.lineWith!)
        cPath.lineCapStyle = .round
        cPath.lineJoinStyle = .round
        let color = self.unfillColor
        color?.setStroke()
        cPath.stroke()
    }
    

}


























