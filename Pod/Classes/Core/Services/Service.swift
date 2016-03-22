//
//  Service.swift
//  Pods
//
//  Created by Brendan Conron on 3/21/16.
//
//

import Foundation

public class Service {

}

public protocol ServiceType {

    func find<T, Error: ErrorType>(parameters: [String: AnyObject]?, block: (error: Error, result: [T]) -> ())
    func get<T, Error: ErrorType>(id: String, parameters: [String: AnyObject]?, block: (error: Error, result: T))
    func create<T, Error: ErrorType>(data: [String: AnyObject], parameters: [String: AnyObject]?, block: (error: Error, result: T))
    func update<T, Error: ErrorType>(id: String, data: [String: AnyObject], parameters: [String: AnyObject]?, block: (error: Error, result: T))
    func patch<T, Error: ErrorType>(id: String, data: [String: AnyObject], parameters: [String: AnyObject]?, block: (error: Error, result: T))
    func remove<T, Error: ErrorType>(id: String, parameters: [String: AnyObject]?, block: (error: Error, result: T))
    func setup(app: Feathers, path: String)

    var service: Service { get }

}

public extension ServiceType {
    func find<T, Error: ErrorType>(parameters: [String: AnyObject]?, block: (error: Error, result: [T]) -> ()) {}
    func get<T, Error: ErrorType>(id: String, parameters: [String: AnyObject]?, block: (error: Error, result: T)) {}
    func create<T, Error: ErrorType>(data: [String: AnyObject], parameters: [String: AnyObject]?, block: (error: Error, result: T)) {}
    func update<T, Error: ErrorType>(id: String, data: [String: AnyObject], parameters: [String: AnyObject]?, block: (error: Error, result: T)) {}
    func patch<T, Error: ErrorType>(id: String, data: [String: AnyObject], parameters: [String: AnyObject]?, block: (error: Error, result: T)) {}
    func remove<T, Error: ErrorType>(id: String, parameters: [String: AnyObject]?, block: (error: Error, result: T)) {}
    func setup(app: Feathers, path: String) {}
}



extension Service: ServiceType {
    public var service: Service {
        return self
    }
}