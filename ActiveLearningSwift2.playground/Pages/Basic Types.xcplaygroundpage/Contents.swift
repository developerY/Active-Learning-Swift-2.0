//: ## Basic Types
//:
//: A _constant_ is a value that stays the same after it’s declared the first time, while a _variable_ is a value that can change. A constant is referred to as immutable, meaning that it can’t be changed, and a variable is mutable. If you know that a value won’t need to be changed in your code, declare it as a constant instead of a variable.
//:
//: Use `let` to make a constant and `var` to make a variable.
//:
var myVariable = 42
myVariable = 50
let myConstant = 42

//: Every constant and variable in Swift has a type, but you don’t always have to write the type explicitly. Providing a value when you create a constant or variable lets the compiler infer its type. In the example above, the compiler infers that `myVariable` is an integer because its initial value is an integer. This is called _type inference_. Once a constant or variable has a type, that type can’t be changed.
//:
//: If the initial value doesn’t provide enough information (or if there is no initial value), specify the type by writing it after the variable, separated by a colon.
//:
let implicitInteger = 70
let implicitDouble = 70.0
let explicitDouble: Double = 70

//: > **Experiment**:
//: > In Xcode, Option-click the name of a constant or variable to see its inferred type. Try doing that with the constants in the code above.
//:
//: Values are never implicitly converted to another type. If you need to convert a value to a different type, explicitly make an instance of the desired type. Here, you convert an `Int` to a `String`.
//:
let label = "The width is "
let width = 94
let widthLabel = label + String(width)

//: Constant & Variable names cannot contain any mathematical symbols, arrows private-use (or
//: invalid) Unicode code points or line-and-box drawing characters. Nor can they begin with a
//: number. Otherwise, it's open season for naming your variables! (yes, really!)
//:
//: Here are some oddly named, but perfectly valid, constants:
let 你好 = "你好世界"
let 🐶🐮 = "dogcow"
var dogcow = "🐶🐮"
dogcow = 🐶🐮

let π = 3.14159
print(π)
let pie = "π"
print(pie, appendNewline: true)



//: > **Experiment**:
//: > Try removing the conversion to `String` from the last line. What error do you get?
//:
//: There’s an even simpler way to include values in strings: Write the value in parentheses, and write a backslash (`\`) before the parentheses. This is known as _string interpolation_.
//:
let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples."
let fruitSummary = "I have \(apples + oranges) pieces of fruit."


//: ## Type Alias

typealias AudioSample = UInt16
var maxAmplitudeFound = AudioSample.min


//: Swift has a basic Boolean type, called Bool. Boolean values are referred to as logical, because they can only ever be true or false. Swift provides two Boolean constant values, true and false:

let orangesAreOrange = true
let turnipsAreDelicious = false

/*
Type Safety and Type Inference

Swift is a type safe language. A type safe language encourages you to be clear about the types of values your code can work with. If part of your code expects a String, you can’t pass it an Int by mistake.

Because Swift is type safe, it performs type checks when compiling your code and flags any mismatched types as errors. This enables you to catch and fix errors as early as possible in the development process.

Type-checking helps you avoid errors when you’re working with different types of values. However, this doesn’t mean that you have to specify the type of every constant and variable that you declare. If you don’t specify the type of value you need, Swift uses type inference to work out the appropriate type. Type inference enables a compiler to deduce the type of a particular expression automatically when it compiles your code, simply by examining the values you provide.

Because of type inference, Swift requires far fewer type declarations than languages such as C or Objective-C. Constants and variables are still explicitly typed, but much of the work of specifying their type is done for you.
    
    Type inference is particularly useful when you declare a constant or variable with an initial value. This is often done by assigning a literal value (or literal) to the constant or variable at the point that you declare it. (A literal value is a value that appears directly in your source code, such as 42 and 3.14159 in the examples below.)

For example, if you assign a literal value of 42 to a new constant without saying what type it is, Swift infers that you want the constant to be an Int, because you have initialized it with a number that looks like an integer:*/

let meaningOfLife = 42
// meaningOfLife is inferred to be of type Int
// Likewise, if you don’t specify a type for a floating-point literal, Swift infers that you want to create a Double:

let pi = 3.14159
// pi is inferred to be of type Double


//: A decimal number, with no prefix
//: A binary number, with a 0b prefix
//: An octal number, with a 0o prefix
//: A hexadecimal number, with a 0x prefix
//: All of these integer literals have a decimal value of 17:
//: Integer literals can be written as:

let decimalInteger = 17
let binaryInteger = 0b10001       // 17 in binary notation
let octalInteger = 0o21           // 17 in octal notation
let hexadecimalInteger = 0x11     // 17 in hexadecimal notation


//:
//: ## Tuples 
//: are groups of values combined into a single, compound value
//: ------------------------------------------------------------------------------------------------

//: Defining a Tuple - use parenthesis around the comma-delimited list of values
//:
//: This Tuple doesn't specify types, so it relies on inference
let httpError404 = (404, "Not found")

//: We can also specify the type in order to avoid inferrence
let someOtherTuple = (Double(100), Bool(false))

//: Decomposing typles looks like this
let (statusCode, statusMessage) = httpError404
statusCode
statusMessage

//: We can also decompose into variables instead of constants, but you probably figured that out
var (varStatusCode, varStatusMessage) = httpError404
varStatusCode
varStatusMessage

//: You can also access them with the dot operator followed by their index:
httpError404.0
httpError404.1

//: Alternatively, you can name the elements of a Tuple
let namedTuple = (statusCode: 404, message: "Not found")

//: When you name the elements you effectively assign names to their indices, so the dot operator
//: works with names or integers:
namedTuple.statusCode == namedTuple.0
namedTuple.message == namedTuple.1

//: not just two valuse ... but any number of valuse
let mutlVal = ("one ", 1, "two", 2 , "ect ..." , true)
mutlVal.5

//: ## Optionals
//: Use optionals to work with values that might be missing. An optional value either contains a value or contains `nil` (no value) to indicate that a value is missing. Write a question mark (`?`) after the type of a value to mark the value as optional.
//:
let optionalInt: Int? = 9

//: To get the underlying type from an optional, you _unwrap_ it. You’ll learn unwrapping optionals later, but the most straightforward way to do it involves the _force unwrap operator_ (`!`). Only use the unwrap operator if you’re sure the underlying value isn’t `nil`.
//:
let actualInt: Int = optionalInt!

//: Optionals are pervasive in Swift, and are very useful for many situations where a value may or may not be present. They’re especially useful for attempted type conversions.
//:
var myString = "7"
var possibleInt = Int(myString)
print(possibleInt)

//: In this code, the value of `possibleInt` is `7`, because `myString` contains the value of an integer. But if you change `myString` to be something that can’t be converted to an integer, `possibleInt` becomes `nil`.
//:
myString = "banana"
possibleInt = Int(myString)
print(possibleInt)

//: 
//:
//: An array is a data type that keeps track of an ordered collection of items. Create arrays using brackets (`[]`), and access their elements by writing the index in brackets. Arrays start at index `0`.
//:
var ratingList = ["Poor", "Fine", "Good", "Excellent"]
ratingList[1] = "OK"
ratingList

//: To create an empty array, use the initializer syntax. You’ll learn more about initializers in a little while.
//:
// Creates an empty array.
let emptyArray = [String]()

//: You’ll notice that the code above has a comment. A _comment_ is a piece of text in a source code file that doesn’t get compiled as part of the program but provides context or useful information about individual pieces of code. A single-line comment appears after two slashes (`//`) and a multiline comment appears between a set of slashes and asterisks (`/*` … `*/`). You’ll see and write both types of comments throughout the source code in the lessons.
//:
//: An _implicitly unwrapped optional_ is an optional that can also be used like a nonoptional value, without the need to unwrap the optional value each time it’s accessed. This is because an implicitly unwrapped optional is assumed to always have a value after that value is initially set, although the value can change. Implicitly unwrapped optional types are indicated with an exclamation mark (`!`) instead of a question mark (`?`).
//:
var implicitlyUnwrappedOptionalInt: Int!

//: You’ll rarely need to create implicitly unwrapped optionals in your own code. More often, you’ll see them used to keep track of outlets between an interface and source code (which you’ll learn about in a later lesson) and in the _APIs_ you’ll see throughout the lessons.
//:
//: [Previous](@previous) | [Next](@next)
