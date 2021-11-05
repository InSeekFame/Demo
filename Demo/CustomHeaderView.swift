//
//  CustomHeaderView.swift
//  Demo
//
//  Created by CL9421 on 2021/11/5.
//

import UIKit

class CustomHeaderView: UITableViewHeaderFooterView {

  static let reuseId = "EnterpriseV2HeaderView"
  
  lazy var verticleLine: UIView = {
    let v = UIView()
    v.backgroundColor = #colorLiteral(red: 1, green: 0.662745098, blue: 0.137254902, alpha: 1)
    return v
  }()
  
  lazy var titleL: UILabel = {
    let l = UILabel()
    l.textColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
    l.font = UIFont.systemFont(ofSize: 18, weight: .bold)
    return l
  }()
  
  lazy var numL : UILabel = {
    let l = UILabel()
    l.textAlignment = .center
    l.backgroundColor = #colorLiteral(red: 1, green: 0.662745098, blue: 0.137254902, alpha: 1)
    l.textColor = .white
    l.font = UIFont.systemFont(ofSize: 18, weight: .bold)
    l.layer.cornerRadius = 4
    l.layer.masksToBounds = true
    return l
  }()
  
  
  lazy var moreL: UILabel = {
    let l = UILabel()
    l.text = "查看更多"
    l.textColor = #colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
    l.font = UIFont.systemFont(ofSize: 14, weight: .regular)
    return l
  }()
  
  var moreBlock:(()->(Void))?
  lazy var moreBtn : UIButton = {
    let btn = UIButton()
    btn.setTitle("更多", for: .normal)
    let btnColor = #colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
    btn.setTitleColor(btnColor, for: .normal)
//    btn.setImage(UIImage(named: "achievement_plutBtn"), for: .normal)
    btn.addTarget(self, action: #selector(btnClick), for: .touchUpInside)
    return btn
  }()
  
  lazy var moreArrow: UIImageView = {
    let iv = UIImageView()
    iv.image = UIImage(named: "niuren_more")
    return iv
  }()
  

  
  lazy var sepLine : UIView = {
    let v = UIView()
    v.backgroundColor = #colorLiteral(red: 0.9607843137, green: 0.9607843137, blue: 0.9607843137, alpha: 1)
    return v
  }()
  
  override init(reuseIdentifier: String?) {
    super.init(reuseIdentifier: reuseIdentifier)
    
    setUI()
    
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setUI(){
    //leftView
    contentView.backgroundColor = UIColor.white
    contentView.addSubview(verticleLine)
    contentView.addSubview(titleL)
    
    contentView.addSubview(numL)
    
//    //rightView
//    contentView.addSubview(moreArrow)
//    contentView.addSubview(moreL)
//    contentView.addSubview(sepLine)
//    contentView.addSubview(plusBtn)
    
    
    verticleLine.snp.makeConstraints { make in
      make.width.equalTo(4)
      make.height.equalTo(20)
      make.left.equalToSuperview().offset(12)
      make.centerY.equalToSuperview()
    }
    
    
    titleL.snp.makeConstraints { (make) in
      make.centerY.equalToSuperview()
      make.left.equalToSuperview().offset(27)
      make.width.lessThanOrEqualTo(200)
    }
    
    numL.snp.makeConstraints { make  in
      make.width.height.equalTo(26)
      make.centerY.equalTo(titleL.snp.centerY)
      make.left.equalTo(titleL.snp.right).offset(4)
    }
    
    
  }
  
  /*
   显示箭头
   */
  public func showArrow(rightMargin: CGFloat = 12){
    contentView.addSubview(moreArrow)
    
    moreArrow.snp.makeConstraints { (make) in
      make.centerY.equalToSuperview()
      make.right.equalToSuperview().offset(-rightMargin)
    }
  }
  
  /*
   显示更多btn
   */
  public func showMoreBtn(title:String, rightMargin: CGFloat = 24, clickBlock:@escaping (()->(Void))){
    
    moreBlock = clickBlock
    moreBtn.setTitle(title, for: .normal)
    
    contentView.addSubview(moreBtn)
    moreBtn.snp.makeConstraints { make in
      make.centerY.equalToSuperview()
//      make.width.equalTo(40)
      make.right.equalToSuperview().offset(-rightMargin)
    }
    
    
  }
  
  @objc private func btnClick(){
    moreBlock?()
  }
  
  /*
   显示底部分割线
   */
  public func showBottomLine(){
    contentView.addSubview(sepLine)
    sepLine.snp.makeConstraints { make  in
      make.height.equalTo(1)
      make.right.left.equalToSuperview().inset(12)
      make.bottom.equalToSuperview()
    }
  }
  
  /*
   *隐藏左边视图
   */
  public func hideLeftView(){
    verticleLine.isHidden = true
    titleL.isHidden = true
    numL.isHidden = true
  }
  
  
  
    

}
