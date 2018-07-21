//
//  QuestionModel.swift
//  RizzoApp
//
//  Created by punyawee  on 21/7/61.
//  Copyright © พ.ศ. 2561 Punyugi. All rights reserved.
//

import Foundation

class QuestionModel {
    static func getAllImageQuestion(completeHandle: @escaping (_ datas: [ImageQustion]) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            completeHandle([])
        }
    }
    static func getAllSoundQuestion(completeHandle: @escaping (_ datas: [SoundQuestion]) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            completeHandle([])
        }
        
    }
    static func getAllDrawQuestion(completeHandle: @escaping (_ datas: [DrawQuestion]) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            completeHandle([])
        }
    }
}
