//
//  APIService.swift
//  ElmenusTask
//
//  Created by Mohamed Mongy on 7/24/19.
//  Copyright © 2019 Mohamed Mongy. All rights reserved.
//



import RxSwift
import Moya
import Moya_ObjectMapper
import ObjectMapper
import Reachability


class APIService<T> where T:TargetType, T:AccessTokenAuthorizable {

    let disposeBag = DisposeBag()
    var provider:MoyaProvider<T>!


    init() {

        let endpointClosure = { (target: T) -> Endpoint in
            var defaultEndpoint = MoyaProvider.defaultEndpointMapping(for: target)
            defaultEndpoint = defaultEndpoint.adding(newHTTPHeaderFields: target.authentications)
            let request = try! defaultEndpoint.urlRequest()
            request.log()
            return defaultEndpoint
        }

        provider = MoyaProvider<T>(endpointClosure:endpointClosure)
        provider.manager.session.configuration.timeoutIntervalForRequest = 30
        provider.manager.session.configuration.timeoutIntervalForResource = 30
    }



    func request<R:Mappable>(target:T)-> Observable<R> {


        if Reachability.shared.connection != .none  {
            return  self.provider.rx.request(target)

                .do(onSuccess: { response in
                    print("reponse you got >>>>>> \(response)")
                },onError: { error in
                    print("Error you got >>>>>> \(error.localizedDescription)")
                })
                .filterSuccessfulStatusCodes()
                .asObservable()
                .mapObject(R.self)
                .catchError { error in
                    print("Error you got >>>>>> \(error.localizedDescription)")

                    guard let moyaError = error as? MoyaError else { return Observable<R>.error(ErrorType.unkown) }

                    switch moyaError {
                    case .statusCode( let response):
                        if let res = try? response.mapObject(R.self) {
                            return Observable.just(res)
                        }
                        else {
                            return Observable<R>.error(ErrorType.unkown)
                        }
                    default:
                        return Observable<R>.error(ErrorType.unkown)
                    }
              }
        }
        else {
            return Observable<R>.error(ErrorType.noInternet)
        }


    }

}


extension AccessTokenAuthorizable {
    var authentications:[String: String] {
        switch authorizationType {
        case .custom( _):
            return [:]
        case .none:
            return [:]
        case .basic:
            return ["Authorization": "Basic "]
        case .bearer:
            return ["Authorization": "Bearer "]
        }

    }
}



public extension URLRequest {
    public func log() {
        print("-----------------------------------------")
        print("\(httpMethod ?? "") \(self)")
        print("BODY \n \(httpBody?.description ?? "")")
        print("HEADERS \n \(allHTTPHeaderFields ?? [:])")
        print("-----------------------------------------")
    }
}
