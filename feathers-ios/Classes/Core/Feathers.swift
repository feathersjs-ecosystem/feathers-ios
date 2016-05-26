//
//  Feathers.swift
//  Pods
//
//  Created by Brendan Conron on 3/21/16.
//
//

import UIKit

private class ServiceWrapper {
    
}

public class Feathers {

    let baseURL: NSURL

    private var services: [String: Service] = [:]

    init(baseURL: NSURL) {
        self.baseURL = baseURL
    }

    func use(name: String, service: Service) -> Self {
        self.services[name] = service
        return self
    }

    func service(path: String) {

    }

}
