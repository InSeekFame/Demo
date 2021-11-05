//
//  Todo1VC.swift
//  Demo
//
//  Created by CL9421 on 2021/11/4.
//

import UIKit
import SnapKit

class Todo1VC: UIViewController {
  
  var blueView = UIView()
  var btn:UIButton!
  var isBig = false

    override func viewDidLoad() {
        super.viewDidLoad()

      view.backgroundColor = .white
      
      
      ///日期Demo
//      DateDemo().todo()
      //属性包装器Demo
//      PropertyWrapperDemo().todo()
      
      
      btn = UIButton(type: .custom)
      btn.setTitle("btn", for: .normal)
      btn.addTarget(self, action: #selector(btnClick), for: .touchUpInside)
      self.view.addSubview(btn)
      btn.backgroundColor = .orange
      btn.snp.makeConstraints { make in
        make.center.equalToSuperview()
      }
      
      //
      testLayout()
    }
  
  @objc func btnClick(){
    changeViewFrame()
  }
    
  
  //setNeedsLayout 和layoutIfNeeded有啥区别？
  //https://juejin.cn/post/6926721545796583432
  func testLayout(){
    self.view.addSubview(blueView)
    blueView.backgroundColor = .blue
    
    blueView.snp.makeConstraints { make in
      make.left.equalToSuperview().offset(30)
      make.right.equalToSuperview().offset(-30)
      make.top.equalToSuperview().offset(120)
      make.height.equalTo(30)
    }
    
    print("setNeedsLayout - 1")
    
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    print("viewDidLayoutSubviews")
  }
  
  func changeViewFrame(){
    self.view.layoutIfNeeded() //让之前没有更新的强制更新。
    
    self.isBig = !self.isBig
    self.blueView.snp.updateConstraints { make in
      make.height.equalTo(self.isBig ? 100:30)
      
    }
    
    UIView.animate(withDuration: 0.1) {
      self.view.layoutIfNeeded() //有动画
//      self.view.setNeedsLayout() //无动画
      //如果这里用setNeedsLayout的话，是没有动画的。因为他只是标记后就返回了。
    }
  }
    

}




