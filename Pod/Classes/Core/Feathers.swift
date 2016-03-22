//
//  Feathers.swift
//  Pods
//
//  Created by Brendan Conron on 3/21/16.
//
//

import UIKit

public class Feathers {
    static let singleton = Feathers()
    private init() {}

    private var providers: [Provider] = []
    private var services: [String: Service] = [:]
}


public extension Feathers {

    public final func configure(provider: Provider) {
        self.providers.append(provider)
    }

    public final func use(location: String, service: Service) {
        self.services[location] = service
        service.setup(self, path: location)
    }

    public final func services(location: String) -> Service? {
        return self.services[location]
    }

}