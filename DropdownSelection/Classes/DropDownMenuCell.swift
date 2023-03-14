//
//  DropDownMenuCell.swift
//  DropdownSelection
//
//  Created by steven on 2023/3/13.
//

import Foundation
import UIKit
//MARK: - DropDownMenuCell 下拉選單Cell
class DropDownMenuCell : BaseTableViewCell{
    lazy var titleLabel = UILabel().then{
        $0.textColor = .black
        $0.numberOfLines = 1
        $0.textAlignment = .left
        $0.font = UIFont.systemFont(ofSize: 10, weight: .medium)
        $0.backgroundColor = .clear
    }
    lazy var iconImageView = UIImageView().then{
        $0.backgroundColor = .clear
        $0.isHidden = true
        //$0.contentMode = .scaleAspectFit
    }
    
    lazy var containerView = UIView().then{
        $0.backgroundColor = .clear
    }
    
    override func setupViews() {
        self.contentView.backgroundColor = .clear
        self.containerView.addMultipleViewToSubView(views: [titleLabel,iconImageView])
        self.contentView.addMultipleViewToSubView(views: [containerView])
        self.iconImageView.setContentCompressionResistancePriority(.required, for: .horizontal)
        
        self.containerView.addLayout {
            $0.edges.equalToSuperview()
        }
        
        self.iconImageView.addLayout {
            $0.left.equalToSuperview().offset(5)
            $0.centerY.equalTo(self.titleLabel)
            $0.width.height.equalTo(0)
        }
        self.titleLabel.addLayout {
            $0.left.equalTo(self.iconImageView.snp.right).offset(5)
            $0.right.equalToSuperview().offset(-10)
            $0.top.bottom.equalToSuperview()
            $0.height.equalTo(40 * UIScreen.main.bounds.width / 320).priority(999)
        }
    }
    func setModel(model: DropdownMenuModel, iconSize: CGSize = .zero){
        self.titleLabel.text = model.title
        self.resetCenter()
        if (model.image.size != .zero){
            self.updateCenter(image: model.image, iconSize: iconSize)
        }
    }
    
    func resetLeft(){
        self.iconImageView.image = nil
        self.iconImageView.isHidden = true
        self.iconImageView.updateLayout {
            $0.width.height.equalTo(0)
            $0.left.equalToSuperview().offset(5)
        }
    }
    
    func updateLeft(image: UIImage){
        self.iconImageView.isHidden = false
        self.iconImageView.image = image
        self.iconImageView.updateLayout {
            $0.width.height.equalTo(10)
            $0.left.equalToSuperview().offset(10)
        }
    }
    
    func resetCenter(){
        self.iconImageView.image = nil
        self.iconImageView.isHidden = true
        
        self.containerView.remakeLayout {
            $0.edges.equalToSuperview()
        }
    }
    
    func updateCenter(image: UIImage, iconSize: CGSize = CGSize(width: 10, height: 10)){
        self.iconImageView.isHidden = false
        self.iconImageView.image = image
        self.containerView.remakeLayout {
            $0.centerX.equalToSuperview()
            $0.left.greaterThanOrEqualToSuperview().offset(10)
            $0.right.lessThanOrEqualToSuperview().offset(-10)
            $0.top.bottom.equalToSuperview()
        }
        self.iconImageView.remakeLayout {
            $0.left.greaterThanOrEqualToSuperview().offset(0)//10
            $0.centerY.equalTo(self.titleLabel)
            $0.width.equalTo(iconSize.width)
            $0.height.equalTo(iconSize.height)
        }
        self.titleLabel.remakeLayout {
            $0.left.equalTo(self.iconImageView.snp.right).offset(5)
            $0.right.equalToSuperview().offset(0)//-10
            $0.top.bottom.equalToSuperview()
            $0.height.equalTo(40 * UIScreen.main.bounds.width / 320).priority(999)
        }
    }
}
