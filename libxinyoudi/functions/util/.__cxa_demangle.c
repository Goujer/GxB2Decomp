// attributes: thunk
char *__cxa_demangle(const char *lpmangled, char *lpout, size_t *lpoutlen, int *lpstatus)
{
  return _cxa_demangle(lpmangled, lpout, lpoutlen, lpstatus);
}
