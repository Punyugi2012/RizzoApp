//
//  QuestionProtocol.swift
//  RizzoApp
//
//  Created by punyawee  on 21/7/61.
//  Copyright © พ.ศ. 2561 Punyugi. All rights reserved.
//

import Foundation

protocol QuestionProtocol {
    var questionName: String { get }
    var answer: String { get }
    var answers: [String] { get }
}
