void __fastcall sub_B2A24(__int64 a1)
{
  __int64 v2; // x21
  __int64 v3; // x22
  void **v4; // x23
  void **v5; // x20
  void *v6; // x0
  unsigned __int64 v7; // x8
  void *v8; // x0
  unsigned __int64 v9; // x8

  v2 = *(_QWORD *)(a1 + 8);
  while ( 1 )
  {
    v3 = *(_QWORD *)(a1 + 16);
    if ( v3 == v2 )
      break;
    *(_QWORD *)(a1 + 16) = v3 - 32;
    v4 = *(void ***)(v3 - 32);
    if ( v4 )
    {
      v5 = *(void ***)(v3 - 24);
      v6 = *(void **)(v3 - 32);
      if ( v5 != v4 )
      {
        do
        {
          v5 -= 4;
          sub_9D32C(v5);
        }
        while ( v4 != v5 );
        v6 = *(void **)(v3 - 32);
      }
      v7 = *(_QWORD *)(v3 - 8);
      *(_QWORD *)(v3 - 24) = v4;
      if ( v7 + 4096 < (unsigned __int64)v6 || v7 > (unsigned __int64)v6 )
      {
        free(v6);
      }
      else if ( *(_QWORD *)(v7 + 4096) == *(_QWORD *)(v3 - 16) )
      {
        *(_QWORD *)(v7 + 4096) = v6;
      }
    }
  }
  v8 = *(void **)a1;
  if ( *(_QWORD *)a1 )
  {
    v9 = **(_QWORD **)(a1 + 32);
    if ( v9 + 4096 < (unsigned __int64)v8 || v9 > (unsigned __int64)v8 )
    {
      free(v8);
    }
    else if ( *(_QWORD *)(v9 + 4096) == *(_QWORD *)(a1 + 24) )
    {
      *(_QWORD *)(v9 + 4096) = v8;
    }
  }
}
