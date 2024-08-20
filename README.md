<p align="center"><img src="art/banner-2x.png"></p>

## Introduction

이 저장소는 Taking의 Mac의 설정을 설정하고 유지하는데 도움을 주고자 만든 dotfiles 입니다. 이를 통해 수동으로 설치하는 수고를 덜어주고 Applications을 포함한 시스템 설정을 빠르게 설치할 수 있습니다.

## How-to

### 맥 구성하기

백업 후에 아래 과정을 따라 새로운 MAC을 설정합니다.

0. 권한 설정
    시스템 설정 > 개인정보 보호 및 보안 > 전체 디스크 접근 권한 > 터미널 사용 설정

1. SSH 설정
    [generate a new public and private SSH key](https://docs.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent) 실행:

    ```zsh
    curl https://raw.githubusercontent.com/taking/dotfiles/HEAD/ssh.sh | sh -s "taking@duck.com"
    ```

2. 저장소를 `$HOME/.dotfiles`로 복사:

    ```zsh
    git clone --recursive git@github.com:taking/dotfiles.git $HOME/.dotfiles
    ```

3. 설치 실행:

    ```zsh
    cd $HOME/.dotfiles && ./fresh.sh
    ```
4. 재부팅

<br />

🎉 뿌뿌! 맥 설정이 완료되었습니다!

<br />

## 콘픽 설정 (`.config`)
- Karabiner 심볼링 링크 설정
  - `ln -sw ${DOTFILES}/config/karabiner.json ${HOME}/.config/karabiner/karabiner.json`

- VS Code, Cursor 심볼링 링크 설정
  - `ln -sw ${DOTFILES}/config/vscode-settings.json ${HOME}/Library/Application Support/Code/User/settings.json`
  - `ln -sw ${DOTFILES}/config/vscode-settings.json ${HOME}/Library/Application Support/Cursor/User/settings.json`

- Helix 심볼링 링크 설정
  - `ln -sw ${DOTFILES}/config/helix-config.toml ${HOME}/.config/helix/config.toml`

<br />

## macos 설정 (`.macos`)

### 1. 일반 UI/UX 설정

- 컴퓨터 이름 변경 → `taking-macbook` 
- 부팅 사운드 비활성화
- 애니메이션 속도 빠르게 변경
- 파일 저장 및 인쇄를 기본적으로 확장 설정
- 기본 파일 저장 위치를 로컬로 설정
- 인쇄 작업이 완료되면 프린터 앱 자동 종료
- "이 애플리케이션을 열겠습니까?" 대화 상자 비활성화
- 충돌 보고 비활성화
- 알람센터 비활성화

### 2. 트랙패드, 마우스, 키보드 설정

- Bluetooth 오디오 품질 향상 설정
- 전체 키보드 접근 허용 설정
- 키 반복 속도 조정
- 시스템 언어 및 지역 설정
- 시간대 설정 → `Asia/Seoul`

### 3. 에너지 절약 설정

- 전원 차단 후 자동 재시작
- 디스플레이 절전 시간 설정 → `10분`
- 시스템 절전 모드 설정 → `15분`
- 대기 시간 지연 설정 → `24시간`

### 4. 화면 설정

- 서브픽셀 폰트 렌더링 재활성화
- 화면 보호기 시작 시 비밀번호 요구
- Finder 기본 보기를 `목록 보기`로 설정 및 파일 확장자를 항상 표시

### 5. Dock, Dashboard, 핫 코너 설정

- Dock 하단 설정 및 크기 `48` 설정
- Dock 자동 숨기기 설정 및 딜레이 `0` 설정
- Dock 최소화/최대화 효과 설정 → `scale`
- Dock 최근 사용 앱 표시 비활성화
- 핫 코너 오른쪽 상단 모서리 설정 → `디스플레이 잠금`

## Thanks To...
Fork by [driesvints/dotilfes](https://github.com/driesvints/dotfiles)