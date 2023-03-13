//
//  DropDownContentStackView.swift
//  DropdownSelection
//
//  Created by steven on 2023/3/13.
//

import UIKit
import Then

protocol DropDownContentStackViewDelegate : BaseDelegate{
    func didSelectMenuRow(indexPath: IndexPath, model: DropdownMenuModel)
}


//MARK: - DropDownContentStackView

class DropDownContentStackView : BaseStackView{
    weak var delegate : DropDownContentStackViewDelegate? = nil
    lazy var spaceView = DropDownMenuBaseView().then{
        $0.backgroundColor = .clear
    }
    lazy var menuTableView = UITableView().then{
        $0.canCancelContentTouches = false
        $0.isHidden = true
        $0.estimatedRowHeight = UITableView.automaticDimension
        $0.rowHeight = UITableView.automaticDimension
        $0.estimatedSectionHeaderHeight = UITableView.automaticDimension
        $0.backgroundColor = .white
        $0.sectionHeaderHeight = UITableView.automaticDimension
        //$0.backgroundColor = .hex293067//.clear
        $0.separatorStyle = .none
        $0.showsVerticalScrollIndicator = false
        $0.setBorder(cornerRadius: 4, borderWith: 1)
        $0.delegate = self
        $0.dataSource = self
        $0.register(DropDownMenuCell.self, forCellReuseIdentifier: DropDownMenuCell.identifier)
        //ios15以上section之間會有間距
        if #available(iOS 15.0, *) {
            $0.sectionHeaderTopPadding = 0
        }
    }
    
    lazy var cellFontSize : CGFloat = 10{
        didSet{
            DispatchQueue.main.async {
                self.menuTableView.reloadData()
            }
        }
    }
    
    lazy var iconSize : CGSize = CGSize(width: 10, height: 10){
        didSet{
            DispatchQueue.main.async {
                self.menuTableView.reloadData()
            }
        }
    }
    
    lazy var models : [DropdownMenuModel] = [] {
        didSet{
            DispatchQueue.main.async {
                if (oldValue.count == 0 && self.models.count > 0){
                    self.menuTableView.reloadData()
                    return
                }
                self.menuTableView.reloadData()
            }
        }
    }
    
    override func setupViews() {
        self.backgroundColor = .clear
        self.axis = .vertical
        self.addMultipleViewToArrangedSubView(views: [spaceView, menuTableView])
        self.spaceView.addLayout {
            $0.height.equalTo(1)
        }
        self.menuTableView.addLayout {
            $0.height.equalTo(0).priority(999)
        }
    }
}

extension DropDownContentStackView : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DropDownMenuCell.identifier, for: indexPath) as? DropDownMenuCell, let model = self.models[safe: indexPath.row] else {
            return UITableViewCell()
        }
        cell.titleLabel.font = UIFont.systemFont(ofSize: self.cellFontSize, weight: .medium)
        cell.setModel(model: model, iconSize: self.iconSize)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let model = self.models[safe: indexPath.row] else {return}
        self.delegate?.didSelectMenuRow(indexPath: indexPath, model: model)
    }
}


