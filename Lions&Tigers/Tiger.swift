//
//  Tiger.swift
//  LionsAndTigers
//
//  Created by Vacano on 12/11/14.
//  Copyright (c) 2014 Vacano. All rights reserved.
//

import Foundation
import UIKit

struct Tiger {
    var name = ""
    var age = 0
    var breed = ""
    var image = UIImage(named: "")
    
    func chuff() {
        println("Tiger: Chuff Chuff")
    }
    //in structs the self keyword can be use for functions not for properties.
    func chuffANumberOfTimes(numberOfTimes: Int) {
        for var chuff = 0; chuff < numberOfTimes; ++chuff {
            self.chuff()
        }
        
    }
    
    func chuffANumberOfTimes (numberOfTimes: Int, isLoud: Bool){
        for var chuffTimes = 1; chuffTimes <= numberOfTimes; chuffTimes++ {
            if isLoud {
                chuff()
            }else {
                println("Tiger: purr purr")
            
            }
        }
    }
    
    func ageInTigerYearsFromAge(regularAge:Int) -> Int {
        let newAge = regularAge * 3
        return newAge
        //can minimize code like this
        //return regularAge * 3 and deleting the constant.
    }
    
    func randomFact() -> String {
        
        let randomNumber = Int(arc4random_uniform(UInt32(3)))
        
        var randomFact:String
        
        switch randomNumber {
            
        case 0: randomFact = "The tiger is the biggest species in the cat family"
        case 1: randomFact = "Tigers can reach a length of 3.3 meters."
        default: randomFact = " A group of tiger is known as an ambush or streak"
            
        }
        
        return randomFact
    }
    
    
    
}