//
//  ViewController.swift
//  CXNetwork
//
//  Created by Teng Fei on 04/14/2024.
//  Copyright (c) 2024 Teng Fei. All rights reserved.
//

import UIKit
import CXNetwork_Moya

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Downloads an image to the local.
        let url = "https://atts.w3cschool.cn/attachments/image/20171028/1509160178371523.png"
        CXNetWorkManager.shared.request(api: StreamAPI(downloadURL: URL(string: url)!, toDirectory: "Images")) { result in
            switch result {
            case .success(let data):
                print("[I] filePath: \(String(data: data, encoding: .utf8))")
            case .failure(let error):
                print("[E] error: \(error)")
            }
        }
        
        // Gets an image data.
        let base = "https://xxx.xxx.xx"
        let imgCodePath = base + "/auth/v1/verify/phoneImgCode"
        CXNetWorkManager.shared.request(api: API(baseUrl: base, path: imgCodePath, method: .get)) { result in
            switch result {
            case .success(let data):
                let image = UIImage(data: data)
                print("[I] imageData: \(data), image: \(image)")
            case .failure(let error):
                print("[E] error: \(error)")
            }
        }
        
        // Gets cookies, and so on.
        CXNetWorkManager.shared.onRequestCompletion = { [weak self] response in
            print("[I] response: \(response), httpURLRespone: \(response.response)")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
