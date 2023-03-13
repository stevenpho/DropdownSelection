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


public struct DropdownMenuConfiguare : Equatable{
    /** Dropdown Menu Max Height */
    var maxHeight = AD(200)
    
    /** Dropdown Menu Result View Title FontSize */
    var resultTitleFontSize : CGFloat = 10
    
    /** Dropdown Menu Result View Has Left Icon or Not */
    var resultIconImage : UIImage? = nil
    
    /** When Dropdown Menu View Is Appear, The Result View's  Arrow Image */
    var resultSelectArrowImage = UIImage()
    
    /** When Dropdown Menu View Is Hidden , The Result View's Arrow Image */
    var resultNormalArrowImage = UIImage()
    
    /** Dropdown Menu Result View Space Between Icon and Arrow */
    var resultSpacing : CGFloat = 5
    
    /** Dropdown Menu View  Table Cell's Title FontSize */
    var menuCellTitleFontSize : CGFloat = 10
    
    /// Dropdown Menu View  Table Cell's Icon Size
    var menuCellIconSize : CGSize = CGSize(width: 10, height: 10)
    
    ///Dropdown Menu Result VIew Corner Radius
    var resultCorner : CGFloat = 15
    
    ///Dropdown Menu Result VIew Border Width
    var resultBorderWidth : CGFloat = 1
    
    ///Dropdown Menu Result VIew Border Color
    var resultBorderColor : UIColor = .white
    
    ///Dropdown Menu Result VIew Arrow Icon Size
    var resultArrowSize : CGSize = CGSize(width: 10, height: 10)
    
    ///Is Enable Dropdown Menu Result VIew ArrowRotation effect
    var isEnableArrowRotation : Bool = false
    
    ///When Dropdown Menu View Is Appear, The Result VIew Arrow Rotation Angle
    var resultSelectArrowRotation  : CGFloat = 0
    
    ///When Dropdown Menu View Is Hidden, The Result VIew Arrow Rotation Angle
    var resultNormalArrowRotation  : CGFloat = 0
    
    ///Dropdown Menu Result VIew Icon Size
    var resultIconSize : CGSize = CGSize(width: 10, height: 10)
    
    ///Dropdown Menu Result VIew Arrow Color
    var resultArrowColor : UIColor = .white
    
    ///Dropdown Menu Result VIew AlignMent
    var resultAlignmentStyle : AlignImageButtonView.Alignment = .right
    
    ///Dropdown Menu Result VIew's Icon Left Spacing and Arrow Right Spacing
    var leftRightPadding : CGFloat = 15
}

extension DropdownMenuConfiguare{
    func maxHeightIsChanged(oldValue: DropdownMenuConfiguare) -> Bool{
        return self.maxHeight != oldValue.maxHeight
    }
    
    func resultTitleFontSizeIsChanged(oldValue: DropdownMenuConfiguare) -> Bool{
        return self.resultTitleFontSize != oldValue.resultTitleFontSize
    }
    
    func resultIconImageIsChanged(oldValue: DropdownMenuConfiguare) -> Bool{
        return self.resultIconImage != oldValue.resultIconImage
    }
    
    func resultSelectArrowImageIsChanged(oldValue: DropdownMenuConfiguare) -> Bool{
        return self.resultSelectArrowImage != oldValue.resultSelectArrowImage
    }
    
    func resultNormalArrowImageIsChanged(oldValue: DropdownMenuConfiguare) -> Bool{
        return self.resultNormalArrowImage != oldValue.resultNormalArrowImage
    }
    
    func resultSpacingIsChanged(oldValue: DropdownMenuConfiguare) -> Bool{
        return self.resultSpacing != oldValue.resultSpacing
    }
    
    func menuCellTitleFontSizeIsChanged(oldValue: DropdownMenuConfiguare) -> Bool{
        return self.menuCellTitleFontSize != oldValue.menuCellTitleFontSize
    }
    
    func menuCellIconSizeIsChanged(oldValue: DropdownMenuConfiguare) -> Bool{
        return self.menuCellIconSize != oldValue.menuCellIconSize
    }
    
    func resultCornerIsChanged(oldValue: DropdownMenuConfiguare) -> Bool{
        return self.resultCorner != oldValue.resultCorner
    }
    
    func resultBorderWidthIsChanged(oldValue: DropdownMenuConfiguare) -> Bool{
        return self.resultBorderWidth != oldValue.resultBorderWidth
    }
    
    func resultBorderColorIsChanged(oldValue: DropdownMenuConfiguare) -> Bool{
        return self.resultBorderColor != oldValue.resultBorderColor
    }
    
    func resultArrowSizeIsChanged(oldValue: DropdownMenuConfiguare) -> Bool{
        return self.resultArrowSize != oldValue.resultArrowSize
    }
    
    func isEnableArrowRotationIsChanged(oldValue: DropdownMenuConfiguare) -> Bool{
        return self.isEnableArrowRotation != oldValue.isEnableArrowRotation
    }
    
    func resultSelectArrowRotationIsChanged(oldValue: DropdownMenuConfiguare) -> Bool{
        return self.resultSelectArrowRotation != oldValue.resultSelectArrowRotation
    }
    
    func resultNormalArrowRotationIsChanged(oldValue: DropdownMenuConfiguare) -> Bool{
        return self.resultNormalArrowRotation != oldValue.resultNormalArrowRotation
    }
    
    func resultIconSizeIsChanged(oldValue: DropdownMenuConfiguare) -> Bool{
        return self.resultIconSize != oldValue.resultIconSize
    }
    
    func resultArrowColorIsChanged(oldValue: DropdownMenuConfiguare) -> Bool{
        return self.resultArrowColor != oldValue.resultArrowColor
    }
    
    func resultAlignmentStyleIsChanged(oldValue: DropdownMenuConfiguare) -> Bool{
        return self.resultAlignmentStyle != oldValue.resultAlignmentStyle
    }
    
    func leftRightPaddingIsChanged(oldValue: DropdownMenuConfiguare) -> Bool{
        return self.leftRightPadding != oldValue.leftRightPadding
    }
}
