//
//  Quote.swift
//
//  Copyright © 2016 Neil Cowburn. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import Foundation

struct Quote {
    private (set) var body: String
    private (set) var author: String
    private (set) var category: String
}

// -----------------------------------------------------------------------------------------------------------------------------------------

extension Quote {
    // Here I add a simple static method in order to provide some sample data for the table view
    static func quotes() -> [Quote] {
        return [
            Quote(body: "It is a wise father that knows his own child.", author: "William Shakespeare", category: "Shakespeare"),

            Quote(body: "To raise new questions, new possibilities, to regard old problems from a new angle, requires creative " +
                "imagination and marks real advance in science.", author: "Albert Einstein", category: "Einstein"),

            Quote(body: "This life, which had been the tomb of his virtue and of his honour, is but a walking shadow; a poor player, " +
                "that struts and frets his hour upon the stage, and then is heard no more: it is a tale told by an idiot, full of sound " +
                "and fury, signifying nothing.", author: "William Shakespeare", category: "Shakespeare"),

            Quote(body: "The world is a dangerous place to live; not because of the people who are evil, but because of the people who " +
                "don't do anything about it.", author: "Albert Einstein", category: "Einstein"),

            Quote(body: "Doubt thou the stars are fire, Doubt that the sun doth move. Doubt truth to be a liar, But never doubt I love.",
                author: "William Shakespeare", category: "Shakespeare"),
            
            Quote(body: "Strive not to be a success, but rather to be of value.", author: "Albert Einstein", category: "Einstein")
        ]
    }
}