//
//  DropdownModel.swift
//  DropdownSelection
//
//  Created by steven on 2023/3/13.
//

import Foundation

public struct DropdownMenuModel : Equatable{
    public var id: String = UUID().uuidString
    public var image : UIImage = UIImage()
    public var title : String = ""
    //need add otherwise Initializer is inaccessable due to 'internal' protection level
    public init(id: String = UUID().uuidString,image : UIImage = UIImage(),title : String = ""){
        self.id = id
        self.title = title
        self.image = image
    }
}

public enum DropDownAlignment{
    case left
    case right
    case top
    case bottom
    case center
    case centerSpace
    case none
}


public struct DropdownMenuConfiguare : Equatable{
    /** Dropdown Menu Max Height */
    public var maxHeight = AD(200)
    
    /** Dropdown Menu Result View Title FontSize */
    public var resultTitleFontSize : CGFloat = 10
    
    /** Dropdown Menu Result View Has Left Icon or Not */
    public var resultIconImage : UIImage? = nil
    
    /** When Dropdown Menu View Is Appear, The Result View's  Arrow Image */
    public var resultSelectArrowImage = UIImage(named: "icon-arrow-up") ?? UIImage()
    
    /** When Dropdown Menu View Is Hidden , The Result View's Arrow Image */
    public var resultNormalArrowImage = UIImage(named: "icon-arrow-down") ?? UIImage()
    
    /** Dropdown Menu Result View Space Between Icon and Arrow */
    public var resultSpacing : CGFloat = 5
    
    /** Dropdown Menu View  Table Cell's Title FontSize */
    public var menuCellTitleFontSize : CGFloat = 10
    
    /// Dropdown Menu View  Table Cell's Icon Size
    public var menuCellIconSize : CGSize = CGSize(width: 10, height: 10)
    
    ///Dropdown Menu Result VIew Corner Radius
    public var resultCorner : CGFloat = 15
    
    ///Dropdown Menu Result VIew Border Width
    public var resultBorderWidth : CGFloat = 1
    
    ///Dropdown Menu Result VIew Border Color
    public var resultBorderColor : UIColor = .white
    
    ///Dropdown Menu Result VIew Arrow Icon Size
    public var resultArrowSize : CGSize = CGSize(width: 10, height: 10)
    
    ///Is Enable Dropdown Menu Result VIew ArrowRotation effect
    public var isEnableArrowRotation : Bool = false
    
    ///When Dropdown Menu View Is Appear, The Result VIew Arrow Rotation Angle
    public var resultSelectArrowRotation  : CGFloat = 0
    
    ///When Dropdown Menu View Is Hidden, The Result VIew Arrow Rotation Angle
    public var resultNormalArrowRotation  : CGFloat = 0
    
    ///Dropdown Menu Result VIew Icon Size
    public var resultIconSize : CGSize = CGSize(width: 10, height: 10)
    
    ///Dropdown Menu Result VIew Arrow Color
    public var resultArrowColor : UIColor = .white
    
    ///Dropdown Menu Result VIew AlignMent
    public var resultAlignmentStyle : DropDownAlignment = .right
    
    ///Dropdown Menu Result VIew's Icon Left Spacing and Arrow Right Spacing
    public var leftRightPadding : CGFloat = 15
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
