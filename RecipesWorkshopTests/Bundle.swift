//
//  Bundle.swift
//  RecipesWorkshopTests
//
//  Created by Mac on 27/05/2023.
//

import Foundation

extension Bundle {
    public class var unitTest :Bundle{
        return Bundle(for: ApiServiceTests.self)
    }
}
