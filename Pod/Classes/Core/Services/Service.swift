//
//  Service.swift
//  Pods
//
//  Created by Brendan Conron on 3/21/16.
//
//

import Foundation

/**
 Details the interface for a feathers service. Conformers may implement
 all or none of the methods as default implementations are provided via protocol
 extension.
 */
public protocol Service {

    static func find()
    static func get()
    static func create()
    static func remove()
    static func update()
    static func patch()
    static func setup()

}