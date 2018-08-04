//
//  QuestionModel.swift
//  RizzoApp
//
//  Created by punyawee  on 21/7/61.
//  Copyright © พ.ศ. 2561 Punyugi. All rights reserved.
//

import Foundation

class QuestionModel {
    
    static func getAllImageQuestion(completeHandle: @escaping (_ datas: [[ImageQuestion]]) -> Void) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            let imageQuestions = [
                [//ผลไม้
                    ImageQuestion(answer: "แตงโม", answers: ["แตงโม", "ส้มโอ", "ลิ้นจี้", "แอปเปิ้ล"]),
                    ImageQuestion(answer: "แอปเปิ้ล", answers: ["แอปเปิ้ล", "ส้ม", "สตอรเบอรรี่", "มะม่วง"]),
                    ImageQuestion(answer: "กล้วย", answers: ["มะม่วง", "กล้วย", "มะละกอ", "ข้าวโพด"]),
                    ImageQuestion(answer: "ข้าวโพด", answers: ["กล้วย", "มะละกอ", "มะเฟือง", "ข้าวโพด"]),
                    ImageQuestion(answer: "ทุเรียน", answers: ["มะม่วง", "ทุเรียน", "สละ", "มังคุด"]),
                    ImageQuestion(answer: "มะพร้าว", answers: ["มะขาม", "ส้มโอ", "มะพร้าว", "แอปเปิ้ล"]),
                    ImageQuestion(answer: "มะละกอ", answers: ["มะขาม", "มะละกอ", "กล้วย", "มะม่วง"]),
                    ImageQuestion(answer: "สตอเบอรี่", answers: ["สตอเบอรี่", "บลูเบอรรี่", "แบล็คเบอรรี่", "สละ"]),
                    ImageQuestion(answer: "ส้ม", answers: ["ส้มโอ", "แอปเปิ้ล", "ส้ม", "กีวี่"]),
                    ImageQuestion(answer: "สับปะรด", answers: ["สตอเบอรรี่", "สับปะรด", "ทุเรียน", "ข้าวโพด"])
                ],
                [//สัตว์
                    ImageQuestion(answer: "เป็ด", answers: ["เป็ด", "ห่าน", "ไก่", "หมู"]),
                    ImageQuestion(answer: "แมว", answers: ["หมา", "แมว", "เสือ", "ลิง"]),
                    ImageQuestion(answer: "ไก่", answers: ["ไก่", "เป็ด", "ห่าน", "หงส์"]),
                    ImageQuestion(answer: "กระต่าย", answers: ["กระทิง", "กระรอก", "กระแต", "กระต่าย"]),
                    ImageQuestion(answer: "ช้าง", answers: ["ฮิปโป", "ช้าง", "ชมด", "ยีราฟ"]),
                    ImageQuestion(answer: "ลิง", answers: ["ลิง", "หมา", "แมว", "หมู"]),
                    ImageQuestion(answer: "สิงโต", answers: ["เสือ", "สิงโต", "กระทิง", "แรด"]),
                    ImageQuestion(answer: "หมา", answers: ["หมา", "แมว", "หมี", "หมู"]),
                    ImageQuestion(answer: "หมี", answers: ["แมว", "หมู", "หมา", "หมี"]),
                    ImageQuestion(answer: "หมู", answers: ["แมว", "หมู", "หมี", "หมา"]),
                    ],
                [//สถานที่
                    ImageQuestion(answer: "ถ้ำ", answers: ["ถ้ำ", "ป่า", "สนามเด็กเล่น", "น้ำตก"]),
                    ImageQuestion(answer: "ทะเล", answers: ["แม่น้ำ", "ทะเล", "ทะเลทราย", "ทะเลสาบ"]),
                    ImageQuestion(answer: "ทุ่งนา", answers: ["สวนผัก", "แม่น้ำ", "ทุ่งนา", "ป่า"]),
                    ImageQuestion(answer: "น้ำตก", answers: ["น้ำตก", "ถ้ำ", "ทะเล", "แม่น้ำ"]),
                    ImageQuestion(answer: "ภูเขา", answers: ["ป่า", "ถ้ำ", "ภูเขา", "น้ำตก"]),
                    ImageQuestion(answer: "วัด", answers: ["สวนสาธารณะ", "สนามเด็กเล่น", "ห้างสรรพสินค้า", "วัด"]),
                    ImageQuestion(answer: "สนามกอล์ฟ", answers: ["สนามกอล์ฟ", "สนามฟุตบอล", "ป่า", "สนามเด็กเล่น"]),
                    ImageQuestion(answer: "สนามบิน", answers: ["บริการขนส่งทางบก", "สนามเด็กเล่น", "สนามกอล์ฟ", "สนามบิน"]),
                    ImageQuestion(answer: "สนามฟุตบอล", answers: ["สนามฟุตซอล", "สนามฟุตบอล", "สนามเด็กเล่น", "สนามกอล์ฟ"]),
                    ImageQuestion(answer: "ห้างสรรพสินค้า", answers: ["ห้างสรรพสินค้า", "ห้างทอง", "สวนสาธารณะ", "ตลาด"]),
                    ],
                [//สิ่งของ
                    ImageQuestion(answer: "เครื่องมือช่าง", answers: ["อุปกรณ์อาบน้ำ", "เครื่องมือช่าง", "เครื่องมือซักผ้า", "เครื่องครัว"]),
                    ImageQuestion(answer: "แปรงสีฟัน", answers: ["แปรงสีฟัน", "แปรงขัดส้วม", "ฝอยขัดหม้อ", "แปรงขัดรองเท้า"]),
                    ImageQuestion(answer: "แว่นตา", answers: ["บิ๊กอาย", "แว่นตา", "แว่นขยาย", "กล้องส่องพระ"]),
                    ImageQuestion(answer: "กรรไกร", answers: ["กรรไกร", "กรรไกรตัดเล็บ", "กรรไกรตัดหญ้า", "มีด"]),
                    ImageQuestion(answer: "ไม้กวาด", answers: ["ที่ตักผง", "ไม้ถูพื้น", "ไม้กวาด", "เครื่องดูดฝุ่น"]),
                    ImageQuestion(answer: "กะทะ", answers: ["กะทะ", "หม้อ", "กะละมัง", "ฉาม"]),
                    ImageQuestion(answer: "ดินสอ", answers: ["ดินสอ", "ปากกา", "ยางลบ", "คัตเตอร์"]),
                    ImageQuestion(answer: "มีดครัว", answers: ["มีดดาบ", "มีดพก", "มีดครัว", "มีดไฟฟ้า"]),
                    ImageQuestion(answer: "มีดช้อนส้อม", answers: ["มีดช้อนส้อม", "มีด", "ช้อน", "ส้อม"]),
                    ImageQuestion(answer: "ร่ม", answers: ["ผ้าใบ", "ร่ม", "ลูกโป่ง", "กิ่งไม้"]),
                    ]
            ]
            completeHandle(imageQuestions)
        }
    }
    
    static func getAllSoundQuestion(completeHandle: @escaping (_ datas: [[SoundQuestion]]) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            // index 0 สัตว์, 1 เครื่องดนตรี
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
                    SoundQuestion(answer: "เปียโน", answers: ["แอคคอร์เดียน", "เปียโน", "ไวโอลิน", "ไซโลโฟน"]),
                    SoundQuestion(answer: "กีต้าร์", answers: ["มาราคา", "ระฆังราว", "ไซโลโฟน", "กีต้าร์"]),
                    SoundQuestion(answer: "ไวโอลิน", answers: ["ไวโอลิน", "กีต้าร์", "ลูท", "แบนโจ"]),
                    SoundQuestion(answer: "กลองชุด", answers: ["คอร์เนต", "กลองชุด", "แซกโซโฟน", "เปียโน"]),
                    SoundQuestion(answer: "แซกโซโฟน", answers: ["ทรอมโบน", "ทรัมเป็ต", "ทูบา", "แซกโซโฟน"]),
                    SoundQuestion(answer: "ระนาดเอก", answers: ["ฆ้อง", "กลองยาว", "ระนาดเอก", "จะเข้"]),
                    SoundQuestion(answer: "ฉิ่ง", answers: ["ตะโพน", "กรับ", "ฉิ่ง", "ฉาบ"]),
                    SoundQuestion(answer: "กรับ", answers: ["กรับ", "ฉิ่ง", "ฉาบ", "กลอง"]),
                    SoundQuestion(answer: "ขลุ่ย", answers: ["ปี่", "กรับ", "พิณ", "ขลุ่ย"]),
                    SoundQuestion(answer: "ซอ", answers: ["จะเข้", "ซอ", "พิณ", "กรับ"])
                ]
            ]
            completeHandle(soundQuestions)
        }
    }
    
    static func getAllDrawQuestion(completeHandle: @escaping (_ datas: [[DrawQuestion]]) -> Void) {
        // 0 สัตว์ 1 สิ่งของ 3 ผลไม้
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            let drawQuestions = [
                [
                    DrawQuestion(questionName: "แกะ", answer: "sheep"),
                    DrawQuestion(questionName: "เป็ด", answer: "duck"),
                    DrawQuestion(questionName: "วัว", answer: "cow"),
                    DrawQuestion(questionName: "สุนัข", answer: "dog"),
                    DrawQuestion(questionName: "หมู", answer: "pig"),
                ],
                [
                    DrawQuestion(questionName: "ดินสอ", answer: "pencil"),
                    DrawQuestion(questionName: "โทรทัศน์", answer: "television"),
                    DrawQuestion(questionName: "รองเท้า", answer: "shoes"),
                    DrawQuestion(questionName: "แว่นตา", answer: "glasses"),
                    DrawQuestion(questionName: "กล้องถ่ายรูป", answer: "camera"),
                ],
                [
                    DrawQuestion(questionName: "กล้วย", answer: "banana"),
                    DrawQuestion(questionName: "แตงโม", answer: "watermelon"),
                    DrawQuestion(questionName: "สตอว์เบอรี่", answer: "strawberry"),
                    DrawQuestion(questionName: "องุ่น", answer: "grape"),
                    DrawQuestion(questionName: "แอปเปิ้ล", answer: "apple"),
                ]
            ]
            completeHandle(drawQuestions)
        }
    }
    
    
    
}
