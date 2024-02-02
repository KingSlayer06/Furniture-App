//
//  CarouselDots.swift
//  Furniture App
//
//  Created by Himanshu Sherkar on 31/01/24.
//

import SwiftUI

struct DynamicCarouselDotsView: UIViewRepresentable {
    
    @Binding var currentPage: Int
    var numberOfPages: Int
    var currentPageIndicatorTintColor: UIColor
    var pageIndicatorTintColor: UIColor

    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }

    func makeUIView(context: Context) -> DynamicDotsUIKit {
        let pageControl = DynamicDotsUIKit()
        pageControl.numberOfPages = numberOfPages
        pageControl.pageIndicatorTintColor = pageIndicatorTintColor
        pageControl.currentPageIndicatorTintColor = currentPageIndicatorTintColor
        return pageControl
    }

    func updateUIView(_ uiView: DynamicDotsUIKit, context: Context) {
        uiView.numberOfPages = numberOfPages
        uiView.setCurrentPage(at: currentPage, animated: true)
    }

    class Coordinator: NSObject {
        var parent: DynamicCarouselDotsView

        init(_ parent: DynamicCarouselDotsView) {
            self.parent = parent
        }
    }
}
