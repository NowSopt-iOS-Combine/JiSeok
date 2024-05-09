//
//  LoginViewModel.swift
//  34th-Sopt-Assignment
//
//  Created by 한지석 on 5/9/24.
//

import Foundation
import Combine

final class LoginViewModel {
    @Published var idTextInput: String = ""
    @Published var passwordTextInput: String = ""
    lazy var isVaild: AnyPublisher<Bool, Never> = Publishers
        .CombineLatest($idTextInput,
                       $passwordTextInput)
        .map {
            if $0.isEmpty || $1.isEmpty {
                return false
            } else {
                if $0.isIdVaild() && $1.isPasswordVaild() {
                    return true
                } else {
                    return false
                }
            }
        }
        .eraseToAnyPublisher()
}
