//
//  AlignImageButtonView.swift
//  DropdownSelection
//
//  Created by steven on 2023/3/14.
//

import Foundation
import UIKit

class AlignImageButtonView : DropDownMenuBaseView{
    
    enum RotationConfigure : Equatable{
        case selectImageRotation(CGFloat)
        case normalImageRotation(CGFloat)
        func getRotation() -> CGFloat {
            switch self {
            case .selectImageRotation(let rotation):
                return rotation
            case .normalImageRotation(let rotation):
                return rotation
            }
        }
    }
    
    enum Alignment{
        case left
        case right
        case top
        case bottom
        case center
        case centerSpace
        case none
    }
    lazy var arrowImageView = UIImageView().then{
        $0.backgroundColor = .clear
    }
    /** 只有在align center時才會出現*/
    lazy var iconImageView = UIImageView().then{
        $0.backgroundColor = .clear
        //$0.contentMode = .scaleAspectFit
        $0.isHidden = true
    }
    lazy var titleLabel = UILabel().then{
        $0.backgroundColor = .clear
        $0.numberOfLines = 0
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 10, weight: .medium)
    }
    lazy var currentState = Alignment.none
    lazy var selectArrowImage = UIImage(){
        didSet{
            DispatchQueue.main.async {
                //guard self.arrowImageView.image == nil else {return}
                self.arrowImageView.image = self.isSelected ? self.selectArrowImage : self.normalArrowImage
            }
        }
    }
    lazy var normalArrowImage = UIImage() {
        didSet{
            DispatchQueue.main.async {
               // guard self.arrowImageView.image == nil else {return}
                self.arrowImageView.image = self.isSelected ? self.selectArrowImage : self.normalArrowImage
            }
        }
    }
    lazy var isSelected = false {
        didSet{
            DispatchQueue.main.async {
                if (self.isArrowRotation){
                    self.arrowImageView.transform = self.isSelected ? CGAffineTransform(rotationAngle: .pi / 180 * self.selectArrowRotation) : CGAffineTransform(rotationAngle: .pi / 180 * self.normalArrowRotation)
                }
                if (!self.isFlipAnimation){
                    self.arrowImageView.image = self.isSelected ? self.selectArrowImage : self.normalArrowImage
                    return
                }
                UIView.transition(with: self.arrowImageView, duration: 0.25, options: self.isSelected ? .transitionFlipFromBottom : .transitionFlipFromTop, animations: {
                    self.arrowImageView.image = self.isSelected ? self.selectArrowImage : self.normalArrowImage
                }, completion: nil)
            }
        }
    }
    lazy var isFlipAnimation = false
    lazy var isArrowRotation : Bool = false{
        didSet{
            if (oldValue == self.isArrowRotation){return}
            if (self.isArrowRotation == false){
                self.arrowImageView.transform = CGAffineTransform.identity
            }
        }
    }
    
    lazy var selectArrowRotation : CGFloat = 0{
        didSet{
            if (oldValue == self.selectArrowRotation){return}
            DispatchQueue.main.async {
                if (self.isSelected){
                    self.arrowImageView.transform = CGAffineTransform(rotationAngle: .pi / 180 * self.selectArrowRotation)
                }
            }
        }
    }
    
    lazy var normalArrowRotation : CGFloat = 0{
        didSet{
            if (oldValue == self.normalArrowRotation){return}
            DispatchQueue.main.async {
                if (!self.isSelected){
                    self.arrowImageView.transform = CGAffineTransform(rotationAngle: .pi / 180 * self.normalArrowRotation)
                }
            }
        }
    }
    
    lazy var corner : CGFloat = 15
    lazy var borderWidth : CGFloat = 1
    lazy var borderColor : UIColor = ShareData.shared.theme.highlight_color
    
    override func setupViews() {
        self.backgroundColor = .clear//ShareData.shared.theme.bg_tertiary_color
        self.setCustomBorder()
        self.addMultipleViewToSubView(views: [arrowImageView,titleLabel,iconImageView])
    }
    
    func setCustomBorder(){
        self.setBorder(cornerRadius: self.corner, borderWith: self.borderWidth, borderColor: self.borderColor)
    }
    
    func alignImage(align: Alignment, spacing: CGFloat = 10){
        if (self.currentState == align){return}
        self.currentState = align
        self.titleLabel.removeAllLayout()
        self.arrowImageView.removeAllLayout()
        self.iconImageView.isHidden = true
        self.iconImageView.removeAllLayout()
        switch align{
        case .left:
            self.left(spacing: spacing)
        case .right:
            self.right(spacing: spacing)
        case .top:
            self.top(spacing: spacing)
        case .bottom:
            self.bottom(spacing: spacing)
        case .center:
            self.center(spacing: spacing)
        case .centerSpace:
            self.centerSpace(spacing: spacing)
        case .none:
            return
        }
    }
    func left(spacing: CGFloat){
        self.arrowImageView.setContentCompressionResistancePriority(.required, for: .horizontal)
        self.titleLabel.addLayout {
            $0.top.bottom.equalToSuperview()
            $0.right.equalToSuperview().offset(-15)
            $0.left.equalTo(self.arrowImageView.snp.right).offset(spacing)
        }
        self.arrowImageView.addLayout {
            $0.left.equalToSuperview().offset(15)
            $0.centerY.equalTo(self.titleLabel)
            $0.width.height.equalTo(10)
        }
    }
    func right(spacing: CGFloat){
        self.arrowImageView.setContentCompressionResistancePriority(.required, for: .horizontal)
        self.titleLabel.addLayout {
            $0.left.equalToSuperview().offset(15)
            $0.top.bottom.equalToSuperview()
            $0.right.equalTo(self.arrowImageView.snp.left).offset(-spacing)
        }
        self.arrowImageView.addLayout {
            $0.right.equalToSuperview().offset(-15)
            $0.centerY.equalTo(self.titleLabel)
            $0.width.height.equalTo(10)
        }
    }
    
    func top(spacing: CGFloat){
        self.arrowImageView.setContentCompressionResistancePriority(.required, for: .vertical)
        self.titleLabel.addLayout {
            $0.top.equalTo(self.arrowImageView.snp.bottom).offset(spacing)
            $0.left.equalToSuperview().offset(15)
            $0.right.equalToSuperview().offset(-15)
            $0.bottom.equalToSuperview()
        }
        self.arrowImageView.addLayout {
            $0.centerX.top.equalToSuperview()
            $0.width.height.equalTo(10)
        }
    }
    func bottom(spacing: CGFloat){
        self.arrowImageView.setContentCompressionResistancePriority(.required, for: .vertical)
        self.titleLabel.addLayout {
            $0.left.equalToSuperview().offset(15)
            $0.right.equalToSuperview().offset(-15)
            $0.top.equalToSuperview()
            $0.bottom.equalTo(self.arrowImageView.snp.top).offset(-spacing)
        }
        self.arrowImageView.addLayout {
            $0.centerX.bottom.equalToSuperview()
            $0.width.height.equalTo(10)
        }
    }
    func center(spacing: CGFloat){
        self.iconImageView.isHidden = false
        self.iconImageView.setContentCompressionResistancePriority(.required, for: .horizontal)
        self.arrowImageView.setContentCompressionResistancePriority(.required, for: .horizontal)
        self.titleLabel.addLayout {
            $0.top.bottom.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
        self.arrowImageView.addLayout {
            $0.left.equalTo(self.titleLabel.snp.right).offset(spacing)
            $0.right.lessThanOrEqualToSuperview().offset(-15)
            $0.centerY.equalTo(self.titleLabel)
            $0.width.height.equalTo(10)
        }
        self.iconImageView.addLayout {
            $0.left.greaterThanOrEqualToSuperview().offset(15)
            $0.right.equalTo(self.titleLabel.snp.left).offset(-spacing)
            $0.centerY.equalTo(self.titleLabel)
            $0.width.height.equalTo(10)
        }
    }
    func centerSpace(spacing: CGFloat){
        self.iconImageView.isHidden = false
        self.iconImageView.setContentCompressionResistancePriority(.required, for: .horizontal)
        self.arrowImageView.setContentCompressionResistancePriority(.required, for: .horizontal)
        self.titleLabel.addLayout {
            $0.top.bottom.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.left.greaterThanOrEqualTo(self.iconImageView.snp.right).offset(spacing)
            $0.right.lessThanOrEqualTo(self.arrowImageView.snp.left).offset(-spacing)
        }
        self.arrowImageView.addLayout {
            $0.right.equalToSuperview().offset(-spacing)
            $0.centerY.equalTo(self.titleLabel)
            $0.width.height.equalTo(10)
        }
        self.iconImageView.addLayout {
            $0.left.equalToSuperview().offset(spacing)
            $0.centerY.equalTo(self.titleLabel)
            $0.width.height.equalTo(10)
        }
    }
    func toggle(){
        self.isSelected = !isSelected
    }
}
