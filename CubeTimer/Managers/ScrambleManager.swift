//
//  Scrumbles.swift
//  CubeTimer
//
//  Created by Ульяна Гритчина on 03.12.2022.
//

import Foundation

class ScrambleManager {
    
    static let instance = ScrambleManager()
    private init () { }
    
    let scramblesT = [
        "B2 U' F R2 B2 D2 F' L2 R2 U F2 D2 F' B' D R' B2 U2 D' B2",
        "D' F2 B' U2 L2 B U R2 D2 B' U2 R U' D' F2 B2 L F D U'",
        "R F' D' R2 D' R2 L B2 U' D L2 D' U' R B2 U R F' U2 D'",
        "F' R' B R F' L2 B2 U2 B2 D L' D2 L' B2 F' U' B' U2 D2 L2",
        "F2 B D' B' R' B D2 L R B U' D2 F U' L F' D' U' R' B2",
        "U D2 F' B2 D B2 L2 R2 F' B2 L D' R' F' D' L2 R' D' B L'",
        "R B L2 B' F L D U' L2 B R2 F B' U' F2 U L U' D2 F2",
        "B2 D' L B2 D B F' U2 B F2 L D' B' U2 F R' D F R D",
        "R2 U B L2 D2 R2 D2 L2 U F' U B2 F2 D L U2 R D2 L U",
        "B' L2 R2 F' D' L U D2 B L2 F2 D2 R' D L2 F' L' F' D2 U",
        "D' B2 F' D2 L U' R B' U2 D' B' L U B2 D' L R2 F2 L' F",
        "B' L D' F2 R F' R' U2 L' D' U' R' D' L2 U' F L R' F2 U2",
        "U F2 B' U2 R F R' L D R U2 R' U2 F2 U2 R' U2 R2 F' R2",
        "U B' U D F' U' B' R' U' L' B' F D' L B F R' F' R2 L",
        "R U' D2 R' D2 U' L' U R L D2 B L B' D U2 B2 F2 D U",
        "U F2 U' L F2 D2 B D2 U R' L F' D2 L2 U R2 D B L2 U2",
        "F2 R L F D2 F U' L B2 D2 F' U B2 R' U B' D2 L U R2",
        "F' U' D2 B2 R' U2 F' D2 B U2 L D R F B D' F2 R2 U' R'",
        "B U2 D' B L' F2 U R L D' F R' D' B' U D' L' U' F2 B'",
        "L' F2 L R' U2 D2 F2 L2 D U2 R2 L B2 U' F' D B' D' R B'",
        "B L B2 D L' F' L B' R2 L' U' F U D F B' L2 B L U2",
        "L' D L' D B2 D2 F2 D2 R' B' R2 D2 R L D F2 L D2 L2 D",
        "U D B R' B L2 D R L F' D2 B D2 U2 R2 B L2 R2 F R'",
        "R' B' F2 L U R L U L U2 R D2 L2 F B2 D' R B R D",
        "U B' D' R L F2 D' R B2 U' F' D2 U R2 U' F U' R' B' F",
        "F2 L F2 D' F R2 B' U2 F L2 D F' R D' F' R2 F2 R2 L' B",
        "B F' D' R2 L B F' D' B R2 B2 D' L R D' R' F' U D2 B",
        "L' U2 B2 D' B' F R' B2 R' F' U' R2 D F2 L2 U2 L' F2 R2 F",
        "B2 F2 D' L' F' U2 D' B' L' U' L B2 D2 U2 F2 R2 B R2 F U'",
        "L B R L2 F2 L' F2 D U2 B' D2 F2 R D' F2 L2 B2 F R B2"
    ]
    
    func getRandomScrambel() -> String {
        scramblesT.randomElement() ?? ""
    }
    
}
