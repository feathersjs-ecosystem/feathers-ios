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

public protocol ServiceType {

    associatedtype Model

    func find(parameters: [String: AnyObject], callback: (Result<[Model], ServiceError>) -> ())
    func get(id: String, parameters: [String: AnyObject], callback: (Result<Model?, ServiceError>) -> ())
    func create(data: [String: AnyObject], parameters: [String: AnyObject], callback: (Result<Model, ServiceError>) -> ())
    func update(id: String, data: [String: AnyObject], parameters: [String: AnyObject], callback: (Result<Model, ServiceError>) -> ())
    func patch(id: String, data: [String: AnyObject], parameters: [String: AnyObject], callback: (Result<Model, ServiceError>) -> ())
    func remove(id: String, parameters: [String: AnyObject], callback: (Result<Model, ServiceError>) -> ())

}


public class Service {

    public typealias Model = AnyObject

    internal var provider: Provider?

}

extension Service: ServiceType {
    public func find(parameters: [String: AnyObject], callback: (Result<[Model], ServiceError>) -> ()) {
        self.provider?.find(parameters, callback: callback)
    }

    public func get(id: String, parameters: [String: AnyObject], callback: (Result<Model?, ServiceError>) -> ()) {
        self.provider?.get(id, parameters: parameters, callback: callback)
    }

    public func create(data: [String: AnyObject], parameters: [String: AnyObject], callback: (Result<Model, ServiceError>) -> ()) {
        self.provider?.create(data, parameters: parameters, callback: callback)
    }

    public func update(id: String, data: [String: AnyObject], parameters: [String: AnyObject], callback: (Result<Model, ServiceError>) -> ()) {
        self.provider?.update(id, data: data, parameters: parameters, callback: callback)
    }

    public func patch(id: String, data: [String: AnyObject], parameters: [String: AnyObject], callback: (Result<Model, ServiceError>) -> ()) {
        self.provider?.patch(id, data: data, parameters: parameters, callback: callback)
    }

    public func remove(id: String, parameters: [String: AnyObject], callback: (Result<Model, ServiceError>) -> ()) {
        self.provider?.remove(id, parameters: parameters, callback: callback)
    }

}