
// Individual Players Dictionary

let player1: [String: Any] = [ "name": "Joe Smith", "height": 42, "experience": true, "guardians": "Jim and Jan Smith"]
let player2: [String: Any] = [ "name": "Jill Tanner", "height": 36, "experience": true, "guardians": "Clara Tanner"]
let player3: [String: Any] = [ "name": "Bill Bon", "height": 43, "experience": true, "guardians": "Sara and Jenny Bon"]
let player4: [String: Any] = [ "name": "Eva Gordon", "height": 45, "experience": false, "guardians": "Wendy and Mike Gordon"]
let player5: [String: Any] = [ "name": "Matt Gill", "height": 40, "experience": false, "guardians": "Charles and Sylvia Gill"]
let player6: [String: Any] = [ "name": "Kimmy Stein", "height": 41, "experience": false, "guardians": "Bill and Hillary Stein"]
let player7: [String: Any] = [ "name": "Sammy Adams", "height": 45, "experience": false, "guardians": "Jeff Adams"]
let player8: [String: Any] = [ "name": "Karl Saygan", "height": 42, "experience": true, "guardians": "Heather Bledsoe"]
let player9: [String: Any] = [ "name": "Suzane Greenberg", "height": 44, "experience": true, "guardians": "Henrietta Dumas"]
let player10: [String: Any] = [ "name": "Sal Dali", "height": 41, "experience": false, "guardians": "Gala Dali"]
let player11: [String: Any] = [ "name": "Joe Kavalier", "height": 39, "experience": false, "guardians": "Sam and Elaine Kavalier"]
let player12: [String: Any] = [ "name": "Ben Finkelstein", "height": 44, "experience": false, "guardians": "Aaron and Jill Finkelstein"]
let player13: [String: Any] = [ "name": "Diego Soto", "height": 41, "experience": true, "guardians": "Robin and Sarika Soto"]
let player14: [String: Any] = [ "name": "Cloe Alaska", "height": 47, "experience": false, "guardians": "David and Jamie Alaska"]
let player15: [String: Any] = [ "name": "Arnold Willis", "height": 43, "experience": false, "guardians": "Claire Willis"]
let player16: [String: Any] = [ "name": "Phillip Helm", "height": 44, "experience": true, "guardians": "Thomas Helm and Elva Jones"]
let player17: [String: Any] = [ "name": "Les Clay", "height": 42, "experience": true, "guardians": "Wynona Brown"]
let player18: [String: Any] = [ "name": "Herschel Krustofski", "height": 45, "experience": true, "guardians": "Hyman and Rachel Krustofski"]

// Collection of all players

let players = [player1, player2, player3, player4, player5, player6, player7, player8, player9, player10, player11, player12, player13, player14, player15, player16, player17, player18]

// Declaring emptyarrays
var experiencedPlayers: [String] = []
var inexperiencedPlayers: [String] = []
var teamDragons: [String] = []
var teamSharks: [String] = []
var teamRaptors: [String] = []
var reserveTeam: [String] = []
var teamsInLeague = [teamDragons, teamSharks, teamRaptors]
var errorPlayers: [String] = []

// Sorting players by experience
for player in players {
    // Saving name, experience
    let playerName = player["name"]as! String
    let playerExperience = player["experience"]as! Bool
    
    
    // Appending name to experienced, inexperienced, error arrays
    if playerExperience == true {
        experiencedPlayers.append(playerName)
    } else if playerExperience == false {
        inexperiencedPlayers.append(playerName)
    } else {
        errorPlayers.append(playerName)
    }
}

// Sorting Experienced and Inexperienced players into balanced teams by experience (teams are total 6 players)

// Counting items in the players array
let numberOfTeams = teamsInLeague.count
let maxExpPlayers = (experiencedPlayers.count / numberOfTeams) - 1
let maxInexpPlayers = (inexperiencedPlayers.count / numberOfTeams) + maxExpPlayers

// Move experienced players to team
for expPLayer in experiencedPlayers {
    
    if teamDragons.count <= maxExpPlayers {
        teamDragons.append(expPLayer)
    } else if teamSharks.count <= maxExpPlayers {
        teamSharks.append(expPLayer)
    } else if teamRaptors.count <= maxExpPlayers {
        teamRaptors.append(expPLayer)
    } else {
        reserveTeam.append(expPLayer)
    }
}

// Move Inexperienced players to team
for inexpPlayer in inexperiencedPlayers {
    
    if teamDragons.count <= maxInexpPlayers {
        teamDragons.append(inexpPlayer)
    } else if teamSharks.count <= maxInexpPlayers {
        teamSharks.append(inexpPlayer)
    } else if teamRaptors.count <= maxInexpPlayers {
        teamRaptors.append(inexpPlayer)
    } else {
        reserveTeam.append(inexpPlayer)
    }
}

// Declarations for Guardian name dictionary and generating letters
var letters: [String] = []
var playerAndGuardians: [String: String] = [:]
var teamName = ""
var practiceTime = ""
var playersOnTeam: [String] = []
var playerName = ""
var guardianName = ""
var letter = ""

// Create dictionary with key value pairs Player Name : Guardian Name
for player in players {
    
    let playerName = player["name"]as! String
    let playerGuardian = player["guardians"]as! String
    playerAndGuardians[playerName] = playerGuardian
}

// Function for letter
func composeLetter() -> String {
    
    for player in playersOnTeam {
        playerName = player
        guardianName = playerAndGuardians[playerName]!
        letter = "Hello \(guardianName)! We're happy that \(playerName) will play in the league this season as part of the \(teamName). The first practice is \(practiceTime). See you there!"
        letters.append(letter)
        print(letter)
    }
    return letter
}

// Compose Dragon letter
playersOnTeam = teamDragons
teamName = "Dragons"
practiceTime = "March 17, at 1pm"
composeLetter()

// Compose Shark letter
playersOnTeam = teamSharks
teamName = "Sharks"
practiceTime = "March 17, at 3pm"
composeLetter()

// Compose Raptor letter
playersOnTeam = teamRaptors
teamName = "Raptors"
practiceTime = "March 18, at 1pm"
composeLetter()
