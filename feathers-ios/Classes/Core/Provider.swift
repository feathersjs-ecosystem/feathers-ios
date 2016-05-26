//
//  Provider.swift
//  Pods
//
//  Created by Brendan Conron on 3/21/16.
//
//

import Foundation
import Result
import ObjectMapper

public protocol Provider {

    init(baseURL: NSURL)
    
    func find(parameters: [String: AnyObject], callback: (Result<[AnyObject], ServiceError>) -> ())
    func get(id: String, parameters: [String: AnyObject], callback: (Result<AnyObject?, ServiceError>) -> ())
    func create(data: [String: AnyObject], parameters: [String: AnyObject], callback: (Result<AnyObject, ServiceError>) -> ())
    func update(id: String, data: [String: AnyObject], parameters: [String: AnyObject], callback: (Result<AnyObject, ServiceError>) -> ())
    func patch(id: String, data: [String: AnyObject], parameters: [String: AnyObject], callback: (Result<AnyObject, ServiceError>) -> ())
    func remove(id: String, parameters: [String: AnyObject], callback: (Result<AnyObject, ServiceError>) -> ())

}