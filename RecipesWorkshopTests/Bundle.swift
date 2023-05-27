//
//  Bundle.swift
//  RecipesWorkshopTests
//
//  Created by JETS Mobile Lab8 on 27/05/2023.
//

import Foundation
extension Bundle {
    public class var unitTest :Bundle{
        return Bundle(for: ApiServiceTests.self)
    }
}
