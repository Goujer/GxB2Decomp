unsigned __int8 *__fastcall sub_9E1F8(_BYTE *a1, unsigned __int8 *a2, void **a3)
{
  _BYTE *v4; // x20
  void **v5; // x19
  __int64 v6; // x22
  __int64 v7; // x27
  __int64 *v8; // x8
  __int64 v9; // x20
  __int64 v10; // x28
  char *v11; // x21
  size_t *v12; // x24
  char *v13; // x25
  size_t v14; // x22
  const void *v15; // x23
  void *v16; // x27
  char *v17; // x8
  char *v18; // x22
  char *v19; // x22
  size_t v20; // x23
  const void *v21; // x27
  void *v22; // x22
  void *v23; // x0
  char *v24; // x8
  void **v25; // x9
  void **v26; // x22
  _QWORD *v27; // x8
  size_t v28; // x10
  void **v29; // x21
  void *v30; // x23
  void **v31; // x24
  unsigned __int64 v32; // x8
  char *v33; // x9
  size_t *v34; // x25
  unsigned __int64 v35; // x26
  unsigned __int64 v36; // x9
  __int64 v37; // x22
  unsigned __int64 v38; // x9
  _QWORD *v39; // x8
  size_t v40; // x0
  size_t v41; // x21
  const void *v42; // x22
  void *v43; // x23
  _BYTE *v44; // x21
  size_t v45; // x22
  const void *v46; // x23
  void *v47; // x21
  unsigned __int8 *v48; // x25
  int v49; // w8
  __int64 v50; // x23
  __int64 v51; // x22
  int v52; // w8
  char *v53; // x8
  char *v54; // x9
  unsigned __int64 v55; // x21
  unsigned __int64 v56; // x9
  unsigned __int64 v57; // x9
  _QWORD *v58; // x9
  char *v59; // x0
  char *v60; // x9
  char *v61; // x9
  _QWORD *v62; // x8
  _BYTE *v63; // x9
  char *v64; // x9
  char *v65; // x9
  unsigned __int64 v66; // x21
  unsigned __int64 v67; // x9
  unsigned __int64 v68; // x9
  _QWORD *v69; // x9
  char *v70; // x0
  unsigned __int64 v71; // x21
  unsigned __int64 v72; // x9
  unsigned __int64 v73; // x9
  _QWORD *v74; // x9
  char *v75; // x0
  unsigned __int64 v76; // x21
  unsigned __int64 v77; // x9
  unsigned __int64 v78; // x9
  _QWORD *v79; // x9
  char *v80; // x0
  unsigned __int64 v81; // x21
  unsigned __int64 v82; // x9
  unsigned __int64 v83; // x9
  _QWORD *v84; // x9
  char *v85; // x0
  unsigned __int64 v86; // x21
  unsigned __int64 v87; // x9
  unsigned __int64 v88; // x9
  _QWORD *v89; // x9
  char *v90; // x0
  _BYTE *v91; // x8
  __int64 *v92; // x8
  __int64 v93; // x26
  __int64 v94; // x28
  char *v95; // x20
  size_t *v96; // x23
  char *v97; // x24
  size_t v98; // x21
  const void *v99; // x22
  void *v100; // x27
  char *v101; // x8
  char *v102; // x21
  char *v103; // x21
  size_t v104; // x22
  const void *v105; // x27
  void *v106; // x21
  void *v107; // x0
  char *v108; // x8
  void **v109; // x9
  void **v110; // x21
  _QWORD *v111; // x8
  size_t v112; // x10
  void **v113; // x20
  void *v114; // x22
  void **v115; // x23
  unsigned __int64 v116; // x8
  char *v117; // x9
  size_t *v118; // x24
  unsigned __int64 v119; // x26
  unsigned __int64 v120; // x9
  __int64 v121; // x21
  unsigned __int64 v122; // x9
  _QWORD *v123; // x8
  size_t v124; // x0
  size_t v125; // x20
  const void *v126; // x21
  void *v127; // x22
  _BYTE *v128; // x20
  size_t v129; // x21
  const void *v130; // x22
  void *v131; // x20
  char *v132; // x8
  void **v133; // x11
  void **v134; // x22
  char *v135; // x10
  __int64 v136; // x12
  void **v137; // x21
  void *v138; // x23
  void **v139; // x24
  char *v140; // x8
  void **v141; // x11
  void **v142; // x22
  char *v143; // x10
  __int64 v144; // x12
  void **v145; // x24
  char *v146; // x8
  void **v147; // x11
  void **v148; // x22
  char *v149; // x10
  __int64 v150; // x12
  void **v151; // x24
  char *v152; // x8
  void **v153; // x11
  void **v154; // x22
  char *v155; // x10
  __int64 v156; // x12
  void **v157; // x24
  char *v158; // x8
  void **v159; // x11
  void **v160; // x22
  char *v161; // x10
  __int64 v162; // x12
  void **v163; // x24
  char *v164; // x8
  void **v165; // x11
  void **v166; // x22
  char *v167; // x10
  __int64 v168; // x12
  void **v169; // x24
  unsigned __int64 v170; // x8
  __int64 v173; // [xsp+8h] [xbp-98h]
  _QWORD v175[2]; // [xsp+28h] [xbp-78h] BYREF
  _QWORD v176[3]; // [xsp+38h] [xbp-68h] BYREF

  v4 = a1;
  v5 = a3;
  v176[2] = *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 2)) + 40);
  if ( a2 - a1 >= 2 && *a1 == 83 )
  {
    v6 = (unsigned __int8)a1[1];
    v7 = 0x555555555555555LL;
    switch ( a1[1] )
    {
      case '_':
        v8 = (__int64 *)a3[4];
        if ( v8 == a3[5] )
          return v4;
        v10 = *v8;
        v9 = v8[1];
        if ( *v8 == v9 )
          return a1 + 2;
        while ( 1 )
        {
          v34 = (size_t *)v5[1];
          v33 = (char *)v5[2];
          if ( v34 == (size_t *)v33 )
          {
            v35 = 0xAAAAAAAAAAAAAAABLL * (((char *)v34 - (_BYTE *)*v5) >> 4);
            if ( v35 + 1 > 0x555555555555555LL )
              goto LABEL_304;
            v36 = 0xAAAAAAAAAAAAAAABLL * ((v33 - (_BYTE *)*v5) >> 4);
            v37 = 0x555555555555555LL;
            if ( v36 >= 0x2AAAAAAAAAAAAAALL || ((v38 = 2 * v36, v38 >= v35 + 1) ? (v37 = v38) : (v37 = v35 + 1), v37) )
            {
              v39 = v5[3];
              v40 = 48 * v37;
              v11 = (char *)v39[512];
              if ( (char *)(v39 + 512) - v11 >= (unsigned __int64)(48 * v37) )
                v39[512] = &v11[v40];
              else
                v11 = (char *)malloc(v40);
            }
            else
            {
              v11 = 0LL;
            }
            v12 = (size_t *)&v11[48 * v35];
            v12[1] = 0LL;
            v12[2] = 0LL;
            *v12 = 0LL;
            v13 = &v11[48 * v37];
            if ( (*(_BYTE *)v10 & 1) == 0 )
            {
              v12[2] = *(_QWORD *)(v10 + 16);
              *(_OWORD *)v12 = *(_OWORD *)v10;
              goto LABEL_18;
            }
            v14 = *(_QWORD *)(v10 + 8);
            if ( v14 >= 0xFFFFFFFFFFFFFFF0LL )
              abort();
            v15 = *(const void **)(v10 + 16);
            if ( v14 >= 0x17 )
            {
              v5 = a3;
              v16 = malloc((v14 + 16) & 0xFFFFFFFFFFFFFFF0LL);
              v17 = &v11[48 * v35];
              *((_QWORD *)v17 + 1) = v14;
              *((_QWORD *)v17 + 2) = v16;
              *v12 = (v14 + 16) & 0xFFFFFFFFFFFFFFF0LL | 1;
            }
            else
            {
              *(_BYTE *)v12 = 2 * v14;
              v16 = (char *)v12 + 1;
              if ( !v14 )
                goto LABEL_17;
            }
            memcpy(v16, v15, v14);
LABEL_17:
            *((_BYTE *)v16 + v14) = 0;
LABEL_18:
            v18 = &v11[48 * v35];
            *((_QWORD *)v18 + 3) = 0LL;
            v19 = v18 + 24;
            *((_QWORD *)v19 + 1) = 0LL;
            *((_QWORD *)v19 + 2) = 0LL;
            if ( (*(_BYTE *)(v10 + 24) & 1) == 0 )
            {
              *((_QWORD *)v19 + 2) = *(_QWORD *)(v10 + 40);
              *(_OWORD *)v19 = *(_OWORD *)(v10 + 24);
LABEL_27:
              v26 = (void **)*v5;
              v25 = (void **)v5[1];
              v27 = v12 + 6;
              if ( v25 == *v5 )
              {
                v29 = (void **)*v5;
              }
              else
              {
                do
                {
                  *(v12 - 4) = (size_t)*(v25 - 4);
                  *((_OWORD *)v12 - 3) = *((_OWORD *)v25 - 3);
                  v28 = (size_t)*(v25 - 1);
                  *(v25 - 5) = 0LL;
                  *(v25 - 4) = 0LL;
                  *(v25 - 6) = 0LL;
                  *(v12 - 1) = v28;
                  *(_OWORD *)(v12 - 3) = *(_OWORD *)(v25 - 3);
                  *(v25 - 2) = 0LL;
                  *(v25 - 1) = 0LL;
                  *(v25 - 3) = 0LL;
                  v25 -= 6;
                  v12 -= 6;
                }
                while ( v26 != v25 );
                v29 = (void **)*v5;
                v26 = (void **)v5[1];
              }
              v30 = v5[2];
              *v5 = v12;
              v5[1] = v27;
              v5[2] = v13;
              if ( v26 != v29 )
              {
                do
                {
                  if ( (*(_BYTE *)(v26 - 3) & 1) != 0 )
                    free(*(v26 - 1));
                  v31 = v26 - 6;
                  if ( (*(_BYTE *)(v26 - 6) & 1) != 0 )
                    free(*(v26 - 4));
                  v26 -= 6;
                }
                while ( v29 != v31 );
              }
              if ( v29 )
              {
                v32 = (unsigned __int64)v5[3];
                if ( v32 + 4096 < (unsigned __int64)v29 || v32 > (unsigned __int64)v29 )
                {
                  free(v29);
                }
                else if ( *(void **)(v32 + 4096) == v30 )
                {
                  *(_QWORD *)(v32 + 4096) = v29;
                }
              }
              goto LABEL_71;
            }
            v20 = *(_QWORD *)(v10 + 32);
            if ( v20 >= 0xFFFFFFFFFFFFFFF0LL )
              abort();
            v21 = *(const void **)(v10 + 40);
            if ( v20 >= 0x17 )
            {
              v23 = malloc((v20 + 16) & 0xFFFFFFFFFFFFFFF0LL);
              v5 = a3;
              v24 = &v11[48 * v35];
              *((_QWORD *)v24 + 4) = v20;
              *((_QWORD *)v24 + 5) = v23;
              *(_QWORD *)v19 = (v20 + 16) & 0xFFFFFFFFFFFFFFF0LL | 1;
              v22 = v23;
            }
            else
            {
              *v19 = 2 * v20;
              v22 = v19 + 1;
              if ( !v20 )
                goto LABEL_26;
            }
            memcpy(v22, v21, v20);
LABEL_26:
            *((_BYTE *)v22 + v20) = 0;
            goto LABEL_27;
          }
          v34[1] = 0LL;
          v34[2] = 0LL;
          *v34 = 0LL;
          if ( (*(_BYTE *)v10 & 1) == 0 )
          {
            v34[2] = *(_QWORD *)(v10 + 16);
            *(_OWORD *)v34 = *(_OWORD *)v10;
            goto LABEL_61;
          }
          v41 = *(_QWORD *)(v10 + 8);
          if ( v41 >= 0xFFFFFFFFFFFFFFF0LL )
            goto LABEL_304;
          v42 = *(const void **)(v10 + 16);
          if ( v41 >= 0x17 )
          {
            v43 = malloc((v41 + 16) & 0xFFFFFFFFFFFFFFF0LL);
            v34[1] = v41;
            v34[2] = (size_t)v43;
            *v34 = (v41 + 16) & 0xFFFFFFFFFFFFFFF0LL | 1;
          }
          else
          {
            *(_BYTE *)v34 = 2 * v41;
            v43 = (char *)v34 + 1;
            if ( !v41 )
              goto LABEL_60;
          }
          memcpy(v43, v42, v41);
LABEL_60:
          *((_BYTE *)v43 + v41) = 0;
LABEL_61:
          v34[3] = 0LL;
          v44 = v34 + 3;
          v34[4] = 0LL;
          v34[5] = 0LL;
          if ( (*(_BYTE *)(v10 + 24) & 1) != 0 )
          {
            v45 = *(_QWORD *)(v10 + 32);
            if ( v45 >= 0xFFFFFFFFFFFFFFF0LL )
              abort();
            v46 = *(const void **)(v10 + 40);
            if ( v45 >= 0x17 )
            {
              v47 = malloc((v45 + 16) & 0xFFFFFFFFFFFFFFF0LL);
              v34[4] = v45;
              v34[5] = (size_t)v47;
              v34[3] = (v45 + 16) & 0xFFFFFFFFFFFFFFF0LL | 1;
            }
            else
            {
              *v44 = 2 * v45;
              v47 = (char *)v34 + 25;
              if ( !v45 )
                goto LABEL_69;
            }
            memcpy(v47, v46, v45);
LABEL_69:
            *((_BYTE *)v47 + v45) = 0;
            goto LABEL_70;
          }
          v34[5] = *(_QWORD *)(v10 + 40);
          *(_OWORD *)v44 = *(_OWORD *)(v10 + 24);
LABEL_70:
          v5[1] = (char *)v5[1] + 48;
LABEL_71:
          v10 += 48LL;
          if ( v10 == v9 )
            return a1 + 2;
        }
      case 'a':
        *(_QWORD *)((char *)v176 + 7) = 0LL;
        v176[0] = 0LL;
        qmemcpy(v175, "std::allocator", 14);
        v53 = (char *)a3[1];
        v60 = (char *)a3[2];
        if ( v53 < v60 )
        {
          *v53 = 28;
          v4 = a1 + 2;
          *(_QWORD *)(v53 + 7) = *(_QWORD *)((char *)v175 + 6);
          v53[15] = 0;
          *((_QWORD *)v53 + 2) = 0LL;
          *(_QWORD *)(v53 + 1) = v175[0];
          *(_QWORD *)((char *)v175 + 6) = 0LL;
          goto LABEL_106;
        }
        v66 = 0xAAAAAAAAAAAAAAABLL * ((v53 - (_BYTE *)*a3) >> 4);
        if ( v66 + 1 > 0x555555555555555LL )
          abort();
        v67 = 0xAAAAAAAAAAAAAAABLL * ((v60 - (_BYTE *)*a3) >> 4);
        if ( v67 >= 0x2AAAAAAAAAAAAAALL || ((v68 = 2 * v67, v68 >= v66 + 1) ? (v7 = v68) : (v7 = v66 + 1), v7) )
        {
          v69 = a3[3];
          v70 = (char *)v69[512];
          if ( (char *)(v69 + 512) - v70 >= (unsigned __int64)(48 * v7) )
            v69[512] = &v70[48 * v7];
          else
            v70 = (char *)malloc(48 * v7);
        }
        else
        {
          v70 = 0LL;
        }
        v140 = &v70[48 * v66];
        *v140 = 28;
        *(_QWORD *)(v140 + 7) = *(_QWORD *)((char *)v175 + 6);
        v140[15] = 0;
        *((_QWORD *)v140 + 2) = 0LL;
        *(_QWORD *)(v140 + 1) = v175[0];
        *(_QWORD *)((char *)v175 + 6) = 0LL;
        v175[0] = 0LL;
        v140[24] = 0;
        *((_QWORD *)v140 + 4) = *(_QWORD *)((char *)v176 + 7);
        *((_QWORD *)v140 + 5) = 0LL;
        *(_QWORD *)(v140 + 25) = v176[0];
        *(_QWORD *)((char *)v176 + 7) = 0LL;
        v176[0] = 0LL;
        v142 = (void **)*v5;
        v141 = (void **)v5[1];
        v143 = v140 + 48;
        if ( v141 == *v5 )
        {
          v137 = (void **)*v5;
        }
        else
        {
          do
          {
            *((_QWORD *)v140 - 4) = *(v141 - 4);
            *((_OWORD *)v140 - 3) = *((_OWORD *)v141 - 3);
            v144 = (__int64)*(v141 - 1);
            *(v141 - 5) = 0LL;
            *(v141 - 4) = 0LL;
            *(v141 - 6) = 0LL;
            *((_QWORD *)v140 - 1) = v144;
            *(_OWORD *)(v140 - 24) = *(_OWORD *)(v141 - 3);
            *(v141 - 2) = 0LL;
            *(v141 - 1) = 0LL;
            *(v141 - 3) = 0LL;
            v141 -= 6;
            v140 -= 48;
          }
          while ( v142 != v141 );
          v137 = (void **)*v5;
          v142 = (void **)v5[1];
        }
        v138 = v5[2];
        *v5 = v140;
        v5[1] = v143;
        v5[2] = &v70[48 * v7];
        if ( v142 != v137 )
        {
          do
          {
            if ( (*(_BYTE *)(v142 - 3) & 1) != 0 )
              free(*(v142 - 1));
            v145 = v142 - 6;
            if ( (*(_BYTE *)(v142 - 6) & 1) != 0 )
              free(*(v142 - 4));
            v142 -= 6;
          }
          while ( v137 != v145 );
        }
        goto LABEL_296;
      case 'b':
        memset(v175, 0, 15);
        qmemcpy(v176, "std::basic_stri", 15);
        v62 = a3[1];
        v63 = a3[2];
        if ( v62 < (_QWORD *)v63 )
        {
          *(_BYTE *)v62 = 34;
          v4 = a1 + 2;
          v62[1] = *(_QWORD *)((char *)v176 + 7);
          v62[2] = 26478LL;
          *(_QWORD *)((char *)v62 + 1) = v176[0];
          *(_QWORD *)((char *)v176 + 7) = 0LL;
          v176[0] = 0LL;
          *((_BYTE *)v62 + 24) = 0;
          v62[4] = *(_QWORD *)((char *)v175 + 7);
          v62[5] = 0LL;
          *(_QWORD *)((char *)v62 + 25) = v175[0];
          memset(v175, 0, 15);
          goto LABEL_108;
        }
        v76 = 0xAAAAAAAAAAAAAAABLL * (((char *)v62 - (_BYTE *)*a3) >> 4);
        if ( v76 + 1 > 0x555555555555555LL )
          abort();
        v77 = 0xAAAAAAAAAAAAAAABLL * ((v63 - (_BYTE *)*a3) >> 4);
        if ( v77 >= 0x2AAAAAAAAAAAAAALL || ((v78 = 2 * v77, v78 >= v76 + 1) ? (v7 = v78) : (v7 = v76 + 1), v7) )
        {
          v79 = a3[3];
          v80 = (char *)v79[512];
          if ( (char *)(v79 + 512) - v80 >= (unsigned __int64)(48 * v7) )
            v79[512] = &v80[48 * v7];
          else
            v80 = (char *)malloc(48 * v7);
        }
        else
        {
          v80 = 0LL;
        }
        v152 = &v80[48 * v76];
        *v152 = 34;
        *((_QWORD *)v152 + 1) = *(_QWORD *)((char *)v176 + 7);
        *((_QWORD *)v152 + 2) = 26478LL;
        *(_QWORD *)(v152 + 1) = v176[0];
        *(_QWORD *)((char *)v176 + 7) = 0LL;
        v176[0] = 0LL;
        v152[24] = 0;
        *((_QWORD *)v152 + 4) = *(_QWORD *)((char *)v175 + 7);
        *((_QWORD *)v152 + 5) = 0LL;
        *(_QWORD *)(v152 + 25) = v175[0];
        memset(v175, 0, 15);
        v154 = (void **)*v5;
        v153 = (void **)v5[1];
        v155 = v152 + 48;
        if ( v153 == *v5 )
        {
          v137 = (void **)*v5;
        }
        else
        {
          do
          {
            *((_QWORD *)v152 - 4) = *(v153 - 4);
            *((_OWORD *)v152 - 3) = *((_OWORD *)v153 - 3);
            v156 = (__int64)*(v153 - 1);
            *(v153 - 5) = 0LL;
            *(v153 - 4) = 0LL;
            *(v153 - 6) = 0LL;
            *((_QWORD *)v152 - 1) = v156;
            *(_OWORD *)(v152 - 24) = *(_OWORD *)(v153 - 3);
            *(v153 - 2) = 0LL;
            *(v153 - 1) = 0LL;
            *(v153 - 3) = 0LL;
            v153 -= 6;
            v152 -= 48;
          }
          while ( v154 != v153 );
          v137 = (void **)*v5;
          v154 = (void **)v5[1];
        }
        v138 = v5[2];
        *v5 = v152;
        v5[1] = v155;
        v5[2] = &v80[48 * v7];
        if ( v154 != v137 )
        {
          do
          {
            if ( (*(_BYTE *)(v154 - 3) & 1) != 0 )
              free(*(v154 - 1));
            v157 = v154 - 6;
            if ( (*(_BYTE *)(v154 - 6) & 1) != 0 )
              free(*(v154 - 4));
            v154 -= 6;
          }
          while ( v137 != v157 );
        }
        goto LABEL_296;
      case 'd':
        *(_QWORD *)((char *)v176 + 7) = 0LL;
        v176[0] = 0LL;
        qmemcpy(v175, "std::iostream", 13);
        v53 = (char *)a3[1];
        v64 = (char *)a3[2];
        if ( v53 < v64 )
        {
          *v53 = 26;
          v4 = a1 + 2;
          *(_QWORD *)(v53 + 6) = *(_QWORD *)((char *)v175 + 5);
          *((_WORD *)v53 + 7) = 0;
          *((_QWORD *)v53 + 2) = 0LL;
          *(_QWORD *)(v53 + 1) = v175[0];
          *(_QWORD *)((char *)v175 + 5) = 0LL;
          goto LABEL_106;
        }
        v81 = 0xAAAAAAAAAAAAAAABLL * ((v53 - (_BYTE *)*a3) >> 4);
        if ( v81 + 1 > 0x555555555555555LL )
          abort();
        v82 = 0xAAAAAAAAAAAAAAABLL * ((v64 - (_BYTE *)*a3) >> 4);
        if ( v82 >= 0x2AAAAAAAAAAAAAALL || ((v83 = 2 * v82, v83 >= v81 + 1) ? (v7 = v83) : (v7 = v81 + 1), v7) )
        {
          v84 = a3[3];
          v85 = (char *)v84[512];
          if ( (char *)(v84 + 512) - v85 >= (unsigned __int64)(48 * v7) )
            v84[512] = &v85[48 * v7];
          else
            v85 = (char *)malloc(48 * v7);
        }
        else
        {
          v85 = 0LL;
        }
        v158 = &v85[48 * v81];
        *v158 = 26;
        *(_QWORD *)(v158 + 6) = *(_QWORD *)((char *)v175 + 5);
        *((_WORD *)v158 + 7) = 0;
        *((_QWORD *)v158 + 2) = 0LL;
        *(_QWORD *)(v158 + 1) = v175[0];
        *(_QWORD *)((char *)v175 + 5) = 0LL;
        v175[0] = 0LL;
        v158[24] = 0;
        *((_QWORD *)v158 + 4) = *(_QWORD *)((char *)v176 + 7);
        *((_QWORD *)v158 + 5) = 0LL;
        *(_QWORD *)(v158 + 25) = v176[0];
        *(_QWORD *)((char *)v176 + 7) = 0LL;
        v176[0] = 0LL;
        v160 = (void **)*v5;
        v159 = (void **)v5[1];
        v161 = v158 + 48;
        if ( v159 == *v5 )
        {
          v137 = (void **)*v5;
        }
        else
        {
          do
          {
            *((_QWORD *)v158 - 4) = *(v159 - 4);
            *((_OWORD *)v158 - 3) = *((_OWORD *)v159 - 3);
            v162 = (__int64)*(v159 - 1);
            *(v159 - 5) = 0LL;
            *(v159 - 4) = 0LL;
            *(v159 - 6) = 0LL;
            *((_QWORD *)v158 - 1) = v162;
            *(_OWORD *)(v158 - 24) = *(_OWORD *)(v159 - 3);
            *(v159 - 2) = 0LL;
            *(v159 - 1) = 0LL;
            *(v159 - 3) = 0LL;
            v159 -= 6;
            v158 -= 48;
          }
          while ( v160 != v159 );
          v137 = (void **)*v5;
          v160 = (void **)v5[1];
        }
        v138 = v5[2];
        *v5 = v158;
        v5[1] = v161;
        v5[2] = &v85[48 * v7];
        if ( v160 != v137 )
        {
          do
          {
            if ( (*(_BYTE *)(v160 - 3) & 1) != 0 )
              free(*(v160 - 1));
            v163 = v160 - 6;
            if ( (*(_BYTE *)(v160 - 6) & 1) != 0 )
              free(*(v160 - 4));
            v160 -= 6;
          }
          while ( v137 != v163 );
        }
        goto LABEL_296;
      case 'i':
        *(_QWORD *)((char *)v176 + 7) = 0LL;
        v176[0] = 0LL;
        qmemcpy(v175, "std::istream", 12);
        v53 = (char *)a3[1];
        v65 = (char *)a3[2];
        if ( v53 < v65 )
          goto LABEL_105;
        v86 = 0xAAAAAAAAAAAAAAABLL * ((v53 - (_BYTE *)*a3) >> 4);
        if ( v86 + 1 > 0x555555555555555LL )
          abort();
        v87 = 0xAAAAAAAAAAAAAAABLL * ((v65 - (_BYTE *)*a3) >> 4);
        if ( v87 >= 0x2AAAAAAAAAAAAAALL || ((v88 = 2 * v87, v88 >= v86 + 1) ? (v7 = v88) : (v7 = v86 + 1), v7) )
        {
          v89 = a3[3];
          v90 = (char *)v89[512];
          if ( (char *)(v89 + 512) - v90 >= (unsigned __int64)(48 * v7) )
            v89[512] = &v90[48 * v7];
          else
            v90 = (char *)malloc(48 * v7);
        }
        else
        {
          v90 = 0LL;
        }
        v164 = &v90[48 * v86];
        *v164 = 24;
        *(_DWORD *)(v164 + 9) = v175[1];
        v164[13] = 0;
        *((_WORD *)v164 + 7) = 0;
        *((_QWORD *)v164 + 2) = 0LL;
        *(_QWORD *)(v164 + 1) = v175[0];
        LODWORD(v175[1]) = 0;
        v175[0] = 0LL;
        v164[24] = 0;
        *((_QWORD *)v164 + 4) = *(_QWORD *)((char *)v176 + 7);
        *((_QWORD *)v164 + 5) = 0LL;
        *(_QWORD *)(v164 + 25) = v176[0];
        *(_QWORD *)((char *)v176 + 7) = 0LL;
        v176[0] = 0LL;
        v166 = (void **)*v5;
        v165 = (void **)v5[1];
        v167 = v164 + 48;
        if ( v165 == *v5 )
        {
          v137 = (void **)*v5;
        }
        else
        {
          do
          {
            *((_QWORD *)v164 - 4) = *(v165 - 4);
            *((_OWORD *)v164 - 3) = *((_OWORD *)v165 - 3);
            v168 = (__int64)*(v165 - 1);
            *(v165 - 5) = 0LL;
            *(v165 - 4) = 0LL;
            *(v165 - 6) = 0LL;
            *((_QWORD *)v164 - 1) = v168;
            *(_OWORD *)(v164 - 24) = *(_OWORD *)(v165 - 3);
            *(v165 - 2) = 0LL;
            *(v165 - 1) = 0LL;
            *(v165 - 3) = 0LL;
            v165 -= 6;
            v164 -= 48;
          }
          while ( v166 != v165 );
          v137 = (void **)*v5;
          v166 = (void **)v5[1];
        }
        v138 = v5[2];
        *v5 = v164;
        v5[1] = v167;
        v5[2] = &v90[48 * v7];
        if ( v166 != v137 )
        {
          do
          {
            if ( (*(_BYTE *)(v166 - 3) & 1) != 0 )
              free(*(v166 - 1));
            v169 = v166 - 6;
            if ( (*(_BYTE *)(v166 - 6) & 1) != 0 )
              free(*(v166 - 4));
            v166 -= 6;
          }
          while ( v137 != v169 );
        }
        goto LABEL_296;
      case 'o':
        *(_QWORD *)((char *)v176 + 7) = 0LL;
        v176[0] = 0LL;
        qmemcpy(v175, "std::ostream", 12);
        v53 = (char *)a3[1];
        v54 = (char *)a3[2];
        if ( v53 >= v54 )
        {
          v55 = 0xAAAAAAAAAAAAAAABLL * ((v53 - (_BYTE *)*a3) >> 4);
          if ( v55 + 1 > 0x555555555555555LL )
            abort();
          v56 = 0xAAAAAAAAAAAAAAABLL * ((v54 - (_BYTE *)*a3) >> 4);
          if ( v56 >= 0x2AAAAAAAAAAAAAALL || ((v57 = 2 * v56, v57 >= v55 + 1) ? (v7 = v57) : (v7 = v55 + 1), v7) )
          {
            v58 = a3[3];
            v59 = (char *)v58[512];
            if ( (char *)(v58 + 512) - v59 >= (unsigned __int64)(48 * v7) )
              v58[512] = &v59[48 * v7];
            else
              v59 = (char *)malloc(48 * v7);
          }
          else
          {
            v59 = 0LL;
          }
          v132 = &v59[48 * v55];
          *v132 = 24;
          *(_DWORD *)(v132 + 9) = v175[1];
          v132[13] = 0;
          *((_WORD *)v132 + 7) = 0;
          *((_QWORD *)v132 + 2) = 0LL;
          *(_QWORD *)(v132 + 1) = v175[0];
          LODWORD(v175[1]) = 0;
          v175[0] = 0LL;
          v132[24] = 0;
          *((_QWORD *)v132 + 4) = *(_QWORD *)((char *)v176 + 7);
          *((_QWORD *)v132 + 5) = 0LL;
          *(_QWORD *)(v132 + 25) = v176[0];
          *(_QWORD *)((char *)v176 + 7) = 0LL;
          v176[0] = 0LL;
          v134 = (void **)*v5;
          v133 = (void **)v5[1];
          v135 = v132 + 48;
          if ( v133 == *v5 )
          {
            v137 = (void **)*v5;
          }
          else
          {
            do
            {
              *((_QWORD *)v132 - 4) = *(v133 - 4);
              *((_OWORD *)v132 - 3) = *((_OWORD *)v133 - 3);
              v136 = (__int64)*(v133 - 1);
              *(v133 - 5) = 0LL;
              *(v133 - 4) = 0LL;
              *(v133 - 6) = 0LL;
              *((_QWORD *)v132 - 1) = v136;
              *(_OWORD *)(v132 - 24) = *(_OWORD *)(v133 - 3);
              *(v133 - 2) = 0LL;
              *(v133 - 1) = 0LL;
              *(v133 - 3) = 0LL;
              v133 -= 6;
              v132 -= 48;
            }
            while ( v134 != v133 );
            v137 = (void **)*v5;
            v134 = (void **)v5[1];
          }
          v138 = v5[2];
          *v5 = v132;
          v5[1] = v135;
          v5[2] = &v59[48 * v7];
          if ( v134 != v137 )
          {
            do
            {
              if ( (*(_BYTE *)(v134 - 3) & 1) != 0 )
                free(*(v134 - 1));
              v139 = v134 - 6;
              if ( (*(_BYTE *)(v134 - 6) & 1) != 0 )
                free(*(v134 - 4));
              v134 -= 6;
            }
            while ( v137 != v139 );
          }
          goto LABEL_296;
        }
LABEL_105:
        *v53 = 24;
        v4 = a1 + 2;
        *(_DWORD *)(v53 + 9) = v175[1];
        v53[13] = 0;
        *((_WORD *)v53 + 7) = 0;
        *((_QWORD *)v53 + 2) = 0LL;
        *(_QWORD *)(v53 + 1) = v175[0];
        LODWORD(v175[1]) = 0;
LABEL_106:
        v175[0] = 0LL;
        goto LABEL_107;
      case 's':
        *(_QWORD *)((char *)v176 + 7) = 0LL;
        v176[0] = 0LL;
        qmemcpy(v175, "std::string", 11);
        v53 = (char *)a3[1];
        v61 = (char *)a3[2];
        if ( v53 >= v61 )
        {
          v71 = 0xAAAAAAAAAAAAAAABLL * ((v53 - (_BYTE *)*a3) >> 4);
          if ( v71 + 1 > 0x555555555555555LL )
            abort();
          v72 = 0xAAAAAAAAAAAAAAABLL * ((v61 - (_BYTE *)*a3) >> 4);
          if ( v72 >= 0x2AAAAAAAAAAAAAALL || ((v73 = 2 * v72, v73 >= v71 + 1) ? (v7 = v73) : (v7 = v71 + 1), v7) )
          {
            v74 = a3[3];
            v75 = (char *)v74[512];
            if ( (char *)(v74 + 512) - v75 >= (unsigned __int64)(48 * v7) )
              v74[512] = &v75[48 * v7];
            else
              v75 = (char *)malloc(48 * v7);
          }
          else
          {
            v75 = 0LL;
          }
          v146 = &v75[48 * v71];
          *v146 = 22;
          *(_QWORD *)(v146 + 1) = v175[0];
          v146[11] = BYTE2(v175[1]);
          v146[12] = 0;
          *(_WORD *)(v146 + 9) = v175[1];
          *(_WORD *)(v146 + 13) = 0;
          *((_QWORD *)v146 + 2) = 0LL;
          v146[15] = 0;
          v175[0] = 0LL;
          LOWORD(v175[1]) = 0;
          BYTE2(v175[1]) = 0;
          v146[24] = 0;
          *((_QWORD *)v146 + 4) = *(_QWORD *)((char *)v176 + 7);
          *((_QWORD *)v146 + 5) = 0LL;
          *(_QWORD *)(v146 + 25) = v176[0];
          *(_QWORD *)((char *)v176 + 7) = 0LL;
          v176[0] = 0LL;
          v148 = (void **)*v5;
          v147 = (void **)v5[1];
          v149 = v146 + 48;
          if ( v147 == *v5 )
          {
            v137 = (void **)*v5;
          }
          else
          {
            do
            {
              *((_QWORD *)v146 - 4) = *(v147 - 4);
              *((_OWORD *)v146 - 3) = *((_OWORD *)v147 - 3);
              v150 = (__int64)*(v147 - 1);
              *(v147 - 5) = 0LL;
              *(v147 - 4) = 0LL;
              *(v147 - 6) = 0LL;
              *((_QWORD *)v146 - 1) = v150;
              *(_OWORD *)(v146 - 24) = *(_OWORD *)(v147 - 3);
              *(v147 - 2) = 0LL;
              *(v147 - 1) = 0LL;
              *(v147 - 3) = 0LL;
              v147 -= 6;
              v146 -= 48;
            }
            while ( v148 != v147 );
            v137 = (void **)*v5;
            v148 = (void **)v5[1];
          }
          v138 = v5[2];
          *v5 = v146;
          v5[1] = v149;
          v5[2] = &v75[48 * v7];
          if ( v148 != v137 )
          {
            do
            {
              if ( (*(_BYTE *)(v148 - 3) & 1) != 0 )
                free(*(v148 - 1));
              v151 = v148 - 6;
              if ( (*(_BYTE *)(v148 - 6) & 1) != 0 )
                free(*(v148 - 4));
              v148 -= 6;
            }
            while ( v137 != v151 );
          }
LABEL_296:
          if ( v137 )
          {
            v170 = (unsigned __int64)v5[3];
            if ( v170 + 4096 < (unsigned __int64)v137 || v170 > (unsigned __int64)v137 )
            {
              free(v137);
            }
            else if ( *(void **)(v170 + 4096) == v138 )
            {
              *(_QWORD *)(v170 + 4096) = v137;
            }
          }
          v4 += 2;
        }
        else
        {
          *v53 = 22;
          v4 = a1 + 2;
          *(_QWORD *)(v53 + 1) = v175[0];
          v53[11] = BYTE2(v175[1]);
          v53[12] = 0;
          *(_WORD *)(v53 + 9) = v175[1];
          *(_WORD *)(v53 + 13) = 0;
          *((_QWORD *)v53 + 2) = 0LL;
          v53[15] = 0;
          v175[0] = 0LL;
          LOWORD(v175[1]) = 0;
          BYTE2(v175[1]) = 0;
LABEL_107:
          v53[24] = 0;
          *((_QWORD *)v53 + 4) = *(_QWORD *)((char *)v176 + 7);
          *((_QWORD *)v53 + 5) = 0LL;
          *(_QWORD *)(v53 + 25) = v176[0];
          *(_QWORD *)((char *)v176 + 7) = 0LL;
          v176[0] = 0LL;
LABEL_108:
          a3[1] = (char *)a3[1] + 48;
        }
        return v4;
      default:
        if ( (unsigned int)(v6 - 48) >= 0xA && !isupper(v6) )
          return v4;
        v48 = v4 + 2;
        if ( v4 + 2 == a2 )
          return v4;
        if ( (unsigned int)(v6 - 48) >= 0xA )
          v49 = -55;
        else
          v49 = -48;
        v50 = v6 + v49;
        while ( 1 )
        {
          v51 = *v48;
          if ( (unsigned int)(v51 - 48) >= 0xA && !isupper(v51) )
            break;
          if ( (unsigned int)(v51 - 48) >= 0xA )
            v52 = -55;
          else
            v52 = -48;
          ++v48;
          v50 = v51 + v52 + 36 * v50;
          if ( a2 == v48 )
            return v4;
        }
        if ( (_DWORD)v51 != 95 )
          return v4;
        v91 = v5[4];
        if ( v50 + 1 >= (unsigned __int64)(((_BYTE *)v5[5] - v91) >> 5) )
          return v4;
        v92 = (__int64 *)&v91[32 * v50 + 32];
        v94 = *v92;
        v93 = v92[1];
        if ( *v92 == v93 )
          return v48 + 1;
        v173 = v92[1];
        break;
    }
    while ( 1 )
    {
      v118 = (size_t *)v5[1];
      v117 = (char *)v5[2];
      if ( v118 == (size_t *)v117 )
      {
        v119 = 0xAAAAAAAAAAAAAAABLL * (((char *)v118 - (_BYTE *)*v5) >> 4);
        if ( v119 + 1 > 0x555555555555555LL )
          goto LABEL_304;
        v120 = 0xAAAAAAAAAAAAAAABLL * ((v117 - (_BYTE *)*v5) >> 4);
        v121 = 0x555555555555555LL;
        if ( v120 >= 0x2AAAAAAAAAAAAAALL
          || ((v122 = 2 * v120, v122 >= v119 + 1) ? (v121 = v122) : (v121 = v119 + 1), v121) )
        {
          v123 = v5[3];
          v124 = 48 * v121;
          v95 = (char *)v123[512];
          if ( (char *)(v123 + 512) - v95 >= (unsigned __int64)(48 * v121) )
            v123[512] = &v95[v124];
          else
            v95 = (char *)malloc(v124);
        }
        else
        {
          v95 = 0LL;
        }
        v96 = (size_t *)&v95[48 * v119];
        v96[1] = 0LL;
        v96[2] = 0LL;
        *v96 = 0LL;
        v97 = &v95[48 * v121];
        if ( (*(_BYTE *)v94 & 1) == 0 )
        {
          v96[2] = *(_QWORD *)(v94 + 16);
          *(_OWORD *)v96 = *(_OWORD *)v94;
          goto LABEL_170;
        }
        v98 = *(_QWORD *)(v94 + 8);
        if ( v98 >= 0xFFFFFFFFFFFFFFF0LL )
          abort();
        v99 = *(const void **)(v94 + 16);
        if ( v98 >= 0x17 )
        {
          v100 = malloc((v98 + 16) & 0xFFFFFFFFFFFFFFF0LL);
          v101 = &v95[48 * v119];
          *((_QWORD *)v101 + 1) = v98;
          *((_QWORD *)v101 + 2) = v100;
          *v96 = (v98 + 16) & 0xFFFFFFFFFFFFFFF0LL | 1;
        }
        else
        {
          *(_BYTE *)v96 = 2 * v98;
          v100 = (char *)v96 + 1;
          if ( !v98 )
            goto LABEL_169;
        }
        memcpy(v100, v99, v98);
LABEL_169:
        *((_BYTE *)v100 + v98) = 0;
LABEL_170:
        v102 = &v95[48 * v119];
        *((_QWORD *)v102 + 3) = 0LL;
        v103 = v102 + 24;
        *((_QWORD *)v103 + 1) = 0LL;
        *((_QWORD *)v103 + 2) = 0LL;
        if ( (*(_BYTE *)(v94 + 24) & 1) == 0 )
        {
          *((_QWORD *)v103 + 2) = *(_QWORD *)(v94 + 40);
          *(_OWORD *)v103 = *(_OWORD *)(v94 + 24);
          v93 = v173;
LABEL_179:
          v110 = (void **)*v5;
          v109 = (void **)v5[1];
          v111 = v96 + 6;
          if ( v109 == *v5 )
          {
            v113 = (void **)*v5;
          }
          else
          {
            do
            {
              *(v96 - 4) = (size_t)*(v109 - 4);
              *((_OWORD *)v96 - 3) = *((_OWORD *)v109 - 3);
              v112 = (size_t)*(v109 - 1);
              *(v109 - 5) = 0LL;
              *(v109 - 4) = 0LL;
              *(v109 - 6) = 0LL;
              *(v96 - 1) = v112;
              *(_OWORD *)(v96 - 3) = *(_OWORD *)(v109 - 3);
              *(v109 - 2) = 0LL;
              *(v109 - 1) = 0LL;
              *(v109 - 3) = 0LL;
              v109 -= 6;
              v96 -= 6;
            }
            while ( v110 != v109 );
            v113 = (void **)*v5;
            v110 = (void **)v5[1];
          }
          v114 = v5[2];
          *v5 = v96;
          v5[1] = v111;
          v5[2] = v97;
          if ( v110 != v113 )
          {
            do
            {
              if ( (*(_BYTE *)(v110 - 3) & 1) != 0 )
                free(*(v110 - 1));
              v115 = v110 - 6;
              if ( (*(_BYTE *)(v110 - 6) & 1) != 0 )
                free(*(v110 - 4));
              v110 -= 6;
            }
            while ( v113 != v115 );
          }
          if ( v113 )
          {
            v116 = (unsigned __int64)v5[3];
            if ( v116 + 4096 < (unsigned __int64)v113 || v116 > (unsigned __int64)v113 )
            {
              free(v113);
            }
            else if ( *(void **)(v116 + 4096) == v114 )
            {
              *(_QWORD *)(v116 + 4096) = v113;
            }
          }
          goto LABEL_223;
        }
        v104 = *(_QWORD *)(v94 + 32);
        if ( v104 >= 0xFFFFFFFFFFFFFFF0LL )
          abort();
        v105 = *(const void **)(v94 + 40);
        if ( v104 >= 0x17 )
        {
          v107 = malloc((v104 + 16) & 0xFFFFFFFFFFFFFFF0LL);
          v108 = &v95[48 * v119];
          *((_QWORD *)v108 + 4) = v104;
          *((_QWORD *)v108 + 5) = v107;
          *(_QWORD *)v103 = (v104 + 16) & 0xFFFFFFFFFFFFFFF0LL | 1;
          v93 = v173;
          v106 = v107;
        }
        else
        {
          *v103 = 2 * v104;
          v106 = v103 + 1;
          v93 = v173;
          if ( !v104 )
            goto LABEL_178;
        }
        memcpy(v106, v105, v104);
LABEL_178:
        *((_BYTE *)v106 + v104) = 0;
        goto LABEL_179;
      }
      v118[1] = 0LL;
      v118[2] = 0LL;
      *v118 = 0LL;
      if ( (*(_BYTE *)v94 & 1) == 0 )
      {
        v118[2] = *(_QWORD *)(v94 + 16);
        *(_OWORD *)v118 = *(_OWORD *)v94;
        goto LABEL_213;
      }
      v125 = *(_QWORD *)(v94 + 8);
      if ( v125 >= 0xFFFFFFFFFFFFFFF0LL )
LABEL_304:
        abort();
      v126 = *(const void **)(v94 + 16);
      if ( v125 >= 0x17 )
      {
        v127 = malloc((v125 + 16) & 0xFFFFFFFFFFFFFFF0LL);
        v118[1] = v125;
        v118[2] = (size_t)v127;
        *v118 = (v125 + 16) & 0xFFFFFFFFFFFFFFF0LL | 1;
      }
      else
      {
        *(_BYTE *)v118 = 2 * v125;
        v127 = (char *)v118 + 1;
        if ( !v125 )
          goto LABEL_212;
      }
      memcpy(v127, v126, v125);
LABEL_212:
      *((_BYTE *)v127 + v125) = 0;
LABEL_213:
      v118[3] = 0LL;
      v128 = v118 + 3;
      v118[4] = 0LL;
      v118[5] = 0LL;
      if ( (*(_BYTE *)(v94 + 24) & 1) != 0 )
      {
        v129 = *(_QWORD *)(v94 + 32);
        if ( v129 >= 0xFFFFFFFFFFFFFFF0LL )
          abort();
        v130 = *(const void **)(v94 + 40);
        if ( v129 >= 0x17 )
        {
          v131 = malloc((v129 + 16) & 0xFFFFFFFFFFFFFFF0LL);
          v118[4] = v129;
          v118[5] = (size_t)v131;
          v118[3] = (v129 + 16) & 0xFFFFFFFFFFFFFFF0LL | 1;
        }
        else
        {
          *v128 = 2 * v129;
          v131 = (char *)v118 + 25;
          if ( !v129 )
            goto LABEL_221;
        }
        memcpy(v131, v130, v129);
LABEL_221:
        *((_BYTE *)v131 + v129) = 0;
        goto LABEL_222;
      }
      v118[5] = *(_QWORD *)(v94 + 40);
      *(_OWORD *)v128 = *(_OWORD *)(v94 + 24);
LABEL_222:
      v5[1] = (char *)v5[1] + 48;
LABEL_223:
      v94 += 48LL;
      if ( v94 == v93 )
        return v48 + 1;
    }
  }
  return v4;
}
