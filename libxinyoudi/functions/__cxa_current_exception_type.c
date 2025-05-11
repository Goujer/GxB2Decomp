struct type_info *_cxa_current_exception_type(void)
{
  struct type_info *result; // x0
  __int64 v1; // x8

  result = (struct type_info *)__cxa_get_globals_fast();
  if ( result )
  {
    v1 = *(_QWORD *)result;
    if ( *(_QWORD *)result )
    {
      if ( *(_QWORD *)(v1 + 96) >> 8 == 0x434C4E47432B2BLL )
        return *(struct type_info **)(v1 + 8);
      else
        return 0LL;
    }
    else
    {
      return 0LL;
    }
  }
  return result;
}
