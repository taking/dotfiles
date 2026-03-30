# Zellij Cheatsheet (Helix Workflow)

## 🧠 기본 철학
- 평소: locked 상태
- 필요할 때만 잠깐 조작 후 다시 locked

---

## 🔐 기본

Ctrl g      → Zellij 조작 시작 (normal mode 진입)
Esc         → locked 상태로 복귀
Enter       → locked 상태로 복귀

---

## 🧩 Pane (분할 / 관리)

Ctrl g v    → 오른쪽 split
Ctrl g x    → 아래 split
Ctrl g n    → 새 pane (현재 방향)
Ctrl g q    → 현재 pane 닫기
Ctrl g f    → 현재 pane fullscreen

Ctrl g p    → pane 이동 모드
  h/j/k/l   → pane 이동
  p         → pane 순환 이동

---

## 📑 Tab (탭 관리)

Ctrl g t    → 새 탭
Ctrl g w    → 현재 탭 닫기

Ctrl g h    → 이전 탭
Ctrl g l    → 다음 탭

Ctrl g 1~4  → 탭 바로 이동

---

## 🔁 Pane 간 이동

Ctrl g Tab  → 같은 탭 내 pane 순환 이동

---

## 📜 Scroll / 로그

Ctrl g s    → scroll mode

  j/k       → 스크롤
  d/u       → 반 페이지 이동
  PageUp/Down → 페이지 이동

  /         → 검색
  n/p       → 다음/이전 검색

  e         → scrollback을 Helix(hx)로 열기 (🔥 매우 유용)

  Ctrl c    → 맨 아래 + 종료

---

## 🗂 Session

Ctrl g o    → session mode

  w         → session manager 열기
  d         → detach (세션 유지한 채 빠져나오기)

---

## 🚪 종료

Ctrl q      → Zellij 종료 (locked 제외 대부분에서 동작)

---

## 🔥 실전 사용 흐름

### ▶ 기본 개발 루틴
- zellij 실행 → locked 상태 유지
- Helix 작업
- 필요할 때만 Ctrl g

---

### ▶ 탭 기반 작업
Ctrl g t    → 새 탭
Ctrl g h/l  → 탭 이동

---

### ▶ pane 분할
Ctrl g v    → 코드 + 터미널
Ctrl g x    → 로그 / 서버

---

### ▶ 로그 확인
Ctrl g s → scroll
e         → Helix로 열기

---

## 💡 핵심 요약

- Zellij는 "잠깐 쓰는 도구"
- Helix가 "메인 작업 공간"

👉 Ctrl g → 작업 → Esc  
👉 이 흐름만 익히면 충분