//
//  Provider+ObjectMapper.swift
//  Pods
//
//  Created by Brendan Conron on 5/26/16.
//
//

import Foundation
import ObjectMapper
import Result

extension Provider {

    public func find<T: Mappable>(parameters: [String: AnyObject], callback: (Result<[T], ServiceError>) -> ()) {
        self.find(parameters) {
            switch $0 {
            case let .Success(jsonArray):
                guard let models: [T] = Mapper<T>().mapArray(jsonArray) else {
                    callback(.Failure(.MappingArrayFailed(jsonArray)))
                    return
                }
                callback(.Success(models))
            case let .Failure(error):
                callback(.Failure(error))
            }
        }
    }

    public func get<T: Mappable>(id: String, parameters: [String: AnyObject], callback: (Result<T?, ServiceError>) -> ()) {
        self.get(id, parameters: parameters) {
            switch $0 {
            case let .Success(json):
                guard let json = json else {
                    callback(.Success(nil))
                    return
                }
                guard let model: T = Mapper<T>().map(json) else {
                    callback(.Failure(.MappingObjectFailed(json)))
                    return
                }
                callback(.Success(model))
            case let .Failure(error):
                callback(.Failure(error))
            }
        }
    }

    public func create<T: Mappable>(data: [String: AnyObject], parameters: [String: AnyObject], callback: (Result<T, ServiceError>) -> ()) {
        self.create(data, parameters: parameters) {
            switch $0 {
            case let .Success(json):
                guard let model: T = Mapper<T>().map(json) else {
                    callback(.Failure(.MappingObjectFailed(json)))
                    return
                }
                callback(.Success(model))
            case let .Failure(error):
                callback(.Failure(error))
            }
        }
    }

    public func update<T: Mappable>(id: String, data: [String: AnyObject], parameters: [String: AnyObject], callback: (Result<T, ServiceError>) -> ()) {
        self.update(id, data: data, parameters: parameters) {
            switch $0 {
            case let .Success(json):
                guard let model: T = Mapper<T>().map(json) else {
                    callback(.Failure(.MappingObjectFailed(json)))
                    return
                }
                callback(.Success(model))
            case let .Failure(error):
                callback(.Failure(error))
            }
        }
    }

    public func patch<T: Mappable>(id: String, data: [String: AnyObject], parameters: [String: AnyObject], callback: (Result<T, ServiceError>) -> ()) {
        self.patch(id, data: data, parameters: parameters) {
            switch $0 {
            case let .Success(json):
                guard let model: T = Mapper<T>().map(json) else {
                    callback(.Failure(.MappingObjectFailed(json)))
                    return
                }
                callback(.Success(model))
            case let .Failure(error):
                callback(.Failure(error))
            }
        }
    }

    public func remove<T: Mappable>(id: String, parameters: [String: AnyObject], callback: (Result<T, ServiceError>) -> ()) {
        self.remove(id, parameters: parameters) {
            switch $0 {
            case let .Success(json):
                guard let model: T = Mapper<T>().map(json) else {
                    callback(.Failure(.MappingObjectFailed(json)))
                    return
                }
                callback(.Success(model))
            case let .Failure(error):
                callback(.Failure(error))
            }
        }
    }

}