//
//  ViewController.swift
//  Nano2
//
//  Created by Tiago Prestes on 24/09/25.
//

import UIKit

class StartViewController: UIViewController {
    
    private let startingView = StartingView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = startingView
        self.navigationItem.hidesBackButton = true
        startingView.onButtonPress = navigateToQuiz
    }
    
    func navigateToQuiz() {
        let quizViewController = QuizViewController()
        navigationController?.pushViewController(quizViewController, animated: true)
    }
}
