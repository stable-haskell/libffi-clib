# LT_SYS_SYMBOL_USCORE
# --------------------
# does the compiler prefix global symbols with an underscore?
AC_DEFUN([LT_SYS_SYMBOL_USCORE],
[m4_require([_LT_CMD_GLOBAL_SYMBOLS])dnl
AC_CACHE_CHECK([for _ prefix in compiled symbols],
  [lt_cv_sys_symbol_underscore],
  [lt_cv_sys_symbol_underscore=no
  cat > conftest.$ac_ext <<_LT_EOF
void nm_test_func(){}
int main(void){nm_test_func;return 0;}
_LT_EOF
  if AC_TRY_EVAL(ac_compile); then
    # Now try to grab the symbols.
    ac_nlist=conftest.nm
    if AC_TRY_EVAL(NM conftest.$ac_objext \| $lt_cv_sys_global_symbol_pipe \> $ac_nlist) && test -s "$ac_nlist"; then
      # See whether the symbols have a leading underscore.
      if grep '^. _nm_test_func' "$ac_nlist" >/dev/null; then
        lt_cv_sys_symbol_underscore=yes
      else
        if grep '^. nm_test_func ' "$ac_nlist" >/dev/null; then
	  :
        else
	  echo "configure: cannot find nm_test_func in $ac_nlist" >&AS_MESSAGE_LOG_FD
        fi
      fi
    else
      echo "configure: cannot run $lt_cv_sys_global_symbol_pipe" >&AS_MESSAGE_LOG_FD
    fi
  else
    echo "configure: failed program was:" >&AS_MESSAGE_LOG_FD
    cat conftest.c >&AS_MESSAGE_LOG_FD
  fi
  rm -rf conftest*
  ])
  sys_symbol_underscore=$lt_cv_sys_symbol_underscore
  AC_SUBST([sys_symbol_underscore])
])# LT_SYS_SYMBOL_USCORE
