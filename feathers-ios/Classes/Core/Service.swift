//
//  Service.swift
//  Pods
//
//  Created by Brendan Conron on 5/25/16.
//
//

import Foundation
import Result

public enum ServiceError: ErrorType {
    case MappingArrayFailed([AnyObject])
    case MappingObjectFailed(AnyObject)
}

public class Service {

    internal var provider: Provider?

    public func find(parameters: [String: AnyObject], callback: (Result<[AnyObject], ServiceError>) -> ()) {
        self.provider?.find(parameters, callback: callback)
    }

    public func get(id: String, paramters: [String: AnyObject], callback: (Result<AnyObject, ServiceError>)) {

    }

    public func create(data: [String: AnyObject], parameters: [String: AnyObject], callback: (Result<AnyObject, ServiceError>)) {

    }

    public func update(id: String, data: [String: AnyObject], paramters: [String: AnyObject], callback: (Result<AnyObject, ServiceError>)) {

    }

    public func patch(id: String, data: [String: AnyObject], paramters: [String: AnyObject], callback: (Result<AnyObject, ServiceError>)) {

    }

    public func remove(id: String, parameters: [String: AnyObject], callback: (Result<AnyObject, ServiceError>)) {

    }

}

public protocol ServiceType {

    associatedtype Model

    func find(parameters: [String: AnyObject], callback: (Result<[Model], ServiceError>) -> ())
    func get(id: String, paramters: [String: AnyObject], callback: (Result<Model, ServiceError>))
    func create(data: [String: AnyObject], parameters: [String: AnyObject], callback: (Result<Model, ServiceError>))
    func update(id: String, data: [String: AnyObject], paramters: [String: AnyObject], callback: (Result<Model, ServiceError>))
    func patch(id: String, data: [String: AnyObject], paramters: [String: AnyObject], callback: (Result<Model, ServiceError>))
    func remove(id: String, parameters: [String: AnyObject], callback: (Result<Model, ServiceError>))

}
