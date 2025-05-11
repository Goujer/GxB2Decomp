__int64 _cxa_uncaught_exception()
{
  __int64 result; // x0

  result = __cxa_get_globals_fast();
  if ( result )
    return *(_DWORD *)(result + 8) != 0;
  return result;
}
