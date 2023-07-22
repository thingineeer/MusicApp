//
//  ViewController.swift
//  appleMusic
//
//  Created by 이명진 on 2023/07/14.
//

import UIKit
import SwiftUI


class ViewController: UIViewController {
    
    
    @IBOutlet weak var musicTableView: UITableView!
    
    var networkManager = NetworkManager.shared
    
    // 음악 데이터 빈배열
    var musicArrays: [Music] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        setupDatas()
        
    }
    
    
    func setupTableView() {
        musicTableView.delegate = self
        musicTableView.dataSource = self
        
        // Nib파일 사용시 등록 과정 필요
        // 스토리보드안에 같이 등록한것이 아닌 따로 Nib파일을 만들어서 등록을 해줘야한다.
        musicTableView.register(UINib(nibName: Cell.musicCellIdentifier, bundle: nil), forCellReuseIdentifier: Cell.musicCellIdentifier)
    }
    
    
    func setupDatas() {
        
        networkManager.fetchMusic(searchTerm: "jazz") { result in
            
            switch result {
            case .success(let musicData):
                
                print("데이터를 잘 받았음")
                self.musicArrays = musicData
                
                // 테이블뷰 리로드 
                self.musicTableView.reloadData()
                
            case .failure(let error):
                print(error.localizedDescription)
                
            }
        }
    }
    

}


extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    


}


extension ViewController: UITableViewDelegate {
    
    
    // 자동적으로 셀 높이 잡아주는 속성 (유동적 셀)
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}

















































// MARK: - 뷰 보기

//struct Preview: UIViewControllerRepresentable {
//
//    // 여기 ViewController를 변경해주세요
//    func makeUIViewController(context: Context) -> UIViewController {
//        ViewController()
//    }
//
//    func updateUIViewController(_ uiView: UIViewController,context: Context) {
//        // leave this empty
//    }
//}
//
//struct ViewController_PreviewProvider: PreviewProvider {
//    static var previews: some View {
//        Group {
//            Preview()
//                .edgesIgnoringSafeArea(.all)
//                .previewDisplayName("Preview")
//                .previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro"))
//        }
//    }
//}
//


