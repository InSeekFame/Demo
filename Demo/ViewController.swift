//
//  ViewController.swift
//  Demo
//
//  Created by MAC on 2021/10/16.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var tableView: UITableView!
  var titleList = [String]()
  var vcList = [UIViewController]()
  
  override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        print("Swift分支")
//        print("OC分支")
//        print("效果分支")
//      print("NJ COMMIT")
//      print("tab")
        
//    navigationController?.pushViewController(getVC("Todo1VCID"), animated: true)
    
        setUI()
    }
  
  func setUI(){
    
    titleList.append("Todo：泛型，日期，属性包装器")
    titleList.append("Todo：TableList")
    
    vcList.append(getVC("Todo1VCID"))
    vcList.append(TableTodoVC())
    
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    tableView.delegate = self
    tableView.dataSource = self
    tableView.reloadData()
  }

  func getVC(_ name: String)->UIViewController{
    let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: name)
    
    return vc
  }

}

extension ViewController:UITableViewDataSource,UITableViewDelegate{
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return vcList.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    cell.textLabel?.text = "\(titleList[indexPath.row])"
    
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let vc = vcList[indexPath.row]
    vc.title = titleList[indexPath.row]
    self.navigationController?.pushViewController(vc, animated: true)
  }
  
  
}

