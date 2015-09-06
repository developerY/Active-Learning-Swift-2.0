//: [Previous](@previous)

/*: Include a link to the Swift page in the text
Translated from  [mengxiangyue](http://blog.csdn.net/mengxiangyue) by Google Tranranslate
*/

import UIKit

//: # Collections
//: **In Swift, the collection clearly know the type of value it can store, so if you insert a wrong type, an error.**
/*: 
* ### Array: an ordered value stored
* ### Set: storage disorder unique value
* ### Dictionary: storage disorderly key-value key pairs
*/

var image = UIImage (named: "collectionTypes")

//: Mutability of Collections
// Use var, let distinguish whether a variable

//: ## Array
//:
//: ### Arrays are ordered lists of elements
//:
//: * The types of values that can be stored in an array must always be made clear either through
//:   explicit type annotation or through type inference and does not have to be a base class type.
//: ----
//: * Arrays are type-safe and always clear about what they contain.
//: ----
//: * Arrays are value types, but Swift is smart about only copying when necessary to improve
//:   performance.
//: ----
//: * Immutable arrays are immutable in terms of the array itself and the contents of the array.
//:   This means you can't add/remove an element nor can you modify an element of an immutable
//:   array.
//: ------------------------------------------------------------------------------------------------



//: Create an array of Strings
var someArray = Array<String>()

//: *Shorter, more common way to define an array of Strings*
var shorter: [String]

//: This is an array literal. Since all members are of type String, this will create a String array.
//:
//: If all members are ***not the same*** type (or cannot be inferred to a homogenized type) then you
//: would ***get a compiler error***.
["Eggs", "Milk"]

//: Let's create an array with some stuff in it. We'll use an explicit String type:
var commonPets: [String] = ["Cats", "Dogs"]

//: We can also let Swift infer the type of the Array based on the type of the initializer members.
//:
//: The folowing is an array of Strings
var shoppingList = ["Eggs", "Milk"]

//: ------------------------------------------------------------------------------------------------
//:
//: ### Accessing and modifying an Array
//:
//: We can get the number of elements
shoppingList.count

//: We can check to see if it's empty
if !shoppingList.isEmpty { "it's not empty" }

//: We can append to the end
shoppingList.append("Flour")
shoppingList.append("Baking Powder")
shoppingList.count

//: We can append another array of same type
shoppingList += ["Chocolate Spread", "Cheese", "Butter"]
shoppingList.count

//: We can get elements from the array by indexing them
shoppingList[0]
shoppingList[1]

//: We can modify an existing item
shoppingList[0] = "Six Eggs"

//: We can use a range operator to modify existing items. This operation modifies a range with
//: a target range. If the target range has more or fewer elements in it, the size of the array
//: will be adjusted.
//:
//: Here, we replace 3 items with only two, removing an item:
shoppingList[4...6] = ["Banannas", "Apples"]
shoppingList

//: Or we can replace two items with three, inserting a new item:
shoppingList[4..<6] = ["Limes", "Mint leaves", "Sugar"]

//: We can insert an item at a given index
shoppingList.insert("Maple Syrup", atIndex: 3)

//: We can remove the last element. During this, we can preserve the value of what was removed
//: into a stored value
let apples = shoppingList.removeLast()
//: or removeAtIndex

let eggs = shoppingList.removeAtIndex(0)

//: ***NOTE***
//: If you try to access or modify a value for an index that is outside of an array’s existing bounds, you will trigger a runtime error. However, you can check that an index is valid before using it, by comparing it to the array’s count property. Except when count is 0 (meaning the array is empty), the largest valid index in an array will always be count - 1, because arrays are indexed from zero.
//let bad = shoppingList.removeAtIndex(100)

//: ------------------------------------------------------------------------------------------------
//: ### Enumeration
//:
//: We can iterate over the the array using a for-in loop
for item in shoppingList
{
    item
}

//: We can also use the the enumerate() method to return a tuple containing the index and value
//: for each element:
for (index, value) in shoppingList.enumerate() {
    print("Item \(index + 1): \(value)")
}

//: ------------------------------------------------------------------------------------------------
//: ### Creating and initializing an array
//:
//: Earlier, we saw how to declare an array of a given type. Here, we see how to declare an array
//: type and then assign it to a stored value, which gets its type by inference:
var someInts = [Int]()

//: Add the number '3' to the array
someInts.append(3)
someInts

//: We can assign it to an empty array, but we don't modify the type, since someInts is already
//: an Int[] type.
someInts = []

//: We can initialize an array and and fill it with default values
var threeDoubles = [Double](count: 3, repeatedValue: 3.3)

//: We can also use the Array initializer to fill it with default values. Note that we don't need to
//: specify type since it is inferred:
var anotherThreeDoubles = Array(count: 3, repeatedValue: 2.5)

//: If you store an array in a constant, it is considered "Immutable"
let immutableArray = ["a", "b"]

//: In terms of immutability, it's important to consider that the array and its contents are treated
//: separately. Therefore, you can change the contents of an immutable array, but you can't change
//: the array itself.
//:
//: We can't change the contents of an immutable array:
//:
//: immutableArray[0] = "b"
//:
//: Nor can we change the size or add an element, you will get a compiler error:
//:
//: immutableArray += "c"

//: ------------------------------------------------------------------------------------------------
//: Arrays are Value Types
//:
//: Arrays are value types that only copy when necessary, which is only when the array itself
//: changes (not the contents.)
//:
//: Here are three copies of an array:
var a = [1, 2, 3]
var b = a
var c = a

//: However, if we change the contents of one array (mutating it), then it is copied and becomes its
//: own unique entity:
a[0] = 42
b[0]
c[0]

//: The same is true if we mutate the array in other ways (mofify the array's size)...
b.append(4)

//: Now, we have three different arrays...
a
b
c

//: ## Set
//:
//: #### A set stores distinct values of the same type in a collection with no defined ordering. You can use a set instead of an array when the order of items is not important, or when you need to ensure that an item only appears once.

//: *Hash Values for Set Types A type must be hashable in order to be stored in a set—that is, the type must provide a way to compute a hash value for itself. A hash value is an Int value that is the same for all objects that compare equally, such that if a == b, it follows that a.hashValue == b.hashValue.*

//: Creating and Initializing an Empty Set
//: You can create an empty set of a certain type using initializer syntax:

var letters = Set<Character>()
print("letters is of type Set<Character> with \(letters.count) items.")

// adds a
letters.insert("a")
// empty
letters = []

//: The example below creates a set called favoriteGenres to store String values:
var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]

//: ### Accessing and Modifying a Set
print("I have \(favoriteGenres.count) favorite music genres.")

// check empty
if favoriteGenres.isEmpty {
    print("As far as music goes, I'm not picky.")
} else {
    print("I have particular music preferences.")
}

// insert
favoriteGenres.insert("Jazz")

// remove
let removedGenre = favoriteGenres.remove("Rock")

// contains
if favoriteGenres.contains("Jazz") {
    print("I get up on the good foot.")
}

//: ### Iterating Over a Set
// even sort
for genre in favoriteGenres.sort() {
    print("\(genre)")
}

//: ### Performing Set Operations
//:
//: You can efficiently perform fundamental set operations, such as combining two sets together, determining which values two sets have in common, or determining whether two sets contain all, some, or none of the same values.

//: *Fundamental Set Operations*
//: *The illustration below depicts two sets–a and b– with the results of various set operations represented by the shaded regions.*

image = UIImage(named: "SetOperations")
/*:
* Use the intersect(_:) method to create a new set with only the values common to both sets.
* Use the exclusiveOr(_:) method to create a new set with values in either set, but not both.
* Use the union(_:) method to create a new set with all of the values in both sets.
* Use the subtract(_:) method to create a new set with values not in the specified set.
*/

let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]

oddDigits.union(evenDigits).sort()

oddDigits.intersect(evenDigits).sort()

oddDigits.subtract(singleDigitPrimeNumbers).sort()

oddDigits.exclusiveOr(singleDigitPrimeNumbers).sort()

//: ### Set Membership and Equality
//: *The illustration below depicts three sets–a, b and c– with overlapping regions representing elements shared among sets. Set a is a superset of set b, because a contains all elements in b. Conversely, set b is a subset of set a, because all elements in b are also contained by a. Set b and set c are disjoint with one another, because they share no elements in common.*

image = UIImage(named: "setEulerDiagram")

/*:
* Use the “is equal” operator (==) to determine whether two sets contain all of the same values.
* Use the isSubsetOf(_:) method to determine whether all of the values of a set are contained in the specified set.
* Use the isSupersetOf(_:) method to determine whether a set contains all of the values in a specified set.
* Use the isStrictSubsetOf(_:) or isStrictSupersetOf(_:) methods to determine whether a set is a subset or superset, but not equal to, a specified set.
* Use the isDisjointWith(_:) method to determine whether two sets have any values in common.
*/

let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]

houseAnimals.isSubsetOf(farmAnimals)

farmAnimals.isSupersetOf(houseAnimals)

farmAnimals.isDisjointWith(cityAnimals)




//: [Next](@next)
