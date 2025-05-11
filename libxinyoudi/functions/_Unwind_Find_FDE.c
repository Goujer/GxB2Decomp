unsigned int *__fastcall Unwind_Find_FDE(unsigned __int64 a1, _QWORD *a2)
{
  __int64 i; // x19
  unsigned int *v5; // x20
  _QWORD *v6; // x1
  __int64 *v7; // x2
  char v8; // w1
  unsigned __int8 v9; // w0
  char v10; // w21
  char *v11; // x0
  unsigned __int64 v12; // x0
  unsigned __int64 v14; // [xsp+50h] [xbp+50h] BYREF
  __int64 v15; // [xsp+58h] [xbp+58h]
  __int64 v16; // [xsp+60h] [xbp+60h]
  unsigned __int64 v17; // [xsp+68h] [xbp+68h]
  unsigned int *v18; // [xsp+70h] [xbp+70h]
  int v19; // [xsp+78h] [xbp+78h]

  if ( &pthread_create )
    pthread_mutex_lock(&stru_69EA488);
  for ( i = qword_69EA4B8; ; i = *(_QWORD *)(i + 40) )
  {
    if ( !i )
      goto LABEL_9;
    if ( a1 >= *(_QWORD *)i )
      break;
  }
  v5 = sub_BAC30(i, a1);
  if ( v5 )
  {
LABEL_25:
    if ( !&pthread_create )
      goto LABEL_18;
  }
  else
  {
LABEL_9:
    while ( 1 )
    {
      i = qword_69EA4B0;
      if ( !qword_69EA4B0 )
        break;
      qword_69EA4B0 = *(_QWORD *)(qword_69EA4B0 + 40);
      v5 = sub_BAC30(i, a1);
      v6 = (_QWORD *)qword_69EA4B8;
      v7 = &qword_69EA4B8;
      while ( v6 && *v6 >= *(_QWORD *)i )
      {
        v7 = v6 + 5;
        v6 = (_QWORD *)v6[5];
      }
      *(_QWORD *)(i + 40) = v6;
      *v7 = i;
      if ( v5 )
        goto LABEL_25;
    }
    v5 = 0LL;
    if ( !&pthread_create )
      goto LABEL_21;
  }
  pthread_mutex_unlock(&stru_69EA488);
  if ( v5 )
  {
LABEL_18:
    *a2 = *(_QWORD *)(i + 8);
    v8 = *(_BYTE *)(i + 32);
    a2[1] = *(_QWORD *)(i + 16);
    v9 = (unsigned __int64)*(unsigned __int16 *)(i + 32) >> 3;
    if ( (v8 & 4) != 0 )
      v9 = sub_BA4D4((__int64)v5);
    v10 = v9;
    v11 = (char *)sub_BA038(v9, i);
    sub_BA0F8(v10, v11, (char *)v5 + 8, &v14);
    v12 = v14;
    goto LABEL_24;
  }
LABEL_21:
  v19 = 1;
  v14 = a1;
  v5 = 0LL;
  v15 = 0LL;
  v16 = 0LL;
  v17 = 0LL;
  v18 = 0LL;
  if ( (dl_iterate_phdr((int (*)(struct dl_phdr_info *, size_t, void *))sub_BA4E4, &v14) & 0x80000000) == 0 )
  {
    v5 = v18;
    if ( v18 )
    {
      *a2 = v15;
      a2[1] = v16;
      v12 = v17;
LABEL_24:
      a2[2] = v12;
    }
  }
  return v5;
}
