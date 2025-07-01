//
//  DetailViewController.swift
//  Heroes-iOS
//
//  Created by Mañanas on 25/6/25.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var superheroImageView: UIImageView!
    @IBOutlet weak var realNameLabel: UILabel!
    @IBOutlet weak var publisherLabel: UILabel!
    @IBOutlet weak var placeOfBirthLabel: UILabel!
    @IBOutlet weak var alignmentLabel: UILabel!
    
    @IBOutlet weak var intelligenceLabel: UILabel!
    @IBOutlet weak var strengthLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var durabilityLabel: UILabel!
    @IBOutlet weak var powerLabel: UILabel!
    @IBOutlet weak var combatLabel: UILabel!
    
    @IBOutlet weak var intelligenceProgress: UIProgressView!
    @IBOutlet weak var strengthProgress: UIProgressView!
    @IBOutlet weak var speedProgress: UIProgressView!
    @IBOutlet weak var durabilityProgress: UIProgressView!
    @IBOutlet weak var powerProgress: UIProgressView!
    @IBOutlet weak var combatProgress: UIProgressView!
    
    var superhero: Superhero!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationItem.title = superhero.name
        
        superheroImageView.setCornerRadius(16)
        
        superheroImageView.loadFrom(url: superhero.image.url)
        realNameLabel.text = superhero.biography.realName
        publisherLabel.text = superhero.biography.publisher
        placeOfBirthLabel.text = superhero.biography.placeOfBirth
        alignmentLabel.text = superhero.biography.alignment.uppercased()
        alignmentLabel.textColor = UIColor(named: "alignment-\(superhero.biography.alignment)")
        
        intelligenceLabel.text = superhero.powerstats.intelligence
        strengthLabel.text = superhero.powerstats.strength
        speedLabel.text = superhero.powerstats.speed
        durabilityLabel.text = superhero.powerstats.durability
        powerLabel.text = superhero.powerstats.power
        combatLabel.text = superhero.powerstats.combat
        
        intelligenceProgress.progress = Float(Int(superhero.powerstats.intelligence) ?? 0) / 100
        strengthProgress.progress = Float(Int(superhero.powerstats.strength) ?? 0) / 100
        speedProgress.progress = Float(Int(superhero.powerstats.speed) ?? 0) / 100
        durabilityProgress.progress = Float(Int(superhero.powerstats.durability) ?? 0) / 100
        powerProgress.progress = Float(Int(superhero.powerstats.power) ?? 0) / 100
        combatProgress.progress = Float(Int(superhero.powerstats.combat) ?? 0) / 100
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
