# 오픈마켓 

## 🙋🏻‍♂️ 프로젝트 소개
오픈마켓 어플 입니다 

> 프로젝트 기간: 2022-07-11 ~ 2022-07-22</br>
> 팀원: [백곰](https://github.com/Baek-Gom-95), [브래드](https://github.com/bradheo65) </br>
리뷰어: [Corn](https://github.com/protocorn93)</br>
그라운드롤: [GroundRule](https://github.com/Jeon-Minsu/ios-open-market/tree/step01/Docs/GroundRule.md)

## 📑 목차

- [🧑🏻‍💻🧑🏻‍💻 개발자 소개](#-개발자-소개)
- [📈 UML](#-UML)
- [💡 키워드](#-키워드)
- [🤔 핵심경험](#-핵심경험)
- [📚 참고문서](#-참고문서)
- [📝 기능설명](#-기능설명)
- [🚀 TroubleShooting](#-TroubleShooting)
    - [🚀 STEP 1](#-STEP-1)

- STEP별 상세 내용
    - [1️⃣ STEP 1](https://github.com/bradheo65/ios-open-market/blob/Step1/Docs/Step01.md)

## 🧑🏻‍💻🧑🏻‍💻 개발자 소개

|||
|:---:|:---:|
|<image src = "https://user-images.githubusercontent.com/45350356/174251611-46adf61c-93fa-42a0-815b-2c998af1c258.png" width="250" height="250">| <image src = "https://i.imgur.com/c17eEk8.jpg" width="250" height="250">
|[브래드](https://github.com/bradheo65)|[백곰](https://github.com/Baek-Gom-95)|

## 📈 UML

### [ClassDiagram]

![image](https://user-images.githubusercontent.com/45350356/179156798-ab0a0963-8193-4974-8d51-7ea9712c2342.png)

## 💡 키워드
- HTTP
- URLSession
- URLSession Unit Test

## 🤔 핵심경험
- [x] 파싱한 JSON 데이터와 매핑할 모델 설계
- [x] URL Session을 활용한 서버와의 통신
- [x] CodingKeys 프로토콜의 활용
- [x] 네트워크 상황과 무관한 네트워킹 데이터 타입의 단위 테스트(Unit Test)


## 📚 참고문서
- URLSession
    - Fetching Website Data into Memory
- UICollectionView
    - Modern cell configuration
    - Lists in UICollectionView
    - Implementing Modern Collection Views


## 📝 기능설명
- UrlCollection: URL주소를 Enum 타입으로 만들어주었습니다
- CustomError: Error 타입을 모아놓은곳 입니다
- ProductListResponse: API 주소에서 가져온 Json 타입의 상품 리스트 데이터들을 담을 Model 구조체 입니다
- Product: API 주소에서 가져온 Json 타입의 상품의 상세 데이터들을 담을 Model 구조체 입니다
- JsonParser 
    - dataTask(): 매개변수로 받은 URL 주소를 GET 방식으로 서버와 데이터를 주고받은후 Escaping Closure로 결과값을 반환해 줍니다.
- MockURLSession: 네트워크가 연결되지 않은 상태에서 Unit Test를 진행할때 사용할 코드 입니다

    
## 🚀 TroubleShooting
    
### 🚀 STEP 1

#### T1. HTTP method `POST` 테스트
`POST` method 를 통해 서버에 테스트 데이터를 API문서를 보면서 필요한 정보에 대해 Json 형식으로 `POST`를 해주었지만, 계속해서 `400` 에러가 발생되었습니다. 알고 보니 해당 서버 접근에 필요한 `id` 와 `password`가 아직 할당 받지 못해서 발생된 에러였습니다.    

#### T2. 네트워크가 연결되지 않을 때 네트워크 Unit 테스트
네트워크 Unit 테스트 목적: 인터넷에 의존하기 떄문에 테스트를 신뢰할 수 없어서, 실제 서버와 통신하면 의도치 않은 결과 도출될 수 있음. 실제 서버에 영향이 갈 수 도 있어 테스트가 필수적이다. 하지만 테스트 코드 직접 작성하고 나서 실행 시 결과 값이 클로저의 데이터값을 확인하는 것이기 때문에 비동기적으로 실행되서 무조건 `SUCCESS`로 되어서 비동기 테스트에 대한 지식이 필요하다.
