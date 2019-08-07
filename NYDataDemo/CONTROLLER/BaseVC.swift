//
//  BaseVCWithNavBarTopMenu.swift
//  Dayout
//
//  Created by Husain Nahar on 1/8/19.
//  Copyright © 2019 TechBox. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class BaseVC: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //NAVIGATION BAR
    lazy var backBtn: UIButton = {
        let bb = UIButton(type: .system)
        bb.setImage(UIImage(named: "back")?.withRenderingMode(.alwaysOriginal), for: .normal)
        bb.translatesAutoresizingMaskIntoConstraints = false
        bb.addTarget(self, action: #selector(backPresed), for: .touchUpInside)
        
        return bb
    }()
    
    @objc func backPresed(){
        
        self.dismiss(animated: true, completion: nil)
    }
    
    func hideBackBtn(){
        
        self.backBtn.isHidden = true
    }
    
    func hideMenuBtn(){
        
        self.menuBtn.isHidden = true
    }
    
    lazy var menuBtn: UIButton = {
        let bb = UIButton(type: .system)
        bb.setImage(UIImage(named: "menu")?.withRenderingMode(.alwaysOriginal), for: .normal)
        bb.imageView?.contentMode = UIView.ContentMode.scaleAspectFit
        bb.translatesAutoresizingMaskIntoConstraints = false
        bb.addTarget(self, action: #selector(menuBtnPresed), for: .touchUpInside)
        
        return bb
    }()
    
    @objc func menuBtnPresed(){
        
        self.present(LangVC(), animated: true, completion: nil)
    }
        
    func hideUnhideNavBarItems(_ navText: String){
        
            self.navBarTitle.attributedText = const.attributedTextBoldSmalBlack(with: navText)
        }
    
    lazy var nvBlur: UIView = {
        let nb = UIView()
        nb.translatesAutoresizingMaskIntoConstraints = false
        nb.backgroundColor = .clear
        nb.isHidden = true
        
        return nb
    }()
    
    lazy var nv: NVActivityIndicatorView = {
        let nv = NVActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 50, height: 50), type: NVActivityIndicatorType.ballClipRotate, color: const.BLACK_COLOR, padding: nil)
        nv.translatesAutoresizingMaskIntoConstraints = false
        
        return nv
    }()
    
    func setupIndicator(){
        
        view.addSubview(nvBlur)
        nvBlur.addSubview(nv)
        
        nvBlur.customAnchor(self.backBtn.bottomAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, topConstant: 0, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        [nv.centerXAnchor.constraint(equalTo: nvBlur.centerXAnchor),
         nv.centerYAnchor.constraint(equalTo: nvBlur.centerYAnchor)].forEach({$0.isActive = true})
    }
    
    func startAnimate(){
        DispatchQueue.main.async {
            self.nvBlur.isHidden = false
            self.nv.startAnimating()
        }
    }
    
    func stopAnimate(){
        DispatchQueue.main.async {
            self.nv.stopAnimating()
            self.nvBlur.isHidden = true
        }
    }
    
    lazy var navBarTitle: BoldSmalBlackLbl = {
        let nl = BoldSmalBlackLbl()
        
        return nl
    }()
    
    func setupViews(){
        view.backgroundColor = const.WHITE_COLOR
        
        view.addChildViews([backBtn, menuBtn, navBarTitle])
        
        navBarTitle.customAnchorWithXY(view.centerXAnchor, centerY: backBtn.centerYAnchor, widthConstant: 0, heightConstant: 20)
        
        if const.curentLang == 0{
            
            backBtn.customAnchor(view.safeAreaLayoutGuide.topAnchor, bottom: nil, left: view.leftAnchor, right: nil, topConstant: 10, bottomConstant: 0, leftConstant: 10, rightConstant: 0, widthConstant: 15, heightConstant: 25)
            
            menuBtn.customAnchorWithY(nil, right: view.rightAnchor, centerY: backBtn.centerYAnchor, leftConstant: 0, rightConstant: 10, widthConstant: 25, heightConstant: 25)
            
            
        }else{
            backBtn.customAnchor(view.safeAreaLayoutGuide.topAnchor, bottom: nil, left: nil, right: view.rightAnchor, topConstant: 10, bottomConstant: 0, leftConstant: 0, rightConstant: 10, widthConstant: 15, heightConstant: 25)
            
            menuBtn.customAnchorWithY(view.leftAnchor, right: nil, centerY: backBtn.centerYAnchor, leftConstant: 10, rightConstant: 0, widthConstant: 25, heightConstant: 25)
            
        }
    }
}
