path_prepend_if_exists() {
  [[ -d "$1" ]] && path=("$1" $path)
}

path_prepend_if_exists "$HOME/bin"
path_prepend_if_exists "$HOME/.local/bin"
path_prepend_if_exists "$HOME/.atuin/bin"
# Ensure Homebrew itself can be discovered on both Apple Silicon and Intel macOS.
path_prepend_if_exists "/opt/homebrew/bin"
path_prepend_if_exists "/usr/local/bin"
path_prepend_if_exists "$HOME/go/bin"
path_prepend_if_exists "$HOME/.luarocks/bin"

case "$OSTYPE" in
  darwin*)
    if command -v brew >/dev/null 2>&1; then
      # Faster than invoking `brew --prefix` on every shell startup.
      BREW_BIN="$(command -v brew)"
      BREW_PREFIX="${BREW_BIN:h:h}"
      path_prepend_if_exists "$BREW_PREFIX/bin"
      path_prepend_if_exists "$BREW_PREFIX/sbin"
      path_prepend_if_exists "$BREW_PREFIX/opt/ruby/bin"

      if [ -d "$BREW_PREFIX/opt/gradle/libexec" ]; then
        export GRADLE_HOME="$BREW_PREFIX/opt/gradle/libexec"
      fi

      if [ -d "$BREW_PREFIX/opt/openjdk/libexec/openjdk.jdk/Contents/Home" ]; then
        export JAVA_HOME="$BREW_PREFIX/opt/openjdk/libexec/openjdk.jdk/Contents/Home"
        path_prepend_if_exists "$JAVA_HOME/bin"
      else
        export JAVA_HOME="$(/usr/libexec/java_home 2>/dev/null)"
      fi
    else
      export JAVA_HOME="$(/usr/libexec/java_home 2>/dev/null)"
    fi

    export PNPM_HOME="$HOME/Library/pnpm"
    path_prepend_if_exists "$PNPM_HOME"
  ;;
  linux*)
    if command -v ruby >/dev/null 2>&1; then
      path_prepend_if_exists "$(ruby -e 'puts Gem.user_dir')/bin"
    fi
  ;;
esac

unfunction path_prepend_if_exists
