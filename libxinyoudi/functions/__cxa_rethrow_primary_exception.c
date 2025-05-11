__int64 __fastcall _cxa_rethrow_primary_exception(__int64 result)
{
  __int64 v1; // x20
  __int64 v2; // x0
  __int64 v3; // x19
  unsigned __int64 *v4; // x21
  unsigned __int64 v5; // x8
  __int64 terminate; // x0
  __int64 globals; // x0
  __int64 v8; // x20
  int v9; // w8

  v1 = result;
  if ( !result )
    return result;
  v2 = sub_8F9C4(128LL);
  v3 = v2;
  if ( !v2 )
LABEL_14:
    std::terminate();
  v4 = (unsigned __int64 *)(v1 - 128);
  memset((void *)(v2 + 8), 0, 0x78uLL);
  *(_QWORD *)v3 = v1;
  do
    v5 = __ldaxr(v4);
  while ( __stlxr(v5 + 1, v4) );
  *(_QWORD *)(v3 + 8) = *(_QWORD *)(v1 - 120);
  *(_QWORD *)(v3 + 24) = std::get_unexpected();
  terminate = std::get_terminate();
  *(_QWORD *)(v3 + 96) = 0x434C4E47432B2B01LL;
  *(_QWORD *)(v3 + 32) = terminate;
  globals = __cxa_get_globals();
  ++*(_DWORD *)(globals + 8);
  *(_QWORD *)(v3 + 104) = sub_8E9E8;
  _Unwind_RaiseException();
  v8 = *(_QWORD *)(v3 + 96);
  result = __cxa_get_globals();
  if ( (v8 & 0xFFFFFFFFFFFFFF00LL) != 0x434C4E47432B2B00LL )
  {
    if ( !*(_QWORD *)result )
    {
      *(_QWORD *)result = v3;
      return result;
    }
    goto LABEL_14;
  }
  v9 = *(_DWORD *)(v3 + 48);
  if ( v9 < 0 )
    v9 = -v9;
  *(_DWORD *)(v3 + 48) = v9 + 1;
  if ( *(_QWORD *)result != v3 )
  {
    *(_QWORD *)(v3 + 40) = *(_QWORD *)result;
    *(_QWORD *)result = v3;
  }
  --*(_DWORD *)(result + 8);
  return result;
}
