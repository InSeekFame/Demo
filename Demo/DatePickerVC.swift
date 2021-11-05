//
//  DatePickerVC.swift
//  Demo
//
//  Created by CL9421 on 2021/11/5.
//

import UIKit
import SnapKit

let kScreenWidth = UIScreen.main.bounds.width
let kScreenHeight = UIScreen.main.bounds.height

class DatePickerVC: UIViewController {

  @IBOutlet weak var textField: UITextField!
  
  lazy var datePicker: UIDatePicker = {
    let picker = UIDatePicker()
    if #available(iOS 13.4, *) {
      picker.preferredDatePickerStyle = .wheels
    } else {
      // Fallback on earlier versions
    }
    picker.locale = Locale(identifier: "zh")
    picker.setDate(Date(), animated: true)
    picker.maximumDate = Date()
//    picker.addTarget(self, action: #selector(dateChange(:picker)), for: .valueChanged)
    picker.addTarget(self, action: #selector(btnClick2(_:)), for: .valueChanged)
    return picker
  }()
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      
      self.view.addSubview(datePicker)
      
      datePicker.snp.makeConstraints { make in
        make.center.equalToSuperview()
      }
      
      //设置时间输入框的键盘框样式为时间选择器
//      self.textField.inputView = datePicker
      datePicker.clearSepearatorLine()
      datePicker.selectBackgroundColor()
      //设置其颜色
      
      let color = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
      datePicker.setValue(color, forKey: "textColor")
//      datePicker.setValue(UIFont.systemFont(ofSize: 15), forKey: "font")
      
//      let lab = UILabel()
//      lab.textColor = .red
//      lab.font = UIFont.systemFont(ofSize: 15)
      //
      datePicker.sendAction("setHighlightsToday", to: nil, for: nil)
      datePicker.backgroundColor = .white
    }
  
  @objc func btnClick2(_ sender: UIDatePicker){
    print("sender:\(datePicker.date)")
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd mm:ss"
    let dateStr = formatter.string(from: datePicker.date)
    print("date:\(datePicker.date), dateStr:\(dateStr)")
    
    textField.text = dateStr
  }
    
  @IBAction func btnClick(_ sender: Any) {
    print("click")
  }
  
  
  @objc func dateChange(_ datePicker: UIDatePicker){
    
  }

  
  

}


extension DatePickerVC:UITextFieldDelegate{
  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    return false
  }
  
  func textFieldDidBeginEditing(_ textField: UITextField) {
    self.dateChange(datePicker)
  }
  
}



// MARK: - 扩展UIDatePicker类
extension UIDatePicker {
    // 去掉中间 row 上的分割线
    func clearSepearatorLine() {
        for subView in self.subviews {
          if subView.isKind(of: UIPickerView.self) {
                for sub in subView.subviews {
                    if sub.frame.size.height < 1 {
                      sub.isHidden = true
                    }
                }
            }
          
        }
    }
    
   // 设置中间 row 上的背景颜色
    func selectBackgroundColor() {
        let selectView = self.subviews[0]
      //选中的那一行
      let colorView = UIView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 34))
      colorView.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        colorView.alpha = 0.2
        colorView.center = selectView.center
        selectView.addSubview(colorView)
      
    }
}

