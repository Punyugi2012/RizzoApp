//
//  DrawAPI.swift
//  RizzoApp
//
//  Created by punyawee  on 24/7/61.
//  Copyright © พ.ศ. 2561 Punyugi. All rights reserved.
//

import Foundation
import Alamofire


class DrawAPI {
    static func checkDrawed(params: Parameters, completeHandle: @escaping (_ result: [String]) -> Void) {
        DispatchQueue.global(qos: .userInteractive).async {
            if let url = URL(string: "https://inputtools.google.com/request?ime=handwriting&app=quickdraw&dbg=1&cs=1&oe=UTF-8") {
                 Alamofire.request(url, method: .post, parameters: params, encoding: JSONEncoding.default).responseJSON { (response) in
                    switch response.result {
                    case .failure:
                        print(response.result.error!)
                    case .success:
                        if let data = response.result.value as? [Any],
                            let data2 = data[1] as? [Any],
                            let data3 = data2[0] as? [Any],
                            let data4 = data3[1] as? [String] {
                            DispatchQueue.main.async {
                                completeHandle(data4)
                            }
                        }
                    }
                }
            }
        }
    }
}

