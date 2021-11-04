//
//  DateDemo.swift
//  Demo
//
//  Created by CL9421 on 2021/11/4.
//

import UIKit


///日期扩展Demo
class DateDemo: NSObject {
  func todo(){
    
    print(Calendar.current.dateComponents([.day], from: Date()))
    
    print("Date:\(Date())")
    print("Calendar.current:\(Calendar.current)")
    print("DateComponents():\(DateComponents())")
    print("startOfDay:\(Calendar.current.startOfDay(for: Date()))")
    
    print("Calendar.Component.weekOfMonth:\(Calendar.Component.weekOfMonth)")
    
    print("*************************\n")
//      testDate()
    
    Date().printDate()
  }
  
  func testDate(){
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss ZZZ"
    dateFormatter.timeZone = NSTimeZone.system
    dateFormatter.calendar = Calendar(identifier: Calendar.Identifier.gregorian)

    let date = Date()

    print("date = \(dateFormatter.string(from: date))")

    print("startOfDay = \(dateFormatter.string(from: date.startOfDay))")
    print("endOfDay = \(dateFormatter.string(from: date.endOfDay))")

    print("startOfMonth = \(dateFormatter.string(from: date.startOfMonth))")
    print("endOfMonth = \(dateFormatter.string(from: date.endOfMonth))")

//    print("startOfYear = \(dateFormatter.string(from: date.startOfYear))")
//    print("endOfYear = \(dateFormatter.string(from: date.endOfYear))")

  }
}


//extension Date {
//
//    /// 日初
//    var startOfDay: Date {
//        return Calendar.current.startOfDay(for: self)
//    }
//
//    /// 日末
//    var endOfDay: Date {
//        var components = DateComponents()
//        components.day = 1
//        components.second = -1
//        return Calendar.current.date(byAdding: components, to: startOfDay)!
//    }
//
//    /// 月初
//    var startOfMonth: Date {
//        let components = Calendar.current.dateComponents([.year, .month], from: startOfDay)
//        return Calendar.current.date(from: components)!
//    }
//
//    /// 月末
//    var endOfMonth: Date {
//        var components = DateComponents()
//        components.month = 1
//        components.second = -1
//        return Calendar.current.date(byAdding: components, to: startOfMonth)!
//    }
//
//    /// 年初
//    var startOfYear: Date {
//        let components = Calendar.current.dateComponents([.year], from: startOfDay)
//        return Calendar.current.date(from: components)!
//    }
//
//    /// 年末
//    var endOfYear: Date {
//        var components = DateComponents()
//        components.year = 1
//        components.second = -1
//        return Calendar.current.date(byAdding: components, to: startOfYear)!
//    }
//}


// MARK: - Date 添加扩展
extension Date {

  func printDate(){
    print("date:\(Date().day)")
    print("isToday:\(Date().isToday)")
    print("previousDay:\(Date().previousDay)")
    print("nextDay:\(Date().nextDay)")
    //startOfDay
    print("startOfDay:\(Date().startOfDay)")
    print("endOfDay:\(Date().endOfDay)")
    //
    print("startOfWeek:\(Date().startOfWeek)")
    
    print("startOfMonth:\(Date().startOfMonth)")
    print("endOfMonth:\(Date().endOfMonth)")
    
    print("startOfNextWeek:\(Date().startOfNextWeek)")
    print("startOfPreviousWeek:\(Date().startOfPreviousWeek)")
    
    ///weekDates dayOfTheWeek weekOfYear
    print("weekDates:\(Date().weekDates)")
    print("dayOfTheWeek:\(Date().dayOfTheWeek)")
    print("weekOfYear:\(Date().weekOfYear)")
    
    ///weekOfYear year
    print("year:\(Date().year)")
    print("month:\(Date().month)")
    print("day:\(Date().day)")
    print("dayOfTheWeek:\(Date().dayOfTheWeek)")
    print("season:\(Date().season)")
    
    //
    print("iso8601:\(Date().iso8601)")
    
    //各种格式的日期字符串
    ///yyyy-MM-dd'T'HH:mm:ss
    print("Date().string():\(Date().string())")
    print("yyyy-MM-dd:\(Date().string(format: "yyyy-MM-dd"))")
    print("yyyy-MM-dd HH:mm:ss:\(Date().string(format: "yyyy-MM-dd HH:mm:ss"))")
    //小duan
    print("yyyy-MM:\(Date().string(format: "yyyy-MM"))")
    print("MM-dd:\(Date().string(format: "MM-dd"))")
    
    ///年月日
    print("yyyy:\(Date().string(format: "yyyy"))")
    print("MM:\(Date().string(format: "MM"))")
    print("dd:\(Date().string(format: "dd"))")
    
    //时间
    print("HH:mm:ss:\(Date().string(format: "HH-mm:ss"))")
    print("HH:mm:\(Date().string(format: "HH-mm"))")
    
    //日期+分钟
    print("MM:dd HH:mm:ss:\(Date().string(format: "MM:dd HH-mm:ss"))")
    print("MM:dd HH:mm:\(Date().string(format: "MM:dd HH-mm"))")
    print("MM:dd HH:\(Date().string(format: "MM:dd HH"))")
  }
  
  
  ///今天数字 2021.11.04 xxx : -> 4
    var day: Int {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day], from: self)
        return components.day ?? 1
    }
    
  ///是否是今天
    var isToday: Bool {
        let gregorian = Calendar(identifier: .gregorian)
        let thisDate = gregorian.dateComponents([.day, .month, .year], from: self)
        let currentDate = gregorian.dateComponents([.day, .month, .year], from: Date())
        return thisDate == currentDate
    }
  
    ///昨天:Date
    var previousDay: Date {
        var components = DateComponents()
        components.day = -1
        return Calendar.current.date(byAdding: components, to: startOfDay)!
    }
    ///明天：-> Date
    var nextDay: Date {
        var components = DateComponents()
        components.day = 1
        return Calendar.current.date(byAdding: components, to: startOfDay)!
    }
    
  ///今天的起点：0点
    var startOfDay: Date {
        return Calendar.current.startOfDay(for: self)
    }
  ///今天的结束：23：59
    var endOfDay: Date {
        var components = DateComponents()
        components.day = 1
        components.second = -1
        return Calendar.current.date(byAdding: components, to: startOfDay)!
    }
  ///本月的开始
    var startOfMonth: Date {
        let components = Calendar.current.dateComponents([.year, .month], from: startOfDay)
        return Calendar.current.date(from: components)!
    }
  ///本月的结束
    var endOfMonth: Date {
        var components = DateComponents()
        components.month = 1
        components.second = -1
        return Calendar.current.date(byAdding: components, to: startOfMonth)!
    }
    ///本周的开始
    var startOfWeek: Date {
        let  gregorian = Calendar(identifier: .gregorian)
        let sunday = gregorian.date(from: gregorian.dateComponents([.yearForWeekOfYear, .weekOfYear], from: self))
        return sunday!
    }
    ///下周的开始
    var startOfNextWeek: Date {
        let gregorian = Calendar(identifier: .gregorian)
        let sunday = gregorian.date(from: gregorian.dateComponents([.yearForWeekOfYear, .weekOfYear], from: self))
        return gregorian.date(byAdding: .weekOfMonth, value: 1, to: sunday!)!
    }
    ///上一周的开始
    var startOfPreviousWeek: Date {
        let gregorian = Calendar(identifier: .gregorian)
        let sunday = gregorian.date(from: gregorian.dateComponents([.yearForWeekOfYear, .weekOfYear], from: self))
        return gregorian.date(byAdding: .weekOfMonth, value: -1, to: sunday!)!
    }
    
  ///这一周的所有日期
    var weekDates: [Date] {
        var dates: [Date] = []
        for i in 0..<7 {
            dates.append(Calendar.current.date(byAdding: .day, value: i, to: startOfWeek)!)
        }
        return dates
    }
  
  ///今天是本周的第几天
    var dayOfTheWeek: Int {
         let dayNumber = Calendar.current.component(.weekday, from: self)
         // day number starts from 1 but array count from 0
         return dayNumber - 1
    }
    
    /// 获取当前时间的所在的周数：本周是今年的第几周
    var weekOfYear: Int {
        let calendar = Calendar.current
        let weekOfYear = calendar.component(.weekOfYear, from: self.addingTimeInterval(TimeInterval(-24*3600)))
        return weekOfYear
    }
    
    
    /// 获取当前时间的年份
    var year: Int {
        let calendar = Calendar.current
        let year = calendar.component(.year, from: self)
        return year
    }
    
    /// 获取当前时间的月数：第几个月
    var month: Int {
        let calendar = Calendar.current
        let month = calendar.component(.month, from: self)
        return month
    }
    
    /// 获取当前时间的季度：第几季度
    var season: Int {
        let calendar = Calendar.current
        let month = calendar.component(.month, from: self)
        switch month {
        case 1...3:
            return 1
        case 4...6:
            return 2
        case 7...9:
            return 3
        case 10...12:
            return 4
        default:
            return 1
        }
    }

    
    var iso8601: String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
        return formatter.string(from: self)
    }
    
    func string(format: String = "dd-MM-yyyy") -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "zh_Hans_CN")
        formatter.timeZone = TimeZone(identifier:"Asia/Shanghai")
        formatter.dateStyle = .short
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
    

}
