//
//  WBAlertView.swift
//  WBAlertView
//
//  Created by Zwb on 16/4/9.
//  Copyright © 2016年 zwb. All rights reserved.
//

import UIKit

class WBAlertView: UIView {

    // 外部调用
    internal var font:CGFloat? // 文本字体大小
    internal var color:UIColor?  // 背景颜色
    internal var disTime:CGFloat?  // 持续时间
    
    // 内部调用
    private let label=UILabel()
    private var wbRect=CGRect()
    private var wbwindow=UIWindow()
    private var str=NSString()
    
    // 顶部显示
    internal func showTop(string:NSString)->Void{
        str=string
        wbwindow=UIApplication.sharedApplication().keyWindow!
        wbRect=wbwindow.screen.bounds
        create()
        self.frame = CGRectMake(0, -height(), wbRect.width, height())
        wbwindow.addSubview(self)
        weak var weakSelf=self
        UIView.animateWithDuration(1.0, animations: {
                weakSelf?.frame = CGRectMake((weakSelf?.frame.origin.x)!, 0, (weakSelf?.frame.size.width)!, (weakSelf?.frame.size.height)!)
            }) { (flag) in
                weakSelf?.topHidde()
        }
    }
    
    // 底部显示
    internal func showBottom(string:NSString)->Void{
        str=string
        wbwindow=UIApplication.sharedApplication().keyWindow!
        wbRect=wbwindow.screen.bounds
        create()
        self.frame = CGRectMake(0, wbRect.height, wbRect.width, height())
        wbwindow.addSubview(self)
        weak var weakSelf=self
        UIView.animateWithDuration(1.0, animations: {
            weakSelf?.frame = CGRectMake((weakSelf?.frame.origin.x)!, (weakSelf?.wbRect.height)!-(weakSelf?.height())!, (weakSelf?.frame.size.width)!, (weakSelf?.frame.size.height)!)
        }) { (flag) in
            weakSelf?.botomHidde()
        }
    }
    
    private func topHidde()->Void{
        let s = disTime==nil ? 1.5 : disTime
        let time = dispatch_time(DISPATCH_TIME_NOW, Int64(Double(s!) * Double(NSEC_PER_SEC)))
        weak var weakSelf=self
        dispatch_after(time, dispatch_get_main_queue()) {
            UIView.animateWithDuration(0.5, animations: {
                weakSelf?.frame = CGRectMake((weakSelf?.frame.origin.x)!, -(weakSelf?.height())!, (weakSelf?.frame.size.width)!, (weakSelf?.frame.size.height)!)
            }) { (flag) in
                self.removeFromSuperview()
            }
        }
    }
    
    private func botomHidde()->Void{
        let s = disTime==nil ? 1.5 : disTime
        let time = dispatch_time(DISPATCH_TIME_NOW, Int64(Double(s!) * Double(NSEC_PER_SEC)))
        weak var weakSelf=self
        dispatch_after(time, dispatch_get_main_queue()) {
            UIView.animateWithDuration(0.5, animations: {
                weakSelf?.frame = CGRectMake((weakSelf?.frame.origin.x)!, (weakSelf?.wbRect.height)!, (weakSelf?.frame.size.width)!, (weakSelf?.frame.size.height)!)
            }) { (flag) in
                self.removeFromSuperview()
            }
        }
    }
    
    private func create()->Void{
        self.frame=CGRectMake(0, 0, 10, 10)
        self.backgroundColor=color==nil ? UIColor.cyanColor() : color
        
        let bound=NSString.init(string: str)
        let rect=bound.sizeWithSize(CGSizeMake(width(), 1000), andFont: (font==nil ? UIFont.systemFontOfSize(17) : UIFont.systemFontOfSize(font!) ))
        self.bounds=CGRectMake(0, 0, width(), rect.height+20)
        
        label.frame=self.bounds
        label.text=str as String
        label.textAlignment = .Center
        label.lineBreakMode = .ByTruncatingTail
        label.numberOfLines=0
        label.font=font==nil ? UIFont.systemFontOfSize(17) : UIFont.systemFontOfSize(font!)
        label.textColor=UIColor.whiteColor()
        self.addSubview(label)
    }
    
    private func width()->CGFloat{
        return wbRect.width
    }
    
    private func height()->CGFloat{
        return self.bounds.size.height
    }
    
    /* 根据输入的文字，设置文本的高度 (因swift bug导致该函数不能运行，因此在这里导入OC语言)
     private func sizeWithString(string:NSString, font:UIFont)->CGSize{
     var rect = CGRect()
     let options:NSStringDrawingOptions = .TruncatesLastVisibleLine | .UsesFontLeading | .UsesLineFragmentOrigin
     rect = string.boundingRectWithSize(CGSizeMake(getWidth()-20, 1000), options:options , attributes: [NSFontAttributeName:font,NSForegroundColorAttributeName:UIColor.whiteColor()], context: nil)
     return rect.size
     }
     */

}
