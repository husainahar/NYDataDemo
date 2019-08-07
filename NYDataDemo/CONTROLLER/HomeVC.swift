//
//  OrderHistoryVC.swift
//  Mishkat
//
//  Created by Husain Nahar on 7/18/19.
//  Copyright © 2019 TechBox. All rights reserved.
//

import UIKit

private let ITEMLISTCELLIDORDER = "ITEMLISTCELLIDORDER"

class HomeVC: BaseVC {
    
    //    MARK: LIFE CYCLE METHODS
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("VIEW DID LOAD")
        
        hideUnhideNavBarItems("HOMEPAGE")
        hideBackBtn()
        
        getOrders()
    }
    
    // MARK: VARIABLES
    var response: Response?{
        didSet{
            
            guard let decode = self.response else {return}
            
            DispatchQueue.main.async {
                
                if decode.status == "OK"{
                    
                    self.dataTableView.reloadData()
                    
                }else{
                    print("DATA NOT FOUND")
                }
            }
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
        cl.register(HomeCell.self, forCellReuseIdentifier: ITEMLISTCELLIDORDER)
        cl.backgroundColor = .clear
        cl.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        cl.showsVerticalScrollIndicator = false
        cl.separatorStyle = .none
        
        return cl
    }()
    
    // MARK: Actions
    fileprivate func getOrders(){
        
        self.startAnimate()
        
        let encoder = Encoder(apiKey: const.API_KEY)
        
        guard let params = try? JSONEncoder().encode(encoder) else {return}
        
        HTTPHelperGet.shared.request(url: const.BASE_URL, params: params) { (result) in
            
            self.stopAnimate()
            
            switch result{
                
            case .failure(let err):
                
                print(err.localizedDescription)
                
            case .success(let data):
                
                guard let response = try? JSONDecoder().decode(Response.self, from: data) else {return}
                
                self.response = response
            }
        }
    }
}

//MARK: CUSTOM CELL
class HomeCell: UITableViewCell{
    
    lazy var titleLbl: BoldSmalBlackLbl = {
        let st = BoldSmalBlackLbl()
        
        return st
    }()
    
    lazy var abstractLbl: BoldSmalOrangeLbl = {
        let st = BoldSmalOrangeLbl()
        st.numberOfLines = 3
        
        return st
    }()
    
    lazy var dateLbl: BoldSmalBlackLbl = {
        let st = BoldSmalBlackLbl()
        st.setLblTitle(str: "Date" + ": ")
        
        return st
    }()
    
    lazy var sourceLbl: BoldSmalBlackLbl = {
        let st = BoldSmalBlackLbl()
        st.setLblTitle(str: "Source" + ": ")
        
        return st
    }()
    
    lazy var line: CustomView = {
        let cl = CustomView()
        cl.setBackGroundColor(const.BROWN_COLOR)
        
        return cl
    }()
    
    lazy var dateStack: UIStackView = {
        let im = UIStackView(arrangedSubviews: const.curentLang == 0 ? [self.dateLbl, self.dateAnsLbl] : [self.dateAnsLbl, self.dateLbl])
        im.axis = .horizontal
        im.spacing = 0
        im.distribution = UIStackView.Distribution.fillProportionally
        im.translatesAutoresizingMaskIntoConstraints = false
        
        return im
    }()
    
    lazy var sourceStack: UIStackView = {
        let im = UIStackView(arrangedSubviews: const.curentLang == 0 ? [self.sourceLbl, self.sourceAnsLbl] : [self.sourceAnsLbl, self.sourceLbl])
        im.axis = .horizontal
        im.spacing = 0
        im.distribution = UIStackView.Distribution.fillProportionally
        im.translatesAutoresizingMaskIntoConstraints = false
        
        return im
    }()
    
    lazy var mainStack: UIStackView = {
        let im = UIStackView(arrangedSubviews: const.curentLang == 0 ? [self.sourceStack, self.dateStack] : [self.dateStack, self.sourceStack])
        im.axis = .horizontal
        im.spacing = 10
        im.distribution = UIStackView.Distribution.equalSpacing
        im.translatesAutoresizingMaskIntoConstraints = false
        
        return im
    }()
    
    
    lazy var dateAnsLbl: BoldSmalRedLbl = {
        let st = BoldSmalRedLbl()
        
        return st
    }()
    
    lazy var sourceAnsLbl: BoldSmalGreenLbl = {
        let st = BoldSmalGreenLbl()
        
        return st
    }()
    
   fileprivate func configureCell(result: ResultOfResponse?){
        
        self.titleLbl.setLblTitle(str: result?.title ?? "")
        self.abstractLbl.setLblTitle(str: result?.abstract ?? "")
        self.dateAnsLbl.setLblTitle(str: result?.published_date ?? "")
        self.sourceAnsLbl.setLblTitle(str: result?.source ?? "")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addChildViews([titleLbl, abstractLbl, mainStack, line])
        
        titleLbl.customAnchor(topAnchor, bottom: nil, left: leftAnchor, right: rightAnchor, topConstant: 10, bottomConstant: 0, leftConstant: 10, rightConstant: 10, widthConstant: 0, heightConstant: 20)
        
        abstractLbl.customAnchor(titleLbl.bottomAnchor, bottom: nil, left: leftAnchor, right: rightAnchor, topConstant: 10, bottomConstant: 0, leftConstant: 10, rightConstant: 10, widthConstant: 0, heightConstant: 0)
        
        line.customAnchor(nil, bottom: bottomAnchor, left: leftAnchor, right: rightAnchor, topConstant: 0, bottomConstant: 0, leftConstant: 20, rightConstant: 20, widthConstant: 0, heightConstant: 1)
        
        mainStack.customAnchor(abstractLbl.bottomAnchor, bottom: bottomAnchor, left: leftAnchor, right: rightAnchor, topConstant: 10, bottomConstant: 10, leftConstant: 10, rightConstant: 10, widthConstant: 0, heightConstant: 20)
 
    if const.curentLang != 0{
            [self.titleLbl, self.abstractLbl, self.dateLbl, self.dateAnsLbl, self.sourceLbl, self.sourceAnsLbl].forEach({$0.textAlignment = .right})
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: DELEGATE & DATASOURCE METHODS
extension HomeVC: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let result = self.response?.results
        
        switch tableView {
            
        case dataTableView:
            
            let item = result?.count ?? 0
            
            return item
            
        default:
            break
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let result = self.response?.results
        
        switch tableView {
        case dataTableView:
            
            let item = result?[indexPath.item]
            
                if let cell = tableView.dequeueReusableCell(withIdentifier: ITEMLISTCELLIDORDER, for: indexPath) as? HomeCell{
                    
                    cell.configureCell(result: item)
                    
                    return cell
                }
        default:
            break
        }
        return UITableViewCell()
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 130
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let singleMedia = self.response?.results?[indexPath.item]
        
        let secondVC = SecondVC()
        secondVC.media = singleMedia?.media?.first
        secondVC.hideUnhideNavBarItems(singleMedia?.source ?? "")
        
        self.present(secondVC, animated: true, completion: nil)
    
    }
}
