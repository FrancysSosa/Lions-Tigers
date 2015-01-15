//
//  ViewController.swift
//  Lions&Tigers
//
//  Created by Vacano on 1/3/15.
//  Copyright (c) 2015 Vacano. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var breedLabel: UILabel!
    @IBOutlet weak var randomFactLabel: UILabel!
    
    //this is how to declare an array of type lion or tiger class.
    var myTigers: [Tiger] = []
    var lions: [Lion] = []
    var lionCubs: [LionCub] = []
    
    var currentIndex = 0
    
    var currentAnimal = (species: "Tiger", index: 0)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var myTiger = Tiger()
        myTiger.name = "Tigger"
        myTiger.age = 3
        myTiger.breed = "Bengal"
        myTiger.image = UIImage(named: "BengalTiger.jpg")
        //functions inside structs should be call at the object instance.
        myTiger.age = myTiger.ageInTigerYearsFromAge(myTiger.age)
        
        myTiger.chuff()
        myTiger.chuffANumberOfTimes(5, isLoud: true)
        
        self.myTigers.append(myTiger)
        
        println("My Tiger's name is: \(myTiger.name), its age is \(myTiger.age), its breed is \(myTiger.breed) and its image is \(myTiger.image)")
        
        self.nameLabel.text = myTiger.name
        self.ageLabel.text = "\(myTiger.age)"
        self.breedLabel.text = myTiger.breed
        self.myImageView.image = myTiger.image
        
        var secondTiger = Tiger()
        secondTiger.name = "Tigress"
        secondTiger.age = 2
        secondTiger.breed = "Indochinese Tiger"
        secondTiger.image = UIImage(named: "IndochineseTiger.jpg")
        
        secondTiger.age = secondTiger.ageInTigerYearsFromAge(secondTiger.age)
        
        var thirdTiger = Tiger()
        thirdTiger.name = "Jacob"
        thirdTiger.age = 4
        thirdTiger.breed = "Malayan Tiger"
        thirdTiger.image = UIImage(named: "MalayanTiger.jpg")
        
        thirdTiger.age = thirdTiger.ageInTigerYearsFromAge(thirdTiger.age)
        
        var fourthTiger = Tiger()
        fourthTiger.name = "Spar"
        fourthTiger.age = 5
        fourthTiger.breed = "Siberian Tiger"
        fourthTiger.image = UIImage(named: "SiberianTiger.jpg")
        
        fourthTiger.age = fourthTiger.ageInTigerYearsFromAge(fourthTiger.age)
        
        self.myTigers += [secondTiger, thirdTiger, fourthTiger]
        
        var lion = Lion()
        lion.age = 4
        lion.isAlphaMale = false
        lion.image = UIImage(named: "Lion.jpg")
        lion.name = "Mufasa"
        lion.subspecies = "West African"
        
        var lioness = Lion()
        lioness.age = 3
        lioness.isAlphaMale = false
        lioness.image = UIImage(named: "Lioness.jpeg")
        lioness.name = "Sarabi"
        lioness.subspecies = "Barbary"
        
        lion.roar()
        lioness.roar()
        lion.changeToAlphaMale()
        println(lion.isAlphaMale)
        
        self.lions += [lion, lioness]
        
        var lionCub = LionCub()
        lionCub.age = 1
        lionCub.name = "Simba"
        lionCub.image = UIImage(named: "LionCub1.jpg")
        lionCub.subspecies = "Masai"
        lionCub.isAlphaMale = true 
        
        lionCub.roar()
        lionCub.rubLionCubsBelly()
        
        var femaleLionCub = LionCub()
        femaleLionCub.age = 1
        femaleLionCub.name = "Nala"
        femaleLionCub.image = UIImage (named: "LionCub2.jpeg")
        femaleLionCub.subspecies = "Transvaal"
        femaleLionCub.isAlphaMale = false
        
        self.lionCubs += [lionCub, femaleLionCub]
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func nextBarButtonItemPressed(sender: UIBarButtonItem) {
        
        
        self.updateAnimal()
        self.updateView()
//        var randomIndex:Int
//        do{
//            randomIndex = Int(arc4random_uniform(UInt32(myTigers.count)))//randomized index of tigers
//        }while self.currentIndex == randomIndex
//        
//        self.currentIndex = randomIndex
//        
//        
//        let tiger = myTigers[randomIndex]//the constant *tiger* holds all the tigers now, and we can do
        
        //        myImageView.image = tiger.image
        //        nameLabel.text = tiger.name
        //        ageLabel.text = "\(tiger.age)"
        //        breedLabel.text = tiger.breed
        
        // this code will replace the above code to animate frame between tigers, this is call a closure.
//        UIView.transitionWithView(self.view, duration: 2, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: {
//            
//            self.myImageView.image = tiger.image
//            self.nameLabel.text = tiger.name
//            self.ageLabel.text = "\(tiger.age)"
//            self.breedLabel.text = tiger.breed
//            self.randomFactLabel.text = tiger.randomFact()
//            
//            }, completion: {
//                (finished: Bool) -> () in
//        }) *MOVED ALL THIS CODE TO THE UPDATEVIEW FUNCTION AND KEPT WHATS NEEDED
        
    }
    //on the function below were using the tuple "currentAnimal" to randomize the index of the array.
    func updateAnimal () {
        switch currentAnimal {
        case ("Tiger", _):
            let randomIndex = Int(arc4random_uniform(UInt32(lions.count)))
            currentAnimal = ("Lion", randomIndex)
        case ("Lion", _):
            let randomIndex = Int(arc4random_uniform(UInt32(lionCubs.count)))
            currentAnimal = ("LionCub", randomIndex)
        default:
            let randomIndex = Int(arc4random_uniform(UInt32(myTigers.count)))
            currentAnimal = ("Tiger", randomIndex)
        }
    }

    func updateView () {
        
        UIView.transitionWithView(self.view, duration: 2, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: {
            //on the "if statement" below were using the tuple integer element to start displaying animal from the 0 index "currentAnimal.index"
            if self.currentAnimal.species == "Tiger" {
                let tiger = self.myTigers[self.currentAnimal.index]
                
                self.myImageView.image = tiger.image
                self.breedLabel.text = tiger.breed
                self.ageLabel.text = "\(tiger.age)"
                self.nameLabel.text = tiger.name
                self.randomFactLabel.text = tiger.randomFact()
            }
            else if self.currentAnimal.species == "Lion" {
                let lion = self.lions [self.currentAnimal.index]
                self.myImageView.image = lion.image
                self.breedLabel.text = lion.subspecies
                self.ageLabel.text = "\(lion.age)"
                self.nameLabel.text = lion.name
                self.randomFactLabel.text = lion.randomFact()
            }
                //self.randomFactLabel.hidden = false
            else if self.currentAnimal.species == "LionCub" {
                let lionCub = self.lionCubs[self.currentAnimal.index]
                
                self.myImageView.image = lionCub.image
                self.breedLabel.text = lionCub.subspecies
                self.ageLabel.text = "\(lionCub.age)"
                self.nameLabel.text = lionCub.name
                self.randomFactLabel.text = lionCub.randomFact()
            }
            }, completion: {
                (finished: Bool) -> () in
        })
    }

}

