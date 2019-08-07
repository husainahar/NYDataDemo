//
//  LanguageScreenVC.swift
//  Kiuber
//
//  Created by Husain Nahar on 3/18/19.
//  Copyright © 2019 TechBox. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class LangVC: BaseVC {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideBackBtn()
        hideMenuBtn()
    }
    
    // MARK: CONSTRAINTS
    override func setupViews(){
        super.setupViews()
        
        view.addChildViews([logoutCircle])
        logoutCircle.addChildViews([logoutStack])
        
        logoutCircle.customAnchorWithXY(view.centerXAnchor, centerY: view.centerYAnchor, widthConstant: 200, heightConstant: 200)
        
        logoutStack.customAnchor(logoutCircle.topAnchor, bottom: logoutCircle.bottomAnchor, left: logoutCircle.leftAnchor, right: logoutCircle.rightAnchor, topConstant: 0, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        setupIndicator()
    }
    
    // MARK: UI'S
    lazy var engBtn: UIButton = {
        let yb = UIButton(type: .system)
        yb.setAttributedTitle(const.attributedTextBoldBigWhite(with: "English"), for: .normal)
        yb.backgroundColor = .clear
        yb.addTarget(self, action: #selector(lang(_:)), for: .touchUpInside)
        
        return yb
    }()
    
    lazy var arabicBtn: UIButton = {
        let yb = UIButton(type: .system)
        yb.setAttributedTitle(const.attributedTextBoldBigBlack(with: "عربى"), for: .normal)
        yb.backgroundColor = const.WHITE_COLOR
        yb.addTarget(self, action: #selector(lang(_:)), for: .touchUpInside)
        
        
        return yb
    }()
    
    lazy var logoutCircle: CustomView = {
        let bl = CustomView()
        bl.backgroundColor = const.BLACK_COLOR
        bl.layer.cornerRadius = 100
        bl.layer.borderColor = const.BLACK_COLOR.cgColor
        bl.layer.borderWidth = 1.0
        bl.layer.masksToBounds = true
        
        return bl
    }()
    
    lazy var logoutStack: CustomStackView = {
        let lg = CustomStackView(arrangedSubviews: [self.engBtn, self.arabicBtn])
        lg.axis = .horizontal
        lg.spacing = 0
        
        return lg
    }()
    
    // MARK: Actions
    @objc fileprivate func lang(_ btn: UIButton){
        
        if btn == engBtn{
            print("ENGLISH SELECTED")
            
            const.curentLang = 0
            defaults.userLang = "en"
            
        }else if btn == arabicBtn{
            
            print("ARABIC SELECTED")
            
            const.curentLang = 1
            defaults.userLang = "ar"

        }
        
        self.startAnimate()
        Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(proceed), userInfo: nil, repeats: false)
    }
    
    @objc fileprivate func proceed(){
        self.stopAnimate()
        
        self.present(HomeVC(), animated: true, completion: nil)
    }
}
