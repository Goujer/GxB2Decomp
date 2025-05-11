__int64 __fastcall sub_8E9E8(int a1, __int64 a2)
{
  __int64 v2; // x19
  __int64 v3; // x0
  unsigned __int64 *v4; // x20
  unsigned __int64 v5; // x8
  unsigned __int64 v6; // x8
  void (*v7)(void); // x8

  if ( a1 != 1 )
    sub_8EC38(*(_QWORD *)(a2 - 64));
  v2 = a2 - 96;
  v3 = *(_QWORD *)(a2 - 96);
  if ( v3 )
  {
    v4 = (unsigned __int64 *)(v3 - 128);
    do
    {
      v5 = __ldaxr(v4);
      v6 = v5 - 1;
    }
    while ( __stlxr(v6, v4) );
    if ( !v6 )
    {
      v7 = *(void (**)(void))(v3 - 112);
      if ( v7 )
        v7();
      _cxa_free_dependent_exception_0(v4);
    }
  }
  return _cxa_free_dependent_exception_0(v2);
}
