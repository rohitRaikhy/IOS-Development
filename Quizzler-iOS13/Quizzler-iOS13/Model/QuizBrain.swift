//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Rohit Raikhy on 3/9/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct QuizBrain{
    let quiz = [
        Question(q: "Once an example has been assigned to a particular centroid, it will never be reassigned to another centroid.", a: "False"),
        Question(q: "A good way to initialize K-means is to select K (distinct) examples from the training set and set the cluster centroids equal to these selected examples.", a: "True"),
        Question(q: "On every iteration of K-means, the cost funtion J(c(1), ..., c(m), μ1, ..., μk (the distortion function) should either stay the same or decrease; in particular, it should not increase.", a: "True"),
        Question(q: "K-Means will always give the same results regardless of the initialization of the centroids..", a: "False"),
        Question(q: "For some datasets, the right or correct value of K (the number of clusters) can be ambiguous, and hard even for a human expert looking carefully at the data to decide.", a: "True"),
        Question(q: "If we are worried about K-means getting stuck in bad local optima, one way to ameliorate (reduce) this problem is if we try using multiple random initializations.", a: "True"),
        Question(q: "Given sales data from a large number of products in a supermarket, figure out which products tend to form coherent groups (say are frequently purchased together) and thus should be put on the same shelf.", a: "True"),
        Question(q: "Given many emails, you want to determine if they are Spam or Non-Spam emails.'.", a: "False"),
        Question(q: "From the user usage patterns on a website, figure out what different groups of users exists.", a: "True"),
        Question(q: "Given a set of news articles from many different websites, find out what topics are the main topics covered.", a: "True"),
        Question(q: "Given historical weather records, predict if tomorrow's weather will be sunny or rainy.", a: "False"),
        Question(q: "Given a database of information about your users, automatically group them into different market segments.", a: "True")
    ]
    
    var questionNumber = 0
    var score = 0
    
    mutating func checkAnswer(_ userAnswer: String) -> Bool{
        if userAnswer == quiz[questionNumber].answer{
            score += 1
            return true
        }else{
            return false
        }
        
    }
    
    func getScore() -> Int {
        return score
    } 
    
    func getQuestionText() -> String{
        return quiz[questionNumber].text
        
    }
    
    func getProgress() -> Float{
        let progress = Float(questionNumber + 1) / Float(quiz.count)
        return progress
    }
    
    mutating func nextQuestion(){
        if questionNumber + 1 < quiz.count{
            questionNumber += 1
        }else{
            questionNumber = 0
            score = 0
        }
    }
    
}
