//
//  Extension.swift
//  DropdownSelection
//
//  Created by steven on 2023/3/13.
//

import Foundation
import UIKit

extension UIView{
    func addMultipleViewToSubView(views: [UIView]){
        if (views.count == 0){return}
        for view in views{
            self.addSubview(view)
        } 
    }
}
