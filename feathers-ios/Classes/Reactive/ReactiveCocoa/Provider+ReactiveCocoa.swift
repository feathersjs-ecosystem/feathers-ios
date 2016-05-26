//
//  Provider+ReactiveCocoa.swift
//  Pods
//
//  Created by Brendan Conron on 5/25/16.
//
//

import Foundation
import ReactiveCocoa
import Result
import ObjectMapper

extension Provider {
    func rac_find(parameters: [String: AnyObject]) {

    }

    func rac_get(id: String, parameters: [String: AnyObject]) {

    }

    func rac_create(data: [String: AnyObject], parameters: [String: AnyObject]) {

    }

    func rac_update(id: String, data: [String: AnyObject], parameters: [String: AnyObject]) {

    }

    func rac_patch(id: String, data: [String: AnyObject], parameters: [String: AnyObject]) {

    }

    func rac_remove(id: String, parameters: [String: AnyObject]) {

    }

    func rac_find<T: Mappable>(parameters: [String: AnyObject]) -> SignalProducer<[T], ServiceError> {
        return SignalProducer { observer, disposable in
            self.find(parameters) { result in

            }
        }
    }

    func rac_get<T: Mappable>(id: String, parameters: [String: AnyObject]) -> SignalProducer<T, ServiceError> {
        return .empty
    }

    func rac_create<T: Mappable>(data: [String: AnyObject], parameters: [String: AnyObject]) -> SignalProducer<T, ServiceError> {
        return .empty
    }

    func rac_update<T: Mappable>(id: String, data: [String: AnyObject], parameters: [String: AnyObject]) -> SignalProducer<T, ServiceError> {
        return .empty
    }

    func rac_patch<T: Mappable>(id: String, data: [String: AnyObject], parameters: [String: AnyObject]) -> SignalProducer<T, ServiceError> {
        return .empty
    }

    func rac_remove<T: Mappable>(id: String, parameters: [String: AnyObject]) -> SignalProducer<T, ServiceError> {
        return .empty
    }
}