unsigned __int8 *__fastcall sub_A8CFC(unsigned __int8 *result, unsigned __int8 *a2, void **a3)
{
  int v4; // w8
  __int64 v5; // x22
  unsigned __int8 *v6; // x8
  int v7; // w9
  int v8; // t1
  unsigned __int8 *v9; // x25
  unsigned __int8 *v10; // x8
  unsigned __int8 *v11; // x24
  int v12; // w9
  unsigned __int8 *v13; // x8
  unsigned __int8 *v14; // x9
  int v15; // w10
  unsigned __int8 *v16; // x8
  int v17; // t1
  unsigned __int8 *v18; // x9
  int v19; // w10
  int v20; // t1
  unsigned __int8 *v21; // x25
  unsigned __int8 *v22; // x8
  int v23; // w9
  unsigned __int8 *v24; // x8
  int v25; // t1
  unsigned __int64 v26; // x26
  unsigned __int8 *v27; // x0
  unsigned __int8 *v28; // x8
  unsigned __int64 v29; // x9
  _OWORD *v30; // x11
  __int128 *v31; // x12
  unsigned __int64 v32; // x13
  __int128 v33; // q0
  __int128 v34; // q1
  unsigned __int8 *v35; // x8
  int v36; // t1
  unsigned __int64 v37; // x26
  unsigned __int8 *v38; // x0
  unsigned __int8 v39; // t1
  __int64 v40; // x8
  __int64 v41; // x9
  void *v42; // x20
  char v43; // w25
  __int64 v44; // x8
  __int64 v45; // x9
  _QWORD *v46; // x8
  _BYTE *v47; // x9
  __int64 v48; // x9
  __int64 v49; // x9
  unsigned __int64 v50; // x26
  unsigned __int64 v51; // x9
  unsigned __int64 v52; // x9
  _QWORD *v53; // x9
  char *v54; // x0
  char *v55; // x8
  char *v56; // x9
  void **v57; // x11
  void **v58; // x23
  char *v59; // x10
  __int64 v60; // x12
  void **v61; // x20
  void *v62; // x22
  void **v63; // x25
  unsigned __int64 v64; // x8
  unsigned __int8 *v65; // x8
  unsigned __int64 v66; // x9
  _OWORD *v67; // x11
  __int128 *v68; // x12
  unsigned __int64 v69; // x13
  __int128 v70; // q0
  __int128 v71; // q1
  unsigned __int8 v72; // t1
  __int64 v73; // x8
  __int64 v74; // x9
  __int64 v75; // x8
  __int64 v76; // x9
  _BYTE *v77; // x9
  unsigned __int64 v78; // x26
  unsigned __int64 v79; // x9
  unsigned __int64 v80; // x9
  _QWORD *v81; // x9
  char *v82; // x0
  char *v83; // x8
  char *v84; // x9
  void **v85; // x11
  void **v86; // x23
  char *v87; // x10
  __int64 v88; // x12
  void **v89; // x25
  __int128 v90; // [xsp+0h] [xbp-A0h] BYREF
  void *p; // [xsp+10h] [xbp-90h]
  _QWORD v92[4]; // [xsp+18h] [xbp-88h] BYREF
  _QWORD v93[2]; // [xsp+38h] [xbp-68h] BYREF
  _QWORD v94[3]; // [xsp+48h] [xbp-58h] BYREF

  v94[2] = *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 2)) + 40);
  if ( a2 - result < 3 || *result != 102 )
    return result;
  v4 = result[1];
  v5 = 0x555555555555555LL;
  if ( v4 == 76 )
  {
    v13 = result + 2;
    if ( result + 2 == a2 )
      return result;
    if ( result[2] == 110 )
      v14 = result + 3;
    else
      v14 = result + 2;
    if ( v14 != a2 )
    {
      v15 = *v14;
      if ( v15 == 48 )
      {
        v13 = v14 + 1;
        if ( v14 + 1 == a2 )
          return result;
        goto LABEL_34;
      }
      if ( (unsigned int)(v15 - 49) <= 8 )
      {
        v16 = v14 + 1;
        do
        {
          if ( a2 == v16 )
            return result;
          v17 = *v16++;
        }
        while ( (unsigned int)(v17 - 48) < 0xA );
        v13 = v16 - 1;
      }
    }
    if ( v13 == a2 )
      return result;
LABEL_34:
    if ( *v13 != 112 )
      return result;
    v18 = v13 + 1;
    if ( v13 + 1 == a2 )
      return result;
    v19 = *v18;
    if ( v19 == 114 )
    {
      v19 = v13[2];
      v18 = v13 + 2;
    }
    if ( v19 == 86 )
    {
      v20 = *++v18;
      v19 = v20;
    }
    v21 = v19 == 75 ? v18 + 1 : v18;
    if ( v21 == a2 )
      return result;
    v22 = v21 + 1;
    v11 = v21;
    if ( *v21 != 110 )
      v22 = v21;
    if ( v22 != a2 )
    {
      v23 = *v22;
      if ( v23 == 48 )
      {
        v11 = v22 + 1;
        if ( v22 + 1 == a2 )
          return result;
        goto LABEL_77;
      }
      v11 = v21;
      if ( (unsigned int)(v23 - 49) <= 8 )
      {
        v35 = v22 + 1;
        do
        {
          if ( a2 == v35 )
            return result;
          v36 = *v35++;
        }
        while ( (unsigned int)(v36 - 48) < 0xA );
        v11 = v35 - 1;
      }
    }
    if ( v11 == a2 )
      return result;
LABEL_77:
    if ( *v11 != 95 )
      return result;
    v37 = v11 - v21;
    p = 0LL;
    v90 = 0uLL;
    if ( (unsigned __int64)(v11 - v21) >= 0xFFFFFFFFFFFFFFF0LL )
      goto LABEL_156;
    if ( v37 > 0x16 )
    {
      v38 = (unsigned __int8 *)malloc((v37 + 16) & 0xFFFFFFFFFFFFFFF0LL);
      *((_QWORD *)&v90 + 1) = v11 - v21;
      p = v38;
      *(_QWORD *)&v90 = (v37 + 16) & 0xFFFFFFFFFFFFFFF0LL | 1;
      if ( v21 == v11 )
        goto LABEL_127;
    }
    else
    {
      LOBYTE(v90) = 2 * v37;
      v38 = (unsigned __int8 *)&v90 + 1;
      if ( v21 == v11 )
      {
LABEL_127:
        *v38 = 0;
        sub_9CDD8((size_t *)&v90, 0LL, "fp", 2uLL);
        v73 = *(_QWORD *)((char *)&v90 + 1);
        v74 = *((_QWORD *)&v90 + 1);
        v42 = p;
        v43 = v90;
        p = 0LL;
        v90 = 0uLL;
        *(_QWORD *)((char *)v92 + 7) = v74;
        v92[0] = v73;
        v75 = *(_QWORD *)((char *)v92 + 7);
        v76 = v92[0];
        memset(v93, 0, 15);
        memset(v92, 0, 15);
        *(_QWORD *)((char *)v94 + 7) = v75;
        v94[0] = v76;
        v46 = a3[1];
        v77 = a3[2];
        if ( v46 < (_QWORD *)v77 )
        {
LABEL_86:
          *(_BYTE *)v46 = v43;
          v46[1] = *(_QWORD *)((char *)v94 + 7);
          v48 = v94[0];
          v46[2] = v42;
          *(_QWORD *)((char *)v46 + 1) = v48;
          memset(v94, 0, 15);
          *((_BYTE *)v46 + 24) = 0;
          v46[4] = *(_QWORD *)((char *)v93 + 7);
          v49 = v93[0];
          v46[5] = 0LL;
          *(_QWORD *)((char *)v46 + 25) = v49;
          memset(v93, 0, 15);
          a3[1] = (char *)a3[1] + 48;
          if ( (v90 & 1) == 0 )
            return v11 + 1;
          goto LABEL_153;
        }
        v78 = 0xAAAAAAAAAAAAAAABLL * (((char *)v46 - (_BYTE *)*a3) >> 4);
        if ( v78 + 1 > 0x555555555555555LL )
          abort();
        v79 = 0xAAAAAAAAAAAAAAABLL * ((v77 - (_BYTE *)*a3) >> 4);
        if ( v79 >= 0x2AAAAAAAAAAAAAALL || ((v80 = 2 * v79, v80 >= v78 + 1) ? (v5 = v80) : (v5 = v78 + 1), v5) )
        {
          v81 = a3[3];
          v82 = (char *)v81[512];
          if ( (char *)(v81 + 512) - v82 >= (unsigned __int64)(48 * v5) )
            v81[512] = &v82[48 * v5];
          else
            v82 = (char *)malloc(48 * v5);
        }
        else
        {
          v82 = 0LL;
        }
        v83 = &v82[48 * v78];
        *v83 = v43;
        v84 = &v82[48 * v5];
        *((_QWORD *)v83 + 1) = *(_QWORD *)((char *)v94 + 7);
        *((_QWORD *)v83 + 2) = v42;
        *(_QWORD *)(v83 + 1) = v94[0];
        memset(v94, 0, 15);
        v83[24] = 0;
        *((_QWORD *)v83 + 4) = *(_QWORD *)((char *)v93 + 7);
        *((_QWORD *)v83 + 5) = 0LL;
        *(_QWORD *)(v83 + 25) = v93[0];
        memset(v93, 0, 15);
        v86 = (void **)*a3;
        v85 = (void **)a3[1];
        v87 = v83 + 48;
        if ( v85 == *a3 )
        {
          v61 = (void **)*a3;
        }
        else
        {
          do
          {
            *((_QWORD *)v83 - 4) = *(v85 - 4);
            *((_OWORD *)v83 - 3) = *((_OWORD *)v85 - 3);
            v88 = (__int64)*(v85 - 1);
            *(v85 - 5) = 0LL;
            *(v85 - 4) = 0LL;
            *(v85 - 6) = 0LL;
            *((_QWORD *)v83 - 1) = v88;
            *(_OWORD *)(v83 - 24) = *(_OWORD *)(v85 - 3);
            *(v85 - 2) = 0LL;
            *(v85 - 1) = 0LL;
            *(v85 - 3) = 0LL;
            v85 -= 6;
            v83 -= 48;
          }
          while ( v86 != v85 );
          v61 = (void **)*a3;
          v86 = (void **)a3[1];
        }
        v62 = a3[2];
        *a3 = v83;
        a3[1] = v87;
        a3[2] = v84;
        if ( v86 != v61 )
        {
          do
          {
            if ( (*(_BYTE *)(v86 - 3) & 1) != 0 )
              free(*(v86 - 1));
            v89 = v86 - 6;
            if ( (*(_BYTE *)(v86 - 6) & 1) != 0 )
              free(*(v86 - 4));
            v86 -= 6;
          }
          while ( v61 != v89 );
        }
        if ( !v61 )
          goto LABEL_152;
        v64 = (unsigned __int64)a3[3];
        if ( v64 + 4096 >= (unsigned __int64)v61 && v64 <= (unsigned __int64)v61 )
        {
LABEL_111:
          if ( *(void **)(v64 + 4096) == v62 )
          {
            *(_QWORD *)(v64 + 4096) = v61;
            if ( (v90 & 1) == 0 )
              return v11 + 1;
            goto LABEL_153;
          }
LABEL_152:
          if ( (v90 & 1) == 0 )
            return v11 + 1;
LABEL_153:
          free(p);
          return v11 + 1;
        }
LABEL_151:
        free(v61);
        goto LABEL_152;
      }
    }
    if ( v37 >= 0x20 )
    {
      v66 = v37 & 0xFFFFFFFFFFFFFFE0LL;
      if ( (v37 & 0xFFFFFFFFFFFFFFE0LL) != 0 )
      {
        if ( v38 >= v11 || (v65 = v38, v21 >= &v11[v38 - v21]) )
        {
          v65 = &v38[v66];
          v67 = v38 + 16;
          v68 = (__int128 *)(v21 + 16);
          v69 = v37 & 0xFFFFFFFFFFFFFFE0LL;
          do
          {
            v70 = *(v68 - 1);
            v71 = *v68;
            v69 -= 32LL;
            v68 += 2;
            *(v67 - 1) = v70;
            *v67 = v71;
            v67 += 2;
          }
          while ( v69 );
          v21 += v66;
          if ( v66 == v37 )
            goto LABEL_126;
        }
      }
      else
      {
        v65 = v38;
      }
    }
    else
    {
      v65 = v38;
    }
    do
    {
      v72 = *v21++;
      *v65++ = v72;
    }
    while ( v11 != v21 );
LABEL_126:
    v38 += v37;
    goto LABEL_127;
  }
  if ( v4 == 112 )
  {
    v6 = result + 2;
    if ( result + 2 != a2 )
    {
      v7 = *v6;
      if ( v7 == 114 )
      {
        v6 = result + 3;
        v7 = result[3];
      }
      if ( v7 == 86 )
      {
        v8 = *++v6;
        v7 = v8;
      }
      v9 = v7 == 75 ? v6 + 1 : v6;
      if ( v9 != a2 )
      {
        v10 = v9 + 1;
        v11 = v9;
        if ( *v9 != 110 )
          v10 = v9;
        if ( v10 != a2 )
        {
          v12 = *v10;
          if ( v12 == 48 )
          {
            v11 = v10 + 1;
            if ( v10 + 1 == a2 )
              return result;
            goto LABEL_56;
          }
          v11 = v9;
          if ( (unsigned int)(v12 - 49) <= 8 )
          {
            v24 = v10 + 1;
            do
            {
              if ( a2 == v24 )
                return result;
              v25 = *v24++;
            }
            while ( (unsigned int)(v25 - 48) < 0xA );
            v11 = v24 - 1;
          }
        }
        if ( v11 == a2 )
          return result;
LABEL_56:
        if ( *v11 != 95 )
          return result;
        v26 = v11 - v9;
        p = 0LL;
        v90 = 0uLL;
        if ( (unsigned __int64)(v11 - v9) < 0xFFFFFFFFFFFFFFF0LL )
        {
          if ( v26 > 0x16 )
          {
            v27 = (unsigned __int8 *)malloc((v26 + 16) & 0xFFFFFFFFFFFFFFF0LL);
            *((_QWORD *)&v90 + 1) = v11 - v9;
            p = v27;
            *(_QWORD *)&v90 = (v26 + 16) & 0xFFFFFFFFFFFFFFF0LL | 1;
            if ( v9 == v11 )
              goto LABEL_85;
          }
          else
          {
            LOBYTE(v90) = 2 * v26;
            v27 = (unsigned __int8 *)&v90 + 1;
            if ( v9 == v11 )
            {
LABEL_85:
              *v27 = 0;
              sub_9CDD8((size_t *)&v90, 0LL, "fp", 2uLL);
              v40 = *(_QWORD *)((char *)&v90 + 1);
              v41 = *((_QWORD *)&v90 + 1);
              v42 = p;
              v43 = v90;
              p = 0LL;
              v90 = 0uLL;
              *(_QWORD *)((char *)&v92[2] + 7) = v41;
              v92[2] = v40;
              v44 = *(_QWORD *)((char *)&v92[2] + 7);
              v45 = v92[2];
              memset(v93, 0, 15);
              memset(&v92[2], 0, 15);
              *(_QWORD *)((char *)v94 + 7) = v44;
              v94[0] = v45;
              v46 = a3[1];
              v47 = a3[2];
              if ( v46 < (_QWORD *)v47 )
                goto LABEL_86;
              v50 = 0xAAAAAAAAAAAAAAABLL * (((char *)v46 - (_BYTE *)*a3) >> 4);
              if ( v50 + 1 > 0x555555555555555LL )
                abort();
              v51 = 0xAAAAAAAAAAAAAAABLL * ((v47 - (_BYTE *)*a3) >> 4);
              if ( v51 >= 0x2AAAAAAAAAAAAAALL || ((v52 = 2 * v51, v52 >= v50 + 1) ? (v5 = v52) : (v5 = v50 + 1), v5) )
              {
                v53 = a3[3];
                v54 = (char *)v53[512];
                if ( (char *)(v53 + 512) - v54 >= (unsigned __int64)(48 * v5) )
                  v53[512] = &v54[48 * v5];
                else
                  v54 = (char *)malloc(48 * v5);
              }
              else
              {
                v54 = 0LL;
              }
              v55 = &v54[48 * v50];
              *v55 = v43;
              v56 = &v54[48 * v5];
              *((_QWORD *)v55 + 1) = *(_QWORD *)((char *)v94 + 7);
              *((_QWORD *)v55 + 2) = v42;
              *(_QWORD *)(v55 + 1) = v94[0];
              memset(v94, 0, 15);
              v55[24] = 0;
              *((_QWORD *)v55 + 4) = *(_QWORD *)((char *)v93 + 7);
              *((_QWORD *)v55 + 5) = 0LL;
              *(_QWORD *)(v55 + 25) = v93[0];
              memset(v93, 0, 15);
              v58 = (void **)*a3;
              v57 = (void **)a3[1];
              v59 = v55 + 48;
              if ( v57 == *a3 )
              {
                v61 = (void **)*a3;
              }
              else
              {
                do
                {
                  *((_QWORD *)v55 - 4) = *(v57 - 4);
                  *((_OWORD *)v55 - 3) = *((_OWORD *)v57 - 3);
                  v60 = (__int64)*(v57 - 1);
                  *(v57 - 5) = 0LL;
                  *(v57 - 4) = 0LL;
                  *(v57 - 6) = 0LL;
                  *((_QWORD *)v55 - 1) = v60;
                  *(_OWORD *)(v55 - 24) = *(_OWORD *)(v57 - 3);
                  *(v57 - 2) = 0LL;
                  *(v57 - 1) = 0LL;
                  *(v57 - 3) = 0LL;
                  v57 -= 6;
                  v55 -= 48;
                }
                while ( v58 != v57 );
                v61 = (void **)*a3;
                v58 = (void **)a3[1];
              }
              v62 = a3[2];
              *a3 = v55;
              a3[1] = v59;
              a3[2] = v56;
              if ( v58 != v61 )
              {
                do
                {
                  if ( (*(_BYTE *)(v58 - 3) & 1) != 0 )
                    free(*(v58 - 1));
                  v63 = v58 - 6;
                  if ( (*(_BYTE *)(v58 - 6) & 1) != 0 )
                    free(*(v58 - 4));
                  v58 -= 6;
                }
                while ( v61 != v63 );
              }
              if ( !v61 )
                goto LABEL_152;
              v64 = (unsigned __int64)a3[3];
              if ( v64 + 4096 >= (unsigned __int64)v61 && v64 <= (unsigned __int64)v61 )
                goto LABEL_111;
              goto LABEL_151;
            }
          }
          if ( v26 >= 0x20 )
          {
            v29 = v26 & 0xFFFFFFFFFFFFFFE0LL;
            if ( (v26 & 0xFFFFFFFFFFFFFFE0LL) != 0 )
            {
              if ( v27 >= v11 || (v28 = v27, v9 >= &v11[v27 - v9]) )
              {
                v28 = &v27[v29];
                v30 = v27 + 16;
                v31 = (__int128 *)(v9 + 16);
                v32 = v26 & 0xFFFFFFFFFFFFFFE0LL;
                do
                {
                  v33 = *(v31 - 1);
                  v34 = *v31;
                  v32 -= 32LL;
                  v31 += 2;
                  *(v30 - 1) = v33;
                  *v30 = v34;
                  v30 += 2;
                }
                while ( v32 );
                v9 += v29;
                if ( v29 == v26 )
                  goto LABEL_84;
              }
            }
            else
            {
              v28 = v27;
            }
          }
          else
          {
            v28 = v27;
          }
          do
          {
            v39 = *v9++;
            *v28++ = v39;
          }
          while ( v11 != v9 );
LABEL_84:
          v27 += v26;
          goto LABEL_85;
        }
LABEL_156:
        abort();
      }
    }
  }
  return result;
}
