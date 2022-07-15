## 1️⃣ STEP 1

### STEP 1 Questions 

#### Q1. 타입 형식에 맞는 `JSON`데이터 가져오는 법
현재 메서드가 `JSON` 파싱을 위해 `URL` 정보 중 `key:value`에 맞는 타입 값을 지정해줘야 합니다. 하지만 이러한 방법은 메소드 재사용성이 별로 좋지 않다고 생각 하고 있는데 별다른 방법이 떠오르지 않았습니다... 혹시 콘이라면 이러한 상황일 때 어떻게 표현하는게 좋은 지에 대한 생각을 듣고 싶습니다!
    
### STEP 1 Answers 

#### A1. 타입 형식에 맞는 `JSON`데이터 가져오는 법
보통 데이터를 가져올 때
외부 저장소(서버)에 접근하는 객체
이를 사용해 화면에서 사용되는 적절한 화면의 데이터로 매핑하는 객체
이렇게 두 가지 객체를 활용해요. 즉 1번 객체는 여러곳에서 재사용될 수 있고 2번 객체는 특정 화면에서만 사용 혹은 특정 도메인 안에서 재사용될 수 있겠죠!
그래서 보통 1번 객체는 제네릭을 활용하는 편이에요. (T: Decodable) 그리고 이를 사용하는 2번객체에선 원하는 모델(Network)로 매핑을 해서 다시 원하는 타입으로 사용하는 곳에 돌려주는 편이에요!

---
### STEP 1 TroubleShooting
    
#### T1. HTTP method `POST` 테스트
`POST` method 를 통해 서버에 테스트 데이터를 API문서를 보면서 필요한 정보에 대해 Json 형식으로 `POST`를 해주었지만, 계속해서 `400` 에러가 발생되었습니다. 알고 보니 해당 서버 접근에 필요한 `id` 와 `password`가 아직 할당 받지 못해서 발생된 에러였습니다. 
    
---
    
### STEP 1 Concepts
- Json
- URLSession
- HTTP Method
- 
---
### STEP 1 Reviews And Updates
[STEP1PR](https://github.com/yagom-academy/ios-open-market/pull/175)
---
