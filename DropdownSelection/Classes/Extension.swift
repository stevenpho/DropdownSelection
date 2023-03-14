//
//  Extension.swift
//  DropdownSelection
//
//  Created by steven on 2023/3/13.
//

import Foundation
import UIKit
import SnapKit
import SVGKit
//MARK: UIView

extension UIView{
    func addMultipleViewToSubView(views: [UIView]){
        if (views.count == 0){return}
        for view in views{
            self.addSubview(view)
        }
    }
    func addLayout(_ closure: (_ make: ConstraintMaker) -> Void){
        self.snp.makeConstraints(closure)
    }
    
    func updateLayout(_ closure: (_ make: ConstraintMaker) -> Void){
        self.snp.updateConstraints(closure)
    }
    func removeAllLayout(){
        self.snp.removeConstraints()
    }
    func remakeLayout(_ closure: (_ make: ConstraintMaker) -> Void){
        self.snp.remakeConstraints(closure)
    }
    func setBorder(cornerRadius: CGFloat = 5.0, borderWith: CGFloat = 0.5, borderColor: UIColor = .white){
        self.layer.cornerRadius = cornerRadius
        self.layer.borderWidth = borderWith
        self.layer.borderColor = borderColor.cgColor
    }
}

//MARK: UIStackView
extension UIStackView{
    func addMultipleViewToArrangedSubView(views: [UIView]) {
        views.forEach { self.addArrangedSubview($0) }
    }
    func insertMultipleViewToArrangedSubView(views: [UIView], at: Int) {
        views.forEach { self.insertArrangedSubview($0, at: at)}
    }
    
    func removeMultipleViewFromArrangedSubView(views: [UIView]){
        views.forEach {
            $0.removeAllLayout()
            self.removeArrangedSubview($0)
            $0.removeFromSuperview()
        }
    }
}

//MARK: Collection
extension Collection {
    subscript(safe index: Index) -> Iterator.Element? {
        return (startIndex <= index && index < endIndex) ? self[index] : nil
    }
}

//MARK: UIWindow
extension UIWindow {
    static var key: UIWindow? {
        if #available(iOS 15, *) {
            return UIApplication.shared
                .connectedScenes
                .compactMap { $0 as? UIWindowScene }
                .flatMap { $0.windows }
                .first { $0.isKeyWindow }
        } else if #available(iOS 13, *) {
            return UIApplication.shared.windows.first { $0.isKeyWindow }
        } else {
            return UIApplication.shared.keyWindow
        }
    }
}

//MARK: UIApplication
extension UIApplication{
    class func topViewController(controller: UIViewController? = UIWindow.key?.rootViewController) -> UIViewController? {
        if let navigationController = controller as? UINavigationController {
            return topViewController(controller: navigationController.topViewController)
        }
        
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topViewController(controller: selected)
            }
        }
        
        if let presented = controller?.presentedViewController {
            return topViewController(controller: presented)
        }
        
        return controller
    }
}

//MARK: UIImage
extension UIImage{
    static func toSvgImage(name: String, size: CGSize = CGSize.zero, fillColor: UIColor? = nil, opacity: Float = 1.0) -> UIImage{
        let frameworkBundle = Bundle(for: DropDownMenuResultView.self)
        return autoreleasepool {
            if let svgImg = SVGKImage(named: name, in: frameworkBundle){
                if (size != .zero){
                    svgImg.size = size
                }
                if let fillColor = fillColor {
                    svgImg.fillColor(color: fillColor, opacity: opacity)
                }
                if let toIconImg = svgImg.uiImage{
                    SVGKImage.clearCache()
                    return toIconImg
                }
            }
            return UIImage()
        }
    }
    
}

//MARK: SVGKImage
extension SVGKImage {
    
    // MARK:- Private Method(s)
    private func fillColorForSubLayer(layer: CALayer, color: UIColor, opacity: Float) {
        if layer is CAShapeLayer {
            let shapeLayer = layer as! CAShapeLayer
            shapeLayer.fillColor = color.cgColor
            shapeLayer.opacity = opacity
        }
        
        if let sublayers = layer.sublayers {
            for subLayer in sublayers {
                fillColorForSubLayer(layer: subLayer, color: color, opacity: opacity)
            }
        }
    }
    
    private func fillColorForOutter(layer: CALayer, color: UIColor, opacity: Float) {
        if let shapeLayer = layer.sublayers?.first as? CAShapeLayer {
            shapeLayer.fillColor = color.cgColor
            shapeLayer.opacity = opacity
        }
    }
    
    // MARK:- Public Method(s)
    func fillColor(color: UIColor, opacity: Float) {
        if let layer = caLayerTree {
            fillColorForSubLayer(layer: layer, color: color, opacity: opacity)
        }
    }
    
    func fillOutterLayerColor(color: UIColor, opacity: Float) {
        if let layer = caLayerTree {
            fillColorForOutter(layer: layer, color: color, opacity: opacity)
        }
    }
}
