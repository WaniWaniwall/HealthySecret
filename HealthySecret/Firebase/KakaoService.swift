//
//  KakaoService.swift
//  HealthySecret
//
//  Created by 양승완 on 2024/01/18.
//

import Foundation
import KakaoSDKAuth
import KakaoSDKUser
import RxSwift

final class KakaoService {
    
    let disposeBag = DisposeBag()
    let firebaseService = FirebaseService()
    
    
    func kakaoLogin() -> Single<[String:String]> {
        
        var outputId : String!
        var outputPassword : String!
        
        return Single.create { single in
            
            if AuthApi.hasToken() {
                
                UserApi.shared.accessTokenInfo { token , error in
                    if let error = error {
                        print("_________login error_________")
                        print(error)
                        print("토큰 존재하지 않음.")
                        if UserApi.isKakaoTalkLoginAvailable() {
                            print("카카오톡 존재")
                            UserApi.shared.loginWithKakaoTalk { oauthToken, error in
                                print("1")
                                if let error = error {
                                    print(error)
                                } else {
                                    print("새로운 Login")
                                    
                                    //do something
                                    _ = oauthToken
                                    
                                    // 로그인 성공 시
                                    UserApi.shared.me { kuser, error in
                                        
                                        if let error = error {
                                            print("------KAKAO : user loading failed------")
                                            print(error)
                                            single(.failure(error))
                                        } else {
                                            
                                            guard let email = ((kuser?.kakaoAccount?.email)) else { return }
                                            guard let pw =  kuser?.id else {return}
                                            
                                            outputId = "kakao_" + email
                                            outputPassword = "kakao_" + String(describing: pw )
                                            
                                        }
                                    }
                                    
                                    
                                    
                                }
                            }
                            
                            single(.success(["email": outputId , "pw" : outputPassword  ] ))
                        }
                        else{
                            UserApi.shared.loginWithKakaoAccount { oauthToken, error in
                                print("2")

                                if let error = error {
                                    print(error)
                                } else {
                                    print("새로운 Login")
                                    
                                    //do something
                                    _ = oauthToken
                                    
                                    // 로그인 성공 시
                                    UserApi.shared.me { kuser, error in
                                        
                                        if let error = error {
                                            print("------KAKAO : user loading failed------")
                                            print(error)
                                            single(.failure(error))
                                        } else {
                                            
                                            guard let email = ((kuser?.kakaoAccount?.email)) else { return }
                                            guard let pw =  kuser?.id else {return}
                                            
                                            outputId = "kakao_" + email
                                            outputPassword = "kakao_" + String(describing: pw )
                                        }
                                    }
                                }
                                
                                
                                single(.success(["email": outputId , "pw" : outputPassword  ] ))

                           
                            }
                        }
                        
                    }
                    else{
                        print("g")
                        UserApi.shared.me { kuser, error in
                            guard let email = ((kuser?.kakaoAccount?.email)) else { return }
                            guard let pw =  kuser?.id else {return}
                            
                            outputId = "kakao_" + email
                            outputPassword = "kakao_" + String(describing: pw )
                            single(.success(["email" : outputId  , "pw" : outputPassword ]))

                        }

                    }
                    
                    
                }
                
                
                
                
            } else {
                if UserApi.isKakaoTalkLoginAvailable() {
                    print("3")
                    UserApi.shared.loginWithKakaoTalk{ oauthToken, error in
                        if let error = error {
                            print(error)
                        } else {
                            print("New Kakao Login")
                            
                            //do something
                            _ = oauthToken
                            
                            // 로그인 성공 시
                            UserApi.shared.me { kuser, error in
                                if let error = error {
                                    print("------KAKAO : user loading failed------")
                                    print(error)
                                } else {
                                    guard let email = ((kuser?.kakaoAccount?.email)) else { return }
                                    guard let pw =  kuser?.id else {return}
                                    
                                    outputId = "kakao_" + email
                                    outputPassword = "kakao_" + String(describing: pw )
                                }
                            }
                            
                            print("갱신")
                        }
                        single(.success(["email": outputId , "pw" : outputPassword  ] ))

                    }
                }
                else {
                    UserApi.shared.loginWithKakaoAccount { oauthToken, error in
                        print("4")
                        
                        if let error = error {
                            print(error)
                        } else {
                            print("New Kakao Login")
                            
                            //do something
                            _ = oauthToken
                            
                            // 로그인 성공 시
                            UserApi.shared.me { kuser, error in
                                if let error = error {
                                    print("------KAKAO : user loading failed------")
                                    print(error)
                                } else {
                                    guard let email = ((kuser?.kakaoAccount?.email)) else { return }
                                    guard let pw =  kuser?.id else {return}
                                    
                                    outputId = "kakao_" + email
                                    outputPassword = "kakao_" + String(describing: pw )
                                }
                            }
                            
                            print("갱신")
                            
                        }
                        single(.success(["email": outputId , "pw" : outputPassword  ] ))

                    }
                    
                }
            }
            return Disposables.create()
            
        }
        
    }
    
    
    }