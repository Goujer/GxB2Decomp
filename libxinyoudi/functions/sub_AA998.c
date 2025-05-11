unsigned __int8 *__fastcall sub_AA998(
        unsigned __int8 *a1,
        unsigned __int8 *a2,
        unsigned __int8 *a3,
        unsigned __int64 *a4)
{
  unsigned __int8 *v4; // x21
  unsigned __int8 *v7; // x8
  int v8; // w9
  unsigned __int8 *v9; // x28
  unsigned __int64 v10; // x8
  unsigned __int64 v11; // x8
  __int64 v12; // x24
  __int64 v13; // x8
  __int64 v14; // x9
  void *v15; // x22
  char v16; // w25
  __int64 v17; // x8
  __int64 v18; // x9
  unsigned __int64 v19; // x8
  unsigned __int64 v20; // x9
  unsigned __int8 *v21; // x8
  int v22; // t1
  unsigned __int64 v23; // x8
  _OWORD *v24; // x9
  unsigned __int64 v25; // x22
  unsigned __int64 v26; // x8
  unsigned __int64 v27; // x8
  unsigned __int64 v28; // x9
  char *v29; // x0
  unsigned __int64 v30; // x26
  unsigned __int64 v31; // x9
  unsigned __int64 v32; // x9
  unsigned __int64 v33; // x9
  char *v34; // x0
  char *v35; // x8
  unsigned __int64 v36; // x11
  unsigned __int64 v37; // x25
  char *v38; // x9
  _OWORD *v39; // x10
  __int64 v40; // x12
  unsigned __int64 v41; // x22
  unsigned __int64 v42; // x24
  unsigned __int64 v43; // x26
  unsigned __int64 v44; // x8
  void *v45; // x0
  char *v46; // x8
  char *v47; // x9
  void **v48; // x11
  void **v49; // x25
  char *v50; // x10
  __int64 v51; // x12
  void **v52; // x22
  unsigned __int64 v53; // x24
  void **v54; // x26
  unsigned __int64 v55; // x8
  unsigned __int64 v56; // x22
  unsigned __int64 v57; // x8
  size_t *v58; // x25
  size_t v59; // x23
  unsigned __int64 v60; // x26
  unsigned __int64 v61; // x24
  unsigned __int64 v62; // x9
  unsigned __int64 v63; // x10
  _BYTE *v64; // x0
  void *v65; // x8
  unsigned __int64 v66; // x10
  unsigned __int8 *v67; // x8
  _BYTE *v68; // x9
  _OWORD *v69; // x11
  __int128 *v70; // x12
  unsigned __int64 v71; // x13
  __int128 v72; // q0
  __int128 v73; // q1
  char v74; // t1
  char v75; // w22
  void *v76; // x21
  char *v77; // x1
  size_t v78; // x2
  unsigned __int64 v79; // x8
  size_t v80; // x8
  void *v81; // x0
  size_t v82; // x2
  void *v83; // x23
  size_t v84; // x26
  void *v85; // x23
  unsigned __int64 v86; // x8
  unsigned __int8 *v87; // x9
  size_t v88; // x10
  unsigned __int8 *v89; // x11
  unsigned __int64 v90; // x12
  __int128 *v91; // x13
  _OWORD *v92; // x14
  unsigned __int64 v93; // x15
  __int128 v94; // q0
  __int128 v95; // q1
  unsigned __int8 v96; // t1
  size_t v97; // x8
  unsigned __int64 v98; // x8
  size_t v99; // x2
  void *v100; // x1
  size_t n; // [xsp+8h] [xbp-B8h]
  size_t v103; // [xsp+10h] [xbp-B0h]
  void *src; // [xsp+18h] [xbp-A8h]
  __int128 v105; // [xsp+20h] [xbp-A0h] BYREF
  void *p; // [xsp+30h] [xbp-90h]
  _QWORD v107[2]; // [xsp+38h] [xbp-88h] BYREF
  _QWORD v108[2]; // [xsp+48h] [xbp-78h] BYREF
  _QWORD v109[3]; // [xsp+58h] [xbp-68h] BYREF

  v4 = a1;
  v109[2] = *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 2)) + 40);
  if ( a1 == a2 )
    return v4;
  v7 = *a1 == 110 ? a1 + 1 : a1;
  if ( v7 == a2 )
    return v4;
  v8 = *v7;
  if ( v8 == 48 )
  {
    v9 = v7 + 1;
    if ( v7 + 1 == a1 )
      return v4;
LABEL_8:
    if ( v9 == a2 || *v9 != 69 )
      return v4;
    v10 = *a3;
    if ( (v10 & 1) != 0 )
      v11 = *((_QWORD *)a3 + 1);
    else
      v11 = v10 >> 1;
    v12 = 0x555555555555555LL;
    if ( v11 < 4 )
    {
      v24 = (_OWORD *)a4[1];
      v23 = a4[2];
      if ( (unsigned __int64)v24 < v23 )
      {
        v24[1] = 0u;
        v24[2] = 0u;
        *v24 = 0u;
        a4[1] += 48LL;
        goto LABEL_81;
      }
      v25 = 0xAAAAAAAAAAAAAAABLL * ((__int64)((__int64)v24 - *a4) >> 4);
      if ( v25 + 1 > 0x555555555555555LL )
        goto LABEL_160;
      v26 = 0xAAAAAAAAAAAAAAABLL * ((__int64)(v23 - *a4) >> 4);
      if ( v26 >= 0x2AAAAAAAAAAAAAALL || ((v27 = 2 * v26, v27 >= v25 + 1) ? (v12 = v27) : (v12 = v25 + 1), v12) )
      {
        v28 = a4[3];
        v29 = *(char **)(v28 + 4096);
        if ( v28 + 4096 - (unsigned __int64)v29 >= 48 * v12 )
          *(_QWORD *)(v28 + 4096) = &v29[48 * v12];
        else
          v29 = (char *)malloc(48 * v12);
      }
      else
      {
        v29 = 0LL;
      }
      v35 = &v29[48 * v25];
      *((_OWORD *)v35 + 1) = 0u;
      *((_OWORD *)v35 + 2) = 0u;
      *(_OWORD *)v35 = 0u;
      v37 = *a4;
      v36 = a4[1];
      v38 = &v29[48 * v12];
      v39 = v35 + 48;
      if ( v36 == *a4 )
      {
        v41 = *a4;
      }
      else
      {
        do
        {
          *((_QWORD *)v35 - 4) = *(_QWORD *)(v36 - 32);
          *((_OWORD *)v35 - 3) = *(_OWORD *)(v36 - 48);
          v40 = *(_QWORD *)(v36 - 8);
          *(_QWORD *)(v36 - 40) = 0LL;
          *(_QWORD *)(v36 - 32) = 0LL;
          *(_QWORD *)(v36 - 48) = 0LL;
          *((_QWORD *)v35 - 1) = v40;
          *(_OWORD *)(v35 - 24) = *(_OWORD *)(v36 - 24);
          *(_QWORD *)(v36 - 16) = 0LL;
          *(_QWORD *)(v36 - 8) = 0LL;
          *(_QWORD *)(v36 - 24) = 0LL;
          v36 -= 48LL;
          v35 -= 48;
        }
        while ( v37 != v36 );
        v41 = *a4;
        v37 = a4[1];
      }
      v42 = a4[2];
      *a4 = (unsigned __int64)v35;
      a4[1] = (unsigned __int64)v39;
      a4[2] = (unsigned __int64)v38;
      if ( v37 != v41 )
      {
        do
        {
          if ( (*(_BYTE *)(v37 - 24) & 1) != 0 )
            free(*(void **)(v37 - 8));
          v43 = v37 - 48;
          if ( (*(_BYTE *)(v37 - 48) & 1) != 0 )
            free(*(void **)(v37 - 32));
          v37 -= 48LL;
        }
        while ( v41 != v43 );
      }
      if ( v41 )
      {
        v44 = a4[3];
        if ( v44 + 4096 < v41 || v44 > v41 )
        {
          v45 = (void *)v41;
LABEL_80:
          free(v45);
          goto LABEL_81;
        }
        if ( *(_QWORD *)(v44 + 4096) == v42 )
          *(_QWORD *)(v44 + 4096) = v41;
      }
LABEL_81:
      if ( *v4 == 110 )
      {
        sub_B23DC(a4[1] - 48, 45LL);
        ++v4;
      }
      v56 = a4[1];
      v58 = (size_t *)(v56 - 48);
      v57 = *(unsigned __int8 *)(v56 - 48);
      if ( (*(_BYTE *)(v56 - 48) & 1) != 0 )
      {
        v57 = *(_QWORD *)(v56 - 48);
        v59 = *(_QWORD *)(v56 - 40);
        v60 = (v57 & 0xFFFFFFFFFFFFFFFELL) - 1;
        v61 = v9 - v4;
        if ( v9 == v4 )
          goto LABEL_150;
      }
      else
      {
        v59 = v57 >> 1;
        v60 = 22LL;
        v61 = v9 - v4;
        if ( v9 == v4 )
          goto LABEL_150;
      }
      if ( (v57 & 1) != 0 )
      {
        v63 = *(_QWORD *)(v56 - 40);
        v62 = *(_QWORD *)(v56 - 32);
        if ( v62 > (unsigned __int64)v4 )
          goto LABEL_96;
      }
      else
      {
        v62 = v56 - 47;
        v63 = (unsigned __int64)((unsigned __int8)v57 & 0xFE) >> 1;
        if ( v56 - 47 > (unsigned __int64)v4 )
          goto LABEL_96;
      }
      if ( v62 + v63 > (unsigned __int64)v4 )
      {
        p = 0LL;
        v105 = 0uLL;
        if ( v61 >= 0xFFFFFFFFFFFFFFF0LL )
          goto LABEL_160;
        if ( v61 > 0x16 )
        {
          v64 = malloc((v61 + 16) & 0xFFFFFFFFFFFFFFF0LL);
          *((_QWORD *)&v105 + 1) = v61;
          p = v64;
          *(_QWORD *)&v105 = (v61 + 16) & 0xFFFFFFFFFFFFFFF0LL | 1;
          if ( v4 == v9 )
            goto LABEL_110;
        }
        else
        {
          LOBYTE(v105) = 2 * v61;
          v64 = (char *)&v105 + 1;
          if ( v4 == v9 )
          {
LABEL_110:
            *v64 = 0;
            v75 = v105;
            v76 = p;
            if ( (v105 & 1) != 0 )
              v77 = (char *)p;
            else
              v77 = (char *)&v105 + 1;
            if ( (v105 & 1) != 0 )
              v78 = *((_QWORD *)&v105 + 1);
            else
              v78 = (unsigned __int64)(unsigned __int8)v105 >> 1;
            sub_9CFD0(v58, v77, v78);
            if ( (v75 & 1) != 0 )
              free(v76);
            goto LABEL_150;
          }
        }
        if ( v61 >= 0x20 && (v66 = v61 & 0xFFFFFFFFFFFFFFE0LL, (v61 & 0xFFFFFFFFFFFFFFE0LL) != 0) )
        {
          v67 = &v4[v66];
          v68 = &v64[v66];
          v69 = v64 + 16;
          v70 = (__int128 *)(v4 + 16);
          v71 = v61 & 0xFFFFFFFFFFFFFFE0LL;
          do
          {
            v72 = *(v70 - 1);
            v73 = *v70;
            v71 -= 32LL;
            v70 += 2;
            *(v69 - 1) = v72;
            *v69 = v73;
            v69 += 2;
          }
          while ( v71 );
          if ( v66 == v61 )
            goto LABEL_109;
        }
        else
        {
          v67 = v4;
          v68 = v64;
        }
        do
        {
          v74 = *v67++;
          *v68++ = v74;
        }
        while ( v9 != v67 );
LABEL_109:
        v64 += v61;
        goto LABEL_110;
      }
LABEL_96:
      if ( v60 - v59 >= v61 )
        goto LABEL_131;
      if ( -17LL - v60 >= v59 + v61 - v60 )
      {
        if ( (v57 & 1) != 0 )
          v65 = *(void **)(v56 - 32);
        else
          v65 = (void *)(v56 - 47);
        src = v65;
        if ( v60 > 0x7FFFFFFFFFFFFFE6LL )
        {
          v80 = -17LL;
        }
        else
        {
          v79 = 2 * v60;
          if ( v59 + v61 >= 2 * v60 )
            v79 = v59 + v61;
          if ( v79 >= 0x17 )
            v80 = (v79 + 16) & 0xFFFFFFFFFFFFFFF0LL;
          else
            v80 = 23LL;
        }
        v103 = v80;
        v81 = malloc(v80);
        if ( v59 )
        {
          n = v59;
          v82 = v59;
          v83 = v81;
          memcpy(v81, src, v82);
          v81 = v83;
          v59 = n;
        }
        if ( v60 != 22 )
        {
          v84 = v59;
          v85 = v81;
          free(src);
          v81 = v85;
          v59 = v84;
        }
        *(_QWORD *)(v56 - 32) = v81;
        LOBYTE(v57) = v103 | 1;
        *(_QWORD *)(v56 - 48) = v103 | 1;
LABEL_131:
        if ( (v57 & 1) != 0 )
          v86 = *(_QWORD *)(v56 - 32);
        else
          v86 = v56 - 47;
        v87 = (unsigned __int8 *)(v86 + v59);
        if ( v4 == v9 )
          goto LABEL_147;
        v88 = v59 - (_QWORD)v4;
        if ( v61 >= 0x20 )
        {
          v90 = v61 & 0xFFFFFFFFFFFFFFE0LL;
          if ( (v61 & 0xFFFFFFFFFFFFFFE0LL) != 0 )
          {
            if ( v87 >= v9 || v4 >= &v9[v86 + v88] )
            {
              v87 += v90;
              v89 = &v4[v90];
              v91 = (__int128 *)(v4 + 16);
              v92 = (_OWORD *)(v86 + v59 + 16);
              v93 = v61 & 0xFFFFFFFFFFFFFFE0LL;
              do
              {
                v94 = *(v91 - 1);
                v95 = *v91;
                v91 += 2;
                v93 -= 32LL;
                *(v92 - 1) = v94;
                *v92 = v95;
                v92 += 2;
              }
              while ( v93 );
              if ( v90 == v61 )
                goto LABEL_146;
            }
            else
            {
              v89 = v4;
            }
          }
          else
          {
            v89 = v4;
          }
        }
        else
        {
          v89 = v4;
        }
        do
        {
          v96 = *v89++;
          *v87++ = v96;
        }
        while ( v9 != v89 );
LABEL_146:
        v87 = &v9[v88 + v86];
LABEL_147:
        *v87 = 0;
        v97 = v59 + v61;
        if ( (*(_BYTE *)v58 & 1) != 0 )
          *(_QWORD *)(v56 - 40) = v97;
        else
          *(_BYTE *)v58 = 2 * v97;
LABEL_150:
        v98 = *a3;
        if ( (v98 & 1) != 0 )
          v99 = *((_QWORD *)a3 + 1);
        else
          v99 = v98 >> 1;
        if ( v99 <= 3 )
        {
          if ( (v98 & 1) != 0 )
            v100 = (void *)*((_QWORD *)a3 + 2);
          else
            v100 = a3 + 1;
          sub_9CFD0((size_t *)(a4[1] - 48), v100, v99);
        }
        return v9 + 1;
      }
LABEL_160:
      abort();
    }
    sub_9F8F0("(", a3, (size_t *)&v105);
    sub_9CFD0((size_t *)&v105, ")", 1uLL);
    v13 = *(_QWORD *)((char *)&v105 + 1);
    v14 = *((_QWORD *)&v105 + 1);
    v15 = p;
    v16 = v105;
    p = 0LL;
    v105 = 0uLL;
    *(_QWORD *)((char *)v107 + 7) = v14;
    v107[0] = v13;
    v17 = *(_QWORD *)((char *)v107 + 7);
    v18 = v107[0];
    memset(v108, 0, 15);
    memset(v107, 0, 15);
    *(_QWORD *)((char *)v109 + 7) = v17;
    v109[0] = v18;
    v19 = a4[1];
    v20 = a4[2];
    if ( v19 < v20 )
    {
      *(_BYTE *)v19 = v16;
      *(_QWORD *)(v19 + 8) = *(_QWORD *)((char *)v109 + 7);
      *(_QWORD *)(v19 + 16) = v15;
      *(_QWORD *)(v19 + 1) = v109[0];
      memset(v109, 0, 15);
      *(_BYTE *)(v19 + 24) = 0;
      *(_QWORD *)(v19 + 32) = *(_QWORD *)((char *)v108 + 7);
      *(_QWORD *)(v19 + 40) = 0LL;
      *(_QWORD *)(v19 + 25) = v108[0];
      memset(v108, 0, 15);
      a4[1] += 48LL;
      if ( (v105 & 1) == 0 )
        goto LABEL_81;
      goto LABEL_79;
    }
    v30 = 0xAAAAAAAAAAAAAAABLL * ((__int64)(v19 - *a4) >> 4);
    if ( v30 + 1 > 0x555555555555555LL )
      abort();
    v31 = 0xAAAAAAAAAAAAAAABLL * ((__int64)(v20 - *a4) >> 4);
    if ( v31 >= 0x2AAAAAAAAAAAAAALL || ((v32 = 2 * v31, v32 >= v30 + 1) ? (v12 = v32) : (v12 = v30 + 1), v12) )
    {
      v33 = a4[3];
      v34 = *(char **)(v33 + 4096);
      if ( v33 + 4096 - (unsigned __int64)v34 >= 48 * v12 )
        *(_QWORD *)(v33 + 4096) = &v34[48 * v12];
      else
        v34 = (char *)malloc(48 * v12);
    }
    else
    {
      v34 = 0LL;
    }
    v46 = &v34[48 * v30];
    *v46 = v16;
    v47 = &v34[48 * v12];
    *((_QWORD *)v46 + 1) = *(_QWORD *)((char *)v109 + 7);
    *((_QWORD *)v46 + 2) = v15;
    *(_QWORD *)(v46 + 1) = v109[0];
    memset(v109, 0, 15);
    v46[24] = 0;
    *((_QWORD *)v46 + 4) = *(_QWORD *)((char *)v108 + 7);
    *((_QWORD *)v46 + 5) = 0LL;
    *(_QWORD *)(v46 + 25) = v108[0];
    memset(v108, 0, 15);
    v49 = (void **)*a4;
    v48 = (void **)a4[1];
    v50 = v46 + 48;
    if ( v48 == (void **)*a4 )
    {
      v52 = (void **)*a4;
    }
    else
    {
      do
      {
        *((_QWORD *)v46 - 4) = *(v48 - 4);
        *((_OWORD *)v46 - 3) = *((_OWORD *)v48 - 3);
        v51 = (__int64)*(v48 - 1);
        *(v48 - 5) = 0LL;
        *(v48 - 4) = 0LL;
        *(v48 - 6) = 0LL;
        *((_QWORD *)v46 - 1) = v51;
        *(_OWORD *)(v46 - 24) = *(_OWORD *)(v48 - 3);
        *(v48 - 2) = 0LL;
        *(v48 - 1) = 0LL;
        *(v48 - 3) = 0LL;
        v48 -= 6;
        v46 -= 48;
      }
      while ( v49 != v48 );
      v52 = (void **)*a4;
      v49 = (void **)a4[1];
    }
    v53 = a4[2];
    *a4 = (unsigned __int64)v46;
    a4[1] = (unsigned __int64)v50;
    a4[2] = (unsigned __int64)v47;
    if ( v49 != v52 )
    {
      do
      {
        if ( (*(_BYTE *)(v49 - 3) & 1) != 0 )
          free(*(v49 - 1));
        v54 = v49 - 6;
        if ( (*(_BYTE *)(v49 - 6) & 1) != 0 )
          free(*(v49 - 4));
        v49 -= 6;
      }
      while ( v52 != v54 );
    }
    if ( v52 )
    {
      v55 = a4[3];
      if ( v55 + 4096 < (unsigned __int64)v52 || v55 > (unsigned __int64)v52 )
      {
        free(v52);
      }
      else if ( *(_QWORD *)(v55 + 4096) == v53 )
      {
        *(_QWORD *)(v55 + 4096) = v52;
        if ( (v105 & 1) == 0 )
          goto LABEL_81;
LABEL_79:
        v45 = p;
        goto LABEL_80;
      }
    }
    if ( (v105 & 1) == 0 )
      goto LABEL_81;
    goto LABEL_79;
  }
  if ( (unsigned int)(v8 - 49) <= 8 )
  {
    v21 = v7 + 1;
    do
    {
      if ( a2 == v21 )
        return v4;
      v22 = *v21++;
    }
    while ( (unsigned int)(v22 - 48) < 0xA );
    v9 = v21 - 1;
    if ( v21 - 1 != a1 )
      goto LABEL_8;
  }
  return v4;
}
