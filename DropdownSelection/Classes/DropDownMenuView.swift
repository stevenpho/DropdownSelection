//
//  DropDownMenuView.swift
//  T1Games
//
//  Created by steven on 2022/11/25.
//

import UIKit
import SVGKit
public protocol DropDownMenuBaseDelegate : AnyObject{}

protocol AutoButtonViewDelegate : DropDownMenuBaseDelegate{
    func didTap(isExpaned : Bool)
}

/** Drop Down Menu Result View */
public class DropDownMenuResultView: DropDownMenuBaseView, AutoButtonViewDelegate, DropDownContentStackViewDelegate{
    /** Dropdown Menu Result View下拉選單上面一直顯示的結果View */
    fileprivate lazy var contentStackView = DropDownSelectionResultStackView()
    /** Dropdown Menu Delegate */
    public weak var delegate : DropDownContentStackViewDelegate? = nil
    /** Dropdown Menu Will Get Top of ViewController 下拉選單列表View 會自己抓最上層的ＶＣ來加上去確保都是最上層 */
    fileprivate lazy var menuListContentStackView = DropDownContentStackView().then{
        $0.isHidden = true
    }
    /** Dropdown Menu Record Rect */
    public lazy var point : CGRect = .zero
    weak private var topVC : UIViewController? = nil
    /** Dropdown Menu Is Expaned */
    public lazy var isExpaned = false
    /** Dropdown Menu Configuare */
    public lazy var configuare : DropdownMenuConfiguare = DropdownMenuConfiguare(){
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
                
                if (self.configuare.isEnableAnimationIsChanged(oldValue: oldValue)){
                    self.isEnableAnimation = self.configuare.isEnableAnimation
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
                
                if (self.configuare.menuTableViewBackgroundViewIsChanged(oldValue: oldValue)){
                    self.menuListContentStackView.menuTableView.backgroundView = self.configuare.menuTableViewBackgroundView
                }
                
                if (self.configuare.menuTableViewBackgroundColorIsChanged(oldValue: oldValue)){
                    self.menuListContentStackView.menuTableView.backgroundColor = self.configuare.menuTableViewBackgroundColor
                }
                
                if (self.configuare.menuContentViewBackgroundColorIsChanged(oldValue: oldValue)){
                    self.menuListContentStackView.backgroundColor = self.configuare.menuContentViewBackgroundColor
                }
                
                if (self.configuare.menuContentViewBorderRadiusIsChanged(oldValue: oldValue)){
                    self.menuListContentStackView.setBorder(cornerRadius: self.configuare.menuContentViewBorderRadius, borderWith: self.configuare.menuContentViewBorderWidth, borderColor: self.configuare.menuContentViewBorderColor)
                }
                

                if (self.configuare.menuContentViewBorderWidthIsChanged(oldValue: oldValue)){
                    self.menuListContentStackView.setBorder(cornerRadius: self.configuare.menuContentViewBorderRadius, borderWith: self.configuare.menuContentViewBorderWidth, borderColor: self.configuare.menuContentViewBorderColor)
                }
                
                if (self.configuare.menuContentViewBorderColorIsChanged(oldValue: oldValue)){
                    self.menuListContentStackView.setBorder(cornerRadius: self.configuare.menuContentViewBorderRadius, borderWith: self.configuare.menuContentViewBorderWidth, borderColor: self.configuare.menuContentViewBorderColor)
                }
            }
        }
    }
    
    lazy private var isOverScreen = false
    lazy private var isEnableAnimation = true
    override func setupViews(){
        self.backgroundColor = .clear
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
    
    @objc func tapPress(_ sender: UITapGestureRecognizer){}
    
    public func didSelectMenuRow(indexPath: IndexPath, model: DropdownMenuModel) {
        self.contentStackView.selectionResultView.titleLabel.text = model.title
        if (self.configuare.resultIconImage != nil){
            self.configuare.resultIconImage = model.image
        }
        self.contentStackView.autoButtonPress()
        self.delegate?.didSelectMenuRow(indexPath: indexPath, model: model)
    }
    /** Set Drop Down Menu Result Title */
    public func setSelectionResultTitle(title: String){
        self.contentStackView.selectionResultView.titleLabel.text = title
    }
    /** Set Drop Down Menu List Datas */
    public func setDatas(datas: [DropdownMenuModel]){
        self.menuListContentStackView.models = datas
    }
    
    func didTap(isExpaned: Bool) {
        self.isExpaned = isExpaned
        if let topViewController = UIApplication.topViewController(){
            topViewController.view.endEditing(true)
            var point = CGRect.zero
            self.setDropdownStackView(topViewController: topViewController)
            point = self.convert(self.contentStackView.frame, to: topViewController.view)
            if (point != self.point){
                self.checkMenuContentStackViewIsOverScreen(point: point, topViewController: topViewController)
            }
        }
        self.feedBackImpact()
        guard self.isEnableAnimation else {
            self.menuContentStackViewWituoutAnimation(isExpaned: isExpaned)
            return
        }
        self.handleMenuContentStackViewAnimation(isExpaned: isExpaned)
    }
    
    private func setDropdownStackView(topViewController: UIViewController){
        if self.menuListContentStackView.superview == nil{
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tapPress(_:)))
            //設為true會變二次不能點
            tapGesture.cancelsTouchesInView = false//true
            tapGesture.delegate = self
            topViewController.view.addGestureRecognizer(tapGesture)
            topViewController.view.addMultipleViewToSubView(views: [self.menuListContentStackView])
            self.topVC = topViewController
            //init Feedback
            self.setFeedBack()
        }
    }
    
    private func checkMenuContentStackViewIsOverScreen(point: CGRect,topViewController: UIViewController){
        self.point = point
        var topOffset = point.origin.y + point.height
        self.isOverScreen = false
        let distanceToBottom = topViewController.view.frame.height - topOffset - getPadding(type: .botttomPadding)
        let distanceToTop = point.origin.y
        //Check whether the maximum height is higher than the bottom or greater than the top. If there is, it will go to find the length of the top and bottom and it will appear there. 檢查最大高度是否高於底部或是大於頂部 如果有會去尋找頂部底部哪個長度最多就出現在那邊
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
    
    private func menuContentStackViewWituoutAnimation(isExpaned: Bool){
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
    }
    
    private func handleMenuContentStackViewAnimation(isExpaned: Bool){
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
            self.menuListContentStackView.spaceView.updateLayout {
                $0.height.equalTo(isExpaned ? 1 : 0)
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

extension DropDownMenuResultView : UIGestureRecognizerDelegate{
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
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



