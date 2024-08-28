//
//  RxBaseController.swift
//  SkyDunk
//
//  Created by aternetas on 26.08.2024.
//

import RxSwift

class RxBaseController<VM: BaseViewModel>: BaseController<VM> {
    
    let disposeBag = DisposeBag()
}
