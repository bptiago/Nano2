//
//  DataSource.swift
//  Nano2
//
//  Created by Tiago Prestes on 26/09/25.
//

import Foundation

struct DataSource: Identifiable, JsonFile {
    typealias T = QuizNode
    
    let id = UUID()
    let fileName: String = "Questions"
    var data: [T] { decode() }
}

struct QuizNode: Identifiable, Decodable {
    let id = UUID()
    let question: String
    let options: [String]
    let answer: Int
}
