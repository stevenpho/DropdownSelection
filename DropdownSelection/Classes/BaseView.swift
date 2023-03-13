//
//  BaseView.swift
//  CRMManger
//
//  Created by steven on 2022/4/30.
//

import UIKit

class BaseView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.initialize()
        self.setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initialize(){}
    
    func setupViews(){
        self.backgroundColor = .clear
    }
}
