void __fastcall _cxa_free_dependent_exception_0(int *a1)
{
  char *v2; // x20
  int *v3; // x12
  int *v4; // x11
  __int64 v5; // x13
  __int64 v6; // x14
  char *v7; // x13

  if ( a1 < dword_69EA080 || a1 >= (int *)&byte_69EA280 )
  {
    free(a1);
  }
  else
  {
    v2 = (char *)(a1 - 1);
    pthread_mutex_lock(&stru_69EA050);
    if ( !qword_69EA078 || (char *)qword_69EA078 == &byte_69EA280 )
    {
LABEL_12:
      *(_WORD *)v2 = ((unsigned int)qword_69EA078 - (unsigned int)dword_69EA080) >> 2;
      qword_69EA078 = (__int64)(a1 - 1);
    }
    else
    {
      v3 = 0LL;
      v4 = (int *)qword_69EA078;
      while ( 1 )
      {
        v5 = *((unsigned __int16 *)v4 + 1);
        if ( &v4[v5] == (int *)v2 )
        {
          *((_WORD *)v4 + 1) = *((_WORD *)a1 - 1) + v5;
          goto LABEL_17;
        }
        v6 = *((unsigned __int16 *)a1 - 1);
        if ( &v2[4 * v6] == (char *)v4 )
          break;
        v7 = (char *)&dword_69EA080[*(unsigned __int16 *)v4];
        if ( v7 )
        {
          v3 = v4;
          v4 = &dword_69EA080[*(unsigned __int16 *)v4];
          if ( v7 != &byte_69EA280 )
            continue;
        }
        goto LABEL_12;
      }
      *((_WORD *)a1 - 1) = v6 + v5;
      if ( v3 )
      {
        *(_WORD *)v3 = (unsigned __int64)(v2 - (char *)dword_69EA080) >> 2;
      }
      else
      {
        qword_69EA078 = (__int64)(a1 - 1);
        *(_WORD *)v2 = *(_WORD *)v4;
      }
    }
LABEL_17:
    pthread_mutex_unlock(&stru_69EA050);
  }
}
