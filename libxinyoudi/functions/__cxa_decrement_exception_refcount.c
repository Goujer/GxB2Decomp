__int64 __fastcall _cxa_decrement_exception_refcount(__int64 result)
{
  unsigned __int64 *v1; // x19
  unsigned __int64 v2; // x8
  unsigned __int64 v3; // x8
  void (*v4)(void); // x8

  if ( result )
  {
    v1 = (unsigned __int64 *)(result - 128);
    do
    {
      v2 = __ldaxr(v1);
      v3 = v2 - 1;
    }
    while ( __stlxr(v3, v1) );
    if ( !v3 )
    {
      v4 = *(void (**)(void))(result - 112);
      if ( v4 )
        v4();
      return _cxa_free_dependent_exception_0(v1);
    }
  }
  return result;
}
