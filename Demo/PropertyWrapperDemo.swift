//
//  PropertyWrapperDemo.swift
//  Demo
//
//  Created by CL9421 on 2021/11/4.
//

import UIKit
import SystemConfiguration

class PropertyWrapperDemo: NSObject {
  
  /*
   1、基础用法
   功能需求：确保值始终小于或等于12
   这里我们直接使用 property wrapper 进行封装演示
   */
  // 属性的存储方式
  @propertyWrapper
  struct TwelveOrLess {
      private var number: Int
      
      // wrappedValue变量的名字是固定的
      var wrappedValue: Int {
          get { return number }
          set { number = min(newValue, 12) }
      }
      
      init() {
          self.number = 0
      }
  }
  //属性的定义代码
  struct SmallRectangle {
    //属性的定义代码
      @TwelveOrLess var height: Int
      @TwelveOrLess var width: Int
    var height2: Int = 0
  }
  
  /*2、设置初始值*/
  @propertyWrapper
  struct SmallNumber {
      private var maximum: Int
      private var number: Int
      
      var wrappedValue: Int {
          get { return number }
          set { number = min(newValue, maximum) }
      }
      
      init() {
          maximum = 12
          number = 2
      }
      
      init(wrappedValue: Int) {
          print("init(wrappedValue:)")
          maximum = 12
          number = min(wrappedValue, maximum)
      }
      
      init(wrappedValue: Int, maximum: Int) {
          print("init(wrappedValue:maximum:)")
          self.maximum = maximum
          number = min(wrappedValue, maximum)
      }
  }
  //2.1使用了 @SmallNumber 但没有指定初始化值
  struct ZeroRectangle {
      @SmallNumber var height: Int
      @SmallNumber var width: Int
  }
  //2.2使用了 @SmallNumber ，并指定初始化值
  struct UnitRectangle {
      @SmallNumber var height: Int = 1
      @SmallNumber var width: Int = 1
  }
  
  //使用@SmallNumber，并传参进行初始化
  //这里会调用 init(wrappedValue:maximum:) 方法
  //2.3
  struct NarrowRectangle {
      // 报错：Extra argument 'wrappedValue' in call
      // @SmallNumber(wrappedValue: 2, maximum: 5) var height: Int = 1
      // 这种初始化是可以的，调用 init(wrappedValue:maximum:) 方法
      // @SmallNumber(maximum: 9) var height: Int = 2
      @SmallNumber(wrappedValue: 2, maximum: 500) var height: Int
      @SmallNumber(wrappedValue: 3, maximum: 400) var width: Int
  }

  //3、projectedValue
  /*
   projectedValue为 property wrapper 提供了额外的功能（如：标志某个状态，或者记录 property wrapper 内部的变化等）
   两者都是通过实例的属性名进行访问，唯一不同的地方在于，projectedValue 需要在属性名前加上 $ 才可以访问

   wrappedValue: 实例.属性名
   projectedValue: 实例.$属性名

   作者：LinXunFeng
   链接：https://juejin.cn/post/6953646935127359524
   来源：稀土掘金
   著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
   */
  @propertyWrapper
  struct SmallNumber1 {
      private var number: Int
      var projectedValue: Bool //类似于计算属性
      init() {
          self.number = 0
          self.projectedValue = false
      }
      var wrappedValue: Int {
          get { return number }
          set {
              if newValue > 25 {
                  number = 25
                  projectedValue = true
              } else {
                  number = newValue
                  projectedValue = false
              }
          }
      }
  }
  struct SomeStructure {
      @SmallNumber1 var someNumber: Int
  }



  
  /*
   属性包装器的知识点
   */
  func todo(){
    
    print("1、基础用法-功能需求：确保值始终小于或等于12")
    var rectangle = SmallRectangle()
    print(rectangle.height) // 0
    print(rectangle.height2)

    rectangle.height = 10
    rectangle.height2 = 10
    print(rectangle.height) // 10
    print(rectangle.height2) // 10

    rectangle.height = 24
    print(rectangle.height) // 12
    rectangle.height2 = 24
    print(rectangle.height2) // 12
    
    print("2.1、设置初始值")
    var zeroRectangle = ZeroRectangle()
    zeroRectangle.height = 11
    print(zeroRectangle.height, zeroRectangle.width) // 0 0
    
    print("2.2使用了 @SmallNumber ，并指定初始化值")
    var unitRectangle = UnitRectangle()
    print(unitRectangle.height, unitRectangle.width) // 1 1
    
    //传参数
    print("2.3:传参数")
    var narrowRectangle = NarrowRectangle()
    print(narrowRectangle.height, narrowRectangle.width) // 2 3
    
    narrowRectangle.height = 100
    narrowRectangle.width = 100
    print(narrowRectangle.height, narrowRectangle.width) // 5 4
    
    //3、projectedValue
    print("3、projectedValue：类似计算属性")
    var someStructure = SomeStructure()
    someStructure.someNumber = 4
    print(someStructure.someNumber)
    print(someStructure.$someNumber) // false

    someStructure.someNumber = 55
    print(someStructure.$someNumber) // true
    
  }
  
 //MARK: - 应用
  // 声明使用的key为flagEnabled，默认值为true
//  @WrappedDefault(key: "flagEnabled", defaultValue: true)
//  var flagEnabled: Bool
//
//  // 声明使用的key为timestamp
//  @WrappedDefaultOptional(key: "timestamp")
//  var timestamp: Date?

  
  /*
   属性包装器的应用
   */
  func todo2(){
    
  }
  
}


