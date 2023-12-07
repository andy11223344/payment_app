//
//  UICollectionView+Ext.swift
//
//  Created by handika.syahputra on 24/02/23.
//

import UIKit

extension UICollectionView {
    
    // MARK: Reusable support for UICollectionView
    public final func register<T: UICollectionViewCell>(cellType: T.Type) where T: Reusable & NibLoadable {
        self.register(cellType.nib, forCellWithReuseIdentifier: cellType.reuseIdentifier)
    }
    
    public final func register<T: UICollectionViewCell>(cellType: T.Type) where T: Reusable {
        self.register(cellType.self, forCellWithReuseIdentifier: cellType.reuseIdentifier)
    }
    
    public final func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath, cellType: T.Type = T.self) -> T where T: Reusable {
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: cellType.reuseIdentifier, for: indexPath) as? T else {
            fatalError(
                "Failed to dequeue a cell with identifier \(cellType.reuseIdentifier) matching type \(cellType.self). "
                + "Check that the reuseIdentifier is set properly in your XIB/Storyboard "
                + "and that you registered the cell beforehand"
            )
        }
        return cell
    }
}


fileprivate class RowInformation {
    var spacing: CGFloat
    var cells: [UICollectionViewCell] = [] {
        didSet {
            width = cells.reduce(0.0, { $0 + $1.intrinsicContentSize.width })
            if !cells.isEmpty {
                width += CGFloat(cells.count - 1) * spacing
            }
        }
    }
    var width: CGFloat = 0.0
    
    init(spacing: CGFloat) {
        self.spacing = spacing
    }
}

extension UICollectionView {
    func getOptimalCells(_ cells: [UICollectionViewCell], maxWidth: CGFloat) -> [UICollectionViewCell] {
        var rows: [RowInformation] = []
        let spacing = (self.collectionViewLayout
            as? UICollectionViewFlowLayout)?.minimumInteritemSpacing ?? 0.0
        
        var cellsCopy = cells
//        cellsCopy.sort(by: { $0.intrinsicContentSize.width > $1.intrinsicContentSize.width })
        
        cellsCopy.forEach { (cell) in
            var isAdded: Bool = false
            for row in rows {
                if row.width + cell.intrinsicContentSize.width + spacing < maxWidth {
                    row.cells.append(cell)
                    isAdded = true
                    break
                }
            }
            if !isAdded {
                let newRow = RowInformation(spacing: spacing)
                newRow.cells.append(cell)
                rows.append(newRow)
            }
        }
        
        cellsCopy = rows.reduce(into: [UICollectionViewCell](), { (cells, row) in
            cells.append(contentsOf: row.cells)
        })
        
        return cellsCopy
    }
}
