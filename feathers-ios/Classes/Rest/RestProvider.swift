//
//  RestProvider.swift
//  Pods
//
//  Created by Brendan Conron on 5/25/16.
//
//

import Foundation
import Result
import Just

public class RestProvider: Provider {

    required public init(baseURL: NSURL) {

    }

    public func find(parameters: [String: AnyObject], callback: (Result<[AnyObject], ServiceError>) -> ()) {

    }

    public func get(id: String, parameters: [String: AnyObject], callback: (Result<AnyObject?, ServiceError>) -> ()) {

    }

    public func create(data: [String: AnyObject], parameters: [String: AnyObject], callback: (Result<AnyObject, ServiceError>) -> ()) {

    }

    public func update(id: String, data: [String: AnyObject], parameters: [String: AnyObject], callback: (Result<AnyObject, ServiceError>) -> ()) {

    }

    public func patch(id: String, data: [String: AnyObject], parameters: [String: AnyObject], callback: (Result<AnyObject, ServiceError>) -> ()) {

    }

    public func remove(id: String, parameters: [String: AnyObject], callback: (Result<AnyObject, ServiceError>) -> ()) {

    }
}
