void __fastcall sub_9D32C(void **a1)
{
  void **v2; // x20
  void **v3; // x21
  void *v4; // x0
  void **v5; // x22
  unsigned __int64 v6; // x8

  v2 = (void **)*a1;
  if ( *a1 )
  {
    v3 = (void **)a1[1];
    v4 = *a1;
    if ( v3 != v2 )
    {
      do
      {
        if ( (*(_BYTE *)(v3 - 3) & 1) != 0 )
          free(*(v3 - 1));
        v5 = v3 - 6;
        if ( (*(_BYTE *)(v3 - 6) & 1) != 0 )
          free(*(v3 - 4));
        v3 -= 6;
      }
      while ( v2 != v5 );
      v4 = *a1;
    }
    v6 = (unsigned __int64)a1[3];
    a1[1] = v2;
    if ( v6 + 4096 < (unsigned __int64)v4 || v6 > (unsigned __int64)v4 )
    {
      free(v4);
    }
    else if ( *(void **)(v6 + 4096) == a1[2] )
    {
      *(_QWORD *)(v6 + 4096) = v4;
    }
  }
}
