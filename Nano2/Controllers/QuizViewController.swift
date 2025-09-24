//
//  QuizViewController.swift
//  Nano2
//
//  Created by Tiago Prestes on 24/09/25.
//

import UIKit

class QuizViewController: UIViewController {
    
    private let quizView = QuizView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = quizView
    }
}
