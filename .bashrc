# ctrl+s で出力がロックされてしまうのを防ぐ
stty stop undef

# エイリアスを設定
alias ls='ls -CF'
alias ll='ls -AlFh --show-control-chars --color=auto'
alias la='ls -CFal'
alias mv='mv -i'
alias rm='rm -i'
alias cp='cp -i'
alias ps='ps --sort=start_time'

# 自作コマンドの登録
set -e -o pipefail

# 
# findstr
#   ファイルやディレクトリを指定し、ファイル中のテキスト文字列を検索する
#       USAGE: findstr 検索文字列 [(ファイル|ディレクトリ)]
#   第2引数を省略した場合、カレントディレクトリが指定される
#
function findstr() {
        # 引数が1~2個あることを確認
        if [[ $# -lt 1 ]] || [[ $# -gt 2 ]]; then
                echo "usage: findstr PATTERNS [FILE]" 1>&2
                return 1
        fi

        # 第2引数がファイルまたはディレクトリであることを確認
        if [[ ! -e "${2:-$(pwd)}" ]]; then
                echo "usage: findstr PATTERNS [FILE]" 1>&2
                return 1
        fi

        grep -E "$1" -rl "${2:-$(pwd)}"
        return 0
}

set +e +o pipefail

# プロンプト表示の設定
PS1='\[\e[1;32m\]\u@\h:\w \$ \[\e[m\]'

# 環境変数の設定
export PATH=$PATH:/sbin:/usr/sbin
export EDITOR='/usr/bin/vim' # visudo とかで使われる
export HISTCONTROL=ignoreboth # 連続して実行したコマンドを重複して履歴に載せない
export HISTSIZE=50000
export HISTTIMEFORMAT='%F %T '
export LANG='ja_JP.UTF-8'
export LC_ALL='ja_JP.UTF-8'
export LC_MESSAGES='ja_JP.UTF-8'
