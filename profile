# Inicia zsh si está disponible
~/.fehbg &&
ddmonitor

# Agrega los binarios de cargo (Rust) al PATH
if [ -d "$HOME/.cargo/bin" ]; then
    export PATH="$HOME/.cargo/bin:$PATH"
fi

# Inicia i3status al iniciar sesión
if command -v i3status >/dev/null 2>&1; then
   i3status &
fi