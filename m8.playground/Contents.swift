//8.1
struct Person {
  var name: String
  var age: Int
  lazy var info: String = lazyInfo()
  
  init (name: String, age: Int) {
    self.name = name
    self.age = age
  }
  
  func getAgeComparisonString(_ p: Person) -> String {
    switch self.age - p.age {
    case 0:
        return ("\(p.name) такого же возраста, как \(self.name)")
    case 0...:
        return ("\(p.name) младше чем \(self.name)")
    case -100..<0:
        return ("\(p.name) старше чем \(self.name)")
    default:
        return ("\(p.name), поздравляю, вы Один")
    }
  }
  //8.2
  func lazyInfo () -> String {
    switch self.age % 10 {
    case 2...4 where (self.age <= 5 || self.age >= 20):
        return ("\(self.name), \(self.age) года")
    case 1 where (self.age <= 5 || self.age >= 20):
        return ("\(self.name), \(self.age) год")
    default:
        return ("\(self.name), \(self.age) лет")
    }
  }
}

//8.3 & 8.4
class Hero {
  //8.5
  private var lifeCount: Int
  var isLive: Bool {
    get {
      if lifeCount > 0 {
        return true
      } else {
        return false
      }
    }
  }
  
  init (lifeCount: Int) {
    self.lifeCount = lifeCount
  }
  
  public func getLifeCount () -> Int {
    return self.lifeCount
  }
  
  func hit () {
    self.lifeCount -= 1
  }
}

var p1 = Person(name: "Антон", age: 24)
var p2 = Person(name: "Андрей", age: 36)
var p3 = Person(name: "Ольга", age: 24)
var p4 = Person(name: "Макс", age: 1528)

//8.1
print (p1.getAgeComparisonString(p2))
print (p2.getAgeComparisonString(p3))
print (p3.getAgeComparisonString(p4))

//8.2
print (p4.info)

//8.3 & 8.4
let heroLife = 2
var hero = Hero(lifeCount: heroLife)
hero.hit() //убиваю героя парой попаданий
print (hero.isLive)
hero.hit()
print (hero.isLive)

//8.6
class SuperHero: Hero {
  override func hit () {
    print("Аахаха! Не попал, у меня всё равно жизней аж \(self.getLifeCount())!")
  }
}
var superHero = SuperHero(lifeCount: heroLife)
superHero.hit()
