//
//  CustomUI.swift
//  NYDataDemo
//
//  Created by Husain Nahar on 8/5/19.
//  Copyright © 2019 Husain Nahar. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

//BOLD WHITE
class BoldSmalWhiteLbl: UILabel{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        translatesAutoresizingMaskIntoConstraints = false
        textAlignment = .left
        adjustsFontSizeToFitWidth = true
    }
    
    func setLblTitle(str: String){
        
        self.attributedText = const.attributedTextBoldSmalWhite(with: str)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//BOLD BLACK
class BoldSmalBlackLbl: UILabel{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        translatesAutoresizingMaskIntoConstraints = false
        textAlignment = .left
        adjustsFontSizeToFitWidth = true
    }
    
    func setLblTitle(str: String){
        
        self.attributedText = const.attributedTextBoldSmalBlack(with: str)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//BOLD ORANGE
class BoldSmalOrangeLbl: UILabel{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        translatesAutoresizingMaskIntoConstraints = false
        textAlignment = .left
        adjustsFontSizeToFitWidth = true
    }
    
    func setLblTitle(str: String){
        
        self.attributedText = const.attributedTextBoldSmalOrange(with: str)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//BOLD BROWN
class BoldSmalBrownLbl: UILabel{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        translatesAutoresizingMaskIntoConstraints = false
        textAlignment = .left
        adjustsFontSizeToFitWidth = true
    }
    
    func setLblTitle(str: String){
        
        self.attributedText = const.attributedTextBoldSmalBrown(with: str)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//BOLD RED
class BoldSmalRedLbl: UILabel{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        translatesAutoresizingMaskIntoConstraints = false
        textAlignment = .left
        adjustsFontSizeToFitWidth = true
    }
    
    func setLblTitle(str: String){
        
        self.attributedText = const.attributedTextBoldSmalRed(with: str)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//BOLD GOLDEN
class BoldSmalGoldenLbl: UILabel{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        translatesAutoresizingMaskIntoConstraints = false
        textAlignment = .left
        adjustsFontSizeToFitWidth = true
    }
    
    func setLblTitle(str: String){
        
        self.attributedText = const.attributedTextBoldSmalGolden(with: str)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//BOLD GREEN
class BoldSmalGreenLbl: UILabel{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        translatesAutoresizingMaskIntoConstraints = false
        textAlignment = .left
        adjustsFontSizeToFitWidth = true
    }
    
    func setLblTitle(str: String){
        
        self.attributedText = const.attributedTextBoldSmalGreen(with: str)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

let imageCache = NSCache<NSString, AnyObject>()

class CustomImageView: UIImageView {
    
    lazy var nv: NVActivityIndicatorView = {
        let nv = NVActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 40, height: 40), type: NVActivityIndicatorType.ballScaleRippleMultiple, color: const.BLACK_COLOR, padding: nil)
        nv.translatesAutoresizingMaskIntoConstraints = false
        
        return nv
    }()
    
    func startAnimate(){
        nv.startAnimating()
    }
    
    func stopAnimate(){
        //        DispatchQueue.main.async {
        self.nv.stopAnimating()
        //        }
    }
    
    var imageURLString: String?
    
    func loadImageUsingUrlString(from urlString: String) {
        
        self.contentMode = .scaleToFill
        self.clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(nv)
        
        nv.customAnchor(nil, bottom: nil, left: nil, right: nil, topConstant: 0, bottomConstant: 0, leftConstant: 0, rightConstant: 0, widthConstant: 15, heightConstant: 15)
        
        [nv.centerXAnchor.constraint(equalTo: self.centerXAnchor),
         nv.centerYAnchor.constraint(equalTo: self.centerYAnchor)].forEach({$0.isActive = true})
        
        if urlString == ""{
            
            self.setIcon(with: "mainLogo")
            return
        }
        
        DispatchQueue.main.async {
            self.startAnimate()
        }
        
        imageURLString = urlString
        
        guard let url = URL(string: urlString) else {return}
        
        image = nil
        
        if let imageFromCache = imageCache.object(forKey: urlString as NSString) as? UIImage{
            self.image = imageFromCache
            DispatchQueue.main.async {
                self.stopAnimate()
            }
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if error != nil {
                DispatchQueue.main.async {
                    self.stopAnimate()
                }
                return
            }
            guard let data = data else {return}
            
            DispatchQueue.main.async() {
                guard let imageToCache = UIImage(data: data) else {return}
                
                if self.imageURLString == urlString {
                    self.image = imageToCache
                    self.stopAnimate()
                }
                imageCache.setObject(imageToCache, forKey: urlString as NSString)
            }
            }.resume()
    }
}

class CustomCollectionViewCell: UICollectionViewCell{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){
        backgroundColor = .clear
    }
}

class CustomView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setBackGroundColor(_ with: UIColor){
        
        self.backgroundColor = with
    }
}

class CustomStackView: UIStackView{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        translatesAutoresizingMaskIntoConstraints = false
        distribution = .fillEqually
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
