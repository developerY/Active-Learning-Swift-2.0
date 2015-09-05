//: [Previous](@previous)

import UIKit


              let button = UIButton()


let filledStarImage = UIImage(named: "filledStar")
let emptyStarImage = UIImage(named: "emptyStar")

let buttonr = UIButton(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
buttonr.backgroundColor = UIColor.redColor()

            button.setImage(emptyStarImage, forState: .Normal)
            button.setImage(filledStarImage, forState: .Selected)
            button.setImage(filledStarImage, forState: [.Highlighted, .Selected])
            
            button.adjustsImageWhenHighlighted = false
            
            //button.addTarget(self, action: "ratingButtonTapped:", forControlEvents: .TouchDown)
            //ratingButtons += [button]

let test = 1;

if test == 1 {
    print ("hi");
    
}

//: [Next](@next)
