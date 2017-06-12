FROM alpine:latest
MAINTAINER zuolan <i@zuolan.me>
ENV HOME=/home/user \
    TERM=xterm-256color \
    DISABLE=""

RUN mkdir -p /home/user/workspace && \
    apk add --update --no-cache vim
RUN apk add --update curl && \
    mkdir -p ~/.vim/bundle ~/.vim/autoload ~/.vim_runtime/temp_dirs && \
    curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim && \
    echo "execute pathogen#infect()" >> /etc/vim/vimrc && \
    echo "syntax on" >> /etc/vim/vimrc && \
    echo "filetype plugin indent on" >> /etc/vim/vimrc
#    apk del curl && rm -rf /var/cache/* /var/log/* /var/tmp/*

# 插件依赖
RUN apk --update add curl ctags git python bash ncurses-terminfo                                                && \
# 安装 YouCompleteMe
    apk add --virtual build-deps go llvm perl cmake python-dev build-base                                       && \
    git clone --depth 1  https://github.com/Valloric/YouCompleteMe.git ~/.vim/bundle/YouCompleteMe/    && \
    cd ~/.vim/bundle/YouCompleteMe                                                                     && \
    git submodule update --init --recursive                                                                     && \
    ~/.vim/bundle/YouCompleteMe/install.py --gocode-completer                                          && \
# 安装 procvim.vim                                                                               
    git clone --depth 1 https://github.com/Shougo/vimproc.vim.git ~/.vim/bundle/vimproc.vim            && \
    cd ~/.vim/bundle/vimproc.vim                                                                       && \
    make                                                                                                        && \
# 清理
    rm -rf ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp /usr/lib/go                                   \
      ~/.vim/bundle/YouCompleteMe/third_party/ycmd/clang_includes                                      && \
    apk del build-deps                                                                                          && \
    apk add libxt libx11 libstdc++

RUN cd ~/.vim/bundle/                                                                                  && \
    git clone --depth 1 https://github.com/pangloss/vim-javascript.git                                          && \
    git clone --depth 1 https://github.com/scrooloose/nerdcommenter.git                                         && \
    git clone --depth 1 https://github.com/godlygeek/tabular.git                                                && \
    git clone --depth 1 https://github.com/Raimondi/delimitMate.git                                             && \
    git clone --depth 1 https://github.com/nathanaelkane/vim-indent-guides.git                                  && \
    git clone --depth 1 https://github.com/groenewege/vim-less.git                                              && \
    git clone --depth 1 https://github.com/othree/html5.vim.git                                                 && \
    git clone --depth 1 https://github.com/elzr/vim-json.git                                                    && \
    git clone --depth 1 https://github.com/bling/vim-airline.git                                                && \
    git clone --depth 1 https://github.com/easymotion/vim-easymotion.git                                        && \
    git clone --depth 1 https://github.com/mbbill/undotree.git                                                  && \
    git clone --depth 1 https://github.com/majutsushi/tagbar.git                                                && \
    git clone --depth 1 https://github.com/vim-scripts/EasyGrep.git                                             && \
    git clone --depth 1 https://github.com/jlanzarotta/bufexplorer.git                                          && \
    git clone --depth 1 https://github.com/kien/ctrlp.vim.git                                                   && \
    git clone --depth 1 https://github.com/scrooloose/nerdtree.git                                              && \
    git clone --depth 1 https://github.com/jistr/vim-nerdtree-tabs.git                                          && \
    git clone --depth 1 https://github.com/scrooloose/syntastic.git                                             && \
    git clone --depth 1 https://github.com/tomtom/tlib_vim.git                                                  && \
    git clone --depth 1 https://github.com/marcweber/vim-addon-mw-utils.git                                     && \
    git clone --depth 1 https://github.com/altercation/vim-colors-solarized.git                                 && \
    git clone --depth 1 https://github.com/vim-scripts/taglist.vim.git                                          && \
    git clone --depth 1 https://github.com/terryma/vim-expand-region.git                                        && \
    git clone --depth 1 https://github.com/tpope/vim-fugitive.git                                               && \
    git clone --depth 1 https://github.com/airblade/vim-gitgutter.git                                           && \
    git clone --depth 1 https://github.com/fatih/vim-go.git                                                     && \
    git clone --depth 1 https://github.com/plasticboy/vim-markdown.git                                          && \
    git clone --depth 1 https://github.com/michaeljsmith/vim-indent-object.git                                  && \
    git clone --depth 1 https://github.com/terryma/vim-multiple-cursors.git                                     && \
    git clone --depth 1 https://github.com/tpope/vim-repeat.git                                                 && \
    git clone --depth 1 https://github.com/tpope/vim-surround.git                                               && \
    git clone --depth 1 https://github.com/vim-scripts/mru.vim.git                                              && \
    git clone --depth 1 https://github.com/vim-scripts/YankRing.vim.git                                         && \
    git clone --depth 1 https://github.com/tpope/vim-haml.git                                                   && \
    git clone --depth 1 https://github.com/SirVer/ultisnips.git                                                 && \
    git clone --depth 1 https://github.com/honza/vim-snippets.git                                               && \
    git clone --depth 1 https://github.com/derekwyatt/vim-scala.git                                             && \
    git clone --depth 1 https://github.com/leafgarland/typescript-vim.git                                       && \
    git clone --depth 1 https://github.com/christoomey/vim-tmux-navigator.git                                   && \
    git clone --depth 1 https://github.com/Quramy/tsuquyomi.git                                                 && \
    git clone --depth 1 https://github.com/ekalinin/Dockerfile.vim.git                                          && \
# 清理
    vim -E -c 'execute pathogen#helptags()' -c q ; return 0

ENTRYPOINT ["vim"]
