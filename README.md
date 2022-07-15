# Open Market

## 프로젝트 소개
URLSession을 이용하여 API정보를 가져와 만드는 오픈마켓 프로젝트입니다. 🙆🏻‍♂️

> 프로젝트 기간: 2022-07-11 ~ 2022-07-22</br>
> 팀원: [finnn](https://github.com/finnn1), [bonf](https://github.com/apwierk2451) </br>
리뷰어: [쿠마](https://github.com/leejun6694)</br>
그라운드룰: [GroundRule](https://github.com/Jeon-Minsu/ios-open-market/tree/step01/Docs/GroundRule.md)

## 📑 목차

- [🧑🏻‍💻🧑🏻‍💻 개발자 소개](#🧑🏻‍💻🧑🏻‍💻-개발자-소개)
- [📈 UML](#[📈-UML)
- [💡 키워드](#[💡-키워드)
- [🤔 핵심경험](#[🤔-핵심경험)
- [📚 참고문서](#[📚-참고문서)
- [📝 기능설명](#[📝-기능설명)
- [🚀 TroubleShooting](#[🚀-TroubleShooting)
    - [🚀 STEP 1](#-STEP-1)

- STEP별 상세 내용
    - [1️⃣ STEP 1](https://github.com/bradheo65/ios-open-market/blob/Step1/Docs/Step01.md)

## 🧑🏻‍💻🧑🏻‍💻 개발자 소개

|Bonf|Finnn|
|:---:|:---:|
|<img src="https://i.imgur.com/9tYqNmy.jpg" width="250" height="250">|<img src="https://i.imgur.com/5EQ0KJy.png" width="250" height="250">|
|[@bonf](https://github.com/)|[@finnn](https://github.com/finnn1)|

## 📈 UML

![image](https://i.imgur.com/hLUTtf4.jpg)

## 💡 키워드
- JSONEncode & Decode
- HTTPRequest & Response
- URLSession
- escaping closure
- completion Handler

## 🤔 핵심경험
- [x] 파싱한 JSON 데이터와 매핑할 모델 설계
- [x] URL Session을 활용한 서버와의 통신
- [x] CodingKeys 프로토콜의 활용
- [x] 네트워크 상황과 무관한 네트워킹 데이터 타입의 단위 테스트(Unit Test)


## 📚 참고문서
- [URLSession](https://developer.apple.com/documentation/foundation/urlsession)
    - [Fetching Website Data into Memory](https://developer.apple.com/documentation/foundation/url_loading_system/fetching_website_data_into_memory)
- [UICollectionView](https://developer.apple.com/documentation/uikit/uicollectionview)
    - [Modern cell configuration](https://developer.apple.com/videos/play/wwdc2020/10027/)
    - [Lists in UICollectionView](https://developer.apple.com/videos/play/wwdc2020/10026)
    - [Implementing Modern Collection Views](https://developer.apple.com/documentation/uikit/views_and_controls/collection_views/implementing_modern_collection_views)


## 📝 기능설명
- **`Products` :**
상품 리스트를 GET 받아 올 때 데이터를 담을 타입입니다.
- **`Page` :**
Products 내부의 pages 데이터를 담을 타입입니다.
- **`ProductsDataManager` :**
API로 부터 데이터를 가져와 Products에 담는 역할을 하는 클래스입니다.
- **`URLSessionError` :**
URLSession 에 관한 에러를 처리하기 위한 Error 열거형입니다.
- **`Titles` :**
SegmentControl에 들어갈 부분을 namespace로 표현한 열거형입니다.
- **`Section` :**
DiffableDataSource 및 snapshot에 사용할 Section의 정보가 담긴 열거형입니다.
- **`ItemCollectionViewCell` :**
CollectionView의 각 셀을 표현하는 customCell입니다.


## 🚀 TroubleShooting
    
### 🚀 STEP 1

### 다른 API와 통신할 때에도 가능한 코드
```swift
func getData<T: Decodable>(pageNumber: Int, itemsPerPage: Int, completion: @escaping (T) -> Void) {
        
    var urlComponent = URLComponents(string: url)
    urlComponent?.queryItems = [
        URLQueryItem(name: "page_no", value: String(pageNumber)),
        URLQueryItem(name: "items_per_page", value: String(itemsPerPage))
    ]

    guard let urlComponentURL = urlComponent?.url else { return }

    let request = URLRequest(url: urlComponentURL)

    sendRequest(request, completion)
    }
```
위 코드와 같이 getData에 Generic타입을 정의하여 다른 타입의 API가 들어와도 사용할 수 있는 메서드로 수정하였습니다.

---
### CustomCell의 ImageView의 높이 조절
CustomCell의 높이가 타이트해서 사용자가 터치를 할 때 잘못 클릭을 할 수도 있겠다는 생각을 했습니다. Layout을 이용해 contentView의 heightAnchor로 설정하려고 하였으나 잘 되지 않았습니다.
```swift   
private func setupCollectionViewLayout() {
    let flowLayout = UICollectionViewFlowLayout()

    let width = self.view.frame.width
    let height = self.view.frame.height

    flowLayout.minimumLineSpacing = 2
    flowLayout.estimatedItemSize = CGSize(width: width, height: height * 0.08)

    collectionView?.collectionViewLayout = flowLayout
}
```
flowLayout을 추가하여 CollectionView의 각 높이를 조절하였습니다.
