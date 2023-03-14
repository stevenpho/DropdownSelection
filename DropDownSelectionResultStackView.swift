//
//  DropDownSelectionResultStackView.swift
//  DropdownSelection
//
//  Created by steven on 2023/3/14.
//

import Foundation
import UIKit

//MARK: - DropDownSelectionResultStackView - The Result View 選擇結果顯示View
class DropDownSelectionResultStackView : BaseStackView{
    weak var delegate : AutoButtonViewDelegate? = nil
    lazy var selectionResultView = AlignImageButtonView().then{
        $0.titleLabel.numberOfLines = 1
        $0.alignImage(align: .right)
        $0.titleLabel.textAlignment = .left
        $0.isFlipAnimation = true
        $0.normalArrowImage = UIImage.toSvgImage(name: "icon-arrow-down",size: self.arrowSize, fillColor: self.arrowColor)//UIImage(named: "icon-arrow-down", in: Bundle(for: type(of: self)), compatibleWith: nil) ?? UIImage()
        $0.selectArrowImage = UIImage.toSvgImage(name: "icon-arrow-up",size: self.arrowSize, fillColor: self.arrowColor)
    }
    
    lazy var selectArrowImage = UIImage(){
        didSet{
            DispatchQueue.main.async {
                self.selectionResultView.selectArrowImage = self.selectArrowImage
            }
        }
    }
    lazy var normalArrowImage = UIImage() {
        didSet{
            DispatchQueue.main.async {
                self.selectionResultView.normalArrowImage = self.normalArrowImage
            }
        }
    }
    
    
    
    lazy var arrowSize : CGSize = CGSize(width: 10, height: 10){
        didSet{
            if (oldValue == self.arrowSize){return}
            DispatchQueue.main.async {
                self.selectionResultView.selectArrowImage = UIImage.toSvgImage(name: "icon-arrow-up",size: self.arrowSize, fillColor: self.arrowColor)
                self.selectionResultView.normalArrowImage = UIImage.toSvgImage(name: "icon-arrow-down",size: self.arrowSize, fillColor: self.arrowColor)
                self.selectionResultView.arrowImageView.updateLayout {
                    $0.width.equalTo(self.arrowSize.width)
                    $0.height.equalTo(self.arrowSize.height)
                }
            }
        }
    }
    
    lazy var isArrowRotation : Bool = false{
        didSet{
            self.selectionResultView.isArrowRotation = self.isArrowRotation
        }
    }
    
    lazy var selectArrowRotation  : CGFloat = 0{
        didSet{
            self.selectionResultView.selectArrowRotation = self.selectArrowRotation
        }
    }
    
    lazy var normalArrowRotation  : CGFloat = 0{
        didSet{
            self.selectionResultView.normalArrowRotation = self.normalArrowRotation
        }
    }
    
    lazy var iconSize : CGSize = CGSize(width: 10, height: 10){
        didSet{
            if (oldValue == self.iconSize){return}
            if (self.selectionResultView.currentState == .center){return}
            DispatchQueue.main.async {
                self.selectionResultView.iconImageView.updateLayout {
                    $0.width.equalTo(self.iconSize.width)
                    $0.height.equalTo(self.iconSize.height)
                }
            }
        }
    }
    
    lazy var arrowColor : UIColor = .black{
        didSet{
            if (oldValue == self.arrowColor){return}
            DispatchQueue.main.async {
                self.selectionResultView.selectArrowImage = UIImage.toSvgImage(name: "icon-arrow-up",size: self.arrowSize, fillColor: self.arrowColor)
                self.selectionResultView.normalArrowImage = UIImage.toSvgImage(name: "icon-arrow-down",size: self.arrowSize, fillColor: self.arrowColor)
            }
        }
    }
    
    lazy var leftRightPadding : CGFloat = 15{
        didSet{
            if (oldValue == self.leftRightPadding){return}
            DispatchQueue.main.async {
                self.selectionResultView.arrowImageView.updateLayout {
                    $0.right.lessThanOrEqualToSuperview().offset(-self.leftRightPadding)
                }
                self.selectionResultView.iconImageView.updateLayout {
                    $0.left.greaterThanOrEqualToSuperview().offset(self.leftRightPadding)
                }
            }
        }
    }
    
    lazy var alignmentStyle : DropDownAlignment = .right{
        didSet{
            if (oldValue == self.alignmentStyle){return}
            self.selectionResultView.alignImage(align: self.alignmentStyle)
        }
    }
    
    lazy var backgroundButton = UIButton(type: .system).then{
        $0.addTarget(self, action: #selector(self.autoButtonPress), for: .touchUpInside)
    }
    lazy var isExpaned = false {
        didSet{
            DispatchQueue.main.async {
                self.selectionResultView.toggle()
                self.delegate?.didTap(isExpaned: self.isExpaned)
            }
        }
    }
    
    @objc func autoButtonPress(){
        self.isExpaned = !self.isExpaned
    }
    override func setupViews(){
        self.backgroundColor = .clear
        self.axis = .vertical
        self.addMultipleViewToArrangedSubView(views: [selectionResultView])
        self.selectionResultView.addMultipleViewToSubView(views: [backgroundButton])
        self.selectionResultView.addLayout {
            $0.edges.equalToSuperview()
        }
        self.backgroundButton.addLayout {
            $0.edges.equalToSuperview()
        }
    }
}
