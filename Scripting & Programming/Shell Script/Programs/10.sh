[[ $- == *i* ]] && echo 'Interactive' || echo 'not-interactive'

# Clearer (Bash)
if [[ $- == *i* ]]; then
    echo 'Interactive'
else
    echo 'not-interactive'

fi

# Portable (POSIX sh)

case "$-" in
  *i*) printf 'Interactive\n' ;;
  *)   printf 'not-interactive\n' ;;
esac