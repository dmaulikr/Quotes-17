//
//  QuoteCell.swift
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

// -----------------------------------------------------------------------------------------------------------------------------------------

class QuoteCell: UITableViewCell {

    // This is used by table view controllers to register this class as 
    // the table view cell type
    static let CellReuseIdentifier = "QuoteCell"


    // Here I use lazy intitialisation of the cell's sub-views. 
    // It's a convenience pattern for setting defaults on views.
    private lazy var titleLabel: UILabel! = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .ByWordWrapping
        label.font = UIFont.systemFontOfSize(UIFont.systemFontSize())
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(white: 1.0, alpha: 0.8)
        label.textAlignment = .Left
        return label
    }()

    private lazy var bodyLabel: UILabel! = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .ByWordWrapping
        label.font = UIFont.systemFontOfSize(UIFont.systemFontSize())
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(white: 1.0, alpha: 0.8)
        return label
    }()

    private lazy var authorLabel: UILabel! = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .ByWordWrapping
        label.font = UIFont.systemFontOfSize(10.0)
        label.textAlignment = .Right
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(white: 1.0, alpha: 0.8)
        return label
    }()

    // This variable is used to prevent repeatedly adding the Auto-Layout constraints
    private var addedConstraints: Bool = false

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        setupCell()
    }

    private func setupCell() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(bodyLabel)
        contentView.addSubview(authorLabel)

        setNeedsUpdateConstraints()
    }

    // Add the constraints to the cell's sub-views. It's a very basic layout 
    // consisting of two fixed-height labels sandwiching a variable height label.
    override func updateConstraints() {
        if !addedConstraints {
            // titleLabel: Anchored to the top, left, and right. Height is exactly 14.0 points.
            titleLabel.heightAnchor.constraintEqualToConstant(22.0).active = true
            titleLabel.topAnchor.constraintEqualToAnchor(contentView.layoutMarginsGuide.topAnchor).active = true
            titleLabel.leadingAnchor.constraintEqualToAnchor(contentView.layoutMarginsGuide.leadingAnchor).active = true
            titleLabel.trailingAnchor.constraintEqualToAnchor(contentView.layoutMarginsGuide.trailingAnchor).active = true

            // bodyLabel: Anchored to the left, right, to the bottom the title, and to the top of the author. Height is variable.
            bodyLabel.topAnchor.constraintEqualToAnchor(titleLabel.bottomAnchor, constant: 8.0).active = true
            bodyLabel.leadingAnchor.constraintEqualToAnchor(contentView.layoutMarginsGuide.leadingAnchor).active = true
            bodyLabel.trailingAnchor.constraintEqualToAnchor(contentView.layoutMarginsGuide.trailingAnchor).active = true

            // authorLabel: Anchored to the bottom, left, right, and to the bottom the body. Height is exactly 14.0 points.
            authorLabel.topAnchor.constraintEqualToAnchor(bodyLabel.bottomAnchor, constant: 8.0).active = true
            authorLabel.bottomAnchor.constraintEqualToAnchor(contentView.layoutMarginsGuide.bottomAnchor).active = true
            authorLabel.leadingAnchor.constraintEqualToAnchor(contentView.layoutMarginsGuide.leadingAnchor).active = true
            authorLabel.trailingAnchor.constraintEqualToAnchor(contentView.layoutMarginsGuide.trailingAnchor).active = true
            authorLabel.heightAnchor.constraintEqualToConstant(18.0).active = true

            addedConstraints = true
        }

        super.updateConstraints()
    }

    // The UITableViewDelegate will call this when setting up each table cell
    func configure(withPresenter presenter: QuotePresentable) {

        // The UI is configured from the ViewModel. 
        // Note that no text formatting is performed here. 
        // It's all in the ViewModel.
        
        bodyLabel.text = presenter.bodyForDisplay
        bodyLabel.textColor = presenter.bodyColor
        bodyLabel.font = presenter.bodyFont

        authorLabel.text = presenter.authorForDisplay
        authorLabel.textColor = presenter.authorColor
        authorLabel.font = presenter.authorFont

        titleLabel.text = presenter.titleForDisplay
        titleLabel.textColor = presenter.titleColor
        titleLabel.font = presenter.titleFont
    }
}
