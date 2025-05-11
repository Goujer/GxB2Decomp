__int64 __fastcall sub_A0C94(unsigned __int8 *a1, unsigned __int8 *a2, char **a3)
{
  unsigned __int8 *v4; // x19
  unsigned __int8 *v6; // x23
  int v7; // w9
  __int64 v9; // x22
  char *v10; // x8
  unsigned int v11; // w9
  __int64 v12; // x8
  void *v13; // x21
  __int64 v14; // x9
  char v15; // w23
  unsigned __int64 v16; // x8
  unsigned __int64 v17; // x9
  unsigned __int64 v18; // x25
  unsigned __int64 v19; // x9
  unsigned __int64 v20; // x9
  char *v21; // x9
  char *v22; // x0
  int v23; // w8
  unsigned __int64 v24; // x9
  unsigned __int64 v25; // x10
  unsigned int v26; // w9
  __int64 v27; // x8
  __int64 v28; // x9
  unsigned __int64 v29; // x9
  unsigned __int64 v30; // x8
  void **v31; // x9
  unsigned __int64 v32; // x11
  unsigned __int64 v33; // x28
  unsigned __int64 v34; // x25
  char *v35; // x9
  char *v36; // x0
  unsigned __int64 v37; // x9
  unsigned __int64 v38; // x9
  char *v39; // x9
  char *v40; // x0
  unsigned __int64 v41; // x25
  unsigned __int64 v42; // x9
  unsigned __int64 v43; // x9
  char *v44; // x9
  char *v45; // x0
  char *v46; // x8
  char *v47; // x9
  void **v48; // x11
  void **v49; // x23
  char *v50; // x10
  __int64 v51; // x12
  void **v52; // x21
  char *v53; // x22
  void **v54; // x24
  unsigned __int64 v55; // x8
  char *v56; // x8
  char *v57; // x9
  void **v58; // x11
  void **v59; // x24
  char *v60; // x10
  __int64 v61; // x12
  void **v62; // x22
  char *v63; // x25
  void **v64; // x26
  unsigned __int64 v65; // x8
  char *v66; // x28
  int v67; // w24
  __int64 v68; // x26
  unsigned __int8 *v69; // x25
  char *v70; // x22
  char *v71; // x21
  void *v72; // x0
  char *v73; // x22
  unsigned __int64 v74; // x8
  size_t *v75; // x16
  size_t v76; // x18
  unsigned __int64 v77; // x23
  unsigned __int64 v78; // x17
  unsigned __int64 v79; // x9
  unsigned __int64 v80; // x10
  void *v81; // x0
  char *v82; // x8
  char *v83; // x8
  char *v84; // x9
  void **v85; // x11
  void **v86; // x23
  char *v87; // x10
  __int64 v88; // x12
  void **v89; // x22
  char *v90; // x24
  void **v91; // x25
  unsigned __int64 v92; // x8
  unsigned __int8 *v93; // x22
  unsigned __int8 *v94; // x2
  unsigned __int8 *v95; // x8
  unsigned __int8 *v96; // x22
  __int64 v97; // x23
  char v98; // w25
  void **v99; // x26
  __int64 v100; // x0
  void **v101; // x24
  unsigned __int8 *v102; // x9
  void **v103; // x22
  signed __int64 v104; // x11
  __int64 v105; // x23
  __int64 v106; // x26
  void **v107; // x28
  unsigned __int64 v108; // x8
  unsigned __int64 v109; // x8
  unsigned __int64 v110; // x8
  unsigned __int64 v111; // x8
  size_t *v112; // x24
  unsigned __int64 v113; // x8
  bool v114; // zf
  size_t v115; // x8
  void *v116; // x1
  size_t v117; // x2
  void *v118; // x25
  char *v119; // x1
  size_t v120; // x2
  __int64 v121; // x24
  __int64 v122; // x22
  char *v123; // x23
  int v124; // w9
  void **v125; // x8
  char *v126; // x8
  char *v127; // x9
  void **v128; // x11
  void **v129; // x23
  char *v130; // x10
  __int64 v131; // x12
  void **v132; // x24
  size_t v133; // x23
  unsigned __int64 v134; // x28
  unsigned __int8 *v135; // x8
  unsigned __int64 v136; // x9
  unsigned __int64 v137; // x10
  _BYTE *v138; // x11
  _OWORD *v139; // x12
  __int128 *v140; // x13
  unsigned __int64 v141; // x14
  __int128 v142; // q0
  __int128 v143; // q1
  unsigned __int64 v144; // x8
  size_t v145; // x8
  _BYTE *v146; // x9
  char v147; // t1
  char v148; // w22
  void *v149; // x23
  char *v150; // x1
  size_t v151; // x2
  char *v152; // x21
  char *v153; // x22
  void *v154; // x0
  void *v155; // x24
  char *v156; // x8
  char *v157; // x9
  unsigned __int64 v158; // x11
  size_t v159; // x10
  unsigned __int64 v160; // x12
  __int128 *v161; // x13
  char *v162; // x14
  unsigned __int64 v163; // x15
  __int128 v164; // q0
  __int128 v165; // q1
  char v166; // t1
  size_t v167; // x8
  size_t v168; // [xsp+8h] [xbp-D8h]
  signed __int64 v169; // [xsp+10h] [xbp-D0h]
  unsigned __int8 *v170; // [xsp+18h] [xbp-C8h]
  unsigned __int64 v171; // [xsp+18h] [xbp-C8h]
  char *v172; // [xsp+20h] [xbp-C0h]
  unsigned __int64 v173; // [xsp+28h] [xbp-B8h]
  __int64 v174; // [xsp+37h] [xbp-A9h]
  __int128 v175; // [xsp+40h] [xbp-A0h] BYREF
  _BYTE v176[15]; // [xsp+58h] [xbp-88h]
  __int128 v177; // [xsp+70h] [xbp-70h] BYREF
  void *p; // [xsp+80h] [xbp-60h]
  __int64 v179; // [xsp+88h] [xbp-58h]

  v4 = a1;
  v6 = (unsigned __int8 *)(a1 - a2);
  v179 = *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 2)) + 40);
  if ( a1 == a2 )
    return (__int64)v4;
  v7 = *a1;
  if ( (unsigned int)(v7 - 49) < 9 )
    return sub_B190C(a1, a2, a3);
  v9 = 0x555555555555555LL;
  if ( (unsigned int)(v7 - 67) < 2 )
  {
    if ( a2 - a1 < 2 )
      return (__int64)v4;
    v10 = a3[1];
    if ( *a3 == v10 )
      return (__int64)v4;
    if ( v7 == 68 )
    {
      v26 = a1[1];
      if ( v26 > 0x35 || ((1LL << v26) & 0x27000000000000LL) == 0 )
        return (__int64)v4;
      sub_B1FF4(&v177, v10 - 48);
      sub_9CDD8((size_t *)&v177, 0LL, "~", 1uLL);
      v27 = *(_QWORD *)((char *)&v177 + 1);
      v28 = *((_QWORD *)&v177 + 1);
      v13 = p;
      v15 = v177;
      p = 0LL;
      v177 = 0uLL;
      v174 = v28;
      LOBYTE(v174) = HIBYTE(v27);
      memset(&v175, 0, 15);
      *(_QWORD *)&v176[7] = v174;
      *(_QWORD *)v176 = v27;
      v16 = (unsigned __int64)a3[1];
      v29 = (unsigned __int64)a3[2];
      if ( v16 >= v29 )
      {
        v41 = 0xAAAAAAAAAAAAAAABLL * ((__int64)(v16 - (_QWORD)*a3) >> 4);
        if ( v41 + 1 > 0x555555555555555LL )
          abort();
        v42 = 0xAAAAAAAAAAAAAAABLL * ((__int64)(v29 - (_QWORD)*a3) >> 4);
        if ( v42 >= 0x2AAAAAAAAAAAAAALL || ((v43 = 2 * v42, v43 >= v41 + 1) ? (v9 = v43) : (v9 = v41 + 1), v9) )
        {
          v44 = a3[3];
          v45 = (char *)*((_QWORD *)v44 + 512);
          if ( v44 + 4096 - v45 >= (unsigned __int64)(48 * v9) )
            *((_QWORD *)v44 + 512) = &v45[48 * v9];
          else
            v45 = (char *)malloc(48 * v9);
        }
        else
        {
          v45 = 0LL;
        }
        v126 = &v45[48 * v41];
        *v126 = v15;
        v127 = &v45[48 * v9];
        *((_QWORD *)v126 + 1) = *(_QWORD *)&v176[7];
        *((_QWORD *)v126 + 2) = v13;
        *(_QWORD *)(v126 + 1) = *(_QWORD *)v176;
        v126[24] = 0;
        *((_QWORD *)v126 + 4) = *(_QWORD *)((char *)&v175 + 7);
        *((_QWORD *)v126 + 5) = 0LL;
        *(_QWORD *)(v126 + 25) = 0LL;
        v129 = (void **)*a3;
        v128 = (void **)a3[1];
        v130 = v126 + 48;
        if ( v128 == (void **)*a3 )
        {
          v52 = (void **)*a3;
        }
        else
        {
          do
          {
            *((_QWORD *)v126 - 4) = *(v128 - 4);
            *((_OWORD *)v126 - 3) = *((_OWORD *)v128 - 3);
            v131 = (__int64)*(v128 - 1);
            *(v128 - 5) = 0LL;
            *(v128 - 4) = 0LL;
            *(v128 - 6) = 0LL;
            *((_QWORD *)v126 - 1) = v131;
            *(_OWORD *)(v126 - 24) = *(_OWORD *)(v128 - 3);
            *(v128 - 2) = 0LL;
            *(v128 - 1) = 0LL;
            *(v128 - 3) = 0LL;
            v128 -= 6;
            v126 -= 48;
          }
          while ( v129 != v128 );
          v52 = (void **)*a3;
          v129 = (void **)a3[1];
        }
        v53 = a3[2];
        *a3 = v126;
        a3[1] = v130;
        a3[2] = v127;
        if ( v129 != v52 )
        {
          do
          {
            if ( (*(_BYTE *)(v129 - 3) & 1) != 0 )
              free(*(v129 - 1));
            v132 = v129 - 6;
            if ( (*(_BYTE *)(v129 - 6) & 1) != 0 )
              free(*(v129 - 4));
            v129 -= 6;
          }
          while ( v52 != v132 );
        }
        if ( !v52 )
          goto LABEL_223;
        v55 = (unsigned __int64)a3[3];
        if ( v55 + 4096 < (unsigned __int64)v52 || v55 > (unsigned __int64)v52 )
          goto LABEL_222;
LABEL_219:
        if ( *(char **)(v55 + 4096) == v53 )
        {
          *(_QWORD *)(v55 + 4096) = v52;
          if ( (v177 & 1) == 0 )
            goto LABEL_225;
          goto LABEL_224;
        }
LABEL_223:
        if ( (v177 & 1) == 0 )
        {
LABEL_225:
          v4 += 2;
          *((_BYTE *)a3 + 108) = 1;
          return (__int64)v4;
        }
LABEL_224:
        free(p);
        goto LABEL_225;
      }
    }
    else
    {
      if ( v7 != 67 )
        return (__int64)v4;
      v11 = a1[1];
      if ( v11 > 0x35 || ((1LL << v11) & 0x2E000000000000LL) == 0 )
        return (__int64)v4;
      sub_B1FF4(&v177, v10 - 48);
      v12 = *((_QWORD *)&v177 + 1);
      v13 = p;
      v14 = *(_QWORD *)((char *)&v177 + 1);
      v15 = v177;
      v177 = 0uLL;
      p = 0LL;
      memset(&v175, 0, 15);
      *(_QWORD *)&v176[7] = v12;
      *(_QWORD *)v176 = v14;
      v16 = (unsigned __int64)a3[1];
      v17 = (unsigned __int64)a3[2];
      if ( v16 >= v17 )
      {
        v18 = 0xAAAAAAAAAAAAAAABLL * ((__int64)(v16 - (_QWORD)*a3) >> 4);
        if ( v18 + 1 > 0x555555555555555LL )
          abort();
        v19 = 0xAAAAAAAAAAAAAAABLL * ((__int64)(v17 - (_QWORD)*a3) >> 4);
        if ( v19 >= 0x2AAAAAAAAAAAAAALL || ((v20 = 2 * v19, v20 >= v18 + 1) ? (v9 = v20) : (v9 = v18 + 1), v9) )
        {
          v21 = a3[3];
          v22 = (char *)*((_QWORD *)v21 + 512);
          if ( v21 + 4096 - v22 >= (unsigned __int64)(48 * v9) )
            *((_QWORD *)v21 + 512) = &v22[48 * v9];
          else
            v22 = (char *)malloc(48 * v9);
        }
        else
        {
          v22 = 0LL;
        }
        v46 = &v22[48 * v18];
        *v46 = v15;
        v47 = &v22[48 * v9];
        *((_QWORD *)v46 + 1) = *(_QWORD *)&v176[7];
        *((_QWORD *)v46 + 2) = v13;
        *(_QWORD *)(v46 + 1) = *(_QWORD *)v176;
        v46[24] = 0;
        *((_QWORD *)v46 + 4) = *(_QWORD *)((char *)&v175 + 7);
        *((_QWORD *)v46 + 5) = 0LL;
        *(_QWORD *)(v46 + 25) = 0LL;
        v49 = (void **)*a3;
        v48 = (void **)a3[1];
        v50 = v46 + 48;
        if ( v48 == (void **)*a3 )
        {
          v52 = (void **)*a3;
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
          v52 = (void **)*a3;
          v49 = (void **)a3[1];
        }
        v53 = a3[2];
        *a3 = v46;
        a3[1] = v50;
        a3[2] = v47;
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
        if ( !v52 )
          goto LABEL_223;
        v55 = (unsigned __int64)a3[3];
        if ( v55 + 4096 < (unsigned __int64)v52 || v55 > (unsigned __int64)v52 )
        {
LABEL_222:
          free(v52);
          goto LABEL_223;
        }
        goto LABEL_219;
      }
    }
    *(_BYTE *)v16 = v15;
    *(_QWORD *)(v16 + 8) = *(_QWORD *)&v176[7];
    *(_QWORD *)(v16 + 16) = v13;
    *(_QWORD *)(v16 + 1) = *(_QWORD *)v176;
    *(_BYTE *)(v16 + 24) = 0;
    *(_QWORD *)(v16 + 32) = *(_QWORD *)((char *)&v175 + 7);
    *(_QWORD *)(v16 + 40) = 0LL;
    *(_QWORD *)(v16 + 25) = v175;
    a3[1] += 48;
    if ( (v177 & 1) == 0 )
      goto LABEL_225;
    goto LABEL_224;
  }
  if ( v7 != 85 )
    return sub_AC0B0(a1, a2, a3);
  if ( a2 - a1 < 3 )
    return (__int64)v4;
  v23 = a1[1];
  if ( v23 == 108 )
  {
    v31 = (void **)*a3;
    v30 = (unsigned __int64)a3[1];
    *((_QWORD *)&v175 + 1) = 10240LL;
    BYTE8(v175) = aLambda[7];
    *(_QWORD *)&v177 = *(_QWORD *)"'lambda'(";
    *(_QWORD *)((char *)&v177 + 7) = *((_QWORD *)&v175 + 1);
    v32 = (unsigned __int64)a3[2];
    v33 = 0xAAAAAAAAAAAAAAABLL * ((__int64)(v30 - (_QWORD)v31) >> 4);
    if ( v32 <= v30 )
    {
      if ( v33 + 1 > 0x555555555555555LL )
        abort();
      v37 = 0xAAAAAAAAAAAAAAABLL * ((__int64)(v32 - (_QWORD)v31) >> 4);
      if ( v37 >= 0x2AAAAAAAAAAAAAALL || ((v38 = 2 * v37, v38 >= v33 + 1) ? (v9 = v38) : (v9 = v33 + 1), v9) )
      {
        v39 = a3[3];
        v40 = (char *)*((_QWORD *)v39 + 512);
        if ( v39 + 4096 - v40 >= (unsigned __int64)(48 * v9) )
          *((_QWORD *)v39 + 512) = &v40[48 * v9];
        else
          v40 = (char *)malloc(48 * v9);
      }
      else
      {
        v40 = 0LL;
      }
      v83 = &v40[48 * v33];
      *v83 = 18;
      v84 = &v40[48 * v9];
      *((_QWORD *)v83 + 1) = *(_QWORD *)((char *)&v177 + 7);
      *((_QWORD *)v83 + 2) = 0LL;
      *(_QWORD *)(v83 + 1) = v177;
      *(_QWORD *)((char *)&v177 + 7) = 0LL;
      *(_QWORD *)&v177 = 0LL;
      v83[24] = 0;
      *((_QWORD *)v83 + 4) = 0LL;
      *((_QWORD *)v83 + 5) = 0LL;
      *(_QWORD *)(v83 + 25) = 0LL;
      v86 = (void **)*a3;
      v85 = (void **)a3[1];
      v87 = v83 + 48;
      if ( v85 == (void **)*a3 )
      {
        v89 = (void **)*a3;
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
        v89 = (void **)*a3;
        v86 = (void **)a3[1];
      }
      v90 = a3[2];
      *a3 = v83;
      a3[1] = v87;
      a3[2] = v84;
      if ( v86 != v89 )
      {
        do
        {
          if ( (*(_BYTE *)(v86 - 3) & 1) != 0 )
            free(*(v86 - 1));
          v91 = v86 - 6;
          if ( (*(_BYTE *)(v86 - 6) & 1) != 0 )
            free(*(v86 - 4));
          v86 -= 6;
        }
        while ( v89 != v91 );
      }
      if ( v89 )
      {
        v92 = (unsigned __int64)a3[3];
        if ( v92 + 4096 < (unsigned __int64)v89 || v92 > (unsigned __int64)v89 )
        {
          free(v89);
        }
        else if ( *(char **)(v92 + 4096) == v90 )
        {
          *(_QWORD *)(v92 + 4096) = v89;
        }
      }
    }
    else
    {
      *(_BYTE *)v30 = 18;
      *(_QWORD *)(v30 + 8) = *(_QWORD *)((char *)&v177 + 7);
      *(_QWORD *)(v30 + 16) = 0LL;
      *(_QWORD *)(v30 + 1) = v177;
      *(_QWORD *)((char *)&v177 + 7) = 0LL;
      *(_QWORD *)&v177 = 0LL;
      *(_BYTE *)(v30 + 24) = 0;
      *(_QWORD *)(v30 + 32) = 0LL;
      *(_QWORD *)(v30 + 40) = 0LL;
      *(_QWORD *)(v30 + 25) = 0LL;
      a3[1] += 48;
    }
    v93 = v4 + 2;
    if ( v4[2] == 118 )
    {
      sub_B23DC(a3[1] - 48, 41LL);
      v93 = v4 + 3;
      if ( v4 + 3 == a2 )
        goto LABEL_265;
    }
    else
    {
      v97 = (__int64)a3[1];
      v98 = 1;
      v173 = v33;
      while ( 1 )
      {
        v99 = (void **)*a3;
        v100 = sub_925FC(v93, a2, a3);
        v101 = (void **)a3[1];
        if ( (unsigned __int8 *)v100 == v93 )
        {
          v123 = a3[1];
          v124 = 6;
          goto LABEL_198;
        }
        v102 = v93;
        v103 = (void **)*a3;
        v104 = 0xAAAAAAAAAAAAAAABLL * ((v97 - (__int64)v99) >> 4);
        if ( v104 >= (__int64)(0xAAAAAAAAAAAAAAABLL * (((char *)v101 - *a3) >> 4)) )
          break;
        v105 = 16 * ((v97 - (__int64)v99) >> 4);
        v106 = 16 * (((char *)v101 - *a3) >> 4);
        v169 = v104;
        v170 = (unsigned __int8 *)v100;
        do
        {
          v107 = &v103[(unsigned __int64)v105 / 8];
          v108 = LOBYTE(v103[(unsigned __int64)v105 / 8]);
          if ( (v108 & 1) != 0 )
            v109 = (unsigned __int64)v103[(unsigned __int64)v105 / 8 + 1];
          else
            v109 = v108 >> 1;
          if ( v109
            || ((v110 = *((unsigned __int8 *)v107 + 24), (v110 & 1) != 0)
              ? (v111 = (unsigned __int64)v107[4])
              : (v111 = v110 >> 1),
                v111) )
          {
            v112 = (size_t *)&(*a3)[48 * v173];
            if ( !v98 )
              sub_9CFD0((size_t *)&(*a3)[48 * v173], &asc_69D1AEC, 2uLL);
            v113 = LOBYTE(v103[(unsigned __int64)v105 / 8 + 3]);
            v114 = (v113 & 1) == 0;
            v115 = v113 >> 1;
            if ( v114 )
              v116 = (char *)&v103[(unsigned __int64)v105 / 8 + 3] + 1;
            else
              v116 = v103[(unsigned __int64)v105 / 8 + 5];
            if ( v114 )
              v117 = v115;
            else
              v117 = (size_t)v103[(unsigned __int64)v105 / 8 + 4];
            sub_9CFD0((size_t *)&v103[(unsigned __int64)v105 / 8], v116, v117);
            p = v107[2];
            v177 = *(_OWORD *)v107;
            v107[1] = 0LL;
            v107[2] = 0LL;
            *v107 = 0LL;
            v118 = p;
            if ( (v177 & 1) != 0 )
              v119 = (char *)p;
            else
              v119 = (char *)&v177 + 1;
            if ( (v177 & 1) != 0 )
              v120 = *((_QWORD *)&v177 + 1);
            else
              v120 = (unsigned __int64)(unsigned __int8)v177 >> 1;
            sub_9CFD0(v112, v119, v120);
            if ( (v177 & 1) != 0 )
              free(v118);
            v98 = 0;
          }
          v106 -= 48LL;
          v103 += 6;
        }
        while ( v105 != v106 );
        v97 = (__int64)a3[1];
        v121 = (__int64)&(*a3)[48 * v169];
        if ( v121 == v97 )
        {
          v33 = v173;
        }
        else
        {
          v33 = v173;
          do
          {
            if ( (*(_BYTE *)(v97 - 24) & 1) != 0 )
              free(*(void **)(v97 - 8));
            v122 = v97 - 48;
            if ( (*(_BYTE *)(v97 - 48) & 1) != 0 )
              free(*(void **)(v97 - 32));
            v97 -= 48LL;
          }
          while ( v121 != v122 );
          v97 = v121;
          a3[1] = (char *)v121;
        }
        v93 = v170;
      }
      v123 = a3[1];
      v93 = v102;
      v124 = 1;
LABEL_198:
      if ( v124 != 6 )
        return (__int64)v4;
      v125 = (void **)*a3;
      if ( v98 )
      {
        if ( v125 == v101 )
          return (__int64)v4;
        v71 = (char *)(v101 - 6);
        if ( (*(_BYTE *)(v101 - 3) & 1) != 0 )
          free(*(v101 - 1));
        if ( (*v71 & 1) == 0 )
          goto LABEL_109;
        v72 = *(v101 - 4);
        goto LABEL_108;
      }
      if ( v125 == v101 || 0xAAAAAAAAAAAAAAABLL * ((v123 - (char *)v125) >> 4) - 1 != v33 )
        return (__int64)v4;
      sub_9CFD0((size_t *)v101 - 6, ")", 1uLL);
      if ( v93 == a2 )
        goto LABEL_265;
    }
    if ( *v93 == 69 )
    {
      v94 = v93 + 1;
      if ( v93 + 1 != a2 )
      {
        if ( (unsigned int)*v94 - 48 > 9 )
        {
          v96 = v93 + 1;
          if ( v94 == a2 )
            goto LABEL_265;
        }
        else
        {
          v95 = v93 + 2;
          v114 = v93 + 2 == a2;
          v96 = a2;
          if ( !v114 )
          {
            v96 = v95;
            while ( (unsigned int)*v96 - 48 <= 9 )
            {
              if ( a2 == ++v96 )
              {
                v96 = a2;
                break;
              }
            }
          }
          sub_B2508();
          if ( v96 == a2 )
            goto LABEL_265;
        }
        if ( *v96 == 95 )
          return (__int64)(v96 + 1);
      }
    }
LABEL_265:
    v152 = a3[1];
    if ( *a3 != v152 )
    {
      v153 = v152 - 48;
      if ( (*(v152 - 24) & 1) != 0 )
        free(*((void **)v152 - 1));
      if ( (*v153 & 1) != 0 )
        free(*((void **)v152 - 4));
      a3[1] = v153;
    }
    return (__int64)v4;
  }
  if ( v23 == 116 )
  {
    *(_QWORD *)((char *)&v177 + 7) = 100LL;
    *(_QWORD *)&v177 = 0x64656D616E6E7527LL;
    v24 = (unsigned __int64)a3[1];
    v25 = (unsigned __int64)a3[2];
    if ( v24 >= v25 )
    {
      v34 = 0xAAAAAAAAAAAAAAABLL * ((__int64)(v24 - (_QWORD)*a3) >> 4);
      if ( v34 + 1 > 0x555555555555555LL )
        abort();
      if ( 0xAAAAAAAAAAAAAAABLL * ((__int64)(v25 - (_QWORD)*a3) >> 4) >= 0x2AAAAAAAAAAAAAALL
        || (0x5555555555555556LL * ((__int64)(v25 - (_QWORD)*a3) >> 4) >= v34 + 1
          ? (v9 = 0x5555555555555556LL * ((__int64)(v25 - (_QWORD)*a3) >> 4))
          : (v9 = v34 + 1),
            v9) )
      {
        v35 = a3[3];
        v36 = (char *)*((_QWORD *)v35 + 512);
        if ( v35 + 4096 - v36 >= (unsigned __int64)(48 * v9) )
          *((_QWORD *)v35 + 512) = &v36[48 * v9];
        else
          v36 = (char *)malloc(48 * v9);
      }
      else
      {
        v36 = 0LL;
      }
      v56 = &v36[48 * v34];
      *v56 = 16;
      v57 = &v36[48 * v9];
      *((_QWORD *)v56 + 1) = *(_QWORD *)((char *)&v177 + 7);
      *((_QWORD *)v56 + 2) = 0LL;
      *(_QWORD *)(v56 + 1) = v177;
      *(_QWORD *)((char *)&v177 + 7) = 0LL;
      *(_QWORD *)&v177 = 0LL;
      v56[24] = 0;
      *((_QWORD *)v56 + 4) = 0LL;
      *((_QWORD *)v56 + 5) = 0LL;
      *(_QWORD *)(v56 + 25) = 0LL;
      v59 = (void **)*a3;
      v58 = (void **)a3[1];
      v60 = v56 + 48;
      if ( v58 == (void **)*a3 )
      {
        v62 = (void **)*a3;
      }
      else
      {
        do
        {
          *((_QWORD *)v56 - 4) = *(v58 - 4);
          *((_OWORD *)v56 - 3) = *((_OWORD *)v58 - 3);
          v61 = (__int64)*(v58 - 1);
          *(v58 - 5) = 0LL;
          *(v58 - 4) = 0LL;
          *(v58 - 6) = 0LL;
          *((_QWORD *)v56 - 1) = v61;
          *(_OWORD *)(v56 - 24) = *(_OWORD *)(v58 - 3);
          *(v58 - 2) = 0LL;
          *(v58 - 1) = 0LL;
          *(v58 - 3) = 0LL;
          v58 -= 6;
          v56 -= 48;
        }
        while ( v59 != v58 );
        v62 = (void **)*a3;
        v59 = (void **)a3[1];
      }
      v63 = a3[2];
      *a3 = v56;
      a3[1] = v60;
      a3[2] = v57;
      if ( v59 != v62 )
      {
        do
        {
          if ( (*(_BYTE *)(v59 - 3) & 1) != 0 )
            free(*(v59 - 1));
          v64 = v59 - 6;
          if ( (*(_BYTE *)(v59 - 6) & 1) != 0 )
            free(*(v59 - 4));
          v59 -= 6;
        }
        while ( v62 != v64 );
      }
      if ( v62 )
      {
        v65 = (unsigned __int64)a3[3];
        if ( v65 + 4096 < (unsigned __int64)v62 || v65 > (unsigned __int64)v62 )
        {
          free(v62);
        }
        else if ( *(char **)(v65 + 4096) == v63 )
        {
          *(_QWORD *)(v65 + 4096) = v62;
        }
      }
    }
    else
    {
      *(_BYTE *)v24 = 16;
      *(_QWORD *)(v24 + 8) = *(_QWORD *)((char *)&v177 + 7);
      *(_QWORD *)(v24 + 16) = 0LL;
      *(_QWORD *)(v24 + 1) = v177;
      *(_QWORD *)((char *)&v177 + 7) = 0LL;
      *(_QWORD *)&v177 = 0LL;
      *(_BYTE *)(v24 + 24) = 0;
      *(_QWORD *)(v24 + 32) = 0LL;
      *(_QWORD *)(v24 + 40) = 0LL;
      *(_QWORD *)(v24 + 25) = 0LL;
      a3[1] += 48;
    }
    v66 = (char *)(v4 + 2);
    if ( v4 + 2 == a2 )
    {
LABEL_104:
      v70 = a3[1];
      v71 = v70 - 48;
      if ( (*(v70 - 24) & 1) != 0 )
        free(*((void **)v70 - 1));
      if ( (*v71 & 1) == 0 )
        goto LABEL_109;
      v72 = (void *)*((_QWORD *)v70 - 4);
LABEL_108:
      free(v72);
LABEL_109:
      a3[1] = v71;
      return (__int64)v4;
    }
    v67 = (unsigned __int8)*v66;
    if ( (unsigned int)(v67 - 48) > 9 )
    {
      v69 = v4 + 2;
      goto LABEL_101;
    }
    v68 = 3LL;
    if ( v4 + 3 == a2 )
    {
LABEL_99:
      v69 = a2;
    }
    else
    {
      while ( (unsigned int)v4[v68] - 48 <= 9 )
      {
        if ( !&v6[++v68] )
          goto LABEL_99;
      }
      v69 = &v4[v68];
    }
    v73 = a3[1];
    v75 = (size_t *)(v73 - 48);
    v74 = (unsigned __int8)*(v73 - 48);
    if ( (*(v73 - 48) & 1) != 0 )
    {
      v74 = *((_QWORD *)v73 - 6);
      v76 = *((_QWORD *)v73 - 5);
      v77 = (v74 & 0xFFFFFFFFFFFFFFFELL) - 1;
      v78 = v69 - (unsigned __int8 *)v66;
      if ( v69 == (unsigned __int8 *)v66 )
        goto LABEL_101;
    }
    else
    {
      v76 = v74 >> 1;
      v77 = 22LL;
      v78 = v69 - (unsigned __int8 *)v66;
      if ( v69 == (unsigned __int8 *)v66 )
        goto LABEL_101;
    }
    if ( (v74 & 1) != 0 )
    {
      v80 = *((_QWORD *)v73 - 5);
      v79 = *((_QWORD *)v73 - 4);
      if ( v79 > (unsigned __int64)v66 )
        goto LABEL_124;
    }
    else
    {
      v79 = (unsigned __int64)(v73 - 47);
      v80 = (unsigned __int64)((unsigned __int8)v74 & 0xFE) >> 1;
      if ( v73 - 47 > v66 )
        goto LABEL_124;
    }
    if ( v79 + v80 > (unsigned __int64)v66 )
    {
      p = 0LL;
      v177 = 0uLL;
      if ( v78 >= 0xFFFFFFFFFFFFFFF0LL )
        goto LABEL_297;
      if ( v78 > 0x16 )
      {
        v133 = (v78 + 16) & 0xFFFFFFFFFFFFFFF0LL;
        v134 = v78;
        v81 = malloc(v133);
        v78 = v134;
        v75 = (size_t *)(v73 - 48);
        *((_QWORD *)&v177 + 1) = v134;
        p = v81;
        *(_QWORD *)&v177 = v133 | 1;
        if ( v68 == 2 )
          goto LABEL_254;
      }
      else
      {
        LOBYTE(v177) = 2 * v78;
        v81 = (char *)&v177 + 1;
        if ( v68 == 2 )
        {
LABEL_254:
          *(_BYTE *)v81 = 0;
          v148 = v177;
          v149 = p;
          if ( (v177 & 1) != 0 )
            v150 = (char *)p;
          else
            v150 = (char *)&v177 + 1;
          if ( (v177 & 1) != 0 )
            v151 = *((_QWORD *)&v177 + 1);
          else
            v151 = (unsigned __int64)(unsigned __int8)v177 >> 1;
          sub_9CFD0(v75, v150, v151);
          if ( (v148 & 1) != 0 )
            free(v149);
LABEL_101:
          sub_B23DC(a3[1] - 48, 39LL);
          if ( v69 != a2 && *v69 == 95 )
            return (__int64)(v69 + 1);
          goto LABEL_104;
        }
      }
      v135 = v4 + 3;
      *(_BYTE *)v81 = v67;
      if ( v4 + 3 != v69 )
      {
        v136 = (unsigned __int64)&v69[-3LL - (_QWORD)v4];
        if ( v136 >= 0x20 && (v137 = v136 & 0xFFFFFFFFFFFFFFE0LL, (v136 & 0xFFFFFFFFFFFFFFE0LL) != 0) )
        {
          if ( (char *)v81 + 1 >= (char *)v69 || (v138 = v81, v4 + 3 >= &v69[-2LL - (_QWORD)v4 + (_QWORD)v81]) )
          {
            v135 += v137;
            v138 = (char *)v81 + v137;
            v139 = (char *)v81 + 17;
            v140 = (__int128 *)(v4 + 19);
            v141 = v136 & 0xFFFFFFFFFFFFFFE0LL;
            do
            {
              v142 = *(v140 - 1);
              v143 = *v140;
              v141 -= 32LL;
              v140 += 2;
              *(v139 - 1) = v142;
              *v139 = v143;
              v139 += 2;
            }
            while ( v141 );
            if ( v137 == v136 )
              goto LABEL_253;
          }
        }
        else
        {
          v138 = v81;
        }
        v146 = v138 + 1;
        do
        {
          v147 = *v135++;
          *v146++ = v147;
        }
        while ( v69 != v135 );
      }
LABEL_253:
      v81 = (char *)v81 + v78;
      goto LABEL_254;
    }
LABEL_124:
    if ( v77 - v76 >= v78 )
    {
LABEL_277:
      if ( (v74 & 1) != 0 )
        v156 = (char *)*((_QWORD *)v73 - 4);
      else
        v156 = (char *)v75 + 1;
      v157 = &v156[v76];
      if ( v68 != 2 )
      {
        v158 = (unsigned __int64)&v69[-2LL - (_QWORD)v4];
        v159 = v76 - (_QWORD)v66;
        if ( v158 < 0x20 )
          goto LABEL_300;
        v160 = v158 & 0xFFFFFFFFFFFFFFE0LL;
        if ( (v158 & 0xFFFFFFFFFFFFFFE0LL) == 0
          || v157 < (char *)v69 && (unsigned __int8 *)v66 < &v69[v76 - 2 - (_QWORD)v4 + (_QWORD)v156] )
        {
          goto LABEL_300;
        }
        v157 += v160;
        v66 += v160;
        v161 = (__int128 *)(v4 + 18);
        v162 = &v156[v76 + 16];
        v163 = v158 & 0xFFFFFFFFFFFFFFE0LL;
        do
        {
          v164 = *(v161 - 1);
          v165 = *v161;
          v161 += 2;
          v163 -= 32LL;
          *((_OWORD *)v162 - 1) = v164;
          *(_OWORD *)v162 = v165;
          v162 += 32;
        }
        while ( v163 );
        if ( v160 != v158 )
        {
LABEL_300:
          do
          {
            v166 = *v66++;
            *v157++ = v166;
          }
          while ( v69 != (unsigned __int8 *)v66 );
        }
        v157 = (char *)&v69[v159 + (_QWORD)v156];
      }
      *v157 = 0;
      v167 = v76 + v78;
      if ( (*(_BYTE *)v75 & 1) != 0 )
        *((_QWORD *)v73 - 5) = v167;
      else
        *(_BYTE *)v75 = 2 * v167;
      goto LABEL_101;
    }
    if ( -17LL - v77 >= v76 + v78 - v77 )
    {
      if ( (v74 & 1) != 0 )
        v82 = (char *)*((_QWORD *)v73 - 4);
      else
        v82 = v73 - 47;
      v172 = v82;
      v171 = v78;
      if ( v77 > 0x7FFFFFFFFFFFFFE6LL )
      {
        v145 = -17LL;
      }
      else
      {
        v144 = 2 * v77;
        if ( v76 + v78 >= 2 * v77 )
          v144 = v76 + v78;
        if ( v144 >= 0x17 )
          v145 = (v144 + 16) & 0xFFFFFFFFFFFFFFF0LL;
        else
          v145 = 23LL;
      }
      v168 = v145;
      v154 = malloc(v145);
      v155 = v154;
      if ( v76 )
        memcpy(v154, v172, v76);
      if ( v77 != 22 )
        free(v172);
      *((_QWORD *)v73 - 4) = v155;
      LOBYTE(v74) = v168 | 1;
      *((_QWORD *)v73 - 6) = v168 | 1;
      v75 = (size_t *)(v73 - 48);
      v78 = v171;
      goto LABEL_277;
    }
LABEL_297:
    abort();
  }
  return (__int64)v4;
}
