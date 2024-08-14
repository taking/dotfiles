<p align="center"><img src="art/banner-2x.png"></p>

## Introduction

이 저장소는 Taking의 Mac의 설정을 설정하고 유지하는데 도움을 주고자 만든 dotfiles 입니다. 이를 통해 수동으로 설치하는 수고를 덜어주고 Applications을 포함한 시스템 설정을 빠르게 설치할 수 있습니다.

## How-to

### 설치 전에

- 포맷 전에 mackup을 통해 설정을 백업을 진행해야합니다.

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
5. mackup을 통해 설정을 복구하세요. `mackup restore`
7. 재부팅

<br />

🎉 뿌뿌! 맥 설정이 완료되었습니다!

## Thanks To...
Fork by [driesvints/dotilfes](https://github.com/driesvints/dotfiles)