//
//  QuoteViewModel.swift
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

import UIKit

// This protocol will be implemented by ViewModels
protocol QuotePresentable {
    var body: String { get }
    var bodyFont: UIFont { get }
    var bodyColor: UIColor { get }

    var author: String { get }
    var authorFont: UIFont { get }
    var authorColor: UIColor { get }

    var title: String { get }
    var titleFont: UIFont { get }
    var titleColor: UIColor { get }

    var bodyForDisplay: String { get }
    var authorForDisplay: String { get }
    var titleForDisplay: String { get }
}

// -----------------------------------------------------------------------------------------------------------------------------------------

// And here is my ViewModel. 
struct QuoteViewModel: QuotePresentable {
    private(set) var body: String
    private(set) var author: String
    private(set) var title: String

    var bodyColor: UIColor {
        return UIColor(white: 0.2, alpha: 1.0)
    }

    var bodyFont: UIFont {
        return UIFont.systemFontOfSize(14.0)
    }

    var authorFont: UIFont {
        return UIFont.systemFontOfSize(12.0)
    }

    var authorColor: UIColor {
        return UIColor(white: 0.5, alpha: 1.0)
    }

    var titleFont: UIFont {
        return UIFont.systemFontOfSize(12.0)
    }

    var titleColor: UIColor {
        return UIColor(white: 0.5, alpha: 1.0)
    }

    // The following properties format the model 
    // properties ready for display by the UI

    var bodyForDisplay: String {
        return String(format: "“%@”", body)
    }

    var authorForDisplay: String {
        return String(format: "— %@", author)
    }

    var titleForDisplay: String {
        return String(format: "%@", title)
    }

    init(model: Quote) {
        body = model.body
        author = model.author
        title = model.category
    }
}
