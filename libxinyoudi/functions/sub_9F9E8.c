__int64 __fastcall sub_9F9E8(_BYTE *a1, _BYTE *a2, __int64 a3)
{
  _BYTE *v3; // x20
  __int64 v5; // x8
  __int64 v6; // x9
  __int64 *v7; // x8
  __int64 v8; // x27
  __int64 v9; // x28
  char *v10; // x21
  size_t *v11; // x24
  char *v12; // x20
  size_t v13; // x22
  const void *v14; // x23
  void *v15; // x27
  char *v16; // x8
  char *v17; // x22
  char *v18; // x22
  size_t v19; // x23
  const void *v20; // x27
  void *v21; // x22
  void *v22; // x0
  char *v23; // x8
  void **v24; // x9
  void **v25; // x22
  _QWORD *v26; // x8
  size_t v27; // x10
  void **v28; // x21
  __int64 v29; // x23
  void **v30; // x24
  unsigned __int64 v31; // x8
  size_t *v32; // x9
  size_t *v33; // x25
  unsigned __int64 v34; // x26
  unsigned __int64 v35; // x9
  __int64 v36; // x22
  unsigned __int64 v37; // x9
  __int64 v38; // x8
  size_t v39; // x0
  size_t v40; // x21
  const void *v41; // x22
  void *v42; // x23
  _BYTE *v43; // x21
  size_t v44; // x22
  const void *v45; // x23
  void *v46; // x21
  __int64 v47; // x8
  __int64 v48; // x28
  _BYTE *v49; // x24
  __int64 v50; // x12
  unsigned __int64 v51; // x8
  unsigned __int64 v52; // x9
  __int64 v53; // x9
  __int64 v54; // x9
  __int64 v55; // x10
  unsigned __int64 v56; // x8
  __int64 *v57; // x8
  __int64 v58; // x26
  __int64 v59; // x27
  unsigned __int64 v60; // x21
  unsigned __int64 v61; // x8
  unsigned __int64 v62; // x9
  unsigned __int64 v63; // x9
  __int64 v64; // x9
  char *v65; // x0
  char *v66; // x21
  size_t *v67; // x26
  char *v68; // x20
  size_t v69; // x22
  const void *v70; // x1
  void *v71; // x24
  const void *v72; // x24
  void *v73; // x0
  char *v74; // x8
  char *v75; // x22
  char *v76; // x22
  size_t v77; // x23
  const void *v78; // x1
  void *v79; // x22
  const void *v80; // x20
  void *v81; // x0
  char *v82; // x8
  void **v83; // x9
  void **v84; // x22
  _QWORD *v85; // x8
  size_t v86; // x10
  void **v87; // x21
  __int64 v88; // x23
  void **v89; // x24
  unsigned __int64 v90; // x8
  size_t *v91; // x9
  size_t *v92; // x25
  unsigned __int64 v93; // x25
  unsigned __int64 v94; // x9
  __int64 v95; // x22
  unsigned __int64 v96; // x9
  __int64 v97; // x8
  size_t v98; // x0
  size_t v99; // x21
  const void *v100; // x22
  void *v101; // x23
  _BYTE *v102; // x21
  size_t v103; // x22
  const void *v104; // x23
  void *v105; // x21
  __int64 v106; // x22
  unsigned __int64 v107; // x23
  _BYTE *v108; // x0
  char *v109; // x8
  __int64 v110; // x10
  void **v111; // x11
  void **v112; // x22
  char *v113; // x10
  __int64 v114; // x12
  void **v115; // x21
  __int64 v116; // x23
  void **v117; // x24
  unsigned __int64 v118; // x8
  __int64 v120; // x9
  char *v121; // x8
  unsigned __int64 v122; // x10
  _BYTE *v123; // x11
  _OWORD *v124; // x12
  __int128 *v125; // x13
  unsigned __int64 v126; // x14
  __int128 v127; // q0
  __int128 v128; // q1
  _BYTE *v129; // x9
  _BYTE *v130; // x10
  char v131; // t1
  __int64 v132; // x8
  _BYTE *v133; // x21
  __int64 v134; // x9
  char v135; // w23
  unsigned __int64 v136; // x8
  unsigned __int64 v137; // x9
  unsigned __int64 v138; // x20
  unsigned __int64 v139; // x8
  unsigned __int64 v140; // x9
  unsigned __int64 v141; // x9
  __int64 v142; // x9
  char *v143; // x0
  char *v144; // x8
  void **v145; // x11
  void **v146; // x21
  char *v147; // x10
  __int64 v148; // x12
  void **v149; // x20
  __int64 v150; // x23
  void **v151; // x24
  unsigned __int64 v152; // x8
  char *v153; // [xsp+8h] [xbp-B8h]
  __int64 v156; // [xsp+20h] [xbp-A0h]
  __int64 v157; // [xsp+28h] [xbp-98h]
  __int64 v158; // [xsp+28h] [xbp-98h]
  __int128 v159; // [xsp+30h] [xbp-90h] BYREF
  _BYTE *v160; // [xsp+40h] [xbp-80h]
  _QWORD v161[2]; // [xsp+48h] [xbp-78h] BYREF
  _QWORD v162[3]; // [xsp+58h] [xbp-68h] BYREF

  v3 = a1;
  v162[2] = *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 2)) + 40);
  if ( a2 - a1 < 2 || *a1 != 84 )
    return (__int64)v3;
  v5 = (unsigned __int8)a1[1];
  v156 = 0x555555555555555LL;
  if ( v5 != 95 )
  {
    v47 = v5 - 48;
    if ( (unsigned int)v47 > 9 || a1 + 2 == a2 )
      return (__int64)v3;
    v48 = 0LL;
    while ( 1 )
    {
      v49 = &a1[v48];
      v50 = (unsigned __int8)a1[v48 + 2];
      if ( (unsigned int)(v50 - 48) > 9 )
        break;
      ++v48;
      v47 = v50 - 48 + 10 * v47;
      if ( !&a1[v48 + 2LL - (_QWORD)a2] )
        return (__int64)v3;
    }
    if ( (_DWORD)v50 != 95 )
      return (__int64)v3;
    v54 = *(_QWORD *)(a3 + 72);
    if ( *(_QWORD *)(a3 + 64) == v54 )
      return (__int64)v3;
    v55 = *(_QWORD *)(v54 - 32);
    v56 = v47 + 1;
    if ( v56 < (*(_QWORD *)(v54 - 24) - v55) >> 5 )
    {
      v57 = (__int64 *)(v55 + 32 * v56);
      v59 = *v57;
      v58 = v57[1];
      if ( *v57 == v58 )
        return (__int64)&a1[v48 + 3];
      v158 = v57[1];
      while ( 1 )
      {
        v92 = *(size_t **)(a3 + 8);
        v91 = *(size_t **)(a3 + 16);
        if ( v92 == v91 )
        {
          v93 = 0xAAAAAAAAAAAAAAABLL * (((__int64)v92 - *(_QWORD *)a3) >> 4);
          if ( v93 + 1 > 0x555555555555555LL )
            goto LABEL_228;
          v94 = 0xAAAAAAAAAAAAAAABLL * (((__int64)v91 - *(_QWORD *)a3) >> 4);
          v95 = 0x555555555555555LL;
          if ( v94 >= 0x2AAAAAAAAAAAAAALL || ((v96 = 2 * v94, v96 >= v93 + 1) ? (v95 = v96) : (v95 = v93 + 1), v95) )
          {
            v97 = *(_QWORD *)(a3 + 24);
            v98 = 48 * v95;
            v66 = *(char **)(v97 + 4096);
            if ( v97 + 4096 - (__int64)v66 >= (unsigned __int64)(48 * v95) )
              *(_QWORD *)(v97 + 4096) = &v66[v98];
            else
              v66 = (char *)malloc(v98);
          }
          else
          {
            v66 = 0LL;
          }
          v67 = (size_t *)&v66[48 * v93];
          v67[1] = 0LL;
          v67[2] = 0LL;
          *v67 = 0LL;
          v68 = &v66[48 * v95];
          if ( (*(_BYTE *)v59 & 1) == 0 )
          {
            v67[2] = *(_QWORD *)(v59 + 16);
            *(_OWORD *)v67 = *(_OWORD *)v59;
            goto LABEL_106;
          }
          v69 = *(_QWORD *)(v59 + 8);
          if ( v69 >= 0xFFFFFFFFFFFFFFF0LL )
            abort();
          v70 = *(const void **)(v59 + 16);
          if ( v69 >= 0x17 )
          {
            v72 = *(const void **)(v59 + 16);
            v73 = malloc((v69 + 16) & 0xFFFFFFFFFFFFFFF0LL);
            v70 = v72;
            v71 = v73;
            v74 = &v66[48 * v93];
            *((_QWORD *)v74 + 1) = v69;
            *((_QWORD *)v74 + 2) = v73;
            *v67 = (v69 + 16) & 0xFFFFFFFFFFFFFFF0LL | 1;
          }
          else
          {
            *(_BYTE *)v67 = 2 * v69;
            v71 = (char *)v67 + 1;
            if ( !v69 )
              goto LABEL_105;
          }
          memcpy(v71, v70, v69);
LABEL_105:
          *((_BYTE *)v71 + v69) = 0;
LABEL_106:
          v75 = &v66[48 * v93];
          *((_QWORD *)v75 + 3) = 0LL;
          v76 = v75 + 24;
          *((_QWORD *)v76 + 1) = 0LL;
          *((_QWORD *)v76 + 2) = 0LL;
          if ( (*(_BYTE *)(v59 + 24) & 1) == 0 )
          {
            *((_QWORD *)v76 + 2) = *(_QWORD *)(v59 + 40);
            *(_OWORD *)v76 = *(_OWORD *)(v59 + 24);
LABEL_115:
            v84 = *(void ***)a3;
            v83 = *(void ***)(a3 + 8);
            v85 = v67 + 6;
            if ( v83 == *(void ***)a3 )
            {
              v87 = *(void ***)a3;
            }
            else
            {
              do
              {
                *(v67 - 4) = (size_t)*(v83 - 4);
                *((_OWORD *)v67 - 3) = *((_OWORD *)v83 - 3);
                v86 = (size_t)*(v83 - 1);
                *(v83 - 5) = 0LL;
                *(v83 - 4) = 0LL;
                *(v83 - 6) = 0LL;
                *(v67 - 1) = v86;
                *(_OWORD *)(v67 - 3) = *(_OWORD *)(v83 - 3);
                *(v83 - 2) = 0LL;
                *(v83 - 1) = 0LL;
                *(v83 - 3) = 0LL;
                v83 -= 6;
                v67 -= 6;
              }
              while ( v84 != v83 );
              v87 = *(void ***)a3;
              v84 = *(void ***)(a3 + 8);
            }
            v88 = *(_QWORD *)(a3 + 16);
            *(_QWORD *)a3 = v67;
            *(_QWORD *)(a3 + 8) = v85;
            *(_QWORD *)(a3 + 16) = v68;
            v58 = v158;
            if ( v84 != v87 )
            {
              do
              {
                if ( (*(_BYTE *)(v84 - 3) & 1) != 0 )
                  free(*(v84 - 1));
                v89 = v84 - 6;
                if ( (*(_BYTE *)(v84 - 6) & 1) != 0 )
                  free(*(v84 - 4));
                v84 -= 6;
              }
              while ( v87 != v89 );
            }
            if ( v87 )
            {
              v90 = *(_QWORD *)(a3 + 24);
              if ( v90 + 4096 < (unsigned __int64)v87 || v90 > (unsigned __int64)v87 )
              {
                free(v87);
              }
              else if ( *(_QWORD *)(v90 + 4096) == v88 )
              {
                *(_QWORD *)(v90 + 4096) = v87;
              }
            }
            goto LABEL_159;
          }
          v77 = *(_QWORD *)(v59 + 32);
          if ( v77 >= 0xFFFFFFFFFFFFFFF0LL )
            abort();
          v78 = *(const void **)(v59 + 40);
          if ( v77 >= 0x17 )
          {
            v153 = v68;
            v80 = *(const void **)(v59 + 40);
            v81 = malloc((v77 + 16) & 0xFFFFFFFFFFFFFFF0LL);
            v78 = v80;
            v68 = v153;
            v82 = &v66[48 * v93];
            *((_QWORD *)v82 + 4) = v77;
            *((_QWORD *)v82 + 5) = v81;
            *(_QWORD *)v76 = (v77 + 16) & 0xFFFFFFFFFFFFFFF0LL | 1;
            v79 = v81;
          }
          else
          {
            *v76 = 2 * v77;
            v79 = v76 + 1;
            if ( !v77 )
              goto LABEL_114;
          }
          memcpy(v79, v78, v77);
LABEL_114:
          *((_BYTE *)v79 + v77) = 0;
          goto LABEL_115;
        }
        v92[1] = 0LL;
        v92[2] = 0LL;
        *v92 = 0LL;
        if ( (*(_BYTE *)v59 & 1) == 0 )
        {
          v92[2] = *(_QWORD *)(v59 + 16);
          *(_OWORD *)v92 = *(_OWORD *)v59;
          goto LABEL_149;
        }
        v99 = *(_QWORD *)(v59 + 8);
        if ( v99 >= 0xFFFFFFFFFFFFFFF0LL )
          goto LABEL_228;
        v100 = *(const void **)(v59 + 16);
        if ( v99 >= 0x17 )
        {
          v101 = malloc((v99 + 16) & 0xFFFFFFFFFFFFFFF0LL);
          v92[1] = v99;
          v92[2] = (size_t)v101;
          *v92 = (v99 + 16) & 0xFFFFFFFFFFFFFFF0LL | 1;
        }
        else
        {
          *(_BYTE *)v92 = 2 * v99;
          v101 = (char *)v92 + 1;
          if ( !v99 )
            goto LABEL_148;
        }
        memcpy(v101, v100, v99);
LABEL_148:
        *((_BYTE *)v101 + v99) = 0;
LABEL_149:
        v92[3] = 0LL;
        v102 = v92 + 3;
        v92[4] = 0LL;
        v92[5] = 0LL;
        if ( (*(_BYTE *)(v59 + 24) & 1) != 0 )
        {
          v103 = *(_QWORD *)(v59 + 32);
          if ( v103 >= 0xFFFFFFFFFFFFFFF0LL )
            abort();
          v104 = *(const void **)(v59 + 40);
          if ( v103 >= 0x17 )
          {
            v105 = malloc((v103 + 16) & 0xFFFFFFFFFFFFFFF0LL);
            v92[4] = v103;
            v92[5] = (size_t)v105;
            v92[3] = (v103 + 16) & 0xFFFFFFFFFFFFFFF0LL | 1;
          }
          else
          {
            *v102 = 2 * v103;
            v105 = (char *)v92 + 25;
            if ( !v103 )
              goto LABEL_157;
          }
          memcpy(v105, v104, v103);
LABEL_157:
          *((_BYTE *)v105 + v103) = 0;
          goto LABEL_158;
        }
        v92[5] = *(_QWORD *)(v59 + 40);
        *(_OWORD *)v102 = *(_OWORD *)(v59 + 24);
LABEL_158:
        *(_QWORD *)(a3 + 8) += 48LL;
LABEL_159:
        v59 += 48LL;
        if ( v59 == v58 )
          return (__int64)&a1[v48 + 3];
      }
    }
    v106 = (__int64)&a1[v48 + 3];
    v107 = v48 + 3;
    v160 = 0LL;
    v159 = 0uLL;
    if ( (unsigned __int64)(v48 + 3) >= 0xFFFFFFFFFFFFFFF0LL )
LABEL_228:
      abort();
    if ( v107 > 0x16 )
    {
      v108 = malloc((v48 + 19) & 0xFFFFFFFFFFFFFFF0LL);
      *((_QWORD *)&v159 + 1) = v48 + 3;
      v160 = v108;
      *(_QWORD *)&v159 = (v48 + 19) & 0xFFFFFFFFFFFFFFF0LL | 1;
      if ( v48 == -3 )
      {
LABEL_200:
        *v108 = 0;
        v132 = *((_QWORD *)&v159 + 1);
        v133 = v160;
        v134 = *(_QWORD *)((char *)&v159 + 1);
        v135 = v159;
        v159 = 0uLL;
        v160 = 0LL;
        memset(v161, 0, 15);
        *(_QWORD *)((char *)v162 + 7) = v132;
        v162[0] = v134;
        v136 = *(_QWORD *)(a3 + 8);
        v137 = *(_QWORD *)(a3 + 16);
        if ( v136 >= v137 )
        {
          v138 = 0xAAAAAAAAAAAAAAABLL * ((__int64)(v136 - *(_QWORD *)a3) >> 4);
          v139 = v138 + 1;
          if ( v138 + 1 > 0x555555555555555LL )
            abort();
          v140 = 0xAAAAAAAAAAAAAAABLL * ((__int64)(v137 - *(_QWORD *)a3) >> 4);
          if ( v140 >= 0x2AAAAAAAAAAAAAALL )
            goto LABEL_207;
          v141 = 2 * v140;
          if ( v141 >= v139 )
            v139 = v141;
          v156 = v139;
          if ( v139 )
          {
LABEL_207:
            v142 = *(_QWORD *)(a3 + 24);
            v143 = *(char **)(v142 + 4096);
            if ( v142 + 4096 - (__int64)v143 >= (unsigned __int64)(48 * v156) )
              *(_QWORD *)(v142 + 4096) = &v143[48 * v156];
            else
              v143 = (char *)malloc(48 * v156);
          }
          else
          {
            v156 = 0LL;
            v143 = 0LL;
          }
          v144 = &v143[48 * v138];
          *v144 = v135;
          *((_QWORD *)v144 + 1) = *(_QWORD *)((char *)v162 + 7);
          *((_QWORD *)v144 + 2) = v133;
          *(_QWORD *)(v144 + 1) = v162[0];
          memset(v162, 0, 15);
          v144[24] = 0;
          *((_QWORD *)v144 + 4) = *(_QWORD *)((char *)v161 + 7);
          *((_QWORD *)v144 + 5) = 0LL;
          *(_QWORD *)(v144 + 25) = v161[0];
          memset(v161, 0, 15);
          v146 = *(void ***)a3;
          v145 = *(void ***)(a3 + 8);
          v147 = v144 + 48;
          if ( v145 == *(void ***)a3 )
          {
            v149 = *(void ***)a3;
          }
          else
          {
            do
            {
              *((_QWORD *)v144 - 4) = *(v145 - 4);
              *((_OWORD *)v144 - 3) = *((_OWORD *)v145 - 3);
              v148 = (__int64)*(v145 - 1);
              *(v145 - 5) = 0LL;
              *(v145 - 4) = 0LL;
              *(v145 - 6) = 0LL;
              *((_QWORD *)v144 - 1) = v148;
              *(_OWORD *)(v144 - 24) = *(_OWORD *)(v145 - 3);
              *(v145 - 2) = 0LL;
              *(v145 - 1) = 0LL;
              *(v145 - 3) = 0LL;
              v145 -= 6;
              v144 -= 48;
            }
            while ( v146 != v145 );
            v149 = *(void ***)a3;
            v146 = *(void ***)(a3 + 8);
          }
          v150 = *(_QWORD *)(a3 + 16);
          *(_QWORD *)a3 = v144;
          *(_QWORD *)(a3 + 8) = v147;
          *(_QWORD *)(a3 + 16) = &v143[48 * v156];
          if ( v146 != v149 )
          {
            do
            {
              if ( (*(_BYTE *)(v146 - 3) & 1) != 0 )
                free(*(v146 - 1));
              v151 = v146 - 6;
              if ( (*(_BYTE *)(v146 - 6) & 1) != 0 )
                free(*(v146 - 4));
              v146 -= 6;
            }
            while ( v149 != v151 );
          }
          if ( v149 )
          {
            v152 = *(_QWORD *)(a3 + 24);
            if ( v152 + 4096 < (unsigned __int64)v149 || v152 > (unsigned __int64)v149 )
            {
              free(v149);
            }
            else if ( *(_QWORD *)(v152 + 4096) == v150 )
            {
              *(_QWORD *)(v152 + 4096) = v149;
            }
          }
        }
        else
        {
          *(_BYTE *)v136 = v135;
          *(_QWORD *)(v136 + 8) = *(_QWORD *)((char *)v162 + 7);
          *(_QWORD *)(v136 + 16) = v133;
          *(_QWORD *)(v136 + 1) = v162[0];
          memset(v162, 0, 15);
          *(_BYTE *)(v136 + 24) = 0;
          *(_QWORD *)(v136 + 32) = *(_QWORD *)((char *)v161 + 7);
          *(_QWORD *)(v136 + 40) = 0LL;
          *(_QWORD *)(v136 + 25) = v161[0];
          memset(v161, 0, 15);
          *(_QWORD *)(a3 + 8) += 48LL;
        }
        v3 = (_BYTE *)v106;
        goto LABEL_184;
      }
    }
    else
    {
      LOBYTE(v159) = 2 * v107;
      v108 = (char *)&v159 + 1;
      if ( v48 == -3 )
        goto LABEL_200;
    }
    *v108 = 84;
    if ( v48 != -2 )
    {
      v120 = v48 + 2;
      v121 = v3 + 1;
      if ( (unsigned __int64)(v48 + 2) >= 0x20
        && (v122 = v120 & 0xFFFFFFFFFFFFFFE0LL, (v120 & 0xFFFFFFFFFFFFFFE0LL) != 0) )
      {
        if ( v108 >= v49 + 2 || (v123 = v108, v121 >= &v108[v48 + 3]) )
        {
          v121 += v122;
          v123 = &v108[v122];
          v124 = v108 + 17;
          v125 = (__int128 *)(v3 + 17);
          v126 = v120 & 0xFFFFFFFFFFFFFFE0LL;
          do
          {
            v127 = *(v125 - 1);
            v128 = *v125;
            v126 -= 32LL;
            v125 += 2;
            *(v124 - 1) = v127;
            *v124 = v128;
            v124 += 2;
          }
          while ( v126 );
          if ( v122 == v120 )
            goto LABEL_199;
        }
      }
      else
      {
        v123 = v108;
      }
      v129 = &v3[3LL - (_QWORD)v121 + v48];
      v130 = v123 + 1;
      do
      {
        v131 = *v121++;
        --v129;
        *v130++ = v131;
      }
      while ( v129 );
    }
LABEL_199:
    v108 += v107;
    goto LABEL_200;
  }
  v6 = *(_QWORD *)(a3 + 72);
  if ( *(_QWORD *)(a3 + 64) == v6 )
    return (__int64)v3;
  v7 = *(__int64 **)(v6 - 32);
  if ( v7 == *(__int64 **)(v6 - 24) )
  {
    LODWORD(v161[1]) = 0;
    v161[0] = 0LL;
    memset(v162, 0, 15);
    v51 = *(_QWORD *)(a3 + 8);
    v52 = *(_QWORD *)(a3 + 16);
    if ( v51 >= v52 )
    {
      v60 = 0xAAAAAAAAAAAAAAABLL * ((__int64)(v51 - *(_QWORD *)a3) >> 4);
      v61 = v60 + 1;
      if ( v60 + 1 > 0x555555555555555LL )
        abort();
      v62 = 0xAAAAAAAAAAAAAAABLL * ((__int64)(v52 - *(_QWORD *)a3) >> 4);
      if ( v62 >= 0x2AAAAAAAAAAAAAALL )
        goto LABEL_93;
      v63 = 2 * v62;
      if ( v63 >= v61 )
        v61 = v63;
      v156 = v61;
      if ( v61 )
      {
LABEL_93:
        v64 = *(_QWORD *)(a3 + 24);
        v65 = *(char **)(v64 + 4096);
        if ( v64 + 4096 - (__int64)v65 >= (unsigned __int64)(48 * v156) )
          *(_QWORD *)(v64 + 4096) = &v65[48 * v156];
        else
          v65 = (char *)malloc(48 * v156);
      }
      else
      {
        v156 = 0LL;
        v65 = 0LL;
      }
      v109 = &v65[48 * v60];
      *v109 = 4;
      strcpy(v109 + 1, "T_");
      *((_DWORD *)v109 + 3) = v161[1];
      v110 = v161[0];
      *((_QWORD *)v109 + 2) = 0LL;
      *(_QWORD *)(v109 + 4) = v110;
      LODWORD(v161[1]) = 0;
      v161[0] = 0LL;
      v109[24] = 0;
      *((_QWORD *)v109 + 4) = *(_QWORD *)((char *)v162 + 7);
      *((_QWORD *)v109 + 5) = 0LL;
      *(_QWORD *)(v109 + 25) = v162[0];
      memset(v162, 0, 15);
      v112 = *(void ***)a3;
      v111 = *(void ***)(a3 + 8);
      v113 = v109 + 48;
      if ( v111 == *(void ***)a3 )
      {
        v115 = *(void ***)a3;
      }
      else
      {
        do
        {
          *((_QWORD *)v109 - 4) = *(v111 - 4);
          *((_OWORD *)v109 - 3) = *((_OWORD *)v111 - 3);
          v114 = (__int64)*(v111 - 1);
          *(v111 - 5) = 0LL;
          *(v111 - 4) = 0LL;
          *(v111 - 6) = 0LL;
          *((_QWORD *)v109 - 1) = v114;
          *(_OWORD *)(v109 - 24) = *(_OWORD *)(v111 - 3);
          *(v111 - 2) = 0LL;
          *(v111 - 1) = 0LL;
          *(v111 - 3) = 0LL;
          v111 -= 6;
          v109 -= 48;
        }
        while ( v112 != v111 );
        v115 = *(void ***)a3;
        v112 = *(void ***)(a3 + 8);
      }
      v116 = *(_QWORD *)(a3 + 16);
      *(_QWORD *)a3 = v109;
      *(_QWORD *)(a3 + 8) = v113;
      *(_QWORD *)(a3 + 16) = &v65[48 * v156];
      if ( v112 != v115 )
      {
        do
        {
          if ( (*(_BYTE *)(v112 - 3) & 1) != 0 )
            free(*(v112 - 1));
          v117 = v112 - 6;
          if ( (*(_BYTE *)(v112 - 6) & 1) != 0 )
            free(*(v112 - 4));
          v112 -= 6;
        }
        while ( v115 != v117 );
      }
      if ( v115 )
      {
        v118 = *(_QWORD *)(a3 + 24);
        if ( v118 + 4096 < (unsigned __int64)v115 || v118 > (unsigned __int64)v115 )
        {
          free(v115);
        }
        else if ( *(_QWORD *)(v118 + 4096) == v116 )
        {
          *(_QWORD *)(v118 + 4096) = v115;
        }
      }
    }
    else
    {
      *(_BYTE *)v51 = 4;
      strcpy((char *)(v51 + 1), "T_");
      *(_DWORD *)(v51 + 12) = v161[1];
      v53 = v161[0];
      *(_QWORD *)(v51 + 16) = 0LL;
      *(_QWORD *)(v51 + 4) = v53;
      LODWORD(v161[1]) = 0;
      v161[0] = 0LL;
      *(_BYTE *)(v51 + 24) = 0;
      *(_QWORD *)(v51 + 32) = *(_QWORD *)((char *)v162 + 7);
      *(_QWORD *)(v51 + 40) = 0LL;
      *(_QWORD *)(v51 + 25) = v162[0];
      memset(v162, 0, 15);
      *(_QWORD *)(a3 + 8) += 48LL;
    }
    v3 += 2;
LABEL_184:
    *(_BYTE *)(a3 + 110) = 1;
    return (__int64)v3;
  }
  v9 = *v7;
  v8 = v7[1];
  if ( *v7 != v8 )
  {
    v157 = v7[1];
    do
    {
      v33 = *(size_t **)(a3 + 8);
      v32 = *(size_t **)(a3 + 16);
      if ( v33 == v32 )
      {
        v34 = 0xAAAAAAAAAAAAAAABLL * (((__int64)v33 - *(_QWORD *)a3) >> 4);
        if ( v34 + 1 > 0x555555555555555LL )
          goto LABEL_228;
        v35 = 0xAAAAAAAAAAAAAAABLL * (((__int64)v32 - *(_QWORD *)a3) >> 4);
        v36 = 0x555555555555555LL;
        if ( v35 >= 0x2AAAAAAAAAAAAAALL || ((v37 = 2 * v35, v37 >= v34 + 1) ? (v36 = v37) : (v36 = v34 + 1), v36) )
        {
          v38 = *(_QWORD *)(a3 + 24);
          v39 = 48 * v36;
          v10 = *(char **)(v38 + 4096);
          if ( v38 + 4096 - (__int64)v10 >= (unsigned __int64)(48 * v36) )
            *(_QWORD *)(v38 + 4096) = &v10[v39];
          else
            v10 = (char *)malloc(v39);
        }
        else
        {
          v10 = 0LL;
        }
        v11 = (size_t *)&v10[48 * v34];
        v11[1] = 0LL;
        v11[2] = 0LL;
        *v11 = 0LL;
        v12 = &v10[48 * v36];
        if ( (*(_BYTE *)v9 & 1) == 0 )
        {
          v11[2] = *(_QWORD *)(v9 + 16);
          *(_OWORD *)v11 = *(_OWORD *)v9;
          goto LABEL_19;
        }
        v13 = *(_QWORD *)(v9 + 8);
        if ( v13 >= 0xFFFFFFFFFFFFFFF0LL )
          abort();
        v14 = *(const void **)(v9 + 16);
        if ( v13 >= 0x17 )
        {
          v15 = malloc((v13 + 16) & 0xFFFFFFFFFFFFFFF0LL);
          v16 = &v10[48 * v34];
          *((_QWORD *)v16 + 1) = v13;
          *((_QWORD *)v16 + 2) = v15;
          *v11 = (v13 + 16) & 0xFFFFFFFFFFFFFFF0LL | 1;
        }
        else
        {
          *(_BYTE *)v11 = 2 * v13;
          v15 = (char *)v11 + 1;
          if ( !v13 )
            goto LABEL_18;
        }
        memcpy(v15, v14, v13);
LABEL_18:
        *((_BYTE *)v15 + v13) = 0;
        v8 = v157;
LABEL_19:
        v17 = &v10[48 * v34];
        *((_QWORD *)v17 + 3) = 0LL;
        v18 = v17 + 24;
        *((_QWORD *)v18 + 1) = 0LL;
        *((_QWORD *)v18 + 2) = 0LL;
        if ( (*(_BYTE *)(v9 + 24) & 1) == 0 )
        {
          *((_QWORD *)v18 + 2) = *(_QWORD *)(v9 + 40);
          *(_OWORD *)v18 = *(_OWORD *)(v9 + 24);
LABEL_28:
          v25 = *(void ***)a3;
          v24 = *(void ***)(a3 + 8);
          v26 = v11 + 6;
          if ( v24 == *(void ***)a3 )
          {
            v28 = *(void ***)a3;
          }
          else
          {
            do
            {
              *(v11 - 4) = (size_t)*(v24 - 4);
              *((_OWORD *)v11 - 3) = *((_OWORD *)v24 - 3);
              v27 = (size_t)*(v24 - 1);
              *(v24 - 5) = 0LL;
              *(v24 - 4) = 0LL;
              *(v24 - 6) = 0LL;
              *(v11 - 1) = v27;
              *(_OWORD *)(v11 - 3) = *(_OWORD *)(v24 - 3);
              *(v24 - 2) = 0LL;
              *(v24 - 1) = 0LL;
              *(v24 - 3) = 0LL;
              v24 -= 6;
              v11 -= 6;
            }
            while ( v25 != v24 );
            v28 = *(void ***)a3;
            v25 = *(void ***)(a3 + 8);
          }
          v29 = *(_QWORD *)(a3 + 16);
          *(_QWORD *)a3 = v11;
          *(_QWORD *)(a3 + 8) = v26;
          *(_QWORD *)(a3 + 16) = v12;
          if ( v25 != v28 )
          {
            do
            {
              if ( (*(_BYTE *)(v25 - 3) & 1) != 0 )
                free(*(v25 - 1));
              v30 = v25 - 6;
              if ( (*(_BYTE *)(v25 - 6) & 1) != 0 )
                free(*(v25 - 4));
              v25 -= 6;
            }
            while ( v28 != v30 );
          }
          if ( v28 )
          {
            v31 = *(_QWORD *)(a3 + 24);
            if ( v31 + 4096 < (unsigned __int64)v28 || v31 > (unsigned __int64)v28 )
            {
              free(v28);
            }
            else if ( *(_QWORD *)(v31 + 4096) == v29 )
            {
              *(_QWORD *)(v31 + 4096) = v28;
            }
          }
          goto LABEL_72;
        }
        v19 = *(_QWORD *)(v9 + 32);
        if ( v19 >= 0xFFFFFFFFFFFFFFF0LL )
          abort();
        v20 = *(const void **)(v9 + 40);
        if ( v19 >= 0x17 )
        {
          v22 = malloc((v19 + 16) & 0xFFFFFFFFFFFFFFF0LL);
          v23 = &v10[48 * v34];
          *((_QWORD *)v23 + 4) = v19;
          *((_QWORD *)v23 + 5) = v22;
          *(_QWORD *)v18 = (v19 + 16) & 0xFFFFFFFFFFFFFFF0LL | 1;
          v21 = v22;
        }
        else
        {
          *v18 = 2 * v19;
          v21 = v18 + 1;
          if ( !v19 )
            goto LABEL_27;
        }
        memcpy(v21, v20, v19);
LABEL_27:
        *((_BYTE *)v21 + v19) = 0;
        v8 = v157;
        goto LABEL_28;
      }
      v33[1] = 0LL;
      v33[2] = 0LL;
      *v33 = 0LL;
      if ( (*(_BYTE *)v9 & 1) == 0 )
      {
        v33[2] = *(_QWORD *)(v9 + 16);
        *(_OWORD *)v33 = *(_OWORD *)v9;
        goto LABEL_62;
      }
      v40 = *(_QWORD *)(v9 + 8);
      if ( v40 >= 0xFFFFFFFFFFFFFFF0LL )
        goto LABEL_228;
      v41 = *(const void **)(v9 + 16);
      if ( v40 >= 0x17 )
      {
        v42 = malloc((v40 + 16) & 0xFFFFFFFFFFFFFFF0LL);
        v33[1] = v40;
        v33[2] = (size_t)v42;
        *v33 = (v40 + 16) & 0xFFFFFFFFFFFFFFF0LL | 1;
      }
      else
      {
        *(_BYTE *)v33 = 2 * v40;
        v42 = (char *)v33 + 1;
        if ( !v40 )
          goto LABEL_61;
      }
      memcpy(v42, v41, v40);
LABEL_61:
      *((_BYTE *)v42 + v40) = 0;
LABEL_62:
      v33[3] = 0LL;
      v43 = v33 + 3;
      v33[4] = 0LL;
      v33[5] = 0LL;
      if ( (*(_BYTE *)(v9 + 24) & 1) != 0 )
      {
        v44 = *(_QWORD *)(v9 + 32);
        if ( v44 >= 0xFFFFFFFFFFFFFFF0LL )
          abort();
        v45 = *(const void **)(v9 + 40);
        if ( v44 >= 0x17 )
        {
          v46 = malloc((v44 + 16) & 0xFFFFFFFFFFFFFFF0LL);
          v33[4] = v44;
          v33[5] = (size_t)v46;
          v33[3] = (v44 + 16) & 0xFFFFFFFFFFFFFFF0LL | 1;
        }
        else
        {
          *v43 = 2 * v44;
          v46 = (char *)v33 + 25;
          if ( !v44 )
            goto LABEL_70;
        }
        memcpy(v46, v45, v44);
LABEL_70:
        *((_BYTE *)v46 + v44) = 0;
        goto LABEL_71;
      }
      v33[5] = *(_QWORD *)(v9 + 40);
      *(_OWORD *)v43 = *(_OWORD *)(v9 + 24);
LABEL_71:
      *(_QWORD *)(a3 + 8) += 48LL;
LABEL_72:
      v9 += 48LL;
    }
    while ( v9 != v8 );
  }
  return (__int64)(a1 + 2);
}
