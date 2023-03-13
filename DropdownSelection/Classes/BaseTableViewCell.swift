//
//  BaseTableViewCell.swift
//  DropdownSelection
//
//  Created by steven on 2023/3/13.
//

import UIKit

class BaseTableViewCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?)
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.backgroundColor = .clear
        self.backgroundColor = .clear
        self.selectionStyle = .none
        self.initialize()
        self.setupViews()
        self.setupViewsWithIdentifier(reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // GUI Initialization code
        self.contentView.backgroundColor = .clear
        self.backgroundColor = .clear
        self.selectionStyle = .none
        self.initialize()
        self.setupViews()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    static var nib: UINib {
        return UINib(nibName: String(describing: self) , bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
    
    func initialize(){}
    
    func setupViews(){}
    
    func setupViewsWithIdentifier(reuseIdentifier: String?){}
}
