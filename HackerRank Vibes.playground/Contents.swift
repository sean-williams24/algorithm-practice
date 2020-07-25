import UIKit


var twoDimensionalArray: [[Int]] = [[0, 1], [2, 3]]


//for i in 0..<twoDimensionalArray.count {
//    for n in 0..<twoDimensionalArray[i].count {
//        print(twoDimensionalArray[i][n])
//    }
//}

// Greedy Algorithms

func minimumAbsoluteDifference(arr: [Int]) -> Int {
    let numArray = arr.sorted()
    var lowestAbsDiff = 0
    
    for (i, num) in numArray.enumerated() {
        
        let diff = abs(num - numArray[i + 1])
        
        if lowestAbsDiff == 0 {
            lowestAbsDiff = diff
        } else {
            if diff < lowestAbsDiff {
                lowestAbsDiff = diff
            }
        }
        
        if i + 2 >= numArray.count {
            return lowestAbsDiff
            print(lowestAbsDiff)
        }
    }
    
    print(lowestAbsDiff)
    return lowestAbsDiff
}
minimumAbsoluteDifference(arr: [3, -7, 0])


// Complete the minimumAbsoluteDifference function below.
//func minimumAbsoluteDifference(arr: [Int]) -> Int {
//    var numArray = arr
//    var pairArray: [[Int]] = []
//    var first = 0
//
//    while numArray.count > 1 {
//        for num in numArray {
//        if first == 0 {
//            first = num
//        } else {
//            pairArray.append([first, num])
//        }
//    }
//        print(pairArray)
//        first = 0
//        numArray.removeFirst(1)
//    }
//
//    var lowestAbsDiff = 0
//    for pair in pairArray {
//        let diff = abs(pair[0] - pair[1])
//
//        if lowestAbsDiff == 0 {
//            lowestAbsDiff = diff
//        } else {
//            if diff < lowestAbsDiff {
//                lowestAbsDiff = diff
//            }
//        }
//    }
//
//    print(lowestAbsDiff)
//    return lowestAbsDiff
//}



// LuckBalance

func luckBalance(k: Int, contests: [[Int]]) -> Int {
    var importantContests = [Int]()
    var luckValues = 0
    var badLuck = 0

    for arr in contests {
        if arr[1] == 1 {
            importantContests.append(arr[0])
        } else {
            luckValues += arr[0]
        }
    }

    let losableContests = importantContests.count - k
    importantContests.sort()

    for (i, luck) in importantContests.enumerated() {
        if i >= losableContests {
            luckValues += luck
        } else {
            badLuck += luck
        }
    }

    return luckValues - badLuck

}

//luckBalance(k: 2, contests: [[5,1], [4,0], [6,1], [2,1], [8,0]])
luckBalance(k: 3, contests: [[5,1], [2,1], [1,1], [8,1], [10,0], [5,0]])



// String manipulation

func alternatingCharacters(s: String) -> Int {
    var deletions = 0
    var prev = ""

    for letter in s {
        if prev == "" {
            prev = String(letter)
        } else {
            if prev == String(letter) {
                deletions += 1
            }
            prev = String(letter)
        }
    }
    print(deletions)
    return deletions
}

alternatingCharacters(s: "AAABBB")


var wordA = "abcdeffff"
var wordA2 = "abc"

func makeAnagram(a: String, b: String) -> Int {
    var word = a
    var word2 = b
    
    for letter in a {
        if let index = word2.firstIndex(of: letter) {
            word2.remove(at: index)
            if let indexA = word.firstIndex(of: letter) {
                word.remove(at: indexA)
            }
        }
    }
    
    return word.count + word2.count
}
    

makeAnagram(a: wordA, b: wordA2)

// Maximum Tiys - Sorting

func maximumToys(prices: [Int], k: Int) -> Int {
    let sortedPrices = prices.sorted()
    var count = 1
    var total = sortedPrices[0]

    for (i, price) in sortedPrices.enumerated() {
        if price < k && total + sortedPrices[i + 1] < k {
            if price == k {
                return 1
            } else {
                total += sortedPrices[i + 1]
                count += 1
            }
        } else {
            return count
        }
    }

    return count
}

// Bubble Sort

func countSwaps(a: [Int]) -> Void {
    var arr = a
    var i = 0
    var j = 1
    var swaps = 0
    var swapCount = 0

    repeat {
        swapCount = swaps
        
        repeat {
            if arr[i] > arr[j] {
                // Swap
                let num = arr.remove(at: i)
                arr.insert(num, at: j)
                swaps += 1
            }
            i += 1
            j += 1
        } while j < arr.count

        i = 0
        j = 1
        
    } while swapCount != swaps
    
    print("Array is sorted in \(swaps) swaps.")
    print("First Element: \(arr[0])")
    print("Last Element: \(arr.last!)")
    return
}


countSwaps(a: [2, 5, 6, 7, 1])
countSwaps(a: [1, 2, 4, 6, 8])

// Check Magazine

func checkMagazine(magazine: [String], note: [String]) -> Void {
    var dict: [String: Int] = [:]

    for word in magazine {
        if dict[word] == nil {
            dict[word] = 1
        } else {
            dict[word]! += 1
        }
        
    }
//    print(dict)
    for word in note {
        if dict[word] == nil || dict[word] == 0 {
            print("No")
            return
        } else {
            dict[word]! -= 1
        }
    }

    print("Yes")
}


checkMagazine(magazine: ["sean", "bello"], note: ["sean", "Bello"])

// Two Stings

func twoStrings(s1: String, s2: String) -> String {
    var dict: [String: String] = [:]

    for letter in s1 {
        dict[String(letter)] = String(letter)
    }

    for letter in s2 {
        if dict[String(letter)] != nil {
            print("YES")
            return "YES"
        }
    }
    print("NO")
    return "NO"
}

twoStrings(s1: "Hello", s2: "world")


// Left Rotation

var arr = [1, 2, 3, 4, 5]

func rotLeft(a: [Int], d: Int) -> [Int] {

    let first = a.dropLast(a.count - d)
    var newArray = Array(a.dropFirst(d))
    newArray.append(contentsOf: first)

    print(newArray)
    return newArray
}

rotLeft(a: arr, d: 3)


// Repeated Srings

func repeatedString(s: String, n: Int) -> Int {
    let repeats = n / s.count
    var aCount = 0

    for letter in s {
        if letter == "a" {
            aCount += 1
        }
    }
    aCount *= repeats
    let excess = n % s.count

    if excess != 0 {
        for (i, letter) in s.enumerated() {

            if letter == "a" {
                aCount += 1
            }

            if i + 1 == excess {
                break
            }
        }
    }


    print(aCount)
    return aCount
}


// Save The Prisoner

//func saveThePrisoner(n: Int, m: Int, s: Int) -> Int {
//    var beginLoop = s
//    var sweetCount = m
//
//    repeat {
//        for seat in beginLoop...n {
//            sweetCount -= 1
//
//            if sweetCount == 0 {
//                print(seat)
//                return seat
//            }
//        }
//        beginLoop = 1
//        print("Repeat")
//    } while sweetCount > 0
//
//    return 0
//}
2 % 5


func saveThePrisoner(n: Int, m: Int, s: Int) -> Int {

    let r = m % n
    if (r + s - 1) % n == 0 {
        return n
    } else {
        return (r + s - 1) % n
    }
}

//saveThePrisoner(n: 352926151, m: 380324688, s: 94730870)
saveThePrisoner(n: 5, m: 2, s: 1)
saveThePrisoner(n: 3, m: 7, s: 3)
saveThePrisoner(n: 7, m: 19, s: 2)
saveThePrisoner(n: 5, m: 2, s: 2)
//saveThePrisoner(n: 4, m: 6, s: 2)
//saveThePrisoner(n: 10, m: 10, s: 5)
//saveThePrisoner(n: 556065259, m: 615709967, s: 156417592)
//saveThePrisoner(n: 352926151, m: 380324688, s: 94730870)
saveThePrisoner(n: 94431605, m: 679262176, s: 5284458)




func beautifulDays(i: Int, j: Int, k: Int) -> Int {
    var count = 0
    var reversed = ""
    
    for day in i...j {
        let stri = String(day)
        reversed = String(stri.reversed())
        
        if let num = Int(reversed) {
            let diff = day - num
            if abs(diff) % k == 0 {
                count += 1
            }
        }
    }

    print(count)
    return count

}

beautifulDays(i: 20, j: 23, k: 6)



let twoDArray = [[4, 8, 2], [4, 5, 7], [6, 1, 6]]
var arrA = twoDArray[0]
//let sum = arrA.reduce(0) {$0 + $1}
//print(sum)


func formingMagicSquare(s: [[Int]]) -> Int {
    var arrA = s[0]
    var arrB = s[1]
    var arrC = s[2]

    let horizSumA = arrA.reduce(0) {$0 + $1}
    let horizSumB = arrB.reduce(0) {$0 + $1}
//    let horizSumC = arrC.reduce(0) {$0 + $1}

    
    func checkB() {
        var replacementNum = 0
        var tempArray: [Int] = []
        
        if horizSumB != 15 {
            // check array B[0]
            replacementNum = (15 - horizSumB) + arrB[0]
            tempArray = arrB
            print(replacementNum)
            tempArray.replaceSubrange(0...0, with: [replacementNum])
            
            if arrA[0] + tempArray[0] + arrC[0] == 15 {
                // Check array C
                arrB = tempArray
                
            } else {
                // check array B[1]
                replacementNum = (15 - horizSumB) + arrB[1]
                tempArray = arrB
                tempArray.replaceSubrange(1...1, with: [replacementNum])
                
                if arrA[0] + tempArray[1] + arrC[2] == 15 && arrA[2] + tempArray[1] + arrC[0] == 15 && arrA[1] + tempArray[1] + arrC[1] == 15 {
                    // Move onto array C
                    arrB = tempArray

                    
                } else {
                    // check array B[2]
                    replacementNum = (15 - horizSumB) + arrB[2]
                    tempArray = arrB
                    tempArray.replaceSubrange(2...2, with: [replacementNum])
                    
                    // check array C
                    arrB = tempArray

                    
                }
            }
        } else {
            // Check array C
        }
    }
    
    if horizSumA != 15 {
        // check array A[0]

        var replacementNum = (15 - horizSumA) + arrA[0]
        var tempArray = arrA
        tempArray.replaceSubrange(0..<1, with: [replacementNum])
        
        if tempArray[0] + arrB[0] + arrC[0] == 15 && tempArray[0] + arrB[1] + arrC[2] == 15 {
            // Move onto arrB
            arrA = tempArray
            checkB()
            
        } else {
            // check array A[1]
            replacementNum = (15 - horizSumA) + arrA[1]
            tempArray = arrA
            tempArray.replaceSubrange(1...1, with: [replacementNum])
            
            if tempArray[1] + arrB[1] + arrC[1] == 15  {
                // Move onto arrB
                arrA = tempArray
                checkB()
                
            } else {
                // check array A[2]
                replacementNum = (15 - horizSumA) + arrA[2]
                tempArray = arrA
                tempArray.replaceSubrange(2...2, with: [replacementNum])
                
                if tempArray[2] + arrB[2] + arrC[2] == 15 && tempArray[2] + arrB[1] + arrC[0] == 15 {
                    // Move onto arrB
                    arrA = tempArray
                    checkB()
                }
            }
        }
    } else {
        // Check array B
        checkB()
    }
    
    print(arrA)
    print(arrB)
    return 1
}

formingMagicSquare(s: twoDArray)


let cat = abs(20 - 10)

var count = -1

var belowSeaLevel = false {
    didSet {
        count += 1
    }
}

for char in "UDDUDU" {
    if char == "U" {
        belowSeaLevel = true
    }
}
print(count)


func pageCount(n: Int, p: Int) -> Int {
    var lowestTurns = 0

    for (turns, page) in stride(from: 1, to: n, by: 2).enumerated() {
        if p <= page {
            lowestTurns = turns
            break
        }
    }

    for (turns, page) in stride(from: n, to: 1, by: -2).enumerated() {
        print(page)
        print("TURNS: \(turns)")
        
        let newPage = page % 2 == 0 ? page : page - 1
        
        if p >= newPage {
            if turns < lowestTurns {
                lowestTurns = turns
                break
            }
        }
    }

    print(lowestTurns)
    return lowestTurns

}

pageCount(n: 9, p: 4)

let nums = [1, 1, 1, 3, 3, 2, 2, 1, 2, 3]

let group = Dictionary(grouping: nums, by: {$0.self})
print(group)

for item in group {
    print(item.value.count / 2)
}

func dayOfProgrammer(year: Int) -> String {
var dayOP = ""

// Julien calender
if year >= 1700 && year < 1918 {
    if year % 4 == 0 {
        dayOP = "12.09.\(year)"
    } else {
        dayOP = "13.09.\(year)"
    }

// Gregorian Calender
} else if year > 1918 {
    if (year % 4 == 0 && !(year % 100 == 0)) || year % 400 == 0 {
        dayOP = "12.09.\(year)"
    } else {
        dayOP = "13.09.\(year)"
    }


// Transition year
} else {
    dayOP = "31.08.\(year)"
}

print(dayOP)
return dayOP
}



let birds = [1, 2, 3, 4, 5, 4, 3, 2, 1, 3, 4]
let birds2 = [1, 4, 4, 4, 5, 3]

func migratoryBirds(arr: [Int]) -> Int {
    let array = arr
    var birdCounts: [Int:Int] = [:]

    for bird in array {
        
        if birdCounts == [:] {
            birdCounts[bird] = 0
        }

        if birdCounts.contains(where: {$0.key == bird}) {
            birdCounts[bird]! += 1
        } else {
            birdCounts[bird] = 1
        }
    }
    
    print(birdCounts)
    
    var topType: [Int: Int] = [:]
    var count: Int = 0

    for bird in birdCounts {
        if bird.value >= count {
            if topType.isEmpty {
                topType[bird.key] = bird.value
            } else {
                if topType.contains(where: {$0.value < bird.value}) {
                    topType.removeAll()
                    topType[bird.key] = bird.value
                } else {
                    topType[bird.key] = bird.value
                }
            }
        }
        count = bird.value
    }
    
    let max = birdCounts.values.max()
    print(max!)
    topType.keys.min()
    
    
    count = topType.first?.key ?? 0
    
    for bird in topType {
        if bird.key < count {
            count = bird.key
        }
    }
    print(count)
    return count
}

migratoryBirds(arr: birds2)


func divisibleSumPairs(n: Int, k: Int, ar: [Int]) -> Int {
    var i = ar.first!
    var arr = ar
    arr.removeFirst(1)
    var pairs = 0

    for _ in 1...5 {
        print("HEY")
        for j in arr {
            print(i, j)
            if (i + j) % k == 0 {
                print("ADDED")
                pairs += 1
            }
        }
        i = arr[0]
        arr.removeFirst(1)
    }

    print(pairs)
    return pairs
}

let ar = [1, 3, 2, 6, 1, 2]

divisibleSumPairs(n: 6, k: 3, ar: ar)

for _ in 0..<1 {
    print("BELLO")
}

57 % 2 == 0

16 % 3 == 0

1 % 2 == 0

2 % 4 == 0

var set1: Set<Int> = []

set1.insert(3)
set1.insert(3)
set1.insert(3)

print(set1)


func kangaroo(x1: Int, v1: Int, x2: Int, v2: Int) -> String {
    
    var kangA = x1
    var kangB = x2
    
    if x2 >= x1 && v2 > v1 {
        return "NO"
    } else if x2 > x1 && v2 == v1 {
        return "NO"
    } else if x2 > x1 && v2 < v1 {
        repeat {
            kangA += v1
            kangB += v2
            
            if kangA == kangB {
                return "YES"
            }
        } while kangB > kangA
        return "NO"
        
    } else if x2 < x1 && v2 < v1 {
        return "NO"
    } else if x2 < x1 && v2 > v1 {
        return "YES"
    } else if x2 < x1 && v2 == v1 {
        return "NO"
    } else if x2 == x1 && v2 < v1 {
        return "NO"
    } else if x2 == x1 && v1 == v2 {
        return "YES"
    } else {
        return "NO"
    }
}

kangaroo(x1: 0, v1: 3, x2: 4, v2: 2)


let oranges = [5, -6]

var div = [true, true]
div.remove(at: 0)
print(div)
div.remove(at: 0)
print(div)
if !div.contains(false) {
    print("hi")
}

var oPositions: [Int] = []
for orange in oranges {
    oPositions.append(15 + orange)
}
print(oPositions)

//oPositions = oPositions.filter() { $0 == 9 }
//print(oPositions)

let range = 9...20
for pos in oPositions.reversed() {
    if !range.contains(pos) {
        oPositions.removeFirst(1)
    }
}
print(oPositions)

var time = "12:40:30PM"
time.removeLast(2)

//let startIndex = time.startIndex
//let endIndex = time.index(startIndex, offsetBy: 2)
//let range = Range(uncheckedBounds: (startIndex, endIndex))

let end = time.index(time.startIndex, offsetBy: 2)
let range = time.startIndex..<end


var hour = time.prefix(2)
var numberHour = Int(hour)!
numberHour += 12

3 <= 4

var stringHour = String(numberHour)

if stringHour == "24" {
    stringHour = "00"
}

time.replacingCharacters(in: range, with: stringHour)
time.replaceSubrange(time.startIndex..<end, with: stringHour)





func birthdayCakeCandles(ar: [Int]) -> Int {
    guard var candle = ar.first else { return 0}
    
    
    for num in ar {
        if num > candle {
            print(candle)
            print(num)
            candle = num
        }
    }
    print(candle)

//    let tallCandles = ar.filter() { $0 == candle}
    
    var tallCandles = [Int]()
    for can in ar {
        if can == candle {
            tallCandles.append(can)
        }
    }
    print(tallCandles)
    
    return tallCandles.count
}

birthdayCakeCandles(ar: [18, 90, 90, 13, 90, 75, 90, 8, 90, 43])




func staircase(n: Int) -> Void {
    var str = ""
    let space = " "
    let hash = "#"
    var amountOfSpaces = n
    var amountOfHashes = 1

    amountOfSpaces -= 1

    for _ in 1...n {
        for _ in 0..<amountOfSpaces {
                str += space
            }

            for _ in 1...amountOfHashes {
                str += hash
            }

            print(str)
            amountOfSpaces -= 1
            amountOfHashes += 1
//            print(amountOfSpaces)
//            print(amountOfHashes)
            str = ""
    }
}

staircase(n: 100)

