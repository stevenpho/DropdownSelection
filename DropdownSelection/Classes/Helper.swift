//
//  Helper.swift
//  DropdownSelection
//
//  Created by steven on 2023/3/13.
//

import Foundation
import UIKit
/// 屏幕适配方法, UI布局相关的数字常量, 需要用此方法嵌套, 达到屏幕适配效果
func AD(_ x:CGFloat)->CGFloat{
    let width = min(UIScreen.main.bounds.size.width, UIScreen.main.bounds.size.height)
    return x * width / 375.0
}

enum PaddingType {
    case topPadding
    case botttomPadding
}

func getPadding(type: PaddingType) -> CGFloat{
    if #available(iOS 13.0, *) {
        let window = UIApplication.shared.windows[0]
        let topPadding = window.safeAreaInsets.top
        let bottomPadding = window.safeAreaInsets.bottom
        if (type == .topPadding){
            return topPadding
        } else {
            return bottomPadding
        }
    } else {
        let window = UIApplication.shared.keyWindow
        let topPadding = window?.safeAreaInsets.top ?? 0
        let bottomPadding = window?.safeAreaInsets.bottom ?? 0
        if (type == .topPadding){
            return topPadding
        } else {
            return bottomPadding
        }
    }
}
