void __noreturn _cxa_rethrow(void)
{
  __int64 globals; // x0
  __int64 v1; // x20
  unsigned __int64 v2; // x22
  __int64 v3; // x23
  __int64 v4; // x0
  int v5; // w9

  globals = __cxa_get_globals();
  v1 = *(_QWORD *)globals;
  if ( *(_QWORD *)globals )
  {
    v2 = *(_QWORD *)(v1 + 96) & 0xFFFFFFFFFFFFFF00LL;
    if ( v2 == 0x434C4E47432B2B00LL )
    {
      *(_DWORD *)(v1 + 48) = -*(_DWORD *)(v1 + 48);
      ++*(_DWORD *)(globals + 8);
    }
    else
    {
      *(_QWORD *)globals = 0LL;
    }
    _Unwind_RaiseException();
    v3 = *(_QWORD *)(v1 + 96);
    v4 = __cxa_get_globals();
    if ( (v3 & 0xFFFFFFFFFFFFFF00LL) == 0x434C4E47432B2B00LL )
    {
      v5 = *(_DWORD *)(v1 + 48);
      if ( v5 < 0 )
        v5 = -v5;
      *(_DWORD *)(v1 + 48) = v5 + 1;
      if ( *(_QWORD *)v4 != v1 )
      {
        *(_QWORD *)(v1 + 40) = *(_QWORD *)v4;
        *(_QWORD *)v4 = v1;
      }
      --*(_DWORD *)(v4 + 8);
      if ( v2 == 0x434C4E47432B2B00LL )
LABEL_11:
        sub_8EC38(*(_QWORD *)(v1 + 32));
    }
    else if ( !*(_QWORD *)v4 )
    {
      *(_QWORD *)v4 = v1;
      if ( v2 == 0x434C4E47432B2B00LL )
        goto LABEL_11;
    }
  }
  std::terminate();
}
