//
//  Constants.swift
//  appleMusic
//
//  Created by 이명진 on 2023/07/18.
//
// MARK: - Name Space 만드는 공간



import UIKit


// 데이터 영역에 저장 (열거형, 구조체 다 가능 / 전역 변수로도 선언 가능)
// 사용하게될 API 문자열 묶음
public enum MusicApi {
    static let requestUrl = "https://itunes.apple.com/search?"
    static let mediaParam = "media=music"
}


// 사용하게될 Cell 문자열 묶음
public struct Cell {
    static let musicCellIdentifier = "MusicCellTableViewCell"
    static let musicCollectionViewCellIdentifier = "MusicCollectionViewCell"
    private init() {}
}



// 컬렉션뷰 구성을 위한 설정
public struct CVCell {
    static let spacingWitdh: CGFloat = 1 // 셀간의 간격
    static let cellColumns: CGFloat = 3 // 한줄의 몇개의 컬렉션?
    private init() {}
}


//let REQUEST_URL = "https://itunes.apple.com/search?"


