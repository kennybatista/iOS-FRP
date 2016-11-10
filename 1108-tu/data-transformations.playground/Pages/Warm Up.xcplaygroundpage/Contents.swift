//: [Next](@next)
/*:
 
 ### Challenges
 
 Write the following functions:
 
 1. `makeAllUppercase` that takes an array of `String`s and returns an array of `String`s; all the strings in the returned array should only contain uppercase characters
 2. `convertAllToString` that takes an array of `Int`s and returns an array of `String`s where every `Int` was transformed to a `String`
 3. `keepOnlyOdds` that takes an array of `Int`s and returns an array of `Int`s that only has odd numbers
 4. `startingWithA` that takes an array of `String`s and returns an array of `String`s that only contains `String`s that start with the (uppercase) letter `A`
 5. `computeProduct` that takes an array of `Int`s and returns a single `Int` that is the product of all the elements in the array
 6. `concatenateAll` that takes an array of `String`s and returns a `String` that is concatenates all the elements in the array
 
 */




// 1 - makeAllUppercase

// Here we have function that takes an array of strings, it also takes in a stirng and return a string
func makeAllUpperCase(arrayOfString: [String]) -> [String]{
    
    var capitalLetterWords = [""]
    for word in arrayOfString {
        capitalLetterWords.append(word.uppercased())
    }
    return capitalLetterWords
}
makeAllUpperCase(arrayOfString: ["kenny","is","a","hero"])







// 2 - convertAllToString

func convertAllToString(arrayOfInts: [Int]) -> [String]{
    var newStringArray = [""]
    for integer in arrayOfInts {
        newStringArray.append(String(integer))
    }
    return newStringArray
}
convertAllToString(arrayOfInts: [1,2,3,4,5])


// 3 - keepOnlyOdds that takes an array of Ints and returns an array of Ints that only has odd numbers
func keepOnlyOdds(arrayOfInts: [Int]) -> [Int] {
    var oddInts: [Int] = []
    let greaterThanZero = 0
    for integer in arrayOfInts {
        if integer % 2 != 0 {
            oddInts.append(integer)
        }
    }
    return oddInts
}

keepOnlyOdds(arrayOfInts: [2,5,3,5,2])




// 4 - startingWithA that takes an array of Strings and returns an array of Strings that only contains Strings that start with the (uppercase) letter A

func startingWithA(wordsArray: [String]) -> [String] {
    var capitalAWords: [String] = []
    
    for word in wordsArray {
        if word.characters.first == "A" {
            capitalAWords.append(word)
        }
    }
    return capitalAWords
}

startingWithA(wordsArray: ["Kenny","AirBnB","John","David","Apple","Ape"])

// 5 - computeProduct that takes an array of Ints and returns a single Int that is the product of all the elements in the array
func computeProduct(arrayOfIntegers: [Int]) -> Int {
    var integers = 1
    
    for int in arrayOfIntegers {
        // it's multiplying the value inside of integers * int and then stored in integers
        // then on the next iteratation
        integers = integers * int
    }
    
    
    return integers
}

computeProduct(arrayOfIntegers: [1,2,3,4])


// 6 - concatenateAll that takes an array of Strings and returns a String that is concatenates all the elements in the array

func concatenateAll(arrayOfStrings: [String]) -> String {
    //    var joiner = ""
    //    for value in arrayOfStrings {
    //        joiner += value
    //    }
    
    // OR
    
    let joiner = ""
    let joinedArray = arrayOfStrings.joined(separator: joiner)
    return joinedArray
}

concatenateAll(arrayOfStrings: ["k","e","n","n","y"])




