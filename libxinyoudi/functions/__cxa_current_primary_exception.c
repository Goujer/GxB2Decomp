unsigned __int64 **_cxa_current_primary_exception()
{
  unsigned __int64 **result; // x0
  unsigned __int64 *v1; // x8
  unsigned __int64 v2; // x9

  result = (unsigned __int64 **)__cxa_get_globals_fast();
  if ( result )
  {
    v1 = *result;
    if ( *result )
    {
      if ( v1[12] >> 8 == 0x434C4E47432B2BLL )
      {
        if ( (unsigned __int8)v1[12] == 1LL )
          v1 = (unsigned __int64 *)(*v1 - 128);
        result = (unsigned __int64 **)(v1 + 16);
        do
          v2 = __ldaxr(v1);
        while ( __stlxr(v2 + 1, v1) );
      }
      else
      {
        return 0LL;
      }
    }
    else
    {
      return 0LL;
    }
  }
  return result;
}
