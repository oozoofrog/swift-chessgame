# swift-chessgame


## specification



### 1. Board

- 8(rank)x8(file) 크기
- 가로줄 = rank
- 세로줄 = file

#### 1.1 기능

- 흑과 백 점수 출력
- 체스말 생성
- 체스말 위치 변경



### 2. Pieces

- Pawn
  - 점수 - 1 점
  - 표기 - ♟(흑), ♙(백)

- Bishop
  - 점수 - 3 점
  - 표기 - ♝(흑), ♗(백)

- Knight
  - 점수 - 3 점
  - 표기 - ♞(흑), ♘(백)

- Luke
  - 점수 - 5 점
  - 표기 - ♜(흑), ♖(백)

- Queen
  - 점수 - 9 점
  - 표기 - ♛(흑), ♕(백)

- 빈곳
  - 표기 - .(점) 으로 표시

#### 2.1 기능

- 이동 규칙 체크