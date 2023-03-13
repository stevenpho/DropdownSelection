//
//  DropDownMenuView.swift
//  T1Games
//
//  Created by steven on 2022/11/25.
//

import UIKit
import SVGKit
protocol BaseDelegate : AnyObject{}

protocol AutoButtonViewDelegate : BaseDelegate{
    func didTap(isExpaned : Bool)
}

/** 下拉選單整體View */
public class DropDownMenuView: DropDownMenuBaseView, AutoButtonViewDelegate, DropDownContentStackViewDelegate{
    /** 下拉選單上面一直顯示的結果View */
    fileprivate lazy var contentStackView = DropDownSelectionResultStackView()
    weak var delegate : DropDownContentStackViewDelegate? = nil
    /** 下拉選單列表View 會自己抓最上層的ＶＣ來加上去確保都是最上層 */
    fileprivate lazy var menuListContentStackView = DropDownContentStackView().then{
        $0.isHidden = true
    }
    /** 下拉選單紀錄位置 */
    lazy var point : CGRect = .zero
    weak private var topVC : UIViewController? = nil
    /** Dropdown Menu Is Expaned */
    lazy var isExpaned = false
    
    lazy var configuare : DropdownMenuConfiguare = DropdownMenuConfiguare(){
        didSet{
            DispatchQueue.main.async {
                if (self.isExpaned && self.configuare.maxHeightIsChanged(oldValue: oldValue)){
                    
                }
                
                if (self.configuare.resultTitleFontSizeIsChanged(oldValue: oldValue)){
                    self.contentStackView.selectionResultView.titleLabel.font = UIFont.systemFont(ofSize: self.configuare.resultTitleFontSize, weight: .medium)
                }
                
                if (self.configuare.resultIconImageIsChanged(oldValue: oldValue)){
                    self.contentStackView.selectionResultView.iconImageView.image = self.configuare.resultIconImage
                    if (self.configuare.resultAlignmentStyle != .center && self.configuare.resultAlignmentStyle != .centerSpace){
                        self.contentStackView.selectionResultView.alignImage(align: .center, spacing: self.configuare.resultSpacing)
                        return
                    }
                    self.contentStackView.selectionResultView.alignImage(align: self.configuare.resultAlignmentStyle, spacing: self.configuare.resultSpacing)
                }
                
                if (self.configuare.resultSelectArrowImageIsChanged(oldValue: oldValue)){
                    self.contentStackView.selectArrowImage = self.configuare.resultSelectArrowImage
                }
                
                if (self.configuare.resultNormalArrowImageIsChanged(oldValue: oldValue)){
                    self.contentStackView.selectArrowImage = self.configuare.resultNormalArrowImage
                }
                
                if (self.configuare.resultSpacingIsChanged(oldValue: oldValue)){
                    self.contentStackView.selectionResultView.alignImage(align: self.configuare.resultAlignmentStyle, spacing: self.configuare.resultSpacing)
                }
                
                if (self.configuare.menuCellTitleFontSizeIsChanged(oldValue: oldValue)){
                    self.menuListContentStackView.cellFontSize = self.configuare.menuCellTitleFontSize
                }
                
                if (self.configuare.menuCellIconSizeIsChanged(oldValue: oldValue)){
                    self.menuListContentStackView.iconSize = self.configuare.menuCellIconSize
                }
                
                if (self.configuare.resultCornerIsChanged(oldValue: oldValue)){
                    self.contentStackView.selectionResultView.corner = self.configuare.resultCorner
                    self.contentStackView.selectionResultView.setCustomBorder()
                }
                
                if (self.configuare.resultBorderWidthIsChanged(oldValue: oldValue)){
                    self.contentStackView.selectionResultView.borderWidth = self.configuare.resultBorderWidth
                    self.contentStackView.selectionResultView.setCustomBorder()
                }
                
                if (self.configuare.resultBorderColorIsChanged(oldValue: oldValue)){
                    self.contentStackView.selectionResultView.borderColor = self.configuare.resultBorderColor
                    self.contentStackView.selectionResultView.setCustomBorder()
                }
                
                if (self.configuare.resultArrowSizeIsChanged(oldValue: oldValue)){
                    self.contentStackView.arrowSize = self.configuare.resultArrowSize
                }
                
                if (self.configuare.isEnableArrowRotationIsChanged(oldValue: oldValue)){
                    self.contentStackView.isArrowRotation = self.configuare.isEnableArrowRotation
                }
                
                if (self.configuare.resultSelectArrowRotationIsChanged(oldValue: oldValue)){
                    self.contentStackView.selectArrowRotation = self.configuare.resultSelectArrowRotation
                }
                
                if (self.configuare.resultNormalArrowRotationIsChanged(oldValue: oldValue)){
                    self.contentStackView.normalArrowRotation = self.configuare.resultNormalArrowRotation
                }
                
                if (self.configuare.resultIconSizeIsChanged(oldValue: oldValue)){
                    self.contentStackView.iconSize = self.configuare.resultIconSize
                }
                
                if (self.configuare.resultArrowColorIsChanged(oldValue: oldValue)){
                    self.contentStackView.arrowColor = self.configuare.resultArrowColor
                }
                
                if (self.configuare.resultAlignmentStyleIsChanged(oldValue: oldValue)){
                    self.contentStackView.alignmentStyle = self.configuare.resultAlignmentStyle
                }
                
                if (self.configuare.leftRightPaddingIsChanged(oldValue: oldValue)){
                    self.contentStackView.leftRightPadding = self.configuare.leftRightPadding
                }
            }
        }
    }

    lazy private var isOverScreen = false
    
    override func setupViews(){
        self.backgroundColor = .clear
        //self.clipsToBounds = false
        self.contentStackView.delegate = self
        self.addMultipleViewToSubView(views: [contentStackView])
        self.setContentHuggingPriority(.required, for: .vertical)
        self.contentStackView.addLayout {
            $0.edges.equalToSuperview()
        }
        self.menuListContentStackView.delegate = self
    }
    
    //使用觸覺回饋
    lazy var useHapticFeedback: Bool = true
    
    private var feedbackGenerator: UIImpactFeedbackGenerator? = nil
    
    deinit{
        self.feedbackGenerator = nil
        self.menuListContentStackView.removeFromSuperview()
        SVGKImage.clearCache()
    }
    
    @objc func tapPress(){}
    
    func didSelectMenuRow(indexPath: IndexPath, model: DropdownMenuModel) {
        self.contentStackView.selectionResultView.titleLabel.text = model.title
        if (self.configuare.resultIconImage != nil){
            self.configuare.resultIconImage = model.image
        }
        self.contentStackView.autoButtonPress()
        self.delegate?.didSelectMenuRow(indexPath: indexPath, model: model)
    }
    /** 下拉選單結果預設title文字 */
    func setSelectionResultTitle(title: String){
        self.contentStackView.selectionResultView.titleLabel.text = title
    }
    func setDatas(datas: [DropdownMenuModel]){
        self.menuListContentStackView.models = datas
    }
    
    func didTap(isExpaned: Bool) {
        self.isExpaned = isExpaned
        if let topViewController = UIApplication.topViewController(){
            topViewController.view.endEditing(true)
            var point = CGRect.zero
            if self.menuListContentStackView.superview == nil{
                let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tapPress))
                //設為true會變二次不能點
                tapGesture.cancelsTouchesInView = false//true
                tapGesture.delegate = self
                topViewController.view.addGestureRecognizer(tapGesture)
                topViewController.view.addMultipleViewToSubView(views: [self.menuListContentStackView])
                self.topVC = topViewController
                //init Feedback
                self.setFeedBack()
            }
            point = self.convert(self.contentStackView.frame, to: topViewController.view)
            if (point != self.point){
                self.point = point
                var topOffset = point.origin.y + point.height
                self.isOverScreen = false
                let distanceToBottom = topViewController.view.frame.height - topOffset - getPadding(type: .botttomPadding)
                let distanceToTop = point.origin.y
                //檢查最大高度是否高於底部或是大於頂部 如果有會去尋找頂部底部哪個長度最多就出現在那邊
                if (self.configuare.maxHeight > distanceToBottom && self.configuare.maxHeight > distanceToTop){
                    self.configuare.maxHeight = distanceToBottom > distanceToTop ? distanceToBottom : distanceToTop
                }
                if (topOffset > topViewController.view.frame.height - self.configuare.maxHeight){
                    self.isOverScreen = true
                    topOffset = point.origin.y
                }
                self.menuListContentStackView.remakeLayout {
                    $0.top.equalToSuperview().offset(topOffset)
                    $0.left.equalToSuperview().offset(point.origin.x + 6)
                    $0.width.equalTo(point.width - self.contentStackView.selectionResultView.arrowImageView.frame.width)
                    $0.bottom.lessThanOrEqualTo(topViewController.view.safeAreaLayoutGuide.snp.bottom)
                }
                self.topVC?.view.layoutIfNeeded()
                self.menuListContentStackView.isHidden = false
            }
        }
        
        self.feedBackImpact()
        UIView.animate(withDuration: 0.3) {
            self.menuListContentStackView.menuTableView.isHidden = !isExpaned
            let contentSize =  self.menuListContentStackView.menuTableView.contentSize.height > 0 ? self.menuListContentStackView.menuTableView.contentSize.height : 40 * UIScreen.main.bounds.width / 320
            let tableViewHeight = contentSize > self.configuare.maxHeight ? self.configuare.maxHeight : contentSize
            
            if (self.isOverScreen){
                self.menuListContentStackView.updateLayout {
                    $0.top.equalToSuperview().offset(isExpaned ? self.point.origin.y - tableViewHeight : self.point.origin.y)
                }
            }
            self.menuListContentStackView.menuTableView.updateLayout {
                $0.height.equalTo(isExpaned ? tableViewHeight : 0).priority(999)
            }
            
            self.topVC?.view.layoutIfNeeded()
        }completion: { finish in
            
            //                if(finish && !isExpaned){
            //                    self.menuListContentStackView.removeFromSuperview()
            //}
        }
    }
    
    private func setFeedBack(){
        //init Feedback
        if (self.useHapticFeedback){
            self.feedbackGenerator = UIImpactFeedbackGenerator(style: .light)
            self.feedbackGenerator?.prepare()
            return
        }
        self.feedbackGenerator = nil
    }
    
    private func feedBackImpact(){
        if (!self.useHapticFeedback){return}
        if (self.feedbackGenerator == nil){
            self.setFeedBack()
        }
        // Trigger impact feedback.
        self.feedbackGenerator?.impactOccurred()
        
        // Keep the generator in a prepared state.
        self.feedbackGenerator?.prepare()
    }
}
extension DropDownMenuView : UIGestureRecognizerDelegate{
    private func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        guard let touchView = touch.view else {return true}
        
        if (touchView.isDescendant(of: self.menuListContentStackView.menuTableView) == true || touchView.isDescendant(of: self.contentStackView.backgroundButton) == true){
            return false
        }
        if (self.isExpaned == true){
            self.contentStackView.autoButtonPress()
        }
        return true
    }
}




//MARK: - DropDownSelectionResultStackView 選擇結果顯示View
fileprivate class DropDownSelectionResultStackView : BaseStackView{
    weak var delegate : AutoButtonViewDelegate? = nil
    lazy var selectionResultView = AlignImageButtonView().then{
        $0.titleLabel.numberOfLines = 1
        $0.alignImage(align: .right)
        $0.titleLabel.textAlignment = .left
        $0.isFlipAnimation = true
        $0.normalArrowImage = UIImage.toSvgImage(name: "icon-arrow-down",size: self.arrowSize, fillColor: self.arrowColor)
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
    
    lazy var arrowColor : UIColor = .white{
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
    
    lazy var alignmentStyle : AlignImageButtonView.Alignment = .right{
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


