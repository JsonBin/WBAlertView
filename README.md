# WBAlertView
Swift写的一段基于Windows的提示消息框，可在顶部或者底部弹出消息提示

使用方法
=======

        // 初始化
        let alert=WBAlertView()

        // 设置属性(可不设置)
        alert.color=UIColor.cyanColor()  // 设置背景颜色，默认为天蓝色
        alert.font=15   // 设置字体大小，默认为17
        alert.disTime=3.0  // 设置需要持续显示的时间，默认为1.5s
        
        // 显示
        alert.showTop("这只是一个测试!") // 顶部显示
        //alert.showBottom("这只是一个测试!")  // 底部显示
        
效果图
======

 ![gif](https://github.com/JsonBin/WBAlertView/raw/master/WBAlertView/showtop.gif  "顶部弹出效果图")
 ![gif](https://github.com/JsonBin/WBAlertView/raw/master/WBAlertView/showbottom.gif  "底部弹出效果图")
