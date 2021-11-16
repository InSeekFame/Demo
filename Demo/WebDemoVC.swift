//
//  WebDemoVC.swift
//  Demo
//
//  Created by CL9421 on 2021/11/16.
//

import UIKit
import WebKit

class WebDemoVC: UIViewController {

  @IBOutlet weak var textField: UITextField!
  @IBOutlet weak var webView: WKWebView!
  override func viewDidLoad() {
        super.viewDidLoad()

    textField.text = "https://zh.wikisource.org/zh-hans/%E5%88%97%E5%AD%90/%E6%B9%AF%E5%95%8F%E7%AF%87"
    }
    

  @IBAction func go(_ sender: Any) {
    
    guard let path = textField.text,
          let url = URL(string: path) else{
      return
    }
    
    if path.count <= 10{
      return
    }
    
    let request = URLRequest(url: url )
    webView.load(request)
  }
  

}
