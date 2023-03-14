//
//  ViewController.swift
//  DropdownSelection
//
//  Created by Steven Lee on 03/13/2023.
//  Copyright (c) 2023 Steven Lee. All rights reserved.
//

import UIKit
import DropdownSelection
import Then
import SnapKit

class ViewController: UIViewController {

    lazy var dropDownMenuResultView = DropDownMenuResultView().then{
        $0.configuare.maxHeight = 300
        $0.configuare.resultBorderColor = .black
        $0.configuare.resultBorderWidth = 2
        $0.setSelectionResultTitle(title: "Apple")
        $0.setDatas(datas: [DropdownMenuModel(title: "banana"),DropdownMenuModel(title: "food"),DropdownMenuModel(title: "rice")])
        
        $0.configuare.menuContentViewBackgroundColor = .red
        
        $0.configuare.menuContentViewBorderWidth = 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.addSubview(self.dropDownMenuResultView)
        self.dropDownMenuResultView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.height.equalTo(70)
            make.width.equalTo(200)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

