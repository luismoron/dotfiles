# Inicia zsh si está disponible
~/.fehbg &&
ddmonitor

# Agrega los binarios de cargo (Rust) al PATH
if [ -d "$HOME/.cargo/bin" ]; then
    export PATH="$HOME/.cargo/bin:$PATH"
fi

