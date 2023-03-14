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
    /** Dropdown Menu Max Height   Default is 200  */
    public var maxHeight = AD(200)
    
    /** Dropdown Menu Result View Title FontSize, Default is 10  */
    public var resultTitleFontSize : CGFloat = 10
    
    /** Dropdown Menu Result View Has Left Icon or Not ,Default is nil */
    public var resultIconImage : UIImage? = nil
    
    /** When Dropdown Menu View Is Appear, The Result View's  Arrow Image  */
    public var resultSelectArrowImage = UIImage(named: "icon-arrow-up") ?? UIImage()
    
    /** When Dropdown Menu View Is Hidden , The Result View's Arrow Image */
    public var resultNormalArrowImage = UIImage(named: "icon-arrow-down") ?? UIImage()
    
    /** Dropdown Menu Result View Space Between Icon and Arrow,  Default is 5 */
    public var resultSpacing : CGFloat = 5
    
    /** Dropdown Menu View  Table Cell's Title FontSize,  Default is 10 */
    public var menuCellTitleFontSize : CGFloat = 10
    
    /// Dropdown Menu View  Table Cell's Icon Size,  Default is width: 10, height: 10
    public var menuCellIconSize : CGSize = CGSize(width: 10, height: 10)
    
    ///Dropdown Menu Result VIew Corner Radius, Default is 15
    public var resultCorner : CGFloat = 15
    
    ///Dropdown Menu Result VIew Border Width,  Default is 1
    public var resultBorderWidth : CGFloat = 1
    
    ///Dropdown Menu Result VIew Border Color,  Default is white
    public var resultBorderColor : UIColor = .white
    
    ///Dropdown Menu Result VIew Arrow Icon Size,  Default is width: 10, height: 10
    public var resultArrowSize : CGSize = CGSize(width: 10, height: 10)
    
    ///Is Enable Dropdown Menu Result VIew ArrowRotation Effect, Default is False
    public var isEnableArrowRotation : Bool = false
    
    ///Is Enable Dropdown Menu Animationeffect, Default is True
    public var isEnableAnimation : Bool = true
    
    ///When Dropdown Menu View Is Appear, The Result VIew Arrow Rotation Angle, Default is 0
    public var resultSelectArrowRotation  : CGFloat = 0
    
    ///When Dropdown Menu View Is Hidden, The Result VIew Arrow Rotation Angle,  Default is 0
    public var resultNormalArrowRotation  : CGFloat = 0
    
    ///Dropdown Menu Result VIew Icon Size,  Default is width: 10, height: 10
    public var resultIconSize : CGSize = CGSize(width: 10, height: 10)
    
    ///Dropdown Menu Result VIew Arrow Color,  Default is white
    public var resultArrowColor : UIColor = .white
    
    ///Dropdown Menu Result VIew AlignMent,  Default is right
    public var resultAlignmentStyle : DropDownAlignment = .right
    
    ///Dropdown Menu Result VIew's Icon Left Spacing and Arrow Right Spacing ,  Default is 15
    public var leftRightPadding : CGFloat = 15
    
    /// Dropdown Menu TableView BackgroundView ,  Default is nil
    public var menuTableViewBackgroundView : UIView? = nil
    
    /// Dropdown Menu TableView Background Color,  Default is clear
    public var menuTableViewBackgroundColor : UIColor = .clear
    
    /// Dropdown Menu Content View Background Color,  Default is white
    public var menuContentViewBackgroundColor : UIColor = .white
    
    /// Dropdown Menu Content View Border Radius,  Default is 0
    public var menuContentViewBorderRadius : CGFloat = 0
    
    /// Dropdown Menu Content View Border Width,  Default is 0
    public var menuContentViewBorderWidth : CGFloat = 0
    
    /// Dropdown Menu Content View Border Color,  Default is black
    public var menuContentViewBorderColor : UIColor = .black
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
    
    func isEnableAnimationIsChanged(oldValue: DropdownMenuConfiguare) -> Bool{
        return self.isEnableAnimation != oldValue.isEnableAnimation
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
    
    func menuTableViewBackgroundViewIsChanged(oldValue: DropdownMenuConfiguare) -> Bool{
        return self.menuTableViewBackgroundView != oldValue.menuTableViewBackgroundView
    }
    
    func menuTableViewBackgroundColorIsChanged(oldValue: DropdownMenuConfiguare) -> Bool{
        return self.menuTableViewBackgroundColor != oldValue.menuTableViewBackgroundColor
    }
    
    func menuContentViewBackgroundColorIsChanged(oldValue: DropdownMenuConfiguare) -> Bool{
        return self.menuContentViewBackgroundColor != oldValue.menuContentViewBackgroundColor
    }

    func menuContentViewBorderRadiusIsChanged(oldValue: DropdownMenuConfiguare) -> Bool{
        return self.menuContentViewBorderRadius != oldValue.menuContentViewBorderRadius
    }
    
    func menuContentViewBorderWidthIsChanged(oldValue: DropdownMenuConfiguare) -> Bool{
        return self.menuContentViewBorderWidth != oldValue.menuContentViewBorderWidth
    }
 
    func menuContentViewBorderColorIsChanged(oldValue: DropdownMenuConfiguare) -> Bool{
        return self.menuContentViewBorderColor != oldValue.menuContentViewBorderColor
    }
}
