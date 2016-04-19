//
//  ViewController.swift
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

class ViewController: UITableViewController {
    var prototypeCell: QuoteCell!

    // Initialise the data source used by the table view
    let quotes = Quote.quotes()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Register my UITableViewCell subclass with the table view so that I can reuse it later
        tableView.registerClass(QuoteCell.self, forCellReuseIdentifier: QuoteCell.CellReuseIdentifier)

        // This two properties are critical to getting the UITableViewCells to auto-resize based upon their content.
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 44.0

        title = "Quotes"
        navigationController?.navigationBar.barTintColor = UIColor.whiteColor()
    }
}

// -----------------------------------------------------------------------------------------------------------------------------------------

extension ViewController {
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quotes.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCellWithIdentifier(QuoteCell.CellReuseIdentifier) as? QuoteCell else {
            return QuoteCell()
        }

        // Here I create a ViewModel from the model...
        let viewModel = QuoteViewModel(model: quotes[indexPath.row % quotes.count])
        // ... and hand the ViewModel off to the View (the table view cell) for rendering.
        cell.configure(withPresenter: viewModel)

        // Simple, huh? :) View controllers don't need to be overly complicated monsters.

        return cell
    }
}
