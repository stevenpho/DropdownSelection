//
//  BaseView.swift
//  DropdownSelection
//
//  Created by steven on 2023/3/13.
//

import UIKit

public class DropDownMenuBaseView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
        self.initialize()
        self.setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initialize(){}
    
    func setupViews(){}
}
