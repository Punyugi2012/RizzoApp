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
    
    static func getAllSoundQuestion(completeHandle: @escaping (_ datas: [[SoundQuestion]]) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            // index 0 สัตว์ 1 กีฬา 2 เครื่องดนตรี
            let soundQuestions = [
                [
                    SoundQuestion(answer: "แมว", answers: ["ค้างคาว", "อีเห็น", "แมว", "นกฮูก"]),
                    SoundQuestion(answer: "วัว", answers: ["เสือโคร่ง", "ไก่", "ช้าง", "วัว"]),
                    SoundQuestion(answer: "สุนัข", answers: ["สุนัข", "แมว", "เสือดำ", "ลุงตู่"]),
                    SoundQuestion(answer: "เป็ด", answers: ["เป็ด", "คนหัวเราะ", "ไก่", "หมี"]),
                    SoundQuestion(answer: "ช้าง", answers: ["แตรรถ", "ช้าง", "ยีราฟ", "ยักเขียว"]),
                    SoundQuestion(answer: "กบ", answers: ["ค้างคาว", "กบ", "งู", "นก"]),
                    SoundQuestion(answer: "ม้า", answers: ["ฟ้าร้อง", "หมู", "ลิง", "ม้า"]),
                    SoundQuestion(answer: "ลิง", answers: ["นก", "เด็กร้อง", "ลิง", "ไก่"]),
                    SoundQuestion(answer: "นกฮูก", answers: ["นกฮูก", "นกขุนทอง", "นกเป็ดน้ำ", "ตุ่นปากเป็ด"]),
                    SoundQuestion(answer: "หมู", answers: ["สิงโตทะเล", "หมู", "เสือดาว", "หมีดำ"])
                ],
                [
                    // กีฬา
                ],
                [
                    // เครื่องดนตรี
                ]
            ]
            completeHandle(soundQuestions)
        }
    }
    
    static func getAllDrawQuestion(completeHandle: @escaping (_ datas: [DrawQuestion]) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            completeHandle([])
        }
    }
    
}
