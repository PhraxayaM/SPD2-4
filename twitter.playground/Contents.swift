import UIKit

var str = "Hello, playground"

func suggestUsernames(userHandle: String, handles: [String], k: Int) -> [[String]]{
    var finalResult: [[String]] = []
    let userSet = Set(userHandle)
    var usernameSimilarityDict: [Int: [String]] = [:]
    for username in handles {
        let usernameSet = Set(username)
        var score = usernameSet.intersection(userSet).count
        score -= usernameSet.symmetricDifference(userSet).count
        if usernameSimilarityDict[score] != nil {
            usernameSimilarityDict[score]?.append(username)
        } else {
            usernameSimilarityDict[score] = [username]
        }
    }
    let sortedScores = usernameSimilarityDict.keys.sorted { $0 > $1 }
    for i in 0...k - 1 {
        finalResult.append(usernameSimilarityDict[sortedScores[i]]!)
    }
    return finalResult
}


