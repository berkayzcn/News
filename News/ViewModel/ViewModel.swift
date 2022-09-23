//
//  ViewModel.swift
//  News
//
//  Created by Berkay Ozcan on 13/09/2022.
//

import Foundation

struct newsTableVM {
    let newlist : [News]
    
    func forRowsInSection() -> Int {
        return self.newlist.count
    }
    func newsAtIndexPath(_ index: Int) -> NewsViewModel{
        let NEWS = self.newlist[index]
        return NewsViewModel(news: NEWS)
    }

}

struct NewsViewModel {
    let news : News
    
    var title : String{
        return self.news.title
    }
    var story : String{
        return self.news.story
    }
}
