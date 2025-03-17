//
//  ViewModel.swift
//  ThrownErrorExample
//
//  Created by Yasin Dalkılıç on 16.03.2025.
//


class ViewModel {
    
    
    func fetchData() {
        do {
          try NetworkManager.shared.apiCall(type: [UserModel].self) { result in
                switch result {
                case .success(let data):
                    print(data)
                case .failure(let error):
                    print(error)
                }
            }
        }catch {
            print(error) // burda apiCall fonksiyonunda invalidURL case durumunu okursun. çünkü urlboş
        }
      
    }
}

// MARK: eğerki Error değerini görmek istemiyorsan direk try ı try? yapıp do ve catch bloklarını kaldırıp nil değeri görebilirsin buda bir çeşit error handling
