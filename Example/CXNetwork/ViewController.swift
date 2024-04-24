//
//  ViewController.swift
//  CXNetwork
//
//  Created by Teng Fei on 04/14/2024.
//  Copyright (c) 2024 Teng Fei. All rights reserved.
//

import UIKit
import CXNetwork_Moya
import ObjectMapper

struct User: Mappable {
    var name: String?
    var age: Int = 0
    var gender: Int = 1
    
    init?(map: ObjectMapper.Map) {
        
    }
    
    mutating func mapping(map: ObjectMapper.Map) {
        name    <- map["name"]
        age     <- map["age"]
        gender  <- map["gender"]
    }
}

struct RoomInfo: Mappable {
    var id: Int = 0
    var name: String?
    var channel: String?
    
    init?(map: ObjectMapper.Map) {
        
    }
    
    mutating func mapping(map: ObjectMapper.Map) {
        id      <- map["id"]
        name    <- map["name"]
        channel <- map["channel"]
    }
}

struct RoomReqEnity: Encodable {
    var id: String?
    var channel: String?
}

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        execRequests()
    }
    
    func execRequests() {
        // Downloads an image to the local.
        let url = "https://atts.w3cschool.cn/attachments/image/20171028/1509160178371523.png"
        CXNetWorkManager.shared.request(api: StreamAPI(downloadURL: URL(string: url)!, toDirectory: "Images")) { result in
            switch result {
            case .success(let data):
                print("[I] filePath: \(String(describing: String(data: data, encoding: .utf8)))")
            case .failure(let error):
                print("[E] error: \(error)")
            }
        }
        
        // Gets an image data.
        let base = "http://127.0.0.1:8080"
        let imgCodePath = "/auth/v1/verify/phoneImgCode"
        CXNetWorkManager.shared.request(api: API(baseUrl: base, path: imgCodePath, method: .get)) { result in
            switch result {
            case .success(let data):
                let image = UIImage(data: data)
                print("[I] imageData: \(data), image: \(String(describing: image))")
            case .failure(let error):
                print("[E] error: \(error)")
            }
        }
        
        // Gets a user data.
        let base2 = "http://127.0.0.1:8080"
        let userPath = "/get/users"
        ListResponse<User>.request(api: API(baseUrl: base2, path: userPath, method: .get)) { result in
            switch result {
            case .success(let resp):
                // var data: [User]?
                print("[I] users: \(String(describing: resp.data))")
                break
            case .failure(let error):
                print("[E] error: \(error)")
            }
        }
        
        // Posts a room information.
        let base3 = "http://127.0.0.1:8080"
        let rPath = "/createRoom"
        DataResponse<RoomInfo>.request(api: API(baseUrl: base3, path: rPath, entity: RoomReqEnity(id: "100012", channel: "AECD83243141DDC"))) { result in
            switch result {
            case .success(let resp):
                // var data: RoomInfo?
                print("[I] users: \(String(describing: resp.data))")
                break
            case .failure(let error):
                print("[E] error: \(error)")
            }
        }
        
        // Gets cookies, and so on.
        CXNetWorkManager.shared.onRequestCompletion = { /*[weak self]*/ response in
            print("[I] response: \(response), httpURLRespone: \(String(describing: response.response))")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
