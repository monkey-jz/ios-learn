import UIKit

var str = "Hello, playground"
var startIndex = str.startIndex
var endIndex = str.endIndex
var char1 = str[str.index(after: startIndex)]
var char2 = str[str.index(before: endIndex)]
var char3 = str[startIndex ... str.index(startIndex, offsetBy: 4)]
var char4 = str[str.index(endIndex, offsetBy: -5) ..< endIndex]
var char5 = str.range(of: "Hello")
str.append("!")
str.append("boyaa")
str.insert("t", at: str.index(startIndex, offsetBy: 4))
str.insert(contentsOf: "test", at: str.index(startIndex, offsetBy: 8))
str.replaceSubrange(str.index(endIndex, offsetBy: -10)...endIndex, with: "12345")
str.remove(at: str.index(before: endIndex))
str.removeSubrange(startIndex ... str.index(startIndex ,offsetBy: 6))
str.removeAll()
var str2 = "ceshiDaXiaoXIE"
str2.hasPrefix("ce")
str2.hasPrefix("ceh")
str2.hasSuffix("IE")
str2.hasSuffix("Ie")
str2.uppercased()
str2.lowercased()
var str3: String!
str3 = "str3_test"
if str3 != nil {
    print(str3!)
}
var array1: [Int] = []
var array2: Array<Int>

var array3 = Array(arrayLiteral: "1","2","3")
var array4 = ["a","b"]
var array5 = Array(repeating: "swift5", count: 5)
var array6 = [Int](repeating: 9, count: 5)
var array7 = array3 + array4
array7.count
array7.contains("a")
array7.isEmpty
array1.isEmpty
array7[3]
array7[2...4]
array7.append("c")
array7.first
array7.last
array7.capacity
array7[3] = "4"
array7
array7[3...5] = ["4","5","6"]
array7.append(contentsOf: ["a","b","c"])
array7.insert("d", at: array7.endIndex)
array7.insert(contentsOf: ["-1","0"], at: array7.startIndex)
array7.remove(at: array7.startIndex)
array7.removeFirst()
array7.removeLast()
array7.removeFirst(3)
array7.removeLast(2)
array7.removeSubrange(0...2)
array7.removeAll()
array7.append(contentsOf: ["b","c","d","e","f"])
array7.replaceSubrange(0...4, with: ["1","2","3"])
array7.startIndex
let array8 = [(1,"a"),(3,"b"),(5,"c")]
for item in array8 {
    print(item)
}
for index in array8.indices {
    print("\(index): \(array8[index])" )
}
var array9 = [2,1,65,6,8,100,200,3,5]
array9.sort(by: >)
array9.sort(by: <)
array9.max()
array9.min()
var set1: Set<Int> = [1,2,3]
var set2 = Set(arrayLiteral: 3,4,5,6)
set2[set2.startIndex]
set2[set2.index(set2.startIndex, offsetBy: 2)]
set2.count
set2.contains(3)
set2.isEmpty
set2.max()
set2.min()
set2.insert(3)
set2.insert(7)
set2.remove(at: set2.startIndex)
set2.insert(8)
set2.removeFirst()
set2.insert(9)
set2
set2.remove(at: set2.index(set2.startIndex, offsetBy: 2))
set2
set1 = set2
set2.removeAll()
set1.firstIndex(of: 0)
(set1.firstIndex(of: 2))
var set3: Set<Int> = [1,2,3,4]
var set4: Set<Int> = [3,4,5,6,7]
set3.intersection(set4)
set3.symmetricDifference(set4)
set3.union(set4)
set3.subtract(set4)
var set5 = Set(arrayLiteral: 1,2,3,4,5,6,7,8,9,10)
set3 == set5
set3.isSubset(of: set5)
set5.isSuperset(of: set3)
set3.isStrictSubset(of: set5)
set5.isStrictSuperset(of: set3)
for item in set5 {
    print(item)
}
for index in set5.indices {
    print("\(index) : \(set5[index])")
}
for item in set5.sorted(by: <) {
    print(item)
}
var dic1: Dictionary<String,Int>
var dic2: [String:Int]
dic1 = ["a" : 1,"b" : 2,"c" : 3]
dic2 = Dictionary(dictionaryLiteral: ("a", 1),("b", 2),("c",3))
var dic3: [String:Int] = [:]
dic3 = Dictionary()
var dic4: Dictionary<Int,Int> = Dictionary()
dic2.count
dic2.isEmpty
dic3.isEmpty
dic2["a"]
dic2["b"] = 4
dic2["d"] = 5
dic2
if let temp = dic2.updateValue(10, forKey: "d") {
    print(temp)
}
if let temp = dic2["b"] {
    print(temp)
}
dic2.removeValue(forKey: "b")
dic2
for key in dic2.keys {
    print(key)
}
for value in dic2.values {
    print(value)
}
dic3 = dic2
dic2.removeAll()
for item in dic3 {
    print(item)
}
for (key,value) in dic3 {
    print("key: \(key),value: \(value)")
}
for item in dic3.values.sorted(by: <) {
    print(item)
}
var oriString = "abcdef"
var endIndex2 = oriString.endIndex
var newString = String()
while endIndex2 > oriString.startIndex {
    endIndex2 = oriString.index(before: endIndex2)
    newString.append(oriString[endIndex2])
}
newString
var tp1 = (2,0,"4")
var tp2 = (1,1,"5")
tp1 > tp2
var v1: Int? = 7
var v2: Int
v2 = v1 != nil ? v1! : 0
v2 = v1 ?? 0
var rang1 = 0...10
var rang2 = 0..<6
for r in rang1 {
    print(r)
}
for r in rang2 {
    print(r)
}
print(rang2 ~= 3)
var total = 0
for _ in 0...4 {
    total += 2
}
total
var count = 0
repeat{
    count += 2
    print(count)
}while count < 10
count
while count < 20 {
    count += 4
}
count
var i1 = 4

switch i1{

case 1...4:
    print("aaa")
case 5...6:
    print("bbb")

default:
    print("cccc")
}
var tp3 = (2,30)
switch tp3 {
case (0...4,40...50):
    print("dddd")
case (1...6,30...40):
    print("eeeee")
default:
    print("fffff")
}
switch tp3 {
case (let d,5...6):
    print("d: \(d)")
case (let c,10...40) where 0...2 ~= c :
   print("c: \(c)")
    fallthrough
case (2,30):
    print("LLLLLL")
    fallthrough
case (2,31):
    print("HHHHHH")
    fallthrough
case (3,31):
    print("FFFFFF")
    fallthrough
case (3,30):
    print("DDDDDDDD")
    fallthrough
default:
    print("kkkk")
}
OUT:for i in 0...3 {
    print("i: \(i)")
    for j in 0...3 {
        if j==2 {
            break OUT
        }
        print("j: \(j)")
    }
}
enum MyError:Error{
  case errorOne
  case errorTwo
}
func test1() throws{
    throw MyError.errorOne
}
set3
func func1(param: Int){
    guard param > 0 else {
        return
    }
    print(param)
}
func1(param: 2)
func1(param: 0)
var count2 = 1
for _ in 1...9 {
    count2 = (count2 + 1) * 2
}
print(count2)

func isMoreThanTen(param: Int) -> Bool{
    if param > 10 {
        return true
    }else{
        return false
    }
}
isMoreThanTen(param: 20)
isMoreThanTen(param: 5)

func searchData(dataId: String) -> (success: Bool,data: String){
    let tup = (true,"模拟数据")
    return tup
}
var returnTup = searchData(dataId: "")
if returnTup.success {
    print("data: \(returnTup.data)")
}
func func3(param: Int) -> Int? {
    guard param > 100 else {
        return nil
    }
    return param - 100
}

if let temp = func3(param: 102) {
    print(temp)
}
func func4(param1: Int,param2: Int) -> Int? {
    return param1 + param2
}

func4(param1: 4, param2: 5)

func func5(param1: Int,parma2 :Int = 10,param3: Int) -> Int? {
    return param1 + parma2 + param3
}
func5(param1: 20, param3: 30)
func5(param1: 20, parma2: 20,param3: 10)
func func6(param1: Int...,param2: String) {
    var sum = 0
    for element in param1 {
        sum += element
    }
    print("\(param2) : \(sum)" )
    
}
func6(param1: 1,2,3, param2: "sum")
func func7(param: inout Int) {
    param += 1
}
var var3 = 5
func7(param: &var3)

var a: UInt8 = 0b1000
a = ~a
a = 0b11110000 & a
a = 0b11111111
a = a &+ 1
a = a &- 1
a = a << 1
func addFunc(param1: Int,param2: Int) -> Int {
    return param1 + param2
}
func addFunc(param1: Double,param2: Double) -> Double {
    return param1 + param2
}
addFunc(param1: 3, param2: 4)
addFunc(param1: 2.0, param2: 5.0)
class Circle {
    var center: (Double,Double)
    var radius: Double
    var l: Double{
        get {
            return radius * 2 * Double.pi
        }
        set{
            radius = newValue / 2 / Double.pi
        }
    }
    var s: Double{
        get{
            return radius * radius * Double.pi
        }
        set(newRadius){
            radius = sqrt(newRadius / Double.pi)
        }
    }
    var test: String{
      return "测试"
    }
    init(center: (Double,Double),radius: Double) {
        self.center = center
        self.radius = radius
    }
   
}

func +(circle1: Circle,circle2: Circle) -> Circle {
    return Circle(center: circle1.center, radius: circle1.radius + circle2.radius)
}

var c1 = Circle(center: (2.0,2.0), radius: 6.0)
var c2 = Circle(center: (3.0,3.0), radius: 2.0)
(c1+c2).radius
c1.l
c1.s
c1.l = 314
c1.radius
c1.s = 100
c1.radius
c1.test

prefix operator ++
prefix func ++(param: Int) -> Int {
    return param + 1
}
++6
infix operator ++: AdditionPrecedence
func ++(param1: Int,param2: Int) -> Int {
    return param1 * param1 + param2 * param2
}
4++5
postfix operator ++
postfix func ++(param: Int) -> Int {
    return param + 1
}
8++

enum FirstName {
    case 张
    case 王
    case 李
    case 赵
}

var fn1: FirstName
fn1 = FirstName.张
fn1 = .李
switch fn1 {
case .张:
    print("zhang")
case .李:
    print("li")
case .王:
    print("wang")
case .赵:
    print("zhao")
}
enum CharEnum: Character {
    case A = "a"
    case B = "b"
    case C = "c"
}
var ce1 = CharEnum.A
ce1.rawValue
var ce2 = CharEnum.C
ce2.rawValue

enum IntEnum: Int {
    case 一 = 1
    case 二
    case 三
}
var ie1 = IntEnum.二
ie1.rawValue
var ie2 = IntEnum(rawValue: 3)
ie2?.rawValue

enum Shape {
    case circle(center: (Double,Double),radius: Double)
    case rect(center: (Double,Double),width: Double,height: Double)
    case triangle(point1: (Double,Double),ponit2: (Double,Double),point3: (Double,Double))
}

func shapeFunc(shape: Shape) {
    switch shape {
    case let .circle(center,radius):
        print("center : \(center),radius: \(radius)")
    case let .rect(center, width, height):
         print("center: \(center),width: \(width),height: \(height)")
    case let .triangle(point1, ponit2, point3):
        print("point1: \(point1),ponit2: \(ponit2),point3: \(point3)")
  
    }
}
var circle2 = Shape.circle(center: (2.0,3.0), radius: 6.0)
shapeFunc(shape: circle2)
var rect = Shape.rect(center: (3,4), width: 5, height: 6)
shapeFunc(shape: rect)
var triangle = Shape.triangle(point1: (4,0), ponit2: (0,4), point3: (4,4))
shapeFunc(shape: triangle)

func mathFunc(param: Int) -> Int{
   let temp = param - 1
   if temp > 0 {
        return mathFunc(param: temp) * param
    }else{
        return 1
    }
}
mathFunc(param: 6)
enum Test1: String {
    case north
    case south
    case west
    case east
}
Test1.east.rawValue

//indirect枚举值的相关参数可为自身类型
indirect enum MathEnum {
    case num(num: Int)
    case add(exp1: MathEnum,exp2: MathEnum)
    case multi(exp1: MathEnum,exp2: MathEnum)
    case sub(exp1: MathEnum,exp2: MathEnum)
    case div(exp1: MathEnum,exp2: MathEnum)
}
var seven = MathEnum.num(num: 7)
var eight = MathEnum.num(num: 8)
var add = MathEnum.add(exp1: seven, exp2: eight)
var multi = MathEnum.multi(exp1: add, exp2: MathEnum.num(num: 9))
var sub = MathEnum.sub(exp1: multi, exp2: MathEnum.num(num: 1))
var div = MathEnum.div(exp1: sub, exp2: MathEnum.num(num: 2))
func evaluate(exp: MathEnum) -> Int {
    switch exp {
    case let .num(num):
        return num
    case let .add(exp1, exp2):
        return evaluate(exp: exp1) + evaluate(exp: exp2)
    case let .multi(exp1, exp2):
        return evaluate(exp: exp1) * evaluate(exp: exp2)
    case let .div(exp1, exp2):
       return evaluate(exp: exp1) / evaluate(exp: exp2)
    case let .sub(exp1, exp2):
        return evaluate(exp: exp1) - evaluate(exp: exp2)
    }
}
evaluate(exp: div)
struct SCar {
    
    var brand: String
    var price: Int
    var power: Double
    
    mutating func drive(){
        if power > 0 {
            power -= 1
        }
    }
}
var car1: SCar = SCar(brand: "比亚迪", price: 220000, power: 100.0)
car1.brand
var car2 = car1
car2.brand = "特斯拉"
car1.brand
car2.brand

class Car {
    var brand: String
    var price: Int
    var power: Double
    init(brand: String,price: Int,power: Double) {
        self.brand = brand
        self.price = price
        self.power = power
    }
    
    func drive() {
        if power > 0 {
            power -= 1
        }else{
            self.charge()
        }
    }
    
    func charge() {
        power += 100
    }
}
var car3: Car = Car(brand: "小鹏", price: 300000, power: 100)
car3.brand
var car4 = car3
car4.brand = "问界"
car3.brand

class Transporation {
    var petrol: Int
    
    func drive() {
        self.petrol -= 10
    }
    
    func addPetrol() {
        self.petrol += 10
    }
    
    init(petrol: Int) {
        self.petrol = petrol
    }
    
}

class TCar: Transporation {
    var tyre: Int
    init(tyre: Int,petrol: Int) {
        self.tyre = tyre
        super.init(petrol: petrol)
    }
    
    override func addPetrol() {
        self.petrol += 5
    }
    override func drive() {
        print("车在行驶...")
        self.petrol -= 5
    }
    
}
class Boat: Transporation {
    var floor: Int
    init(floor: Int, petrol: Int) {
        self.floor = floor
        super.init(petrol: petrol)
    }
    override func drive() {
        print("船在行驶...")
        self.petrol -= 50
    }
    
    override func addPetrol() {
        self.petrol += 1000
    }
    
}
var boat: Boat = Boat(floor: 10, petrol: 5000)
var car6: TCar = TCar(tyre: 4, petrol: 100)
boat.drive()
car6.drive()
struct Point {
    var x: Double
    var y: Double
}
class A {
    var x: Double
    let y: Double
    lazy var b: B = B(name: "测试字段")
    init(x: Double,y: Double) {
        self.x = x
        self.y = y
    }
}
class B {
    var name: String
    init(name: String) {
        print("name: \(name)")
        self.name = name
    }
}
var p1: Point = Point(x: 2.0, y: 3.0)
p1.x = 10
let a1: A = A(x: 2.0, y: 6.0)
a1.x = 4.0
a1.x
a1.b

class Teacher {
    var name: String {
        willSet{
            print(newValue)
        }
        didSet(o){
            print(o)
        }
        
    }
    
    var age: Int
    init(name: String,age: Int) {
        self.name = name
        self.age = age
    }
}
var t1: Teacher = Teacher(name: "张三", age: 30)
t1.name = "李四"

@propertyWrapper
struct StringNotEmpty {
    private var str: String
    init() {
        self.str = "default"
    }
    var wrappedValue: String {
        get {
            return str
        }
        set{
            if newValue.count == 0 {
                str = "default"
            }else{
                str = newValue
            }
        }
    }
}

@propertyWrapper
struct IntAbove25{
    private var i: Int
    init() {
        self.i = 25
    }
    var wrappedValue: Int{
        get{
            return i
        }
        set{
            if newValue < 25 {
                i = 25
            }else{
                i = newValue
            }
        }
    }
    
}

class People{
    var name: String
    var age: Int
    @StringNotEmpty var memName: String
    @IntAbove25 var memAge
    init() {
        self.name = ""
        self.age = 0
    }
}
var wp1: People = People()
wp1.memAge = 30
wp1.memAge
wp1.memAge = 20
wp1.memAge
wp1.memName = "张三"
wp1.memName
wp1.memName = ""
wp1.memName

class ParentClass{
    static var p1: String = "p1属性"
    static var p3: String{
        "p3属性"
    }
    class var p2: String {
        "p2属性"
    }
}
ParentClass.p1
ParentClass.p2
ParentClass.p3

class ChildrenClass: ParentClass {
    override class var p2: String{
        "子类p2属性"
    }
}

ChildrenClass.p1
ChildrenClass.p2

class BaseClass {
    init() {
        print("base init ...")
    }
    convenience init(param: Int){
        print("base convenience init ...")
        self.init()
    }
    
    required init(param: Double){
        
    }
}

class SubClass: BaseClass {
    override init() {
        super.init()
        print("sub init ...")
    }
    convenience init(param: Int) {
        print("sub conenience ... \(param)")
        self.init()
    }
    
    convenience init(param: String) {
        print("sub convenience 2 ... \(param)")
        self.init(param:4)
    }
    required init(param: Double) {
        super.init(param: param)
    }

    
}
var subc1: SubClass = SubClass(param: "test")

class B2 {
    var t: String
    init?(t: String) {
        if t.isEmpty {
            return nil
        }
        self.t = t
    }
    deinit {
        print("deinit ...")
    }
}
var b1: B2? = B2(t: "test")
b1!.t
b1 = nil
b1 = B2(t: "")
b1

enum E1 {
    case A,B,C
    init?(param: String) {
        switch param {
        case "a":
            self = .A
        case "b":
            self = .B
        case "c":
            self = .C
        default:
            return nil
        }
    }

}
var e1 = E1(param: "a")
e1 = E1(param: "d")

class RC {
    var name: String = ""
    
    init(param: String) {
        self.name = param
        print("init ...")
    }
    deinit {
        print("deinit ...")
    }
}

var rc1: RC?
var rc2: RC?
var rc3: RC?
rc1 = RC(param: "a")
rc2 = rc1
rc3 = rc1
rc1 = nil
rc2 = nil
rc3 = nil


class Person {
    var name: String
    var apartment: Apartment?
    init(name: String) {
        self.name = name
    }
    deinit {
        print("person deinit ...")
    }
}

class Apartment {
    var unit: String
    weak var person: Person?
    init(unit: String) {
        self.unit = unit
    }
    deinit {
        print("apartment deinit ...")
    }
}
var p5: Person? = Person(name: "张三")
var a5: Apartment? = Apartment(unit: "20unit2")
p5!.apartment = a5
a5!.person = p5
p5 = nil
a5 = nil

enum MyError2: Error{
    case ERRORONE
    case ERRORTWO
    case ERRORTHR
}

class ClassOne {
    
    var name: String = ""
    lazy var closure: () -> Void = {
        [unowned self]() -> Void in print(self.name)
        
    }
    deinit {
        print("deinit ...")
    }
    
    func test() throws -> Bool {
        defer {
            print("defer ===")
        }
        if self.name.count == 0 {
            throw MyError2.ERRORONE
        }
        
       return true
       
    }
    
}
var co1: ClassOne? = ClassOne()
co1?.name = ""
if let xt1 = try?co1?.test() {
    print(xt1)
}else{
    print("name is empty")
}
do{
    try co1?.test()
}catch MyError2.ERRORTWO{
    print("error two")
}catch MyError2.ERRORONE{
    print("error one")
}catch MyError2.ERRORTHR{
    print("error thr")
}catch{
    print(error)
}


co1?.name = "aaa"
co1?.closure
co1 = nil

class Media {
    var name: String
    init(name: String) {
        self.name = name
    }
}

class Movie: Media {
    var director: String
    init(name: String,director: String) {
        self.director = director
        super.init(name: name)
    }
    
}
class Song: Media {
    var singer: String
    init(name: String,singer: String) {
        self.singer = singer
        super.init(name: name)
    }
    
}

var mediaArray = [
   Movie(name: "笑傲江湖", director: "徐克"),
   Movie(name: "英雄本色", director: "吴宇森"),
   Song(name: "七里香", singer: "周杰伦"),
   Movie(name: "大话西游", director: "刘镇伟"),
   Song(name: "晴天", singer: "周杰伦")
]

for media in mediaArray {
    if let song = media as? Song {
        print(song.singer,song.name)
    }else if let movie = media as? Movie{
        print(movie.director,movie.name)
    }else{
        print(media.name)
    }
}

func swapTwoValue<T>(_ t1: inout T,_ t2: inout T){
    let temp = t1
    t1 = t2
    t2 = temp
}
var a3 = 2
var b3 = 3
swapTwoValue(&a3, &b3)
print("a: \(a3),b: \(b3)")

var sa3 = "a"
var sb3 = "b"
swapTwoValue(&sa3, &sb3)
print("a: \(sa3),b: \(sb3)")

struct Stack<Element> {
    var array: [Element] = []
    mutating func push(element: Element){
        array.append(element)
    }
    mutating func pop(element: Element){
        array.removeLast()
    }
}



