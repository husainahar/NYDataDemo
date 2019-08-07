//
//  OrderHistoryVC.swift
//  Mishkat
//
//  Created by Husain Nahar on 7/18/19.
//  Copyright © 2019 TechBox. All rights reserved.
//

import UIKit

private let ITEMLISTCELLIDORDER = "ITEMLISTCELLIDORDER"
private let ITEMLISTCELLIDORDER2 = "ITEMLISTCELLIDORDER2"

class SecondVC: BaseVC {
    
//    MARK: LIFE CYCLE METHODS
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: VARIABLES
    var media: Media?{
        didSet{
            
            print("MEDIA DATA COUNT IS: \(self.media?.mediaMeta?.count ?? 0)")
            
        }
    }
    
    // MARK: CONSTRAINTS
    override func setupViews() {
        super.setupViews()
        
        view.addChildViews([dataTableView])
        
        dataTableView.customAnchor(backBtn.bottomAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, topConstant: 20, bottomConstant: 0, leftConstant: 10, rightConstant: 10, widthConstant: 0, heightConstant: 0)
        
        setupIndicator()
    }
    
    // MARK: UI'S
    lazy var dataTableView: UITableView = {
        
        let cl = UITableView(frame: .zero, style: UITableView.Style.plain)
        
        cl.translatesAutoresizingMaskIntoConstraints = false
        cl.delegate = self
        cl.dataSource = self
        cl.register(ExpandableHeaderView.self, forCellReuseIdentifier: ITEMLISTCELLIDORDER)
        cl.register(ItemSubCell.self, forCellReuseIdentifier: ITEMLISTCELLIDORDER2)
        cl.backgroundColor = .clear
        cl.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        cl.showsVerticalScrollIndicator = false
        cl.separatorStyle = .none
        
        return cl
    }()
    
    // MARK: Actions
}

//MARK: CUSTOM CELL
class ItemSubCell: UITableViewCell{
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var logo: CustomImageView  = {
        let iv = CustomImageView()
        iv.layer.cornerRadius = 50
        
        return iv
    }()
    
    lazy var format: BoldSmalBlackLbl = {
        let nl = BoldSmalBlackLbl()
        nl.textAlignment = .center
        
        return nl
    }()
    
    lazy var heightLbl: BoldSmalBlackLbl = {
        let st = BoldSmalBlackLbl()
        st.setLblTitle(str: "Height" + ": ")
        
        return st
    }()
    
    lazy var widthLbl: BoldSmalBlackLbl = {
        let st = BoldSmalBlackLbl()
        st.setLblTitle(str: "Width" + ": ")
        
        return st
    }()
    
    lazy var heightAnsLbl: BoldSmalRedLbl = {
        let st = BoldSmalRedLbl()
        
        return st
    }()
    
    lazy var widthAnsLbl: BoldSmalGreenLbl = {
        let st = BoldSmalGreenLbl()
        
        return st
    }()
    
    lazy var heightStack: UIStackView = {
        let im = UIStackView(arrangedSubviews: const.curentLang == 0 ? [self.heightLbl, self.heightAnsLbl] : [self.heightAnsLbl, self.heightLbl])
        im.axis = .horizontal
        im.spacing = 0
        im.distribution = UIStackView.Distribution.equalSpacing
        im.translatesAutoresizingMaskIntoConstraints = false
        
        return im
    }()
    
    lazy var widthStack: UIStackView = {
        let im = UIStackView(arrangedSubviews: const.curentLang == 0 ? [self.widthLbl, self.widthAnsLbl] : [self.widthAnsLbl, self.widthLbl])
        im.axis = .horizontal
        im.spacing = 0
        im.distribution = UIStackView.Distribution.equalSpacing
        im.translatesAutoresizingMaskIntoConstraints = false
        
        return im
    }()
    
    lazy var mainStack: UIStackView = {
        let im = UIStackView(arrangedSubviews: [self.heightStack, self.widthStack])
        im.axis = .vertical
        im.spacing = 0
        im.distribution = UIStackView.Distribution.fillEqually
        im.translatesAutoresizingMaskIntoConstraints = false
        
        return im
    }()
    
    lazy var line: CustomView = {
        let cl = CustomView()
        cl.setBackGroundColor(const.BROWN_COLOR)
        
        return cl
    }()
    
    fileprivate func setupViews(){
        addChildViews([logo, format, mainStack, line])
        
        mainStack.customAnchor(format.bottomAnchor, bottom: nil, left: format.leftAnchor, right: format.rightAnchor, topConstant: 10, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 40)
        
        line.customAnchor(nil, bottom: bottomAnchor, left: leftAnchor, right: rightAnchor, topConstant: 0, bottomConstant: 0, leftConstant: 20, rightConstant: 20, widthConstant: 0, heightConstant: 1)
        
        if const.curentLang == 0{
            
            logo.customAnchor(topAnchor, bottom: bottomAnchor, left: leftAnchor, right: nil, topConstant: 10, bottomConstant: 10, leftConstant: 10, rightConstant: 0, widthConstant: 100, heightConstant: 0)
            
            format.customAnchor(logo.topAnchor, bottom: nil, left: logo.rightAnchor, right: rightAnchor, topConstant: 0, bottomConstant: 0, leftConstant: 10, rightConstant: 10, widthConstant: 0, heightConstant: 20)
        }else{
            [heightLbl, heightAnsLbl, widthLbl, widthAnsLbl].forEach({$0.textAlignment = .right})
            
            logo.customAnchor(topAnchor, bottom: bottomAnchor, left: nil, right: rightAnchor, topConstant: 10, bottomConstant: 10, leftConstant: 0, rightConstant: 10, widthConstant: 100, heightConstant: 0)
            
            format.customAnchor(logo.topAnchor, bottom: nil, left: leftAnchor, right: logo.leftAnchor, topConstant: 0, bottomConstant: 0, leftConstant: 10, rightConstant: 10, widthConstant: 0, heightConstant: 20)
        }
    }
    
   fileprivate func configureCell(media: MediaMetadata?){
        
        self.heightAnsLbl.setLblTitle(str: "\(media?.height ?? 0)")
        self.widthAnsLbl.setLblTitle(str: "\(media?.width ?? 0)")
        self.format.setLblTitle(str: media?.format ?? "")
        self.logo.loadImageUsingUrlString(from: media?.url ?? "")
        
    }
}

class ExpandableHeaderView: UITableViewCell{
    
    lazy var typeLbl: BoldSmalBlackLbl = {
        let st = BoldSmalBlackLbl()
                st.setLblTitle(str: "Type" + ": ")
        
        return st
    }()
    
    lazy var subLbl: BoldSmalBlackLbl = {
        let st = BoldSmalBlackLbl()
        st.setLblTitle(str: "Sub-Type" + ": ")
        
        return st
    }()
    
    lazy var aprovedLbl: BoldSmalBlackLbl = {
        let st = BoldSmalBlackLbl()
        st.setLblTitle(str: "Approved" + ": ")
        
        return st
    }()
    
    lazy var typeAnsLbl: BoldSmalRedLbl = {
        let st = BoldSmalRedLbl()
        
        return st
    }()
    
    lazy var subAnsLbl: BoldSmalGreenLbl = {
        let st = BoldSmalGreenLbl()
        
        return st
    }()
    
    lazy var aprovedAnsLbl: BoldSmalRedLbl = {
        let st = BoldSmalRedLbl()
        
        return st
    }()
    
    lazy var typeStack: UIStackView = {
        let im = UIStackView(arrangedSubviews: const.curentLang == 0 ? [self.typeLbl, self.typeAnsLbl] : [self.typeAnsLbl, self.typeLbl])
        im.axis = .horizontal
        im.spacing = 0
        im.distribution = UIStackView.Distribution.equalSpacing
        im.translatesAutoresizingMaskIntoConstraints = false
        
        return im
    }()
    
    lazy var subStack: UIStackView = {
        let im = UIStackView(arrangedSubviews: const.curentLang == 0 ? [self.subLbl, self.subAnsLbl] : [self.subAnsLbl, self.subLbl])
        im.axis = .horizontal
        im.spacing = 0
        im.distribution = UIStackView.Distribution.equalSpacing
        im.translatesAutoresizingMaskIntoConstraints = false
        
        return im
    }()
    
    lazy var aprovedStack: UIStackView = {
        let im = UIStackView(arrangedSubviews: const.curentLang == 0 ? [self.aprovedLbl, self.aprovedAnsLbl] : [self.aprovedAnsLbl, self.aprovedLbl])
        im.axis = .horizontal
        im.spacing = 0
        im.distribution = UIStackView.Distribution.equalSpacing
        im.translatesAutoresizingMaskIntoConstraints = false
        
        return im
    }()
    
    lazy var mainStack: UIStackView = {
        let im = UIStackView(arrangedSubviews: [self.typeStack, self.subStack, self.aprovedStack])
        im.axis = .vertical
        im.spacing = 0
        im.distribution = UIStackView.Distribution.fillEqually
        im.translatesAutoresizingMaskIntoConstraints = false
        
        return im
    }()
    
    
   fileprivate func customInit(media: Media?){
        
        self.typeAnsLbl.setLblTitle(str: media?.type?.capitalized ?? "")
        self.subAnsLbl.setLblTitle(str: media?.subtype?.capitalized ?? "")
        
        if media?.approved_for_syndication == 1{
            self.aprovedAnsLbl.setLblTitle(str: "TRUE")
        }else{
            
            self.aprovedAnsLbl.setLblTitle(str: "FALSE")
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addChildViews([mainStack])
        
        mainStack.customAnchor(topAnchor, bottom: bottomAnchor, left: leftAnchor, right: rightAnchor, topConstant: 10, bottomConstant: 10, leftConstant: 10, rightConstant: 10, widthConstant: 0, heightConstant: 0)
        
        if const.curentLang != 0{
            
            [self.typeLbl, self.typeAnsLbl, self.subLbl, self.subAnsLbl, self.aprovedLbl, self.aprovedAnsLbl].forEach({$0.textAlignment = .right})
        }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: DELEGATE & DATASOURCE METHODS
extension SecondVC: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return ((self.media?.mediaMeta?.count ?? 0) + 1)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let result = self.media?.mediaMeta
        
        switch tableView {
        case dataTableView:
            
            switch indexPath.item{
                
            case 0:
                
                print("THIS LAST INDEXPATH IS: \(indexPath.item)")
                
                if let cell = tableView.dequeueReusableCell(withIdentifier: ITEMLISTCELLIDORDER, for: indexPath) as? ExpandableHeaderView{
                    
                    cell.customInit(media: self.media)
                    
                    return cell
                }
            default:
                
                if let cell = tableView.dequeueReusableCell(withIdentifier: ITEMLISTCELLIDORDER2, for: indexPath) as? ItemSubCell{
                    
                    print("INDEX PATH IS: \(indexPath.item - 1)")
                    
                    cell.configureCell(media: result?[indexPath.item - 1])
                    
                    return cell
                }
            }
        default:
            break
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
                
        switch tableView {
            
        case dataTableView:
            
            switch indexPath.item{
                
            case 0:
                
                    return 80
                
            default:
                
                    return 120
                }
        default:
            break
        }
        return 0
    }
}
