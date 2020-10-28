//
//  ResultsViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 26.10.2020.
//

import UIKit

class ResultsViewController: UIViewController {
    
    // 1. Передать сюда массив с ответами
    // 2. Определить наиболее часто встречающийся тип животного
    // 3. Отобразить результаты на экране    
    // 4. Избавится от кнопки возврата на предыдущий экран

    @IBOutlet weak var topResultTestLabel: UILabel!
    @IBOutlet weak var resultTestLabel: UILabel!
    
    var resultAnswers: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.setHidesBackButton(true, animated: false)
        returnBestVariant(from: resultAnswers)
        }
    
    private func returnBestVariant(from results: [Answer]) { //-> Answer
    
        var bestResultFromAnswer = [AnimalType:Int]()
        
        var count = 0
        results.forEach { (typeAnimal) in
            for testAnimal in results {
                if typeAnimal.type == testAnimal.type {
                    count += 1
                    bestResultFromAnswer[typeAnimal.type] = count
                }
            }
            count = 0
        }
        
        let newDict = bestResultFromAnswer.sorted {
            $0.value > $1.value
        }

        let animalChar = newDict.first?.key.rawValue ?? " "
        topResultTestLabel.text = "Вы - \(animalChar)"
        resultTestLabel.text = newDict.first?.key.definition
    }
}
