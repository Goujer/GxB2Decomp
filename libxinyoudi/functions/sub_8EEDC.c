__int64 __fastcall sub_8EEDC(__int64 result, char a2, char a3, _QWORD *a4)
{
  __int64 v5; // x19
  unsigned __int8 *v6; // x24
  __int64 v7; // x26
  __int64 RegionStart; // x25
  __int64 v9; // x0
  unsigned __int8 *v10; // x9
  unsigned __int8 *v11; // x22
  unsigned __int8 *v12; // x8
  __int64 v13; // x10
  __int64 v14; // x9
  char v15; // t1
  unsigned __int8 *v16; // x28
  char *v17; // x21
  unsigned int v18; // w24
  __int64 v19; // x10
  __int64 v20; // x9
  unsigned __int64 v21; // x27
  char v22; // t1
  signed __int64 v23; // x23
  char *v24; // x20
  char *v25; // x9
  unsigned __int64 v26; // x25
  __int64 v27; // x26
  __int64 v28; // x10
  __int64 v29; // x8
  char v30; // t1
  __int64 v31; // x25
  __int64 v32; // x27
  unsigned __int64 v33; // x9
  __int64 v34; // x8
  char *v35; // x20
  char v36; // w10
  char v37; // t1
  bool v38; // w11
  __int64 v39; // x9
  __int64 v40; // x26
  _QWORD *v41; // x8
  __int64 v42; // x1
  char v43; // w8
  void *v44; // x1
  __int64 v45; // x24
  __int64 v46; // x9
  __int64 v47; // x8
  char v48; // t1
  __int64 v49; // x0
  __int64 v50; // x10
  unsigned __int64 v51; // x9
  __int64 v52; // x8
  char v53; // w11
  unsigned int v54; // w10
  _BOOL4 v55; // w11
  __int64 v56; // x9
  __int64 v57; // x8
  int v58; // w8
  __int64 v59; // x8
  int v60; // w0
  void *v61; // x1
  unsigned __int8 *v62; // [xsp+0h] [xbp-B0h]
  _QWORD *v63; // [xsp+18h] [xbp-98h]
  char v65; // [xsp+34h] [xbp-7Ch]
  unsigned int v67; // [xsp+3Ch] [xbp-74h]
  char *v68; // [xsp+40h] [xbp-70h] BYREF
  unsigned __int8 *v69; // [xsp+48h] [xbp-68h] BYREF
  _QWORD v70[2]; // [xsp+50h] [xbp-60h] BYREF

  v5 = result;
  v70[1] = *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 2)) + 40);
  *(_QWORD *)(result + 32) = 0LL;
  *(_OWORD *)result = 0u;
  *(_OWORD *)(result + 16) = 0u;
  *(_DWORD *)(result + 40) = 3;
  if ( (a2 & 1) == 0 )
  {
    if ( (a2 & 2) != 0 )
    {
      if ( (~a2 & 0xC) == 0 )
      {
        *(_DWORD *)(result + 40) = 2;
        return result;
      }
      goto LABEL_8;
    }
LABEL_5:
    *(_DWORD *)(result + 40) = 3;
    return result;
  }
  if ( (a2 & 0xE) != 0 )
    goto LABEL_5;
LABEL_8:
  result = _Unwind_GetLanguageSpecificData();
  v6 = (unsigned __int8 *)result;
  v69 = (unsigned __int8 *)result;
  if ( !result )
  {
    *(_DWORD *)(v5 + 40) = 8;
    return result;
  }
  *(_QWORD *)(v5 + 16) = result;
  v7 = _Unwind_GetIP() - 1;
  v69 = v6 + 1;
  RegionStart = _Unwind_GetRegionStart();
  v9 = sub_8F870(&v69, *v6);
  v10 = v69;
  if ( v9 )
    v11 = (unsigned __int8 *)v9;
  else
    v11 = (unsigned __int8 *)RegionStart;
  v12 = ++v69;
  v65 = a3;
  v67 = *v10;
  if ( v67 == 255 )
  {
    v16 = 0LL;
  }
  else
  {
    v13 = 0LL;
    v14 = 0LL;
    do
    {
      v15 = *v12++;
      v14 |= (unsigned __int64)(v15 & 0x7F) << v13;
      v13 += 7LL;
    }
    while ( v15 < 0 );
    v16 = &v12[v14];
    v69 = v12;
  }
  v17 = (char *)(v12 + 1);
  v69 = v12 + 1;
  v18 = *v12;
  v19 = 0LL;
  v20 = 0LL;
  v21 = v7 - RegionStart;
  do
  {
    v22 = *v17++;
    v20 |= (unsigned __int64)(v22 & 0x7F) << v19;
    v19 += 7LL;
  }
  while ( v22 < 0 );
  v23 = (unsigned int)v20;
  v24 = &v17[(unsigned int)v20];
  v25 = v17;
  v68 = v17;
  v69 = (unsigned __int8 *)v17;
  do
  {
    if ( v25 >= v24 )
      break;
    v26 = sub_8F870(&v68, v18);
    v27 = sub_8F870(&v68, v18);
    result = sub_8F870(&v68, v18);
    v25 = v68;
    v28 = 0LL;
    v29 = 0LL;
    do
    {
      v30 = *v25++;
      v29 |= (unsigned __int64)(v30 & 0x7F) << v28;
      v28 += 7LL;
    }
    while ( v30 < 0 );
    v68 = v25;
    if ( v26 <= v21 && v21 < v27 + v26 )
      goto LABEL_28;
  }
  while ( v21 >= v26 );
LABEL_27:
  result = sub_8F4D0(v65 & 1, a4);
LABEL_28:
  if ( !result )
    goto LABEL_82;
  if ( !v29 )
  {
    if ( (a2 & 6) == 2 )
    {
      *(_QWORD *)v5 = 0LL;
      *(_QWORD *)(v5 + 24) = &v11[result];
LABEL_86:
      v58 = 6;
      goto LABEL_87;
    }
LABEL_82:
    v58 = 8;
LABEL_87:
    *(_DWORD *)(v5 + 40) = v58;
    return result;
  }
  v62 = &v11[result];
  v63 = a4 + 4;
  v31 = (v67 + 6) & 0xFLL;
  v32 = (__int64)&v17[v23 - 1 + v29];
  v17 = (char *)((0x747u >> v31) & 1);
  while ( 1 )
  {
    v33 = 0LL;
    v34 = 0LL;
    v35 = (char *)v32;
    do
    {
      v37 = *v35++;
      v36 = v37;
      v34 |= (unsigned __int64)(v37 & 0x7F) << v33;
      v33 += 7LL;
    }
    while ( v37 < 0 );
    v38 = v33 < 0x40;
    v39 = -1LL << v33;
    if ( (*(_DWORD *)&v38 & ((unsigned __int8)(v36 & 0x40) >> 6)) == 0 )
      v39 = 0LL;
    v40 = v34 | v39;
    if ( (v34 | v39) >= 1 )
    {
      v70[0] = v16;
      if ( !v16 || ((v67 + 6) & 0xF) > 0xA || !(_DWORD)v17 )
        goto LABEL_27;
      v70[0] = &v16[-(v40 << qword_69D0940[v31])];
      result = sub_8F870(v70, v67);
      if ( result )
      {
        if ( (v65 & 1) != 0 )
        {
          v41 = a4 + 4;
          if ( *a4 == 0x434C4E47432B2B01LL )
            v41 = (_QWORD *)*(a4 - 12);
          v70[0] = v41;
          if ( !v41 || (v42 = *(a4 - 11)) == 0 )
          {
            sub_8F4D0(1, a4);
LABEL_94:
            sub_8F4D0(0, a4);
LABEL_95:
            v60 = sub_8F4D0(1, v44);
            return sub_8F4D0(v60, v61);
          }
          result = (*(__int64 (__fastcall **)(__int64, __int64, _QWORD *))(*(_QWORD *)result + 32LL))(result, v42, v70);
          if ( (result & 1) != 0 )
          {
            v43 = a2;
            if ( (a2 & 1) != 0 )
            {
              *(_QWORD *)v5 = v40;
              *(_QWORD *)(v5 + 8) = v32;
              *(_QWORD *)(v5 + 24) = v62;
              v59 = v70[0];
              *(_DWORD *)(v5 + 40) = 6;
              *(_QWORD *)(v5 + 32) = v59;
              return result;
            }
LABEL_73:
            if ( (v43 & 8) == 0 )
LABEL_92:
              sub_8F4D0(1, a4);
            goto LABEL_74;
          }
        }
      }
      else
      {
        if ( (a2 & 5) != 0 )
          goto LABEL_83;
        if ( (a2 & 8) == 0 )
          goto LABEL_27;
      }
      goto LABEL_74;
    }
    if ( (v40 & 0x8000000000000000LL) == 0 )
      break;
    if ( (v65 & 1) != 0 )
    {
      v44 = a4;
      v23 = (signed __int64)(a4 + 4);
      if ( *a4 == 0x434C4E47432B2B01LL )
        v23 = *(a4 - 12);
      if ( !v23 )
        goto LABEL_95;
      v45 = *(a4 - 11);
      if ( !v45 )
        goto LABEL_95;
      if ( !v16 )
        goto LABEL_94;
      v11 = &v16[~v40];
      while ( 1 )
      {
        v46 = 0LL;
        v47 = 0LL;
        do
        {
          v48 = *v11++;
          v47 |= (unsigned __int64)(v48 & 0x7F) << v46;
          v46 += 7LL;
        }
        while ( v48 < 0 );
        if ( !v47 )
          break;
        v70[0] = v16;
        if ( ((v67 + 6) & 0xF) > 0xA || !(_DWORD)v17 )
          goto LABEL_92;
        v70[0] = &v16[-(v47 << qword_69D0940[v31])];
        v49 = sub_8F870(v70, v67);
        v70[0] = v23;
        result = (*(__int64 (__fastcall **)(__int64, __int64, _QWORD *))(*(_QWORD *)v49 + 32LL))(v49, v45, v70);
        if ( (result & 1) != 0 )
          goto LABEL_74;
      }
      v43 = a2;
      if ( (a2 & 1) != 0 )
      {
        *(_QWORD *)v5 = v40;
        *(_QWORD *)(v5 + 8) = v32;
        *(_QWORD *)(v5 + 24) = v62;
        *(_QWORD *)(v5 + 32) = v23;
        goto LABEL_86;
      }
      goto LABEL_73;
    }
    if ( (a2 & 5) != 0 )
    {
LABEL_83:
      *(_QWORD *)v5 = v40;
      *(_QWORD *)(v5 + 8) = v32;
      *(_QWORD *)(v5 + 24) = v62;
      if ( *a4 == 0x434C4E47432B2B01LL )
        v63 = (_QWORD *)*(a4 - 12);
      *(_QWORD *)(v5 + 32) = v63;
      goto LABEL_86;
    }
    if ( (a2 & 8) == 0 )
      goto LABEL_94;
LABEL_74:
    v50 = 0LL;
    v51 = 0LL;
    v52 = 0LL;
    do
    {
      v53 = v35[v50++];
      v52 |= (unsigned __int64)(v53 & 0x7F) << v51;
      v51 += 7LL;
    }
    while ( v53 < 0 );
    v54 = v53 & 0x40;
    v55 = v51 < 0x40;
    v56 = -1LL << v51;
    if ( (v55 & (v54 >> 6)) == 0 )
      v56 = 0LL;
    v57 = v52 | v56;
    if ( !v57 )
      goto LABEL_82;
    v32 = (__int64)&v35[v57];
  }
  if ( (a2 & 6) != 2 )
    goto LABEL_74;
  *(_QWORD *)v5 = v40;
  *(_QWORD *)(v5 + 8) = v32;
  *(_QWORD *)(v5 + 24) = v62;
  if ( *a4 == 0x434C4E47432B2B01LL )
    v63 = (_QWORD *)*(a4 - 12);
  *(_QWORD *)(v5 + 32) = v63;
  *(_DWORD *)(v5 + 40) = 6;
  return result;
}
