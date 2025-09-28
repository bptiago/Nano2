//
//  QuizViewController.swift
//  Nano2
//
//  Created by Tiago Prestes on 24/09/25.
//

import UIKit

class QuizViewController: UIViewController {
    private var quizView: QuizView
    private var quizNode: QuizNode
    
    private let dataSource = DataSource()
    private var count: Int = 0
    
    init() {
        self.quizNode = dataSource.data[count]
        self.quizView = QuizView(quizNode: quizNode)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        
        self.view = quizView
//        quizView.onButtonPress = updateQuizNode
    }
    
    func updateQuizNode() {
        if count >= dataSource.data.count - 1 {
            return
        }
        
        count += 1
        let newQuizNode = dataSource.data[count]
        self.quizNode = newQuizNode
    }
}
