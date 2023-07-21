//
//  NetworkManager.swift
//  appleMusic
//
//  Created by 이명진 on 2023/07/21.
//

import UIKit

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {} // 싱글톤 패턴
    
    func fetchMusic(completionHandler: @escaping ([Music]?) -> Void) { // 콜백함수

        // URL구조체 만들기
        guard let url = URL(string: "https://itunes.apple.com/search?media=music&term=jazz") else {
            print("Error: cannot create URL")
            completionHandler(nil)
            return
        }
        
        // URL요청 생성
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        // 요청을 가지고 작업세션시작
        // 비동기 처리
        URLSession.shared.dataTask(with: request) { data, response, error in
            // 에러가 없어야 넘어감
            guard error == nil else {
                print("Error: error calling GET")
                print(error!)
                completionHandler(nil)
                return
            }
            // 옵셔널 바인딩
            guard let safeData = data else {
                print("Error: Did not receive data")
                completionHandler(nil)
                return
            }
            // HTTP 200번대 정상코드인 경우만 다음 코드로 넘어감
            guard let response = response as? HTTPURLResponse, (200 ..< 299) ~= response.statusCode else {
                print("Error: HTTP request failed")
                completionHandler(nil)
                return
            }

            // 원하는 모델이 있다면, JSONDecoder로 decode코드로 구현 ⭐️
    //        print(String(decoding: safeData, as: UTF8.self))
            
            do {
                let decoder = JSONDecoder()
                let musicData = try decoder.decode(MusicData.self, from: safeData)
                completionHandler(musicData.results)
                
            } catch {
                
            }


        }.resume()     // 시작
    }
    
}
