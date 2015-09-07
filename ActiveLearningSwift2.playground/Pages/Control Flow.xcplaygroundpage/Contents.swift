import UIKit

//: ## Control Flow
//: Swift provides all the familiar control flow statements from C-like languages. These include *for and while loops* to perform a task multiple times; *if, guard, and switch statements* to execute different branches of code based on certain conditions; and statements such as *break* and *continue* to transfer the flow of execution to another point in your code.

//: In addition to the traditional for loop found in C, Swift adds a for-in loop that makes it easy to iterate over arrays, dictionaries, ranges, strings, and other sequences.

//: Swift’s switch statement is also considerably more powerful than its counterpart in C. The cases of a switch statement do not “fall through” to the next case in Swift, avoiding common C errors caused by missing break statements. Cases can match many different patterns, including interval matches, tuples, and casts to a specific type. Matched values in a switch case can be bound to temporary constants or variables for use within the case’s body, and complex matching conditions can be expressed with a where clause for each case.

//: ## For Loops

//: Swift provides two kinds of loop that perform a set of statements a certain number of times:
/*: 
* The *for-in* loop performs a set of statements *for* each item *in* a sequence.
* The *for* loop performs a set of statements until a specific condition *is* met, typically by incrementing a counter each time the loop ends.
*/

//: For-In
//: You use the for-in loop to iterate over a sequence, such as ranges of numbers, items in an array, or characters in a string.

//: This example prints the first few entries in the five-times-table: (inclusive)
for index in 1...9 {
    print("\(index) times 5 is \(index * 5)")
}

//: If you don’t need each value from a sequence, you can ignore the values by using an underscore in place of a variable name:
let base = 3
let power = 10
var answer = 1
for _ in 1...power {
    answer *= base
}
print("\(base) to the power of \(power) is \(answer)")

//: interate over an array
let names = ["Anna", "Alex", "Brian", "Jack"]
for name in names {
    print("Hello, \(name)!")
}

//: Each item in the dictionary is returned as a (key, value) tuple when the dictionary is iterated
let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
for (animalName, legCount) in numberOfLegs {
    print("\(animalName)s have \(legCount) legs")
}

// We can use an underscore if you don't need access to the loop constant:
for _ in 1...10
{
    print("do something")
}




//: ### For
//: In addition to *for-in* loops, Swift supports traditional C-style *for* loops with a condition and an incrementer:

/*//: ![Icon for a playground](for_loop.png "for loop")*/
let imageFor = UIImage(named: "for_loop.png")


//: Semicolons separate the three parts of the loop’s definition, as in C. However, unlike C, Swift doesn’t need parentheses around the entire “initialization; condition; increment” block.

//: The loop is executed as follows:
/*:
1. When the loop is first entered, the initialization expression is evaluated once, to set up any constants or variables that are needed for the loop.
2. The condition expression is evaluated. If it evaluates to false, the loop ends, and code execution continues after the for loop’s closing brace (}). If the expression evaluates to true, code execution continues by executing the statements inside the braces.
3.  After all statements are executed, the increment expression is evaluated. It might increase or decrease the value of a counter, or set one of the initialized variables to a new value based on the outcome of the statements. After the increment expression has been evaluated, execution returns to step 2, and the condition expression is evaluated again.
*/

var idx: Int
for idx = 0; idx < 3; ++idx {
    print("index is \(idx)")
}

//:  ## While Loops
/*:A while loop performs a set of statements until a condition becomes false. These kinds of loops are best used when the number of iterations is not known before the first iteration begins. Swift provides two kinds of while loop:

* while evaluates its condition at the start of each pass through the loop.
* repeat-while evaluates its condition at the end of each pass through the loop.
*/

//: ------------------------------------------------------------------------------------------------
//: ## While loops
//:
//: While loops resemble other C-like languages. They perform the condition before each iteration
//: through the loop:

let imageWhile = UIImage(named: "while.png")

let finalSquare = 25
var board = [Int](count: finalSquare + 1, repeatedValue: 0)
// setup shoots and ladders
board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08

var square = 0
var diceRoll = 0
while square < finalSquare {
    // roll the dice
    if ++diceRoll == 7 { diceRoll = 1 }
    // move by the rolled amount
    square += diceRoll
    if square < board.count {
        // if we're still on the board, move up or down for a snake or a ladder
        square += board[square]
    }
}
print("Game over!")

//: **There is no Do loop, use repeat while**
/*
do
{
    ++index
} while (index < 3)
*/

//: ## Repeat-While
//:  The other variation of the *while loop*, known as the *repeat-while* loop, performs a single pass through the loop block first, before considering the loop’s condition. It then continues to repeat the loop until the condition is false.
//: *NOTE:*
//: The repeat-while loop in Swift is analogous to a do-while loop in other languages.

let imageRepeat = UIImage(named: "repeat.png")

//: The loop’s condition (while square < finalSquare) is the same as before, but this time it is not evaluated until the end of the first run through the loop. The structure of the repeat-while loop is better suited to this game than the while loop in the previous example. In the repeat-while loop above, square += board[square] is always executed immediately after the loop’s while condition confirms that square is still on the board. *This behavior removes the need for the array bounds check seen in the earlier version of the game.*


// reset and use the repeat loop
square = 0
diceRoll = 0
repeat {
    // move up or down for a snake or ladder
    square += board[square]
    // roll the dice
    if ++diceRoll == 7 { diceRoll = 1 }
    // move by the rolled amount
    square += diceRoll
} while square < finalSquare
print("Game over!")


//: ## Switch
//:
//: *A switch statement considers a value and compares it against several possible matching patterns. It then executes an appropriate block of code, based on the first pattern that matches successfully. A switch statement provides an alternative to the if statement for responding to multiple potential states.*
//:
//: In its simplest form, a switch statement compares a value against one or more values of the same type:
let imageSwitch = UIImage(named: "switch.jpg")


//: Switch statements are more powerful than their C-like counterparts. Here are a few of those
//: differences to get us started:
/*:
* Unlike C-like languages, switch statements do not require a "break" statement to prevent falling through to the next case.
* Additionally, multiple conditions can be separated by a comma for a single case to match multiple conditions.
* Switch statements must also be exhaustive and include all possible values, or the compiler will generate an error.
*/

let someCharacter: Character = "e"
switch someCharacter
{
case "a", "e", "i", "o", "u":
    "a vowel"
    
case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p", "q", "r", "s", "t", "v", "w", "x", "u", "z":
    "a consonant"
    
    // Necessary because switch statements must be exhaustive in order to capture all Characters
default:
    "not a vowel or consonant"
}

//: *No Implicit Fallthrough*

//: In contrast with switch statements in C and Objective-C, switch statements in Swift do not fall through the bottom of each case and into the next one by default. Instead, the entire switch statement finishes its execution as soon as the first matching switch case is completed, without requiring an explicit break statement. This makes the switch statement safer and easier to use than in C, and avoids executing more than one switch case by mistake.

// let anotherCharacter: Character = "a"
/*
switch anotherCharacter
 {
		case "a":
		case "A":
			"the letter a"
		default:
			"not the letter a"
 }
*/

//: *Interval Matching*

//: Values in switch cases can be checked for their inclusion in an interval. This example uses number intervals to provide a natural-language count for numbers of any size:
// We can perform range matching for cases:
let count = 3_000_000_000_000
switch count
{
case 0:
    "no"
case 1...3:
    "a few"
case 4...9:
    "several"
case 10...99:
    "tens of"
case 100...999:
    "hundreds of"
case 1000...999999:
    "thousands of"
default:
    "millions and millions of"
}

//: *Matching against tuples*
//:
//: In addition to matching Tuples, we can also use ranges inside Tuple values and even match
//: against partial Tuple values by using an "_" to ignore matches against a specific value within
//: the Tuple.
let somePoint = (1,1)
switch somePoint
{
case (0,0):
    "origin"
    
    // Match only against y=0
case (_, 0):
    "On the X axis"
    
    // Match only against x=0
case (0, _):
    "On the y axis"
    
    // Match x and y from -2 to +2 (inclusive)
case (-2...2, -2...2):
    "On or inside the 2x2 box"
    
    // Everything else
default:
    "Outisde the 2x2 box"
}

//: *Value bindings in switch statements*
//:
var anotherPoint = (2, 8)
switch anotherPoint
{
    // Bind 'x' to the first value (matching any x) of the tuple and match on y=0
case (let x, 0):
    "On the x axis with an x value of \(x)"
    
    // Bind 'y' to the second value (matching any y) of the tuple and match against x=0
case (0, let y):
    "On the y axis with an y value of \(y)"
    
    // Bind both values of the tuple, matching any x or y. Note the shorthand of the 'let'
    // outside of the parenthesis. This works with 'var' as well.
    //
    // Also notice that since this matches any x or y, we fulfill the requirement for an exhaustive
    // switch.
case let (x, y):
    "Somewhere else on \(x), \(y)"
}

//: We can also mix let/var for case statements. The following code block is the same as the
//: previous except that the final case statement, which mixes variable and constants for the x and
//: y components of the Tuple.
switch anotherPoint
{
case (let x, 0):
    "On the x axis with an x value of \(x)"
    
case (0, let y):
    "On the y axis with an y value of \(y)"
    
case (var x, let y):
    ++x // We can modify the variable 'x', but not the constant 'y'
    "Somewhere else on \(x), \(y)"
}

//: *Where clauses* allow us to perform more detailed conditions on case conditions. The where clauses
//: work on the values declared on the case line:
let yetAnotherPoint = (1, -1)
switch yetAnotherPoint
{
case let (x, y) where x == y:
    "On the line of x == y"
    
case let (x, y) where x == -y:
    "On the line of x == -y"
    
case let (x, y):
    "Just some arbitrary point"
}

//: *Control Transfer Statements*
//:
//: Control transfer statements change the order in which your code is executed, by transferring control from one piece of code to another. Swift has five control transfer statements:
/*:
* continue
* break
* fallthrough
* return
* throw
*/

// continue
let puzzleInput = "great minds think alike"
var puzzleOutput = ""
for character in puzzleInput.characters {
    switch character {
    case "a", "e", "i", "o", "u", " ":
        continue
    default:
        puzzleOutput.append(character)
    }
}
print(puzzleOutput)

// break
let numberSymbol: Character = "三"  // Simplified Chinese for the number 3
var possibleIntegerValue: Int?
switch numberSymbol {
case "1", "١", "一", "๑":
    possibleIntegerValue = 1
case "2", "٢", "二", "๒":
    possibleIntegerValue = 2
case "3", "٣", "三", "๓":
    possibleIntegerValue = 3
case "4", "٤", "四", "๔":
    possibleIntegerValue = 4
default:
    break
}
if let integerValue = possibleIntegerValue {
    print("The integer value of \(numberSymbol) is \(integerValue).")
} else {
    print("An integer value could not be found for \(numberSymbol).")
}

//:  ## Early Exit Swift 2.0

//: A *guard* statement, like an *if* statement, executes statements depending on the Boolean value of an expression. You use a guard statement to require that a condition must be true in order for the code after the guard statement to be executed. Unlike an if statement, a guard statement always has an else clause—the code inside the else clause is executed if the condition is not true.

func greet(person: [String: String]) {
    guard let name = person["name"] else {
        return
    }
    
    print("Hello \(name)!")
    
    guard let location = person["location"] else {
        print("I hope the weather is nice near you.")
        return
    }
    
    print("I hope the weather is nice in \(location).")
}

greet(["name": "John"])
greet(["name": "Jane", "location": "Cupertino"])

//: If the guard statement’s condition is met, code execution continues after the guard statement’s closing brace. Any variables or constants that were assigned values using an optional binding as part of the condition are available for the rest of the code block that the guard statement appears in.

//: If that condition is not met, the code inside the else branch is executed. That branch must transfer control to exit the code block that that guard statement appears in. It can do this with a control transfer statement such as return, break, continue, or throw, or it can call a function or method that doesn’t return, such as fatalError().

//: Using a guard statement for requirements improves the readability of your code, compared to doing the same check with an if statement. It lets you write the code that’s typically executed without wrapping it in an else block, and it lets you keep the code that handles a violated requirement next to the requirement.


//: ## Checking API Availability

//: Swift has built-in support for checking API availability, which ensures that you don’t accidentally use APIs that are unavailable on a given deployment target.

//: The compiler uses availability information in the SDK to verify that all of the APIs used in your code are available on the deployment target specified by your project. Swift reports an error at compile time if you try to use an API that isn’t available.

if #available(iOS 9, OSX 10.10, *) {
    // Use iOS 9 APIs on iOS, and use OS X v10.10 APIs on OS X
} else {
    // Fall back to earlier iOS and OS X APIs
}



//: [Previous](@previous) | [Next](@next)
