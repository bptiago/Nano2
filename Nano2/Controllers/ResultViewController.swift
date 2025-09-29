//
//  ResultController.swift
//  Nano2
//
//  Created by Tiago Prestes on 28/09/25.
//

import UIKit

class ResultViewController: UIViewController {
    private let resultView: ResultView
    private let score: Int
    
    init(score: Int) {
        self.score = score
        self.resultView = ResultView(score: score)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = resultView
        self.navigationItem.hidesBackButton = true
        resultView.onButtonPress = resetQuiz
    }
    
    func resetQuiz() {
        let startViewController = StartViewController()
        navigationController?.pushViewController(startViewController, animated: true)
    }
}
