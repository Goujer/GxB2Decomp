unsigned __int16 *__fastcall sub_8FA30(__int64 a1)
{
  int *v2; // x10
  unsigned __int16 *v3; // x19
  int *v4; // x13
  unsigned __int64 v5; // x12
  int *v6; // x11
  unsigned __int64 v7; // x10
  unsigned __int16 *v8; // x8
  __int64 v9; // x10

  pthread_mutex_lock(&stru_69EA050);
  v2 = (int *)qword_69EA078;
  if ( !qword_69EA078 )
  {
    v2 = dword_69EA080;
    qword_69EA078 = (__int64)dword_69EA080;
    dword_69EA080[0] = 8388736;
  }
  v3 = 0LL;
  if ( v2 && v2 != (int *)&byte_69EA280 )
  {
    v4 = 0LL;
    v5 = ((unsigned __int64)(a1 + 3) >> 2) + 1;
    while ( 1 )
    {
      v6 = v2;
      v7 = *((unsigned __int16 *)v2 + 1);
      if ( v5 < v7 )
      {
        *((_WORD *)v6 + 1) = v7 - v5;
        v8 = (unsigned __int16 *)&v6[(unsigned __int16)(v7 - v5)];
        *v8 = 0;
        v8[1] = v5;
        v3 = v8 + 2;
        goto LABEL_16;
      }
      if ( v5 == v7 )
        break;
      v3 = 0LL;
      v2 = &dword_69EA080[*(unsigned __int16 *)v6];
      if ( v2 )
      {
        v4 = v6;
        if ( &dword_69EA080[*(unsigned __int16 *)v6] != (int *)&byte_69EA280 )
          continue;
      }
      goto LABEL_16;
    }
    v9 = *(unsigned __int16 *)v6;
    if ( v4 )
      *(_WORD *)v4 = v9;
    else
      qword_69EA078 = (__int64)&dword_69EA080[v9];
    *(_WORD *)v6 = 0;
    v3 = (unsigned __int16 *)(v6 + 1);
  }
LABEL_16:
  pthread_mutex_unlock(&stru_69EA050);
  return v3;
}
