//
//  ShamirAbonent.swift
//  Shamir
//
//  Created by Александр on 01.04.17.
//  Copyright © 2017 IceRockDev. All rights reserved.
//

import Foundation

class ShamirAbonent {
    
    var p: Int!
    var c: Int!
    var d: Int?
    
    init(c: Int, p: Int) {
        self.p = p
        self.c = c
        
        let a = euklid(a: p-1, b: c)
        self.d = a[2]
        while self.d! <= 0 {
            self.d! += self.p-1
        }
    }
    
    private func euklid(a: Int, b: Int) -> [Int] {
        var u = [a, 1, 0]
        var v = [b, 0, 1]
        var t = u
        while v[0] != 0 {
            let q = u[0]/v[0]
            for i in 0...2 {
                u[i] -= v[i] * q
            }
            t = u
            u = v
            v = t
        }
        return u
    }
    
    func code(m: Int, byModule p: Int) -> Int {
        let t = Int(pow(Double(m), Double(c)))
        return t % p
    }
    
    func decode(m: Int, byModule p: Int) -> Int {
        return Int(pow(Double(m), Double(d!))) % p
    }
}
