__int64 __fastcall sub_B7384(__int64 result, __int64 a2, char *a3, unsigned int a4, char a5)
{
  __int64 v6; // x8
  __int64 v10; // x23
  const char *v11; // x24
  __int64 v12; // x8
  __int64 v13; // x24
  __int64 v14; // x9
  __int64 v15; // x3
  int v16; // w8
  unsigned __int64 v17; // x24
  __int64 *v18; // x23
  __int64 v19; // x8
  __int64 v20; // x9
  __int64 v21; // x0
  __int64 v22; // t1
  __int64 v23; // x3
  int v24; // w8
  __int64 v25; // x8
  char v26; // w22
  char v27; // w24
  _QWORD *v28; // x25
  unsigned __int64 v29; // x26
  __int64 v30; // x8
  __int64 v31; // x9
  __int64 v32; // x8
  __int64 v33; // x9
  __int64 v34; // x0
  __int64 v35; // t1
  __int64 v36; // x3
  __int64 v37; // x8
  __int64 v38; // x9
  __int64 v39; // x0
  __int64 v40; // t1
  __int64 v41; // x3
  int v42; // w8
  int v43; // w9
  int v44; // w8

  v6 = *(_QWORD *)(a2 + 16);
  v10 = result;
  if ( (a5 & 1) != 0 )
  {
    v11 = *(const char **)(result + 8);
    result = strcmp(v11, *(const char **)(v6 + 8));
    if ( (_DWORD)result )
    {
      result = strcmp(v11, *(const char **)(*(_QWORD *)a2 + 8LL));
      if ( (_DWORD)result )
      {
LABEL_4:
        v12 = *(_QWORD *)(v10 + 32);
        v13 = *(unsigned int *)(v10 + 20);
        v14 = v12 >> 8;
        if ( (v12 & 1) != 0 )
          v14 = *(_QWORD *)(*(_QWORD *)a3 + v14);
        if ( (v12 & 2) != 0 )
          v15 = a4;
        else
          v15 = 2LL;
        result = (*(__int64 (__fastcall **)(_QWORD, __int64, char *, __int64, _QWORD))(**(_QWORD **)(v10 + 24) + 48LL))(
                   *(_QWORD *)(v10 + 24),
                   a2,
                   &a3[v14],
                   v15,
                   a5 & 1);
        if ( (unsigned int)v13 >= 2 )
        {
          v16 = *(_DWORD *)(v10 + 16);
          v17 = v10 + 16 * v13 + 24;
          v18 = (__int64 *)(v10 + 40);
          if ( (v16 & 2) != 0 || *(_DWORD *)(a2 + 60) == 1 )
          {
            do
            {
              if ( *(_BYTE *)(a2 + 78) )
                break;
              v19 = v18[1];
              v20 = v19 >> 8;
              if ( (v19 & 1) != 0 )
                v20 = *(_QWORD *)(*(_QWORD *)a3 + v20);
              v22 = *v18;
              v18 += 2;
              v21 = v22;
              v23 = (v19 & 2) != 0 ? a4 : 2LL;
              result = (*(__int64 (__fastcall **)(__int64, __int64, char *, __int64, _QWORD))(*(_QWORD *)v21 + 48LL))(
                         v21,
                         a2,
                         &a3[v20],
                         v23,
                         a5 & 1);
            }
            while ( (unsigned __int64)v18 < v17 );
          }
          else if ( (v16 & 1) != 0 )
          {
            do
            {
              if ( *(_BYTE *)(a2 + 78) || *(_DWORD *)(a2 + 60) == 1 && *(_DWORD *)(a2 + 48) == 1 )
                break;
              v37 = v18[1];
              v38 = v37 >> 8;
              if ( (v37 & 1) != 0 )
                v38 = *(_QWORD *)(*(_QWORD *)a3 + v38);
              v40 = *v18;
              v18 += 2;
              v39 = v40;
              v41 = (v37 & 2) != 0 ? a4 : 2LL;
              result = (*(__int64 (__fastcall **)(__int64, __int64, char *, __int64, _QWORD))(*(_QWORD *)v39 + 48LL))(
                         v39,
                         a2,
                         &a3[v38],
                         v41,
                         a5 & 1);
            }
            while ( (unsigned __int64)v18 < v17 );
          }
          else
          {
            do
            {
              if ( *(_BYTE *)(a2 + 78) || *(_DWORD *)(a2 + 60) == 1 )
                break;
              v32 = v18[1];
              v33 = v32 >> 8;
              if ( (v32 & 1) != 0 )
                v33 = *(_QWORD *)(*(_QWORD *)a3 + v33);
              v35 = *v18;
              v18 += 2;
              v34 = v35;
              v36 = (v32 & 2) != 0 ? a4 : 2LL;
              result = (*(__int64 (__fastcall **)(__int64, __int64, char *, __int64, _QWORD))(*(_QWORD *)v34 + 48LL))(
                         v34,
                         a2,
                         &a3[v33],
                         v36,
                         a5 & 1);
            }
            while ( (unsigned __int64)v18 < v17 );
          }
        }
        return result;
      }
      goto LABEL_22;
    }
LABEL_39:
    if ( *(char **)(a2 + 8) == a3 && *(_DWORD *)(a2 + 52) != 1 )
      *(_DWORD *)(a2 + 52) = a4;
    return result;
  }
  if ( result == v6 )
    goto LABEL_39;
  if ( result != *(_QWORD *)a2 )
    goto LABEL_4;
LABEL_22:
  if ( *(char **)(a2 + 32) != a3 && *(char **)(a2 + 40) != a3 )
  {
    v24 = *(_DWORD *)(a2 + 68);
    *(_DWORD *)(a2 + 56) = a4;
    if ( v24 == 4 )
      return result;
    v25 = *(unsigned int *)(v10 + 20);
    if ( (_DWORD)v25 )
    {
      v26 = 0;
      v27 = 0;
      v28 = (_QWORD *)(v10 + 24);
      v29 = v10 + 16 * v25 + 24;
      do
      {
        *(_WORD *)(a2 + 76) = 0;
        v30 = v28[1];
        v31 = v30 >> 8;
        if ( (v30 & 1) != 0 )
          v31 = *(_QWORD *)(*(_QWORD *)a3 + v31);
        result = (*(__int64 (__fastcall **)(_QWORD, __int64, char *, char *, _QWORD, _QWORD))(*(_QWORD *)*v28 + 40LL))(
                   *v28,
                   a2,
                   a3,
                   &a3[v31],
                   2 - (((unsigned int)v30 >> 1) & 1),
                   a5 & 1);
        if ( *(_BYTE *)(a2 + 78) )
          break;
        if ( *(_BYTE *)(a2 + 77) )
        {
          if ( *(_BYTE *)(a2 + 76) )
          {
            if ( *(_DWORD *)(a2 + 48) == 1 || (*(_BYTE *)(v10 + 16) & 2) == 0 )
              goto LABEL_70;
            v27 = 1;
            v26 = 1;
          }
          else
          {
            v26 = 1;
            if ( (*(_BYTE *)(v10 + 16) & 1) == 0 )
              break;
          }
        }
        v28 += 2;
      }
      while ( (unsigned __int64)v28 < v29 );
      if ( (v27 & 1) != 0 )
        goto LABEL_69;
    }
    else
    {
      v26 = 0;
    }
    v43 = *(_DWORD *)(a2 + 60);
    v42 = *(_DWORD *)(a2 + 64);
    *(_QWORD *)(a2 + 40) = a3;
    *(_DWORD *)(a2 + 64) = v42 + 1;
    if ( v43 == 1 && *(_DWORD *)(a2 + 48) == 2 )
    {
      *(_BYTE *)(a2 + 78) = 1;
      if ( (v26 & 1) != 0 )
      {
LABEL_70:
        v44 = 3;
        goto LABEL_71;
      }
LABEL_68:
      v44 = 4;
LABEL_71:
      *(_DWORD *)(a2 + 68) = v44;
      return result;
    }
LABEL_69:
    if ( (v26 & 1) != 0 )
      goto LABEL_70;
    goto LABEL_68;
  }
  if ( a4 == 1 )
    *(_DWORD *)(a2 + 56) = 1;
  return result;
}
