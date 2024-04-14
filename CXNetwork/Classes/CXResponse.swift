//
//  CXResponse.swift
//  CXSwiftKit
//
//  Created by chenxing on 2023/3/16.
//

import Foundation
#if canImport(ObjectMapper)
import ObjectMapper

public protocol DataResponseProtocol {
    var code: String? { get set }
    var message: String? { get set }
}

public struct DataResponse<T>: DataResponseProtocol, CXRequestProtocol where T: Mappable {
    public init () {}
    public var code: String?
    public var message: String?
    public var data: T?
    
    public init?(map: Map) {
        
    }
    
    public mutating func mapping(map: Map) {
        code    <- map["code"]
        message <- map["message"]
        data    <- map["data"]
    }
}

public struct ListResponse<T>: DataResponseProtocol, CXRequestProtocol where T: Mappable {
    public init () {}
    public var code: String?
    public var message: String?
    public var data: [T]?
    
    public init?(map: Map) {
        
    }
    
    public mutating func mapping(map: Map) {
        code    <- map["code"]
        message <- map["message"]
        data    <- map["data"]
    }
}

public struct DataSetResponse<T>: DataResponseProtocol, CXRequestProtocol where T: Mappable {
    public init () {}
    public var code: String?
    public var message: String?
    public var data: DataSet<T>?
    
    public init?(map: Map) {
        
    }
    
    public mutating func mapping(map: Map) {
        code    <- map["code"]
        message <- map["message"]
        data    <- map["data"]
    }
}

public struct DataSet<T>: Mappable where T: Mappable {
    public init () {}
    var total: Int32?
    var list: [T]?
    
    public init?(map: Map) {
        
    }
    
    public mutating func mapping(map: Map) {
        total <- map["total"]
        list  <- map["list"]
    }
}

public struct MessageResponse: DataResponseProtocol, CXRequestProtocol {
    public init () {}
    public var code: String?
    public var message: String?
    public var data: String?
    
    public init?(map: Map) {
        
    }
    
    public mutating func mapping(map: Map) {
        code    <- map["code"]
        message <- map["message"]
        data    <- map["data"]
    }
}

#endif
