_BYTE *__fastcall sub_9D3DC(_BYTE *a1, _BYTE *a2, __int64 a3)
{
  __int64 v3; // x27
  __int64 v4; // x19
  void **v5; // x20
  void **i; // x21
  _BYTE *v7; // x24
  unsigned __int64 v8; // x10
  char *v9; // x9
  unsigned __int64 v10; // x8
  unsigned __int64 v11; // x12
  char *v12; // x8
  unsigned __int64 v13; // x9
  _BYTE *v14; // x19
  _QWORD *v16; // x8
  unsigned __int64 v17; // x9
  __int64 v18; // x19
  __int64 v19; // x10
  __int64 v20; // x20
  __int64 v21; // x9
  unsigned __int64 v22; // x9
  __int64 v23; // x21
  size_t v24; // x8
  char *v25; // x0
  char *v26; // x8
  char *v27; // x10
  _QWORD *v28; // x11
  _QWORD *v29; // x9
  _QWORD *v30; // x12
  __int128 v31; // t1
  __int64 v32; // x12
  char *v33; // x8
  void **v34; // x19
  __int64 v35; // x20
  void **v36; // x21
  __int64 v37; // x22
  __int64 v38; // x26
  void **v39; // x23
  void **v40; // x27
  void **v41; // x25
  void *v42; // x0
  unsigned __int64 v43; // x8
  int v44; // w23
  unsigned __int64 v45; // x26
  __int64 v46; // x19
  __int64 v47; // x20
  _QWORD *v48; // x8
  unsigned __int64 v49; // x9
  __int64 v50; // x10
  __int64 v51; // x21
  __int64 v52; // x9
  unsigned __int64 v53; // x9
  __int64 v54; // x22
  char *v55; // x0
  __int64 v56; // x9
  char *v57; // x8
  void **v58; // x11
  void **v59; // x24
  _QWORD *v60; // x10
  __int128 v61; // t1
  void **v62; // x25
  __int64 v63; // x20
  unsigned __int64 v64; // x8
  unsigned __int64 v65; // x19
  char *v66; // x24
  size_t *v67; // x27
  char *v68; // x11
  void **v69; // x8
  size_t v70; // x25
  const void *v71; // x1
  void *v72; // x20
  const void *v73; // x20
  void *v74; // x0
  char *v75; // x8
  char *v76; // x25
  char *v77; // x25
  void **v78; // x8
  void **v79; // x8
  char v80; // t1
  void **v81; // x8
  size_t v82; // x26
  const void *v83; // x23
  void *v84; // x25
  void *v85; // x0
  char *v86; // x8
  void **v87; // x9
  void **v88; // x20
  _QWORD *v89; // x8
  size_t v90; // x10
  void **v91; // x24
  __int64 v92; // x22
  void **v93; // x23
  unsigned __int64 v94; // x8
  void **v95; // x23
  __int64 v96; // x21
  __int64 v97; // x25
  size_t *v98; // x9
  size_t *v99; // x20
  __int64 v100; // x10
  unsigned __int64 v101; // x22
  unsigned __int64 v102; // x9
  __int64 v103; // x20
  unsigned __int64 v104; // x9
  __int64 v105; // x8
  size_t v106; // x0
  void **v107; // x8
  size_t v108; // x24
  const void *v109; // x25
  void *v110; // x26
  _BYTE *v111; // x24
  void **v112; // x8
  void **v113; // x8
  char v114; // t1
  void **v115; // x8
  size_t v116; // x25
  const void *v117; // x26
  void *v118; // x24
  __int64 v119; // x19
  unsigned __int64 v120; // x20
  unsigned __int64 v121; // x8
  __int64 v122; // x0
  unsigned __int64 v123; // x8
  bool v124; // zf
  size_t v125; // x8
  void *v126; // x1
  size_t v127; // x2
  size_t *v128; // x0
  char *v129; // x24
  char v130; // w21
  char *v131; // x1
  size_t v132; // x2
  __int64 v133; // x19
  _BYTE *v134; // x20
  __int64 v135; // x8
  void *v136; // x22
  __int64 v137; // x9
  char v138; // w20
  __int64 v139; // x8
  unsigned __int64 v140; // x8
  unsigned __int64 v141; // x9
  unsigned __int64 v142; // x19
  unsigned __int64 v143; // x8
  unsigned __int64 v144; // x9
  unsigned __int64 v145; // x9
  __int64 v146; // x9
  char *v147; // x0
  char *v148; // x8
  void **v149; // x11
  void **v150; // x19
  char *v151; // x10
  __int64 v152; // x12
  void **v153; // x22
  __int64 v154; // x20
  void **v155; // x21
  unsigned __int64 v156; // x8
  size_t size; // [xsp+10h] [xbp-110h]
  __int64 v158; // [xsp+20h] [xbp-100h]
  _BYTE *v159; // [xsp+28h] [xbp-F8h]
  unsigned __int64 v161; // [xsp+40h] [xbp-E0h]
  char *v162; // [xsp+48h] [xbp-D8h]
  __int64 v163; // [xsp+50h] [xbp-D0h]
  unsigned __int64 j; // [xsp+58h] [xbp-C8h]
  _BYTE *v165; // [xsp+60h] [xbp-C0h]
  __int128 v166; // [xsp+68h] [xbp-B8h] BYREF
  void *p; // [xsp+78h] [xbp-A8h]
  _BYTE v168[15]; // [xsp+80h] [xbp-A0h] BYREF
  _QWORD v169[2]; // [xsp+90h] [xbp-90h] BYREF
  __int128 v170; // [xsp+A0h] [xbp-80h] BYREF
  _QWORD *v171; // [xsp+B0h] [xbp-70h]
  char *v172; // [xsp+B8h] [xbp-68h]
  size_t v173; // [xsp+C0h] [xbp-60h]
  __int64 v174; // [xsp+C8h] [xbp-58h]

  v3 = a3;
  v165 = a1;
  v174 = *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 2)) + 40);
  if ( a2 - a1 < 2 || *a1 != 73 )
    return a1;
  if ( *(_BYTE *)(a3 + 109) )
  {
    v4 = *(_QWORD *)(a3 + 72);
    v5 = *(void ***)(v4 - 32);
    for ( i = *(void ***)(v4 - 24); v5 != i; sub_9D32C(i) )
      i -= 4;
    *(_QWORD *)(v4 - 24) = v5;
  }
  p = 0LL;
  v166 = 0x3C02uLL;
  v7 = v165 + 1;
  v158 = 0x555555555555555LL;
  if ( v165[1] != 69 )
  {
    size = v3 + 88;
    v163 = v3;
    while ( 1 )
    {
      if ( !*(_BYTE *)(v3 + 109) )
        goto LABEL_37;
      v16 = *(_QWORD **)(v3 + 72);
      v17 = *(_QWORD *)(v3 + 80);
      v18 = *(_QWORD *)(v3 + 24);
      if ( (unsigned __int64)v16 < v17 )
      {
        *v16 = 0LL;
        v16[1] = 0LL;
        v16[2] = 0LL;
        v16[3] = v18;
        *(_QWORD *)(v3 + 72) += 32LL;
        goto LABEL_37;
      }
      v19 = *(_QWORD *)(v3 + 64);
      v20 = ((__int64)v16 - v19) >> 5;
      if ( (unsigned __int64)(v20 + 1) >> 59 )
        abort();
      v21 = v17 - v19;
      if ( (unsigned __int64)(v21 >> 5) >= 0x3FFFFFFFFFFFFFFLL )
        break;
      v22 = v21 >> 4;
      if ( v22 >= v20 + 1 )
        v23 = v22;
      else
        v23 = v20 + 1;
      v24 = size;
      v172 = 0LL;
      v173 = size;
      if ( v23 )
        goto LABEL_29;
      v25 = 0LL;
LABEL_32:
      v26 = &v25[32 * v20];
      v27 = &v25[32 * v23];
      v28 = v26 + 32;
      *(_QWORD *)&v170 = v25;
      *((_QWORD *)&v170 + 1) = v26;
      *(_QWORD *)v26 = 0LL;
      *((_QWORD *)v26 + 1) = 0LL;
      *((_QWORD *)v26 + 2) = 0LL;
      *((_QWORD *)v26 + 3) = v18;
      v171 = v26 + 32;
      v172 = v27;
      v29 = *(_QWORD **)(v3 + 64);
      v30 = *(_QWORD **)(v3 + 72);
      if ( v30 == v29 )
      {
        v32 = *(_QWORD *)(v3 + 64);
      }
      else
      {
        do
        {
          *((_QWORD *)v26 - 3) = 0LL;
          *((_QWORD *)v26 - 2) = 0LL;
          *((_QWORD *)v26 - 4) = 0LL;
          *((_QWORD *)v26 - 1) = *(v30 - 1);
          v31 = *((_OWORD *)v30 - 2);
          v30 -= 4;
          *((_OWORD *)v26 - 2) = v31;
          *((_QWORD *)v26 - 2) = v30[2];
          v30[1] = 0LL;
          v30[2] = 0LL;
          *v30 = 0LL;
          v26 = (char *)(*((_QWORD *)&v170 + 1) - 32LL);
          *((_QWORD *)&v170 + 1) -= 32LL;
        }
        while ( v29 != v30 );
        v32 = *(_QWORD *)(v3 + 64);
        v29 = *(_QWORD **)(v3 + 72);
        v28 = v171;
        v27 = v172;
      }
      *(_QWORD *)(v3 + 64) = v26;
      *(_QWORD *)(v3 + 72) = v28;
      *((_QWORD *)&v170 + 1) = v32;
      v171 = v29;
      v33 = *(char **)(v3 + 80);
      *(_QWORD *)(v3 + 80) = v27;
      *(_QWORD *)&v170 = v32;
      v172 = v33;
      sub_B2A24(&v170);
LABEL_37:
      v34 = *(void ***)v3;
      v35 = *(_QWORD *)(v3 + 8);
      v159 = (_BYTE *)sub_B28F0(v7, a2, v3);
      v36 = *(void ***)v3;
      v37 = *(_QWORD *)(v3 + 8);
      if ( *(_BYTE *)(v3 + 109) )
      {
        v38 = *(_QWORD *)(v3 + 72);
        v39 = (void **)(v38 - 32);
        v40 = *(void ***)(v38 - 32);
        if ( v40 )
        {
          v41 = *(void ***)(v38 - 24);
          v42 = *(void **)(v38 - 32);
          if ( v41 != v40 )
          {
            do
            {
              v41 -= 4;
              sub_9D32C(v41);
            }
            while ( v40 != v41 );
            v42 = *v39;
          }
          v43 = *(_QWORD *)(v38 - 8);
          *(_QWORD *)(v38 - 24) = v40;
          if ( v43 + 4096 < (unsigned __int64)v42 || v43 > (unsigned __int64)v42 )
          {
            free(v42);
          }
          else if ( *(_QWORD *)(v43 + 4096) == *(_QWORD *)(v38 - 16) )
          {
            *(_QWORD *)(v43 + 4096) = v42;
          }
        }
        v3 = v163;
        *(_QWORD *)(v163 + 72) = v39;
      }
      v44 = 1;
      if ( v159 == v7 || v159 == a2 )
      {
        v14 = v165;
        goto LABEL_205;
      }
      v45 = 0xAAAAAAAAAAAAAAABLL * ((v37 - (__int64)v36) >> 4);
      v161 = 0xAAAAAAAAAAAAAAABLL * ((v35 - (__int64)v34) >> 4);
      if ( !*(_BYTE *)(v3 + 109) )
        goto LABEL_143;
      v46 = *(_QWORD *)(v3 + 72);
      v47 = *(_QWORD *)(v3 + 24);
      v48 = *(_QWORD **)(v46 - 24);
      v49 = *(_QWORD *)(v46 - 16);
      if ( (unsigned __int64)v48 < v49 )
      {
        *v48 = 0LL;
        v48[1] = 0LL;
        v48[2] = 0LL;
        v48[3] = v47;
        *(_QWORD *)(v46 - 24) += 32LL;
        goto LABEL_76;
      }
      v50 = *(_QWORD *)(v46 - 32);
      v51 = ((__int64)v48 - v50) >> 5;
      if ( (unsigned __int64)(v51 + 1) >> 59 )
        abort();
      v52 = v49 - v50;
      if ( (unsigned __int64)(v52 >> 5) > 0x3FFFFFFFFFFFFFELL )
      {
        v54 = 0x7FFFFFFFFFFFFFFLL;
LABEL_61:
        v56 = *(_QWORD *)(v46 - 8);
        v55 = *(char **)(v56 + 4096);
        if ( v56 + 4096 - (__int64)v55 >= (unsigned __int64)(32 * v54) )
          *(_QWORD *)(v56 + 4096) = &v55[32 * v54];
        else
          v55 = (char *)malloc(32 * v54);
        goto LABEL_64;
      }
      v53 = v52 >> 4;
      if ( v53 >= v51 + 1 )
        v54 = v53;
      else
        v54 = v51 + 1;
      if ( v54 )
        goto LABEL_61;
      v55 = 0LL;
LABEL_64:
      v57 = &v55[32 * v51];
      *(_QWORD *)v57 = 0LL;
      *((_QWORD *)v57 + 1) = 0LL;
      *((_QWORD *)v57 + 2) = 0LL;
      *((_QWORD *)v57 + 3) = v47;
      v59 = *(void ***)(v46 - 32);
      v58 = *(void ***)(v46 - 24);
      v60 = v57 + 32;
      if ( v58 == v59 )
      {
        v62 = *(void ***)(v46 - 32);
      }
      else
      {
        do
        {
          *((_QWORD *)v57 - 3) = 0LL;
          *((_QWORD *)v57 - 2) = 0LL;
          *((_QWORD *)v57 - 4) = 0LL;
          *((_QWORD *)v57 - 1) = *(v58 - 1);
          v61 = *((_OWORD *)v58 - 2);
          v58 -= 4;
          *((_OWORD *)v57 - 2) = v61;
          *((_QWORD *)v57 - 2) = v58[2];
          v57 -= 32;
          v58[1] = 0LL;
          v58[2] = 0LL;
          *v58 = 0LL;
        }
        while ( v59 != v58 );
        v62 = *(void ***)(v46 - 32);
        v59 = *(void ***)(v46 - 24);
      }
      v63 = *(_QWORD *)(v46 - 16);
      *(_QWORD *)(v46 - 32) = v57;
      *(_QWORD *)(v46 - 24) = v60;
      *(_QWORD *)(v46 - 16) = &v55[32 * v54];
      while ( v62 != v59 )
      {
        v59 -= 4;
        sub_9D32C(v59);
      }
      if ( v62 )
      {
        v64 = *(_QWORD *)(v46 - 8);
        if ( v64 + 4096 < (unsigned __int64)v62 || v64 > (unsigned __int64)v62 )
        {
          free(v62);
        }
        else if ( *(_QWORD *)(v64 + 4096) == v63 )
        {
          *(_QWORD *)(v64 + 4096) = v62;
        }
      }
LABEL_76:
      v65 = v161;
      for ( j = v45; v65 < v45; ++v65 )
      {
        v95 = *(void ***)v3;
        v96 = *(_QWORD *)(*(_QWORD *)(v3 + 72) - 24LL);
        v97 = *(_QWORD *)v3 + 48 * v65;
        v99 = *(size_t **)(v96 - 24);
        v98 = *(size_t **)(v96 - 16);
        if ( v99 == v98 )
        {
          v100 = *(_QWORD *)(v96 - 32);
          v101 = 0xAAAAAAAAAAAAAAABLL * (((__int64)v99 - v100) >> 4);
          if ( v101 + 1 > 0x555555555555555LL )
            abort();
          v102 = 0xAAAAAAAAAAAAAAABLL * (((__int64)v98 - v100) >> 4);
          v103 = 0x555555555555555LL;
          if ( v102 >= 0x2AAAAAAAAAAAAAALL
            || ((v104 = 2 * v102, v104 >= v101 + 1) ? (v103 = v104) : (v103 = v101 + 1), v103) )
          {
            v105 = *(_QWORD *)(v96 - 8);
            v106 = 48 * v103;
            v66 = *(char **)(v105 + 4096);
            if ( v105 + 4096 - (__int64)v66 >= (unsigned __int64)(48 * v103) )
              *(_QWORD *)(v105 + 4096) = &v66[v106];
            else
              v66 = (char *)malloc(v106);
          }
          else
          {
            v66 = 0LL;
          }
          v67 = (size_t *)&v66[48 * v101];
          v67[1] = 0LL;
          v67[2] = 0LL;
          *v67 = 0LL;
          v68 = &v66[48 * v103];
          v162 = v68;
          if ( (*(_BYTE *)v97 & 1) == 0 )
          {
            v67[2] = *(_QWORD *)(v97 + 16);
            *(_OWORD *)v67 = *(_OWORD *)v97;
            goto LABEL_89;
          }
          v69 = &v95[6 * v65];
          v70 = (size_t)v69[1];
          if ( v70 >= 0xFFFFFFFFFFFFFFF0LL )
            abort();
          v71 = v69[2];
          if ( v70 >= 0x17 )
          {
            v73 = v69[2];
            v74 = malloc((v70 + 16) & 0xFFFFFFFFFFFFFFF0LL);
            v71 = v73;
            v72 = v74;
            v75 = &v66[48 * v101];
            *((_QWORD *)v75 + 1) = v70;
            *((_QWORD *)v75 + 2) = v74;
            *v67 = (v70 + 16) & 0xFFFFFFFFFFFFFFF0LL | 1;
            v45 = j;
          }
          else
          {
            *(_BYTE *)v67 = 2 * v70;
            v72 = (char *)v67 + 1;
            v45 = j;
            if ( !v70 )
              goto LABEL_88;
          }
          memcpy(v72, v71, v70);
LABEL_88:
          *((_BYTE *)v72 + v70) = 0;
          v68 = v162;
LABEL_89:
          v76 = &v66[48 * v101];
          *((_QWORD *)v76 + 3) = 0LL;
          v77 = v76 + 24;
          v78 = &v95[6 * v65];
          *((_QWORD *)v77 + 1) = 0LL;
          *((_QWORD *)v77 + 2) = 0LL;
          v80 = *((_BYTE *)v78 + 24);
          v79 = v78 + 3;
          if ( (v80 & 1) == 0 )
          {
            *((_QWORD *)v77 + 2) = v79[2];
            *(_OWORD *)v77 = *(_OWORD *)v79;
LABEL_98:
            v88 = *(void ***)(v96 - 32);
            v87 = *(void ***)(v96 - 24);
            v89 = v67 + 6;
            if ( v87 == v88 )
            {
              v91 = *(void ***)(v96 - 32);
            }
            else
            {
              do
              {
                *(v67 - 4) = (size_t)*(v87 - 4);
                *((_OWORD *)v67 - 3) = *((_OWORD *)v87 - 3);
                v90 = (size_t)*(v87 - 1);
                *(v87 - 5) = 0LL;
                *(v87 - 4) = 0LL;
                *(v87 - 6) = 0LL;
                *(v67 - 1) = v90;
                *(_OWORD *)(v67 - 3) = *(_OWORD *)(v87 - 3);
                *(v87 - 2) = 0LL;
                *(v87 - 1) = 0LL;
                *(v87 - 3) = 0LL;
                v87 -= 6;
                v67 -= 6;
              }
              while ( v88 != v87 );
              v91 = *(void ***)(v96 - 32);
              v88 = *(void ***)(v96 - 24);
            }
            v92 = *(_QWORD *)(v96 - 16);
            *(_QWORD *)(v96 - 32) = v67;
            *(_QWORD *)(v96 - 24) = v89;
            *(_QWORD *)(v96 - 16) = v68;
            v3 = v163;
            if ( v88 != v91 )
            {
              do
              {
                if ( (*(_BYTE *)(v88 - 3) & 1) != 0 )
                  free(*(v88 - 1));
                v93 = v88 - 6;
                if ( (*(_BYTE *)(v88 - 6) & 1) != 0 )
                  free(*(v88 - 4));
                v88 -= 6;
              }
              while ( v91 != v93 );
            }
            if ( v91 )
            {
              v94 = *(_QWORD *)(v96 - 8);
              if ( v94 + 4096 < (unsigned __int64)v91 || v94 > (unsigned __int64)v91 )
              {
                free(v91);
              }
              else if ( *(_QWORD *)(v94 + 4096) == v92 )
              {
                *(_QWORD *)(v94 + 4096) = v91;
              }
            }
            continue;
          }
          v81 = &v95[6 * v65];
          v82 = (size_t)v81[4];
          if ( v82 >= 0xFFFFFFFFFFFFFFF0LL )
            abort();
          v83 = v81[5];
          if ( v82 >= 0x17 )
          {
            v85 = malloc((v82 + 16) & 0xFFFFFFFFFFFFFFF0LL);
            v86 = &v66[48 * v101];
            *((_QWORD *)v86 + 4) = v82;
            *((_QWORD *)v86 + 5) = v85;
            *(_QWORD *)v77 = (v82 + 16) & 0xFFFFFFFFFFFFFFF0LL | 1;
            v84 = v85;
          }
          else
          {
            *v77 = 2 * v82;
            v84 = v77 + 1;
            if ( !v82 )
              goto LABEL_97;
          }
          memcpy(v84, v83, v82);
LABEL_97:
          *((_BYTE *)v84 + v82) = 0;
          v45 = j;
          v68 = v162;
          goto LABEL_98;
        }
        v99[1] = 0LL;
        v99[2] = 0LL;
        *v99 = 0LL;
        if ( (*(_BYTE *)v97 & 1) == 0 )
        {
          v99[2] = *(_QWORD *)(v97 + 16);
          *(_OWORD *)v99 = *(_OWORD *)v97;
          goto LABEL_132;
        }
        v107 = &v95[6 * v65];
        v108 = (size_t)v107[1];
        if ( v108 >= 0xFFFFFFFFFFFFFFF0LL )
          abort();
        v109 = v107[2];
        if ( v108 >= 0x17 )
        {
          v110 = malloc((v108 + 16) & 0xFFFFFFFFFFFFFFF0LL);
          v99[2] = (size_t)v110;
          v3 = v163;
          *v99 = (v108 + 16) & 0xFFFFFFFFFFFFFFF0LL | 1;
          v99[1] = v108;
        }
        else
        {
          *(_BYTE *)v99 = 2 * v108;
          v110 = (char *)v99 + 1;
          if ( !v108 )
            goto LABEL_131;
        }
        memcpy(v110, v109, v108);
LABEL_131:
        *((_BYTE *)v110 + v108) = 0;
        v45 = j;
LABEL_132:
        v99[3] = 0LL;
        v111 = v99 + 3;
        v112 = &v95[6 * v65];
        v99[4] = 0LL;
        v99[5] = 0LL;
        v114 = *((_BYTE *)v112 + 24);
        v113 = v112 + 3;
        if ( (v114 & 1) != 0 )
        {
          v115 = &v95[6 * v65];
          v116 = (size_t)v115[4];
          if ( v116 >= 0xFFFFFFFFFFFFFFF0LL )
            abort();
          v117 = v115[5];
          if ( v116 >= 0x17 )
          {
            v118 = malloc((v116 + 16) & 0xFFFFFFFFFFFFFFF0LL);
            v99[5] = (size_t)v118;
            v3 = v163;
            v99[3] = (v116 + 16) & 0xFFFFFFFFFFFFFFF0LL | 1;
            v99[4] = v116;
          }
          else
          {
            *v111 = 2 * v116;
            v118 = (char *)v99 + 25;
            if ( !v116 )
              goto LABEL_140;
          }
          memcpy(v118, v117, v116);
LABEL_140:
          *((_BYTE *)v118 + v116) = 0;
          v45 = j;
          goto LABEL_141;
        }
        v99[5] = (size_t)v113[2];
        *(_OWORD *)v111 = *(_OWORD *)v113;
LABEL_141:
        *(_QWORD *)(v96 - 24) += 48LL;
      }
LABEL_143:
      if ( v161 < v45 )
      {
        v119 = 48 * v161;
        v120 = v161;
        do
        {
          if ( (v166 & 1) != 0 )
            v121 = *((_QWORD *)&v166 + 1);
          else
            v121 = (unsigned __int64)(unsigned __int8)v166 >> 1;
          if ( v121 >= 2 )
            sub_9CFD0((size_t *)&v166, &asc_69D1AEC, 2uLL);
          v122 = *(_QWORD *)v3 + v119;
          v123 = *(unsigned __int8 *)(v122 + 24);
          v124 = (v123 & 1) == 0;
          v125 = v123 >> 1;
          if ( v124 )
            v126 = (void *)(v122 + 25);
          else
            v126 = *(void **)(v122 + 40);
          if ( v124 )
            v127 = v125;
          else
            v127 = *(_QWORD *)(v122 + 32);
          v128 = sub_9CFD0((size_t *)v122, v126, v127);
          v171 = (_QWORD *)v128[2];
          v129 = (char *)v171;
          v170 = *(_OWORD *)v128;
          v128[1] = 0LL;
          v128[2] = 0LL;
          *v128 = 0LL;
          v130 = v170;
          if ( (v170 & 1) != 0 )
            v131 = v129;
          else
            v131 = (char *)&v170 + 1;
          if ( (v170 & 1) != 0 )
            v132 = *((_QWORD *)&v170 + 1);
          else
            v132 = (unsigned __int64)(unsigned __int8)v170 >> 1;
          sub_9CFD0((size_t *)&v166, v131, v132);
          if ( (v130 & 1) != 0 )
            free(v129);
          ++v120;
          v119 += 48LL;
        }
        while ( v120 < v45 );
        if ( v161 < v45 )
        {
          v133 = *(_QWORD *)(v3 + 8);
          do
          {
            if ( *(_QWORD *)v3 != v133 )
            {
              v134 = (_BYTE *)(v133 - 48);
              if ( (*(_BYTE *)(v133 - 24) & 1) != 0 )
                free(*(void **)(v133 - 8));
              if ( (*v134 & 1) != 0 )
                free(*(void **)(v133 - 32));
              v133 -= 48LL;
              *(_QWORD *)(v3 + 8) = v134;
            }
            --v45;
          }
          while ( v45 > v161 );
        }
      }
      v7 = v159;
      if ( *v159 == 69 )
      {
        v10 = (unsigned __int8)v166;
        v8 = *((_QWORD *)&v166 + 1);
        v9 = (char *)p;
        goto LABEL_9;
      }
    }
    v24 = size;
    v23 = 0x7FFFFFFFFFFFFFFLL;
    v172 = 0LL;
    v173 = size;
LABEL_29:
    v25 = *(char **)(*(_QWORD *)v24 + 4096LL);
    if ( *(_QWORD *)v24 + 4096LL - (__int64)v25 >= (unsigned __int64)(32 * v23) )
      *(_QWORD *)(*(_QWORD *)v24 + 4096LL) = &v25[32 * v23];
    else
      v25 = (char *)malloc(32 * v23);
    goto LABEL_32;
  }
  v8 = 0LL;
  v9 = 0LL;
  v10 = 2LL;
LABEL_9:
  v11 = v10 >> 1;
  v124 = (v10 & 1) == 0;
  v12 = (char *)&v166 + 1;
  if ( v124 )
  {
    v13 = v11;
  }
  else
  {
    v12 = v9;
    v13 = v8;
  }
  if ( v12[v13 - 1] == 62 )
    sub_9CFD0((size_t *)&v166, " >", 2uLL);
  else
    sub_9CFD0((size_t *)&v166, ">", 1uLL);
  v135 = *((_QWORD *)&v166 + 1);
  v136 = p;
  v137 = *(_QWORD *)((char *)&v166 + 1);
  v138 = v166;
  v166 = 0uLL;
  *(_QWORD *)&v168[7] = v135;
  p = 0LL;
  v168[7] = HIBYTE(v137);
  v139 = *(_QWORD *)&v168[7];
  memset(v169, 0, 15);
  memset(v168, 0, sizeof(v168));
  *(_QWORD *)((char *)&v170 + 7) = v139;
  *(_QWORD *)&v170 = v137;
  v140 = *(_QWORD *)(v3 + 8);
  v141 = *(_QWORD *)(v3 + 16);
  if ( v140 >= v141 )
  {
    v142 = 0xAAAAAAAAAAAAAAABLL * ((__int64)(v140 - *(_QWORD *)v3) >> 4);
    v143 = v142 + 1;
    if ( v142 + 1 > 0x555555555555555LL )
      abort();
    v144 = 0xAAAAAAAAAAAAAAABLL * ((__int64)(v141 - *(_QWORD *)v3) >> 4);
    if ( v144 >= 0x2AAAAAAAAAAAAAALL )
      goto LABEL_184;
    v145 = 2 * v144;
    if ( v145 >= v143 )
      v143 = v145;
    v158 = v143;
    if ( v143 )
    {
LABEL_184:
      v146 = *(_QWORD *)(v3 + 24);
      v147 = *(char **)(v146 + 4096);
      if ( v146 + 4096 - (__int64)v147 >= (unsigned __int64)(48 * v158) )
        *(_QWORD *)(v146 + 4096) = &v147[48 * v158];
      else
        v147 = (char *)malloc(48 * v158);
    }
    else
    {
      v158 = 0LL;
      v147 = 0LL;
    }
    v148 = &v147[48 * v142];
    *v148 = v138;
    *((_QWORD *)v148 + 1) = *(_QWORD *)((char *)&v170 + 7);
    *((_QWORD *)v148 + 2) = v136;
    *(_QWORD *)(v148 + 1) = v170;
    *(_QWORD *)((char *)&v170 + 7) = 0LL;
    *(_QWORD *)&v170 = 0LL;
    v148[24] = 0;
    *((_QWORD *)v148 + 4) = *(_QWORD *)((char *)v169 + 7);
    *((_QWORD *)v148 + 5) = 0LL;
    *(_QWORD *)(v148 + 25) = v169[0];
    memset(v169, 0, 15);
    v150 = *(void ***)v3;
    v149 = *(void ***)(v3 + 8);
    v151 = v148 + 48;
    if ( v149 == *(void ***)v3 )
    {
      v153 = *(void ***)v3;
    }
    else
    {
      do
      {
        *((_QWORD *)v148 - 4) = *(v149 - 4);
        *((_OWORD *)v148 - 3) = *((_OWORD *)v149 - 3);
        v152 = (__int64)*(v149 - 1);
        *(v149 - 5) = 0LL;
        *(v149 - 4) = 0LL;
        *(v149 - 6) = 0LL;
        *((_QWORD *)v148 - 1) = v152;
        *(_OWORD *)(v148 - 24) = *(_OWORD *)(v149 - 3);
        *(v149 - 2) = 0LL;
        *(v149 - 1) = 0LL;
        *(v149 - 3) = 0LL;
        v149 -= 6;
        v148 -= 48;
      }
      while ( v150 != v149 );
      v153 = *(void ***)v3;
      v150 = *(void ***)(v3 + 8);
    }
    v154 = *(_QWORD *)(v3 + 16);
    *(_QWORD *)v3 = v148;
    *(_QWORD *)(v3 + 8) = v151;
    *(_QWORD *)(v3 + 16) = &v147[48 * v158];
    if ( v150 != v153 )
    {
      do
      {
        if ( (*(_BYTE *)(v150 - 3) & 1) != 0 )
          free(*(v150 - 1));
        v155 = v150 - 6;
        if ( (*(_BYTE *)(v150 - 6) & 1) != 0 )
          free(*(v150 - 4));
        v150 -= 6;
      }
      while ( v153 != v155 );
    }
    if ( v153 )
    {
      v156 = *(_QWORD *)(v3 + 24);
      if ( v156 + 4096 < (unsigned __int64)v153 || v156 > (unsigned __int64)v153 )
      {
        free(v153);
      }
      else if ( *(_QWORD *)(v156 + 4096) == v154 )
      {
        *(_QWORD *)(v156 + 4096) = v153;
      }
    }
  }
  else
  {
    *(_BYTE *)v140 = v138;
    *(_QWORD *)(v140 + 8) = *(_QWORD *)((char *)&v170 + 7);
    *(_QWORD *)(v140 + 16) = v136;
    *(_QWORD *)(v140 + 1) = v170;
    *(_QWORD *)((char *)&v170 + 7) = 0LL;
    *(_QWORD *)&v170 = 0LL;
    *(_BYTE *)(v140 + 24) = 0;
    *(_QWORD *)(v140 + 32) = *(_QWORD *)((char *)v169 + 7);
    *(_QWORD *)(v140 + 40) = 0LL;
    *(_QWORD *)(v140 + 25) = v169[0];
    memset(v169, 0, 15);
    *(_QWORD *)(v3 + 8) += 48LL;
  }
  v44 = 0;
  v14 = v7 + 1;
LABEL_205:
  if ( (v166 & 1) != 0 )
    free(p);
  if ( !v44 )
    return v14;
  return v165;
}
