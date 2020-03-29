//
//  ItemsPresenter.swift
//  Telstra Test
//
//  Created by Regan Russell on 28/3/20.
//  Copyright © 2020 Regan Russell. All rights reserved.
//

import UIKit

class ItemsPresenter: ObservableObject {
    let interactor = DataModelInteractor()
    @Published var data: DataModel? = nil
    
    
    func update(completion: @escaping( () -> Void )) {
        interactor.fetch( completion: { _ in
            DispatchQueue.main.async {
                self.data = self.interactor.dataModel()
                
                completion()
            }
        } )
    }
    
    func fetch(completion: @escaping(  _ data: [DataModel])->Void )  {
        self.interactor.fetch { data in
            DispatchQueue.main.async {
                completion(data)
            }
        }
    }

}
