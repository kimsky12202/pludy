# Pludy - 파인만 학습법 AI 튜터

파인만 학습법 기반 AI 튜터 및 퀴즈 시스템입니다.

## 프로젝트 구조

```
pludy/
├── api/          # FastAPI 백엔드 서버
├── flutter/      # Flutter 모바일 앱
└── ai/           # AI 관련 스크립트
```

## 실행 방법

### 1. API 서버 실행 (백엔드)

#### 사전 요구사항
- Python 3.8 이상
- pip

#### 실행 단계

```bash
# 1. api 디렉토리로 이동
cd api

# 2. 가상환경 활성화 (이미 생성되어 있는 경우)
source venv/bin/activate  # Linux/Mac
# 또는
venv\Scripts\activate     # Windows

# 가상환경이 없는 경우 생성
python -m venv venv
source venv/bin/activate

# 3. 필요한 패키지 설치
pip install -r requirements.txt

# 4. 환경 변수 설정
# .env 파일 확인 및 필요시 수정

# 5. 서버 실행
python server.py
# 또는
uvicorn server:app --reload --host 0.0.0.0 --port 8000
```

서버가 정상적으로 실행되면 `http://localhost:8000`에서 API에 접근할 수 있습니다.
- API 문서: `http://localhost:8000/docs`
- Alternative 문서: `http://localhost:8000/redoc`

### 2. Flutter 앱 실행 (모바일 클라이언트)

#### 사전 요구사항
- Flutter SDK 3.7.2 이상
- Android Studio / Xcode (모바일 개발용)
- 연결된 디바이스 또는 에뮬레이터

#### 실행 단계

```bash
# 1. flutter 디렉토리로 이동
cd flutter

# 2. 패키지 설치
flutter pub get

# 3. 디바이스 확인
flutter devices

# 4. 앱 실행
flutter run
```

#### API 서버 주소 설정
Flutter 앱이 API 서버에 연결하려면 서버 주소를 설정해야 합니다.
- 로컬 테스트: `http://localhost:8000` 또는 `http://10.0.2.2:8000` (Android 에뮬레이터)
- 실제 기기: 컴퓨터의 로컬 IP 주소 사용 (예: `http://192.168.x.x:8000`)

### 3. AI 스크립트 실행

```bash
# 1. ai 디렉토리로 이동
cd ai

# 2. 가상환경 활성화
source venv/bin/activate  # Linux/Mac
# 또는
venv\Scripts\activate     # Windows

# 3. 스크립트 실행
python practice.py
```

## 주요 기능

### API 서버
- 파인만 학습법 기반 AI 튜터링
- PDF 문서 분석 및 학습 자료 생성
- 퀴즈 자동 생성
- WebSocket 기반 실시간 학습 세션
- 사용자 인증 및 관리
- 학습 진도 추적

### Flutter 앱
- 직관적인 모바일 UI
- 실시간 학습 세션
- 퀴즈 풀이 및 결과 확인
- PDF 파일 업로드
- 학습 기록 관리

## 개발 도구

### API 서버 테스트
```bash
cd api
python test_connection.py  # 연결 테스트
python test_feynman.py     # 파인만 학습 테스트
```

### 데이터베이스 초기화
```bash
cd api
python reset_db.py
```

## 기술 스택

### 백엔드
- FastAPI
- SQLAlchemy
- WebSockets
- LangChain
- JWT 인증

### 프론트엔드
- Flutter
- Provider (상태 관리)
- WebSocket
- HTTP

## 환경 설정

### API 서버 (.env)
api 디렉토리의 `.env` 파일에서 다음 설정을 확인하세요:
- 데이터베이스 설정
- API 키 설정
- 기타 환경 변수

## 문제 해결

### API 서버 실행 오류
1. Python 버전 확인: `python --version`
2. 필요한 패키지 재설치: `pip install -r requirements.txt`
3. .env 파일 확인

### Flutter 앱 실행 오류
1. Flutter 버전 확인: `flutter --version`
2. 패키지 재설치: `flutter pub get`
3. 캐시 정리: `flutter clean`

### 서버 연결 오류
1. API 서버가 실행 중인지 확인
2. 방화벽 설정 확인
3. 서버 주소가 올바른지 확인

## 라이센스

이 프로젝트는 교육 목적으로 제작되었습니다.
