__int64 _cxa_uncaught_exceptions()
{
  __int64 result; // x0

  result = __cxa_get_globals_fast();
  if ( result )
    return *(unsigned int *)(result + 8);
  return result;
}
