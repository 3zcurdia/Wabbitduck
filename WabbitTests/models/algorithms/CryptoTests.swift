//
//  CryptoTests
//  WabbitTests
//
//  Created by Luis Ezcurdia on 11/2/17.
//  Copyright © 2017 Luis Ezcurdia. All rights reserved.
//

import XCTest
@testable import Wabbit

class CryptoTests: XCTestCase {
    let text = "Lorem ipsum dolor sit amet, consetetur sadipscing elitr."
    lazy var nsshared = NSCrypto.shared()!

    func testSha1() {
        let expected = "2a0c0bfa51f7aed4c9ea6ecc2650a26d1b4af17c"
        XCTAssertEqual(expected, Crypto.shared.sha1(string: text))
        XCTAssertEqual(expected, nsshared.sha1String(text))
    }

    func testSha256() {
        let expected = "ff640e3eb2f4ce5a3c100a76f247236b0b2eb95776f5bc68151a11cbb3314a80"
        XCTAssertEqual(expected, Crypto.shared.sha256(string: text))
        XCTAssertEqual(expected, nsshared.sha256String(text))
    }

    func testBase64() {
        let expected = "TG9yZW0gaXBzdW0gZG9sb3Igc2l0IGFtZXQsIGNvbnNldGV0dXIgc2FkaXBzY2luZyBlbGl0ci4="
        XCTAssertEqual(expected, Crypto.shared.base64(string: text))
        XCTAssertEqual(expected, nsshared.base64String(text))
    }

    func testBase64Image() {
        let filepath = Bundle.main.path(forResource: "logo128", ofType: "png")!
        let image = UIImage(contentsOfFile: filepath)
        XCTAssertNotNil(Crypto.shared.base64(image: image!))
        XCTAssertNotNil(nsshared.base64Image(image))
    }
}
