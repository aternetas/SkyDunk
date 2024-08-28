//
//  UserService.swift
//  SkyDunk
//
//  Created by aternetas on 28.08.2024.
//

import RxSwift

class UserService {
    
    func getCurrentBalance() -> Observable<Double> {
        Observable<Double>.just(64.8)
    }
}
