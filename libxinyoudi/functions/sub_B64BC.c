void __fastcall sub_B64BC(void ***a1)
{
  void **v2; // x21
  void **v3; // x22
  void **v4; // x0
  void **v5; // x23
  void **v6; // x24
  void **v7; // t1
  void **v8; // x20
  void *v9; // x0
  unsigned __int64 v10; // x8
  unsigned __int64 v11; // x8

  v2 = *a1;
  if ( !*a1 )
    return;
  v3 = a1[1];
  v4 = *a1;
  if ( v3 == v2 )
    goto LABEL_16;
  do
  {
    while ( 1 )
    {
      while ( 1 )
      {
        v5 = v3;
        v7 = (void **)*(v3 - 4);
        v3 -= 4;
        v6 = v7;
        if ( v7 )
          break;
LABEL_10:
        if ( v3 == v2 )
          goto LABEL_15;
      }
      v8 = (void **)*(v5 - 3);
      v9 = v6;
      if ( v8 != v6 )
      {
        do
        {
          v8 -= 4;
          sub_9D32C(v8);
        }
        while ( v6 != v8 );
        v9 = *v3;
      }
      v10 = (unsigned __int64)*(v5 - 1);
      *(v5 - 3) = v6;
      if ( v10 + 4096 >= (unsigned __int64)v9 && v10 <= (unsigned __int64)v9 )
        break;
      free(v9);
      if ( v3 == v2 )
        goto LABEL_15;
    }
    if ( *(void **)(v10 + 4096) != *(v5 - 2) )
      goto LABEL_10;
    *(_QWORD *)(v10 + 4096) = v9;
  }
  while ( v3 != v2 );
LABEL_15:
  v4 = *a1;
LABEL_16:
  v11 = (unsigned __int64)a1[3];
  a1[1] = v2;
  if ( v11 + 4096 < (unsigned __int64)v4 || v11 > (unsigned __int64)v4 )
  {
    free(v4);
  }
  else if ( *(void ***)(v11 + 4096) == a1[2] )
  {
    *(_QWORD *)(v11 + 4096) = v4;
  }
}
