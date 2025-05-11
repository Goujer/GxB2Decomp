__int64 __fastcall sub_A9F34(_BYTE *a1, _BYTE *a2, _QWORD *a3)
{
  _BYTE *v4; // x20
  int v6; // w8
  _BOOL4 v7; // w26
  _BYTE *v8; // x22
  __int64 v9; // x23
  __int64 v10; // x8
  _BYTE *v11; // x24
  _BYTE *v12; // x23
  _BYTE *v13; // x0
  _BYTE *v14; // x22
  _BYTE *v15; // x23
  __int64 v16; // x22
  unsigned __int64 v17; // x8
  bool v18; // zf
  size_t v19; // x8
  void *v20; // x1
  size_t v21; // x2
  __int64 v22; // x22
  _BYTE *v23; // x24
  char v24; // w24
  size_t *v25; // x0
  void *v26; // x22
  char *v27; // x1
  size_t v28; // x2
  int v29; // w26
  _BYTE *v30; // x22
  __int64 v31; // x21
  __int64 v32; // x22
  unsigned __int64 v33; // x8
  bool v34; // zf
  size_t v35; // x8
  void *v36; // x1
  size_t v37; // x2
  __int64 v38; // x22
  _BYTE *v39; // x20
  __int128 v40; // q0
  char *v41; // x8
  char v42; // w22
  void *v43; // x20
  size_t *v44; // x0
  char *v45; // x1
  size_t v46; // x2
  _BYTE *v47; // x0
  _BYTE *v48; // x23
  _BYTE *v49; // x22
  __int64 v50; // x23
  unsigned __int64 v51; // x8
  bool v52; // zf
  size_t v53; // x8
  void *v54; // x1
  size_t v55; // x2
  __int64 v56; // x23
  _BYTE *v57; // x24
  size_t *v58; // x0
  void *v59; // x23
  char *v60; // x1
  size_t v61; // x2
  __int64 v62; // x22
  unsigned __int64 v63; // x8
  bool v64; // zf
  size_t v65; // x8
  void *v66; // x1
  size_t v67; // x2
  __int64 v68; // x22
  _BYTE *v69; // x20
  __int128 v70; // q0
  char *v71; // x8
  __int64 v72; // x0
  _BYTE *v73; // x22
  __int64 v74; // x8
  _BYTE *v75; // x22
  __int64 v76; // x22
  unsigned __int64 v77; // x8
  bool v78; // zf
  size_t v79; // x8
  void *v80; // x1
  size_t v81; // x2
  __int64 v82; // x22
  _BYTE *v83; // x20
  __int128 v84; // q0
  char *v85; // x8
  __int64 v86; // x21
  _BYTE *v87; // x22
  _BYTE *v89; // x24
  __int64 v90; // x0
  __int64 v91; // x24
  unsigned __int64 v92; // x8
  bool v93; // zf
  size_t v94; // x8
  void *v95; // x1
  size_t v96; // x2
  __int64 v97; // x24
  _BYTE *v98; // x23
  __int128 v99; // q0
  char *v100; // x8
  char v101; // w23
  void *v102; // x24
  char *v103; // x1
  size_t v104; // x2
  _BYTE *v105; // x24
  __int64 v106; // x0
  __int64 v107; // x24
  unsigned __int64 v108; // x8
  bool v109; // zf
  size_t v110; // x8
  void *v111; // x1
  size_t v112; // x2
  __int64 v113; // x24
  _BYTE *v114; // x23
  __int128 v115; // q0
  char *v116; // x8
  char v117; // w23
  void *v118; // x24
  char *v119; // x1
  size_t v120; // x2
  __int64 v121; // x27
  _BYTE *v122; // x26
  __int128 v123; // [xsp+0h] [xbp-90h] BYREF
  char *v124; // [xsp+10h] [xbp-80h]
  __int128 v125; // [xsp+20h] [xbp-70h] BYREF
  void *p; // [xsp+30h] [xbp-60h]
  __int64 v127; // [xsp+38h] [xbp-58h]

  v4 = a1;
  v127 = *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 2)) + 40);
  if ( a2 - a1 < 3 )
    return (__int64)v4;
  if ( *a1 == 103 )
  {
    v6 = (unsigned __int8)a1[1];
    v7 = v6 == 115;
    if ( v6 == 115 )
      v8 = a1 + 2;
    else
      v8 = a1;
  }
  else
  {
    v7 = 0;
    v8 = a1;
  }
  v9 = sub_AB388(v8, a2, a3);
  if ( (_BYTE *)v9 == v8 )
  {
    if ( a2 - v8 < 3 || *v8 != 115 || v8[1] != 114 )
      return (__int64)v4;
    v11 = v8 + 2;
    if ( v8[2] != 78 )
    {
      v47 = (_BYTE *)sub_AB6CC(v8 + 2, a2, a3);
      v48 = v47;
      if ( v47 == v11 )
      {
        v72 = sub_B1788(v8 + 2, a2, a3);
        v73 = (_BYTE *)v72;
        if ( (_BYTE *)v72 == v11 || (_BYTE *)v72 == a2 )
          return (__int64)v4;
        if ( v7 )
        {
          v74 = a3[1];
          if ( *a3 == v74 )
            return (__int64)v4;
          sub_9CDD8((size_t *)(v74 - 48), 0LL, "::", 2uLL);
        }
        while ( *v73 != 69 )
        {
          v105 = v73;
          v106 = sub_B1788(v73, a2, a3);
          v73 = (_BYTE *)v106;
          if ( (_BYTE *)v106 == v105 )
            return (__int64)v4;
          if ( (_BYTE *)v106 == a2 )
            return (__int64)v4;
          v107 = a3[1];
          if ( 0xAAAAAAAAAAAAAAABLL * ((v107 - *a3) >> 4) < 2 )
            return (__int64)v4;
          v108 = *(unsigned __int8 *)(v107 - 24);
          v109 = (v108 & 1) == 0;
          v110 = v108 >> 1;
          if ( v109 )
            v111 = (void *)(v107 - 23);
          else
            v111 = *(void **)(v107 - 8);
          if ( v109 )
            v112 = v110;
          else
            v112 = *(_QWORD *)(v107 - 16);
          sub_9CFD0((size_t *)(v107 - 48), v111, v112);
          p = *(void **)(v107 - 32);
          v125 = *(_OWORD *)(v107 - 48);
          *(_QWORD *)(v107 - 40) = 0LL;
          *(_QWORD *)(v107 - 32) = 0LL;
          *(_QWORD *)(v107 - 48) = 0LL;
          v113 = a3[1];
          v114 = (_BYTE *)(v113 - 48);
          if ( (*(_BYTE *)(v113 - 24) & 1) != 0 )
            free(*(void **)(v113 - 8));
          if ( (*v114 & 1) != 0 )
            free(*(void **)(v113 - 32));
          a3[1] = v114;
          sub_9CDD8((size_t *)&v125, 0LL, "::", 2uLL);
          v115 = v125;
          v116 = (char *)p;
          p = 0LL;
          v125 = 0uLL;
          v123 = v115;
          v124 = v116;
          v117 = v115;
          v118 = v116;
          if ( (v115 & 1) != 0 )
            v119 = v116;
          else
            v119 = (char *)&v123 + 1;
          if ( (v115 & 1) != 0 )
            v120 = *((_QWORD *)&v115 + 1);
          else
            v120 = (unsigned __int64)(unsigned __int8)v115 >> 1;
          sub_9CFD0((size_t *)(a3[1] - 48LL), v119, v120);
          if ( (v117 & 1) != 0 )
            free(v118);
          if ( (v125 & 1) != 0 )
            free(p);
        }
        v75 = v73 + 1;
        v31 = sub_AB388(v75, a2, a3);
        if ( (_BYTE *)v31 == v75 )
          goto LABEL_129;
        v76 = a3[1];
        if ( 0xAAAAAAAAAAAAAAABLL * ((v76 - *a3) >> 4) < 2 )
          return (__int64)v4;
        v77 = *(unsigned __int8 *)(v76 - 24);
        v78 = (v77 & 1) == 0;
        v79 = v77 >> 1;
        if ( v78 )
          v80 = (void *)(v76 - 23);
        else
          v80 = *(void **)(v76 - 8);
        if ( v78 )
          v81 = v79;
        else
          v81 = *(_QWORD *)(v76 - 16);
        sub_9CFD0((size_t *)(v76 - 48), v80, v81);
        p = *(void **)(v76 - 32);
        v125 = *(_OWORD *)(v76 - 48);
        *(_QWORD *)(v76 - 40) = 0LL;
        *(_QWORD *)(v76 - 32) = 0LL;
        *(_QWORD *)(v76 - 48) = 0LL;
        v82 = a3[1];
        v83 = (_BYTE *)(v82 - 48);
        if ( (*(_BYTE *)(v82 - 24) & 1) != 0 )
          free(*(void **)(v82 - 8));
        if ( (*v83 & 1) != 0 )
          free(*(void **)(v82 - 32));
        a3[1] = v83;
        sub_9CDD8((size_t *)&v125, 0LL, "::", 2uLL);
        v84 = v125;
        v85 = (char *)p;
        p = 0LL;
        v125 = 0uLL;
        v123 = v84;
        v124 = v85;
        v42 = v84;
        v43 = v85;
        v44 = (size_t *)(a3[1] - 48LL);
        if ( (v84 & 1) != 0 )
          v45 = v85;
        else
          v45 = (char *)&v123 + 1;
        if ( (v84 & 1) != 0 )
          v46 = *((_QWORD *)&v84 + 1);
        else
          v46 = (unsigned __int64)(unsigned __int8)v84 >> 1;
      }
      else
      {
        v49 = sub_9D3DC(v47, a2, (__int64)a3);
        if ( v49 != v48 )
        {
          v50 = a3[1];
          if ( 0xAAAAAAAAAAAAAAABLL * ((v50 - *a3) >> 4) < 2 )
            return (__int64)v4;
          v51 = *(unsigned __int8 *)(v50 - 24);
          v52 = (v51 & 1) == 0;
          v53 = v51 >> 1;
          if ( v52 )
            v54 = (void *)(v50 - 23);
          else
            v54 = *(void **)(v50 - 8);
          if ( v52 )
            v55 = v53;
          else
            v55 = *(_QWORD *)(v50 - 16);
          sub_9CFD0((size_t *)(v50 - 48), v54, v55);
          p = *(void **)(v50 - 32);
          v125 = *(_OWORD *)(v50 - 48);
          *(_QWORD *)(v50 - 40) = 0LL;
          *(_QWORD *)(v50 - 32) = 0LL;
          *(_QWORD *)(v50 - 48) = 0LL;
          v56 = a3[1];
          v57 = (_BYTE *)(v56 - 48);
          if ( (*(_BYTE *)(v56 - 24) & 1) != 0 )
            free(*(void **)(v56 - 8));
          if ( (*v57 & 1) != 0 )
            free(*(void **)(v56 - 32));
          a3[1] = v57;
          v58 = (size_t *)(v56 - 96);
          v59 = p;
          if ( (v125 & 1) != 0 )
            v60 = (char *)p;
          else
            v60 = (char *)&v125 + 1;
          if ( (v125 & 1) != 0 )
            v61 = *((_QWORD *)&v125 + 1);
          else
            v61 = (unsigned __int64)(unsigned __int8)v125 >> 1;
          sub_9CFD0(v58, v60, v61);
          if ( (v125 & 1) != 0 )
            free(v59);
          v48 = v49;
        }
        v31 = sub_AB388(v48, a2, a3);
        if ( (_BYTE *)v31 == v48 )
          goto LABEL_129;
        v62 = a3[1];
        if ( 0xAAAAAAAAAAAAAAABLL * ((v62 - *a3) >> 4) < 2 )
          return (__int64)v4;
        v63 = *(unsigned __int8 *)(v62 - 24);
        v64 = (v63 & 1) == 0;
        v65 = v63 >> 1;
        if ( v64 )
          v66 = (void *)(v62 - 23);
        else
          v66 = *(void **)(v62 - 8);
        if ( v64 )
          v67 = v65;
        else
          v67 = *(_QWORD *)(v62 - 16);
        sub_9CFD0((size_t *)(v62 - 48), v66, v67);
        p = *(void **)(v62 - 32);
        v125 = *(_OWORD *)(v62 - 48);
        *(_QWORD *)(v62 - 40) = 0LL;
        *(_QWORD *)(v62 - 32) = 0LL;
        *(_QWORD *)(v62 - 48) = 0LL;
        v68 = a3[1];
        v69 = (_BYTE *)(v68 - 48);
        if ( (*(_BYTE *)(v68 - 24) & 1) != 0 )
          free(*(void **)(v68 - 8));
        if ( (*v69 & 1) != 0 )
          free(*(void **)(v68 - 32));
        a3[1] = v69;
        sub_9CDD8((size_t *)&v125, 0LL, "::", 2uLL);
        v70 = v125;
        v71 = (char *)p;
        p = 0LL;
        v125 = 0uLL;
        v123 = v70;
        v124 = v71;
        v42 = v70;
        v43 = v71;
        v44 = (size_t *)(a3[1] - 48LL);
        if ( (v70 & 1) != 0 )
          v45 = v71;
        else
          v45 = (char *)&v123 + 1;
        if ( (v70 & 1) != 0 )
          v46 = *((_QWORD *)&v70 + 1);
        else
          v46 = (unsigned __int64)(unsigned __int8)v70 >> 1;
      }
LABEL_100:
      sub_9CFD0(v44, v45, v46);
      if ( (v42 & 1) != 0 )
        free(v43);
      if ( (v125 & 1) != 0 )
        free(p);
      return v31;
    }
    v12 = v8 + 3;
    v13 = (_BYTE *)sub_AB6CC(v8 + 3, a2, a3);
    v14 = v13;
    if ( v13 == v12 || v13 == a2 )
      return (__int64)v4;
    v15 = sub_9D3DC(v13, a2, (__int64)a3);
    if ( v15 == v14 )
    {
LABEL_41:
      while ( *v14 != 69 )
      {
        v89 = v14;
        v90 = sub_B1788(v14, a2, a3);
        v14 = (_BYTE *)v90;
        if ( (_BYTE *)v90 == v89 )
          return (__int64)v4;
        if ( (_BYTE *)v90 == a2 )
          return (__int64)v4;
        v91 = a3[1];
        if ( 0xAAAAAAAAAAAAAAABLL * ((v91 - *a3) >> 4) < 2 )
          return (__int64)v4;
        v92 = *(unsigned __int8 *)(v91 - 24);
        v93 = (v92 & 1) == 0;
        v94 = v92 >> 1;
        if ( v93 )
          v95 = (void *)(v91 - 23);
        else
          v95 = *(void **)(v91 - 8);
        if ( v93 )
          v96 = v94;
        else
          v96 = *(_QWORD *)(v91 - 16);
        sub_9CFD0((size_t *)(v91 - 48), v95, v96);
        p = *(void **)(v91 - 32);
        v125 = *(_OWORD *)(v91 - 48);
        *(_QWORD *)(v91 - 40) = 0LL;
        *(_QWORD *)(v91 - 32) = 0LL;
        *(_QWORD *)(v91 - 48) = 0LL;
        v97 = a3[1];
        v98 = (_BYTE *)(v97 - 48);
        if ( (*(_BYTE *)(v97 - 24) & 1) != 0 )
          free(*(void **)(v97 - 8));
        if ( (*v98 & 1) != 0 )
          free(*(void **)(v97 - 32));
        a3[1] = v98;
        sub_9CDD8((size_t *)&v125, 0LL, "::", 2uLL);
        v99 = v125;
        v100 = (char *)p;
        p = 0LL;
        v125 = 0uLL;
        v123 = v99;
        v124 = v100;
        v101 = v99;
        v102 = v100;
        if ( (v99 & 1) != 0 )
          v103 = v100;
        else
          v103 = (char *)&v123 + 1;
        if ( (v99 & 1) != 0 )
          v104 = *((_QWORD *)&v99 + 1);
        else
          v104 = (unsigned __int64)(unsigned __int8)v99 >> 1;
        sub_9CFD0((size_t *)(a3[1] - 48LL), v103, v104);
        if ( (v101 & 1) != 0 )
          free(v102);
        if ( (v125 & 1) != 0 )
          free(p);
      }
      v30 = v14 + 1;
      v31 = sub_AB388(v30, a2, a3);
      if ( (_BYTE *)v31 != v30 )
      {
        v32 = a3[1];
        if ( 0xAAAAAAAAAAAAAAABLL * ((v32 - *a3) >> 4) < 2 )
          return (__int64)v4;
        v33 = *(unsigned __int8 *)(v32 - 24);
        v34 = (v33 & 1) == 0;
        v35 = v33 >> 1;
        if ( v34 )
          v36 = (void *)(v32 - 23);
        else
          v36 = *(void **)(v32 - 8);
        if ( v34 )
          v37 = v35;
        else
          v37 = *(_QWORD *)(v32 - 16);
        sub_9CFD0((size_t *)(v32 - 48), v36, v37);
        p = *(void **)(v32 - 32);
        v125 = *(_OWORD *)(v32 - 48);
        *(_QWORD *)(v32 - 40) = 0LL;
        *(_QWORD *)(v32 - 32) = 0LL;
        *(_QWORD *)(v32 - 48) = 0LL;
        v38 = a3[1];
        v39 = (_BYTE *)(v38 - 48);
        if ( (*(_BYTE *)(v38 - 24) & 1) != 0 )
          free(*(void **)(v38 - 8));
        if ( (*v39 & 1) != 0 )
          free(*(void **)(v38 - 32));
        a3[1] = v39;
        sub_9CDD8((size_t *)&v125, 0LL, "::", 2uLL);
        v40 = v125;
        v41 = (char *)p;
        p = 0LL;
        v125 = 0uLL;
        v123 = v40;
        v124 = v41;
        v42 = v40;
        v43 = v41;
        v44 = (size_t *)(a3[1] - 48LL);
        if ( (v40 & 1) != 0 )
          v45 = v41;
        else
          v45 = (char *)&v123 + 1;
        if ( (v40 & 1) != 0 )
          v46 = *((_QWORD *)&v40 + 1);
        else
          v46 = (unsigned __int64)(unsigned __int8)v40 >> 1;
        goto LABEL_100;
      }
LABEL_129:
      v86 = a3[1];
      if ( *a3 != v86 )
      {
        v87 = (_BYTE *)(v86 - 48);
        if ( (*(_BYTE *)(v86 - 24) & 1) != 0 )
          free(*(void **)(v86 - 8));
        if ( (*v87 & 1) != 0 )
          free(*(void **)(v86 - 32));
        a3[1] = v87;
      }
      return (__int64)v4;
    }
    v16 = a3[1];
    if ( 0xAAAAAAAAAAAAAAABLL * ((v16 - *a3) >> 4) < 2 )
      return (__int64)v4;
    v17 = *(unsigned __int8 *)(v16 - 24);
    v18 = (v17 & 1) == 0;
    v19 = v17 >> 1;
    if ( v18 )
      v20 = (void *)(v16 - 23);
    else
      v20 = *(void **)(v16 - 8);
    if ( v18 )
      v21 = v19;
    else
      v21 = *(_QWORD *)(v16 - 16);
    sub_9CFD0((size_t *)(v16 - 48), v20, v21);
    p = *(void **)(v16 - 32);
    v125 = *(_OWORD *)(v16 - 48);
    *(_QWORD *)(v16 - 40) = 0LL;
    *(_QWORD *)(v16 - 32) = 0LL;
    *(_QWORD *)(v16 - 48) = 0LL;
    v22 = a3[1];
    v23 = (_BYTE *)(v22 - 48);
    if ( (*(_BYTE *)(v22 - 24) & 1) != 0 )
      free(*(void **)(v22 - 8));
    if ( (*v23 & 1) != 0 )
      free(*(void **)(v22 - 32));
    a3[1] = v23;
    v24 = v125;
    v25 = (size_t *)(v22 - 96);
    v26 = p;
    if ( (v125 & 1) != 0 )
      v27 = (char *)p;
    else
      v27 = (char *)&v125 + 1;
    if ( (v125 & 1) != 0 )
      v28 = *((_QWORD *)&v125 + 1);
    else
      v28 = (unsigned __int64)(unsigned __int8)v125 >> 1;
    sub_9CFD0(v25, v27, v28);
    if ( v15 == a2 )
    {
      v121 = a3[1];
      v122 = (_BYTE *)(v121 - 48);
      if ( (*(_BYTE *)(v121 - 24) & 1) != 0 )
        free(*(void **)(v121 - 8));
      if ( (*v122 & 1) != 0 )
        free(*(void **)(v121 - 32));
      a3[1] = v122;
      v29 = 1;
      if ( (v24 & 1) == 0 )
        goto LABEL_39;
    }
    else
    {
      v29 = 0;
      if ( (v125 & 1) == 0 )
      {
LABEL_39:
        if ( v29 )
          return (__int64)v4;
        v14 = v15;
        goto LABEL_41;
      }
    }
    free(v26);
    goto LABEL_39;
  }
  if ( !v7 )
    return v9;
  v10 = a3[1];
  if ( *a3 != v10 )
  {
    sub_9CDD8((size_t *)(v10 - 48), 0LL, "::", 2uLL);
    return v9;
  }
  return (__int64)v4;
}
