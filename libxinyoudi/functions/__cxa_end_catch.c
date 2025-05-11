void _cxa_end_catch(void)
{
  __int64 *globals_fast; // x20
  __int64 v1; // x19
  unsigned __int64 v2; // x8
  int v3; // w9
  int v4; // w9
  __int64 v5; // x20
  unsigned __int64 v6; // x8
  unsigned __int64 v7; // x8
  void (__fastcall *v8)(__int64); // x8

  globals_fast = (__int64 *)__cxa_get_globals_fast();
  v1 = *globals_fast;
  if ( *globals_fast )
  {
    v2 = *(_QWORD *)(v1 + 96);
    if ( v2 >> 8 == 0x434C4E47432B2BLL )
    {
      v3 = *(_DWORD *)(v1 + 48);
      if ( v3 < 0 )
      {
        *(_DWORD *)(v1 + 48) = v3 + 1;
        if ( v3 == -1 )
          *globals_fast = *(_QWORD *)(v1 + 40);
      }
      else
      {
        v4 = v3 - 1;
        *(_DWORD *)(v1 + 48) = v4;
        if ( !v4 )
        {
          *globals_fast = *(_QWORD *)(v1 + 40);
          if ( (unsigned __int8)v2 == 1LL )
          {
            v5 = *(_QWORD *)v1 - 128LL;
            _cxa_free_dependent_exception_0(v1);
            v1 = v5;
          }
          do
          {
            v6 = __ldaxr((unsigned __int64 *)v1);
            v7 = v6 - 1;
          }
          while ( __stlxr(v7, (unsigned __int64 *)v1) );
          if ( !v7 )
          {
            v8 = *(void (__fastcall **)(__int64))(v1 + 16);
            if ( v8 )
              v8(v1 + 128);
            _cxa_free_dependent_exception_0(v1);
          }
        }
      }
    }
    else
    {
      _Unwind_DeleteException();
      *globals_fast = 0LL;
    }
  }
}
