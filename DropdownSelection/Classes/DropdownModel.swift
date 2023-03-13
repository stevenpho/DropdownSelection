//
//  DropdownModel.swift
//  DropdownSelection
//
//  Created by steven on 2023/3/13.
//

import Foundation

enum DropDownMenuType : Equatable{
    case categories
    case none
    var rawValue: String {
        switch self {
        case .categories:
            return "categories"
        case .none:
            return "none"
        }
    }
}

public struct DropdownMenuModel : Equatable{
    var type: DropDownMenuType = .none
    var id: String = UUID().uuidString
    var image : UIImage = UIImage()
    var title : String = ""
}
