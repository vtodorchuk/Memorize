//
//  AspectVGrid.swift
//  Memorize
//
//  Created by Vlady Todorchuk on 14.01.2025.
//

import SwiftUI

struct AspectVGrid<Item, ItemView>: View where ItemView: View, Item: Identifiable, Item: Equatable  {
    var items: [Item]
    var asAspecRatio: CGFloat = 1
    var content: (Item) -> ItemView
    
    var body: some View {
        GeometryReader { geometry in
            let gridItemSize = gridItemSize(
                count:  items.count,
                size: geometry.size,
                asAspecRatio: asAspecRatio
            )
             
            LazyVGrid(columns: [GridItem(.adaptive(minimum: gridItemSize), spacing: 0)], spacing: 0) {
                ForEach(items) { item in
                    content(item)
                        .aspectRatio(asAspecRatio, contentMode: .fit)
                }
            }
        }
    }
    
    func gridItemSize(
        count: Int,
        size: CGSize,
        asAspecRatio aspecRatio: CGFloat
    ) -> CGFloat {
        let count = CGFloat(count)
        var columnCount = 1.0
           
        repeat {
            let width = size.width / columnCount
            let height = width / aspecRatio
            let rowCount = (count / columnCount).rounded(.up)
        
            if rowCount * height < size .height {
                return (size.width / columnCount).rounded(.down)
            }
              
            columnCount += 1
        } while columnCount < count
        
        return min(size.width / count, size.height * aspecRatio).rounded(.down)
    }
}
