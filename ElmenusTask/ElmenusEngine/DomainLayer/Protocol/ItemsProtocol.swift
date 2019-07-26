//
//  ItemsProtocol.swift
//  ElmenusTask
//
//  Created by Mohamed Mongy on 7/26/19.
//  Copyright © 2019 Mohamed Mongy. All rights reserved.
//


import RxSwift


protocol ItemsProtocol {
    func getItems(tagName: String) -> Observable<[Item]>
}


extension ItemsProtocol {
    
    func getItems(tagName: String) -> Observable<[Item]> {
        let items = [
            Item(id: "132548", urlStr: "https://s3.amazonaws.com/elmenusV3/Photos/Normal/i4g2ehuqrvuw61or.jpg", name: "0 - Deserts -  French Fries", description:  "Custom premium cut by farm frites. Add melted cheese for 7LE - chili con carne for 9LE"),
             Item(id: "655882", urlStr:  "https://s3.amazonaws.com/elmenusV3/Photos/Normal/i4g2ia0fav2t9.jpg", name: "0 - Deserts - Nacho Chips & Salsa", description:  "Homemade crispy nacho chips served with fresh salsa dip. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum elementum ac erat semper convallis. Mauris condimentum nibh vitae leo maximus fringilla at vel quam. Aliquam eget eros ac felis tincidunt consequat. Nulla nec molestie orci, ac rhoncus libero. Pellentesque lacinia dolor mauris, laoreet interdum purus consectetur nec. Mauris at justo a nibh ultricies sodales sed sed ipsum. Quisque vestibulum lectus in lacus maximus viverra. Nunc nec tellus et tortor vestibulum volutpat quis nec mi. Integer porttitor lacus vulputate lectus venenatis tempus. Proin pretium mauris sit amet suscipit tristique. Nam facilisis, purus in viverra efficitur, purus ipsum eleifend quam, rhoncus luctus enim diam in turpis. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum elementum ac erat semper convallis. Mauris condimentum nibh vitae leo maximus fringilla at vel quam. Aliquam eget eros ac felis tincidunt consequat. Nulla nec molestie orci, ac rhoncus libero. Pellentesque lacinia dolor mauris, laoreet interdum purus consectetur nec. Mauris at justo a nibh ultricies sodales sed sed ipsum. Quisque vestibulum lectus in lacus maximus viverra. Nunc nec tellus et tortor vestibulum volutpat quis nec mi. Integer porttitor lacus vulputate lectus venenatis tempus. Proin pretium mauris sit amet suscipit tristique. Nam facilisis, purus in viverra efficitur, purus ipsum eleifend quam, rhoncus luctus enim diam in turpis."),
              Item(id: "132548", urlStr: "https://s3.amazonaws.com/elmenusV3/Photos/Normal/odukrzfr.jpg", name: "0 - Deserts -  French Fries", description:  "Custom premium cut by farm frites. Add melted cheese for 7LE - chili con carne for 9LE"),
               Item(id: "655883", urlStr: "https://s3.amazonaws.com/elmenusV3/Photos/Normal/2bo3whfr.jpg", name: "0 - Deserts -  French Fries", description:  "Custom premium cut by farm frites. Add melted cheese for 7LE - chili con carne for 9LE"),
                Item(id: "132548", urlStr: "https://s3.amazonaws.com/elmenusV3/Photos/Normal/340a4i.jpg", name: "0 - Deserts -  French Fries", description:  "Custom premium cut by farm frites. Add melted cheese for 7LE - chili con carne for 9LE"),
                 Item(id: "132548", urlStr: "https://s3.amazonaws.com/elmenusV3/Photos/Normal/izjr1xjtu4p74x6r.jpg", name: "0 - Deserts -  French Fries", description:  "Custom premium cut by farm frites. Add melted cheese for 7LE - chili con carne for 9LE")
          ]
        
        return Observable.just(items)
//             let itemService = ItemsService()
//               return itemService.fetchItems(tagName: tagName)
//                .flatMap({ itemResponse -> Observable<[Item]> in
//                    return Observable.just(itemResponse.items)
//                })
    }
}
