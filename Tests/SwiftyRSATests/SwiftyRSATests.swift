import XCTest
@testable import SwiftyRSA

final class SwiftyRSATests: XCTestCase {
    
    let key = """
-----BEGIN RSA PUBLIC KEY-----
MIGJAoGBAI9fwyD3Hb5ryCjs7tR1n+SNkZgmUXxdMWl6g9L4s9xLsjsE0yjvaPeZRBIroo6Yc+laattX0WhTonMtAI/hP6/4G/ImBSsYUBilHL9BRQjXo7pfh02G93SycNxsOtLtPtHJkSmDWjzj76RJypjpaBaMOIwMlU87pvaeX5d/gXorAgMBAAE=
-----END RSA PUBLIC KEY-----
"""
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        
        let str = "Password"
        
        
        let publicKey = try PublicKey(pemEncoded: key)
        let clear = try ClearMessage(string: str, using: .utf8)
        let encrypted = try clear.encrypted(with: publicKey, padding: .PKCS1)
        print(encrypted.base64String)
    }
}
