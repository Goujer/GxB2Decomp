unsigned __int8 *__fastcall sub_9AA00(unsigned __int8 *a1, unsigned __int8 *a2, __int64 a3, _BYTE *a4)
{
  unsigned __int8 *v4; // x20
  unsigned __int8 *v5; // x19
  _BYTE *v6; // x26
  unsigned __int8 *v8; // x22
  int v9; // w8
  unsigned __int8 *v10; // x23
  unsigned __int8 *v11; // x8
  int v12; // w9
  int v13; // w25
  unsigned __int8 *v14; // x0
  unsigned __int8 *v15; // x24
  int v16; // w8
  int v17; // w9
  int v18; // w9
  _BYTE *v19; // x27
  char v20; // w26
  unsigned __int8 *v21; // x24
  __int64 v22; // x0
  unsigned __int8 *v23; // x25
  bool v24; // zf
  unsigned __int8 *v25; // x24
  __int64 v26; // x8
  __int64 v27; // x8
  unsigned __int64 v28; // x8
  unsigned __int64 v29; // x9
  void **v30; // x23
  int v31; // t1
  unsigned __int8 *v32; // x26
  _BOOL4 v33; // w27
  int v34; // w8
  int v35; // w8
  unsigned __int8 *v36; // x0
  unsigned __int8 *v37; // x23
  __int64 v38; // x22
  unsigned __int64 v39; // x8
  bool v40; // zf
  size_t v41; // x8
  void *v42; // x1
  size_t v43; // x2
  __int64 v44; // x22
  _BYTE *v45; // x23
  __int64 v46; // x8
  size_t *v47; // x0
  char v48; // w22
  char *v49; // x1
  void *v50; // x2
  int v51; // w21
  unsigned __int64 v52; // x8
  _OWORD *v53; // x9
  unsigned __int64 v54; // x27
  __int64 v55; // x24
  unsigned __int64 v56; // x8
  unsigned __int64 v57; // x8
  __int64 v58; // x9
  char *v59; // x0
  unsigned __int8 *v60; // x8
  unsigned __int8 *v61; // x9
  int v62; // w10
  unsigned __int8 *v63; // x0
  int v64; // w8
  int v65; // w8
  __int64 v66; // x10
  __int64 v67; // x23
  __int64 v68; // x9
  unsigned __int64 v69; // x9
  __int64 v70; // x22
  char *v71; // x0
  char *v72; // x8
  __int64 v73; // x11
  __int64 v74; // x25
  char *v75; // x9
  _OWORD *v76; // x10
  __int64 v77; // x12
  void *v78; // x24
  void *v79; // x27
  unsigned __int64 v80; // x8
  int v81; // w24
  __int64 v82; // x10
  __int64 v83; // x26
  __int64 v84; // x9
  unsigned __int64 v85; // x9
  __int64 v86; // x24
  char *v87; // x0
  __int64 v88; // x9
  char *v89; // x8
  char *v90; // x10
  void **v91; // x11
  void **v92; // x26
  char *v93; // x9
  __int128 v94; // t1
  void **v95; // x27
  __int64 v96; // x24
  unsigned __int64 v97; // x8
  void **v98; // x26
  char *v99; // x8
  char *v100; // x10
  void **v101; // x11
  void **v102; // x26
  char *v103; // x9
  __int128 v104; // t1
  void **v105; // x27
  __int64 v106; // x24
  unsigned __int64 v107; // x8
  void **v108; // x26
  char *v109; // x8
  char *v110; // x10
  void **v111; // x11
  void **v112; // x26
  char *v113; // x9
  __int128 v114; // t1
  void **v115; // x27
  __int64 v116; // x24
  unsigned __int64 v117; // x8
  void **v118; // x26
  __int64 v119; // x24
  __int64 v120; // x9
  char *v121; // x0
  char *v122; // x8
  char *v123; // x10
  void **v124; // x11
  void **v125; // x26
  char *v126; // x9
  __int128 v127; // t1
  void **v128; // x27
  __int64 v129; // x24
  unsigned __int64 v130; // x8
  void **v131; // x26
  void **v132; // x24
  void **v133; // x27
  int v134; // w27
  void **v135; // x24
  void **v136; // x27
  void **v137; // x24
  void **v138; // x27
  void **v139; // x24
  void **v140; // x27
  unsigned __int8 *v141; // x0
  unsigned __int8 *v142; // x25
  __int64 v143; // x24
  unsigned __int64 v144; // x8
  bool v145; // zf
  size_t v146; // x8
  void *v147; // x1
  size_t v148; // x2
  __int64 v149; // x24
  _BYTE *v150; // x27
  __int64 v151; // x8
  unsigned __int64 v152; // x8
  char *v153; // x1
  size_t v154; // x2
  __int64 v155; // x0
  unsigned __int8 *v156; // x25
  __int64 v157; // x24
  unsigned __int64 v158; // x8
  bool v159; // zf
  size_t v160; // x8
  void *v161; // x1
  size_t v162; // x2
  __int64 v163; // x24
  _BYTE *v164; // x27
  __int64 v165; // x8
  unsigned __int64 v166; // x8
  char *v167; // x1
  size_t v168; // x2
  unsigned __int8 *v169; // x0
  unsigned __int8 *v170; // x25
  __int64 v171; // x24
  unsigned __int64 v172; // x8
  bool v173; // zf
  size_t v174; // x8
  void *v175; // x1
  size_t v176; // x2
  __int64 v177; // x24
  _BYTE *v178; // x27
  __int64 v179; // x8
  char *v180; // x1
  size_t v181; // x2
  __int64 v182; // x1
  unsigned __int64 v183; // x8
  unsigned __int64 v184; // x9
  __int64 v185; // x0
  unsigned __int8 *v186; // x25
  __int64 v187; // x24
  unsigned __int64 v188; // x8
  bool v189; // zf
  size_t v190; // x8
  void *v191; // x1
  size_t v192; // x2
  __int64 v193; // x24
  _BYTE *v194; // x27
  __int64 v195; // x8
  unsigned __int64 v196; // x8
  char *v197; // x1
  size_t v198; // x2
  unsigned __int8 *v199; // x0
  __int64 v200; // x24
  unsigned __int64 v201; // x8
  bool v202; // zf
  size_t v203; // x8
  void *v204; // x1
  size_t v205; // x2
  __int64 v206; // x24
  _BYTE *v207; // x27
  __int64 v208; // x8
  unsigned __int64 v209; // x8
  char *v210; // x1
  size_t v211; // x2
  void *v212; // x2
  char *v213; // x1
  __int64 v214; // x1
  unsigned __int64 v215; // x8
  unsigned __int64 v216; // x9
  void **v217; // x26
  __int64 v218; // x10
  __int64 v219; // x26
  __int64 v220; // x9
  unsigned __int64 v221; // x9
  __int64 v222; // x24
  char *v223; // x0
  void *v224; // x2
  char *v225; // x1
  __int64 v226; // x1
  unsigned __int64 v227; // x8
  unsigned __int64 v228; // x9
  __int64 v229; // x10
  __int64 v230; // x24
  __int64 v231; // x9
  unsigned __int64 v232; // x9
  __int64 v233; // x27
  char *v234; // x0
  __int64 v235; // x10
  __int64 v236; // x26
  __int64 v237; // x9
  unsigned __int64 v238; // x9
  __int64 v239; // x24
  char *v240; // x0
  void *v241; // x2
  char *v242; // x1
  __int64 v243; // x1
  unsigned __int64 v244; // x8
  unsigned __int64 v245; // x9
  __int64 v246; // x10
  __int64 v247; // x26
  __int64 v248; // x9
  unsigned __int64 v249; // x9
  __int64 v250; // x9
  void *v251; // x2
  char *v252; // x1
  __int64 v253; // x1
  unsigned __int64 v254; // x8
  unsigned __int64 v255; // x9
  char *v256; // x8
  char *v257; // x10
  void **v258; // x11
  void **v259; // x26
  char *v260; // x9
  __int128 v261; // t1
  void **v262; // x27
  __int64 v263; // x24
  unsigned __int64 v264; // x8
  __int64 v265; // x9
  __int64 v266; // x9
  void **v267; // x24
  void **v268; // x27
  __int64 v269; // x24
  _BYTE *v270; // x20
  __int64 v271; // x8
  __int64 v272; // x20
  __int64 v273; // x9
  unsigned __int8 *v274; // x9
  int v275; // t1
  char *v276; // x8
  char *v277; // x10
  void **v278; // x11
  void **v279; // x23
  char *v280; // x9
  __int128 v281; // t1
  void **v282; // x25
  __int64 v283; // x22
  unsigned __int64 v284; // x8
  void **v285; // x22
  void **v286; // x25
  __int64 v287; // x22
  unsigned __int64 v288; // x8
  bool v289; // zf
  size_t v290; // x8
  void *v291; // x1
  size_t v292; // x2
  __int64 v293; // x22
  _BYTE *v294; // x23
  __int64 v295; // x8
  size_t *v296; // x0
  char *v297; // x1
  void *v298; // x2
  unsigned __int8 *v299; // x8
  int v300; // t1
  unsigned __int8 *v301; // x24
  __int64 v302; // x24
  unsigned __int64 v303; // x8
  bool v304; // zf
  size_t v305; // x8
  void *v306; // x1
  size_t v307; // x2
  __int64 v308; // x24
  _BYTE *v309; // x25
  __int64 v310; // x8
  char *v311; // x1
  void *v312; // x2
  int v313; // w24
  __int64 v314; // x20
  _BYTE *v315; // x24
  unsigned __int8 *v317; // x8
  int v318; // t1
  unsigned __int8 *v319; // x9
  int v320; // w10
  __int64 v321; // x8
  unsigned __int8 *v322; // x8
  int v323; // w9
  __int64 v324; // x23
  unsigned __int64 v325; // x8
  bool v326; // zf
  size_t v327; // x8
  void *v328; // x1
  size_t v329; // x2
  __int64 v330; // x23
  _BYTE *v331; // x24
  __int64 v332; // x8
  char *v333; // x1
  void *v334; // x2
  int v335; // w24
  int v336; // [xsp+4h] [xbp-BCh]
  __int64 v337; // [xsp+8h] [xbp-B8h]
  int v339; // [xsp+18h] [xbp-A8h]
  _BOOL4 v340; // [xsp+24h] [xbp-9Ch]
  char v341; // [xsp+24h] [xbp-9Ch]
  __int64 v342; // [xsp+28h] [xbp-98h] BYREF
  void *v343[2]; // [xsp+30h] [xbp-90h] BYREF
  void *p; // [xsp+40h] [xbp-80h]
  unsigned __int64 v345; // [xsp+48h] [xbp-78h]
  __int128 v346; // [xsp+50h] [xbp-70h] BYREF
  void *v347; // [xsp+60h] [xbp-60h]
  __int64 v348; // [xsp+68h] [xbp-58h]

  v4 = a2;
  v5 = a1;
  v6 = a4;
  v348 = *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 2)) + 40);
  if ( a2 - a1 < 2 )
    return v5;
  if ( *a1 == 76 )
    v8 = a1 + 1;
  else
    v8 = a1;
  v9 = *v8;
  v10 = v8;
  if ( v9 == 90 )
  {
    if ( v8 == a2 )
      goto LABEL_633;
    v14 = sub_91038(v8 + 1, a2, (__int64 *)a3);
    if ( v14 == v8 + 1 )
      goto LABEL_632;
    if ( v14 == v4 )
      goto LABEL_632;
    if ( *v14 != 69 )
      goto LABEL_632;
    v15 = v14 + 1;
    if ( v14 + 1 == v4 )
      goto LABEL_632;
    v16 = *v15;
    if ( v16 != 100 )
    {
      if ( v16 == 115 )
      {
        if ( v14 + 2 == v4 )
          goto LABEL_649;
        v17 = v14[2];
        if ( v17 == 95 )
        {
          if ( v14 + 3 != v4 )
          {
            v18 = v14[3];
            if ( (unsigned int)(v18 - 48) <= 9 )
            {
              v4 = v14 + 4;
              goto LABEL_649;
            }
            if ( v18 == 95 )
            {
              v319 = v14 + 4;
              if ( v14 + 4 != v4 )
              {
                while ( 1 )
                {
                  v320 = *v319;
                  if ( (unsigned int)(v320 - 48) > 9 )
                    break;
                  if ( v4 == ++v319 )
                    goto LABEL_648;
                }
                if ( v320 == 95 )
                  v4 = v319 + 1;
                else
                  v4 = v14 + 2;
                goto LABEL_649;
              }
            }
          }
        }
        else if ( (unsigned int)(v17 - 48) <= 9 )
        {
          v274 = v14 + 3;
          while ( v4 != v274 )
          {
            v275 = *v274++;
            if ( (unsigned int)(v275 - 48) >= 0xA )
              goto LABEL_648;
          }
          goto LABEL_649;
        }
LABEL_648:
        v4 = v14 + 2;
LABEL_649:
        v321 = *(_QWORD *)(a3 + 8);
        if ( *(_QWORD *)a3 != v321 )
          sub_9CFD0((size_t *)(v321 - 48), "::string literal", 0x10uLL);
        goto LABEL_633;
      }
      v63 = (unsigned __int8 *)sub_9AA00(v14 + 1, v4, a3, v6);
      if ( v63 != v15 )
      {
        if ( v63 == v4 )
          goto LABEL_656;
        v64 = *v63;
        if ( v64 == 95 )
        {
          if ( v63 + 1 != v4 )
          {
            v65 = v63[1];
            if ( (unsigned int)(v65 - 48) <= 9 )
            {
              v4 = v63 + 2;
              goto LABEL_656;
            }
            if ( v65 == 95 )
            {
              v322 = v63 + 2;
              if ( v63 + 2 != v4 )
              {
                while ( 1 )
                {
                  v323 = *v322;
                  if ( (unsigned int)(v323 - 48) > 9 )
                    break;
                  if ( v4 == ++v322 )
                    goto LABEL_655;
                }
                if ( v323 == 95 )
                  v4 = v322 + 1;
                else
                  v4 = v63;
                goto LABEL_656;
              }
            }
          }
        }
        else if ( (unsigned int)(v64 - 48) <= 9 )
        {
          v317 = v63 + 1;
          while ( v4 != v317 )
          {
            v318 = *v317++;
            if ( (unsigned int)(v318 - 48) >= 0xA )
              goto LABEL_655;
          }
LABEL_656:
          v324 = *(_QWORD *)(a3 + 8);
          if ( 0xAAAAAAAAAAAAAAABLL * ((v324 - *(_QWORD *)a3) >> 4) < 2 )
            goto LABEL_633;
          v325 = *(unsigned __int8 *)(v324 - 24);
          v326 = (v325 & 1) == 0;
          v327 = v325 >> 1;
          if ( v326 )
            v328 = (void *)(v324 - 23);
          else
            v328 = *(void **)(v324 - 8);
          if ( v326 )
            v329 = v327;
          else
            v329 = *(_QWORD *)(v324 - 16);
          sub_9CFD0((size_t *)(v324 - 48), v328, v329);
          p = *(void **)(v324 - 32);
          *(_OWORD *)v343 = *(_OWORD *)(v324 - 48);
          *(_QWORD *)(v324 - 40) = 0LL;
          *(_QWORD *)(v324 - 32) = 0LL;
          *(_QWORD *)(v324 - 48) = 0LL;
          v330 = *(_QWORD *)(a3 + 8);
          v331 = (_BYTE *)(v330 - 48);
          if ( (*(_BYTE *)(v330 - 24) & 1) != 0 )
            free(*(void **)(v330 - 8));
          if ( (*v331 & 1) != 0 )
            free(*(void **)(v330 - 32));
          v332 = *(_QWORD *)a3;
          *(_QWORD *)(a3 + 8) = v331;
          if ( (_BYTE *)v332 == v331 )
          {
            v335 = 1;
            if ( ((__int64)v343[0] & 1) != 0 )
LABEL_675:
              free(p);
          }
          else
          {
            sub_9CFD0((size_t *)(v330 - 96), "::", 2uLL);
            if ( ((__int64)v343[0] & 1) != 0 )
              v333 = (char *)p;
            else
              v333 = (char *)v343 + 1;
            if ( ((__int64)v343[0] & 1) != 0 )
              v334 = v343[1];
            else
              v334 = (void *)((unsigned __int64)LOBYTE(v343[0]) >> 1);
            sub_9CFD0((size_t *)(*(_QWORD *)(a3 + 8) - 48LL), v333, (size_t)v334);
            v335 = 0;
            if ( ((__int64)v343[0] & 1) != 0 )
              goto LABEL_675;
          }
          v10 = v4;
          if ( v335 )
          {
LABEL_634:
            if ( v10 == v8 )
              return v5;
            else
              return v10;
          }
LABEL_633:
          v10 = v4;
          goto LABEL_634;
        }
LABEL_655:
        v4 = v63;
        goto LABEL_656;
      }
      goto LABEL_626;
    }
    v60 = v14 + 2;
    if ( v14 + 2 == v4 )
      goto LABEL_632;
    if ( v14[2] == 110 )
      v61 = v14 + 3;
    else
      v61 = v14 + 2;
    if ( v61 != v4 )
    {
      v62 = *v61;
      if ( v62 == 48 )
      {
        v60 = v61 + 1;
        if ( v61 + 1 == v4 )
          goto LABEL_632;
LABEL_602:
        if ( *v60 == 95 )
        {
          v301 = v60 + 1;
          v4 = (unsigned __int8 *)sub_9AA00(v60 + 1, v4, a3, v6);
          if ( v4 == v301 )
          {
LABEL_626:
            v314 = *(_QWORD *)(a3 + 8);
            if ( *(_QWORD *)a3 != v314 )
            {
              v315 = (_BYTE *)(v314 - 48);
              if ( (*(_BYTE *)(v314 - 24) & 1) != 0 )
                free(*(void **)(v314 - 8));
              if ( (*v315 & 1) != 0 )
                free(*(void **)(v314 - 32));
              *(_QWORD *)(a3 + 8) = v315;
            }
            goto LABEL_632;
          }
          v302 = *(_QWORD *)(a3 + 8);
          if ( 0xAAAAAAAAAAAAAAABLL * ((v302 - *(_QWORD *)a3) >> 4) < 2 )
            goto LABEL_634;
          v303 = *(unsigned __int8 *)(v302 - 24);
          v304 = (v303 & 1) == 0;
          v305 = v303 >> 1;
          if ( v304 )
            v306 = (void *)(v302 - 23);
          else
            v306 = *(void **)(v302 - 8);
          if ( v304 )
            v307 = v305;
          else
            v307 = *(_QWORD *)(v302 - 16);
          sub_9CFD0((size_t *)(v302 - 48), v306, v307);
          p = *(void **)(v302 - 32);
          *(_OWORD *)v343 = *(_OWORD *)(v302 - 48);
          *(_QWORD *)(v302 - 40) = 0LL;
          *(_QWORD *)(v302 - 32) = 0LL;
          *(_QWORD *)(v302 - 48) = 0LL;
          v308 = *(_QWORD *)(a3 + 8);
          v309 = (_BYTE *)(v308 - 48);
          if ( (*(_BYTE *)(v308 - 24) & 1) != 0 )
            free(*(void **)(v308 - 8));
          if ( (*v309 & 1) != 0 )
            free(*(void **)(v308 - 32));
          v310 = *(_QWORD *)a3;
          *(_QWORD *)(a3 + 8) = v309;
          if ( (_BYTE *)v310 == v309 )
          {
            v313 = 1;
            v4 = v8;
            if ( ((__int64)v343[0] & 1) != 0 )
LABEL_623:
              free(p);
          }
          else
          {
            sub_9CFD0((size_t *)(v308 - 96), "::", 2uLL);
            if ( ((__int64)v343[0] & 1) != 0 )
              v311 = (char *)p;
            else
              v311 = (char *)v343 + 1;
            if ( ((__int64)v343[0] & 1) != 0 )
              v312 = v343[1];
            else
              v312 = (void *)((unsigned __int64)LOBYTE(v343[0]) >> 1);
            sub_9CFD0((size_t *)(*(_QWORD *)(a3 + 8) - 48LL), v311, (size_t)v312);
            v313 = 0;
            if ( ((__int64)v343[0] & 1) != 0 )
              goto LABEL_623;
          }
          if ( v313 )
            goto LABEL_634;
          goto LABEL_633;
        }
LABEL_632:
        v4 = v8;
        goto LABEL_633;
      }
      if ( (unsigned int)(v62 - 49) <= 8 )
      {
        v299 = v61 + 1;
        while ( v4 != v299 )
        {
          v300 = *v299++;
          if ( (unsigned int)(v300 - 48) >= 0xA )
          {
            v60 = v299 - 1;
            goto LABEL_601;
          }
        }
        goto LABEL_632;
      }
    }
LABEL_601:
    if ( v60 == v4 )
      goto LABEL_632;
    goto LABEL_602;
  }
  if ( v9 == 78 )
  {
    if ( v8 != a2 )
    {
      v11 = v8 + 1;
      if ( v8 + 1 == a2 )
        goto LABEL_634;
      v12 = *v11;
      if ( v12 == 114 )
      {
        v11 = v8 + 2;
        v12 = v8[2];
        v13 = 4;
      }
      else
      {
        v13 = 0;
      }
      if ( v12 == 86 )
      {
        v31 = *++v11;
        v12 = v31;
        v13 |= 2u;
      }
      v32 = v12 == 75 ? v11 + 1 : v11;
      v33 = v12 == 75;
      if ( v32 == a2 )
        goto LABEL_634;
      *(_DWORD *)(a3 + 100) = 0;
      v34 = *v32;
      if ( v34 == 79 )
      {
        v35 = 2;
      }
      else
      {
        if ( v34 != 82 )
        {
LABEL_85:
          v53 = *(_OWORD **)(a3 + 8);
          v52 = *(_QWORD *)(a3 + 16);
          if ( (unsigned __int64)v53 >= v52 )
          {
            v340 = v33;
            v54 = 0xAAAAAAAAAAAAAAABLL * (((__int64)v53 - *(_QWORD *)a3) >> 4);
            v55 = 0x555555555555555LL;
            if ( v54 + 1 > 0x555555555555555LL )
              abort();
            v56 = 0xAAAAAAAAAAAAAAABLL * ((__int64)(v52 - *(_QWORD *)a3) >> 4);
            v339 = v13;
            if ( v56 > 0x2AAAAAAAAAAAAA9LL || ((v57 = 2 * v56, v57 >= v54 + 1) ? (v55 = v57) : (v55 = v54 + 1), v55) )
            {
              v58 = *(_QWORD *)(a3 + 24);
              v59 = *(char **)(v58 + 4096);
              if ( v58 + 4096 - (__int64)v59 >= (unsigned __int64)(48 * v55) )
                *(_QWORD *)(v58 + 4096) = &v59[48 * v55];
              else
                v59 = (char *)malloc(48 * v55);
            }
            else
            {
              v59 = 0LL;
            }
            v72 = &v59[48 * v54];
            *((_OWORD *)v72 + 1) = 0u;
            *((_OWORD *)v72 + 2) = 0u;
            *(_OWORD *)v72 = 0u;
            v74 = *(_QWORD *)a3;
            v73 = *(_QWORD *)(a3 + 8);
            v75 = &v59[48 * v55];
            v76 = v72 + 48;
            if ( v73 == *(_QWORD *)a3 )
            {
              v78 = *(void **)a3;
            }
            else
            {
              do
              {
                *((_QWORD *)v72 - 4) = *(_QWORD *)(v73 - 32);
                *((_OWORD *)v72 - 3) = *(_OWORD *)(v73 - 48);
                v77 = *(_QWORD *)(v73 - 8);
                *(_QWORD *)(v73 - 40) = 0LL;
                *(_QWORD *)(v73 - 32) = 0LL;
                *(_QWORD *)(v73 - 48) = 0LL;
                *((_QWORD *)v72 - 1) = v77;
                *(_OWORD *)(v72 - 24) = *(_OWORD *)(v73 - 24);
                *(_QWORD *)(v73 - 16) = 0LL;
                *(_QWORD *)(v73 - 8) = 0LL;
                *(_QWORD *)(v73 - 24) = 0LL;
                v73 -= 48LL;
                v72 -= 48;
              }
              while ( v74 != v73 );
              v78 = *(void **)a3;
              v74 = *(_QWORD *)(a3 + 8);
            }
            v337 = *(_QWORD *)(a3 + 16);
            *(_QWORD *)a3 = v72;
            *(_QWORD *)(a3 + 8) = v76;
            *(_QWORD *)(a3 + 16) = v75;
            if ( (void *)v74 != v78 )
            {
              do
              {
                if ( (*(_BYTE *)(v74 - 24) & 1) != 0 )
                  free(*(void **)(v74 - 8));
                v79 = (void *)(v74 - 48);
                if ( (*(_BYTE *)(v74 - 48) & 1) != 0 )
                  free(*(void **)(v74 - 32));
                v74 -= 48LL;
              }
              while ( v78 != v79 );
            }
            v13 = v339;
            v33 = v340;
            if ( v78 )
            {
              v80 = *(_QWORD *)(a3 + 24);
              if ( v80 + 4096 < (unsigned __int64)v78 || v80 > (unsigned __int64)v78 )
              {
                free(v78);
              }
              else if ( *(_QWORD *)(v80 + 4096) == v337 )
              {
                *(_QWORD *)(v80 + 4096) = v78;
              }
            }
          }
          else
          {
            v53[1] = 0u;
            v53[2] = 0u;
            *v53 = 0u;
            *(_QWORD *)(a3 + 8) += 48LL;
          }
          if ( v4 - v32 >= 2 && *v32 == 83 && v32[1] == 116 )
          {
            v32 += 2;
            sub_A1F74((size_t *)(*(_QWORD *)(a3 + 8) - 48LL), "std", 3uLL);
          }
          if ( v32 == v4 )
          {
            v269 = *(_QWORD *)(a3 + 8);
            v270 = (_BYTE *)(v269 - 48);
            if ( (*(_BYTE *)(v269 - 24) & 1) != 0 )
              free(*(void **)(v269 - 8));
            if ( (*v270 & 1) != 0 )
              free(*(void **)(v269 - 32));
            *(_QWORD *)(a3 + 8) = v270;
            goto LABEL_634;
          }
          v336 = v13 | v33;
          LOBYTE(v81) = 0;
          v341 = 0;
          while ( 2 )
          {
            switch ( *v32 )
            {
              case 'D':
                if ( v32 + 1 != v4 && (v32[1] | 0x20) != 0x74 )
                  goto LABEL_317;
                v141 = sub_A0A48(v32, v4, (_QWORD *)a3);
                v142 = v141;
                if ( v141 == v32 || v141 == v4 )
                  goto LABEL_634;
                v143 = *(_QWORD *)(a3 + 8);
                v144 = *(unsigned __int8 *)(v143 - 24);
                v145 = (v144 & 1) == 0;
                v146 = v144 >> 1;
                if ( v145 )
                  v147 = (void *)(v143 - 23);
                else
                  v147 = *(void **)(v143 - 8);
                if ( v145 )
                  v148 = v146;
                else
                  v148 = *(_QWORD *)(v143 - 16);
                sub_9CFD0((size_t *)(v143 - 48), v147, v148);
                v347 = *(void **)(v143 - 32);
                v346 = *(_OWORD *)(v143 - 48);
                *(_QWORD *)(v143 - 40) = 0LL;
                *(_QWORD *)(v143 - 32) = 0LL;
                *(_QWORD *)(v143 - 48) = 0LL;
                v149 = *(_QWORD *)(a3 + 8);
                v150 = (_BYTE *)(v149 - 48);
                if ( (*(_BYTE *)(v149 - 24) & 1) != 0 )
                  free(*(void **)(v149 - 8));
                if ( (*v150 & 1) != 0 )
                  free(*(void **)(v149 - 32));
                v151 = *(_QWORD *)a3;
                *(_QWORD *)(a3 + 8) = v150;
                if ( (_BYTE *)v151 == v150 )
                {
                  v81 = 1;
                  if ( (v346 & 1) == 0 )
                  {
LABEL_272:
                    if ( !v81 )
                      continue;
                    goto LABEL_634;
                  }
LABEL_271:
                  free(v347);
                  goto LABEL_272;
                }
                v152 = *(unsigned __int8 *)(v149 - 96);
                if ( (v152 & 1) != 0 )
                {
                  if ( !*(_QWORD *)(v149 - 88) )
                  {
LABEL_307:
                    if ( (__int128 *)(v149 - 96) != &v346 )
                    {
                      if ( (v346 & 1) != 0 )
                        v153 = (char *)v347;
                      else
                        v153 = (char *)&v346 + 1;
                      if ( (v346 & 1) != 0 )
                        v154 = *((_QWORD *)&v346 + 1);
                      else
                        v154 = (unsigned __int64)(unsigned __int8)v346 >> 1;
                      sub_A1F74((size_t *)(v149 - 96), v153, v154);
                    }
                    goto LABEL_474;
                  }
                }
                else if ( !(v152 >> 1) )
                {
                  goto LABEL_307;
                }
                sub_9F8F0("::", (unsigned __int8 *)&v346, (size_t *)v343);
                if ( ((__int64)v343[0] & 1) != 0 )
                  v241 = v343[1];
                else
                  v241 = (void *)((unsigned __int64)LOBYTE(v343[0]) >> 1);
                if ( ((__int64)v343[0] & 1) != 0 )
                  v242 = (char *)p;
                else
                  v242 = (char *)v343 + 1;
                sub_9CFD0((size_t *)(*(_QWORD *)(a3 + 8) - 48LL), v242, (size_t)v241);
                if ( ((__int64)v343[0] & 1) != 0 )
                  free(p);
LABEL_474:
                v243 = *(_QWORD *)(a3 + 8) - 48LL;
                v342 = *(_QWORD *)(a3 + 24);
                sub_9D15C((size_t **)v343, v243, &v342);
                v244 = *(_QWORD *)(a3 + 40);
                v245 = *(_QWORD *)(a3 + 48);
                if ( v244 < v245 )
                {
                  *(_QWORD *)(v244 + 24) = v345;
                  *(_OWORD *)v244 = *(_OWORD *)v343;
                  *(_QWORD *)(v244 + 16) = p;
                  v343[1] = 0LL;
                  p = 0LL;
                  v343[0] = 0LL;
                  *(_QWORD *)(a3 + 40) += 32LL;
                  v131 = (void **)v343[0];
                  if ( !v343[0] )
                    goto LABEL_270;
                  goto LABEL_259;
                }
                v246 = *(_QWORD *)(a3 + 32);
                v247 = (__int64)(v244 - v246) >> 5;
                if ( (unsigned __int64)(v247 + 1) >> 59 )
                  abort();
                v248 = v245 - v246;
                if ( (unsigned __int64)(v248 >> 5) > 0x3FFFFFFFFFFFFFELL )
                {
                  v119 = 0x7FFFFFFFFFFFFFFLL;
                }
                else
                {
                  v249 = v248 >> 4;
                  if ( v249 >= v247 + 1 )
                    v119 = v249;
                  else
                    v119 = v247 + 1;
                  if ( !v119 )
                  {
                    v121 = 0LL;
                    goto LABEL_214;
                  }
                }
                v120 = *(_QWORD *)(a3 + 56);
                v121 = *(char **)(v120 + 4096);
                if ( v120 + 4096 - (__int64)v121 >= (unsigned __int64)(32 * v119) )
                  *(_QWORD *)(v120 + 4096) = &v121[32 * v119];
                else
                  v121 = (char *)malloc(32 * v119);
LABEL_214:
                v122 = &v121[32 * v247];
                *((_QWORD *)v122 + 1) = 0LL;
                *((_QWORD *)v122 + 2) = 0LL;
                v123 = v122 + 32;
                *((_QWORD *)v122 + 3) = v345;
                *(_OWORD *)v122 = *(_OWORD *)v343;
                *((_QWORD *)v122 + 2) = p;
                v343[1] = 0LL;
                p = 0LL;
                v343[0] = 0LL;
                v125 = *(void ***)(a3 + 32);
                v124 = *(void ***)(a3 + 40);
                v126 = &v121[32 * v119];
                if ( v124 == v125 )
                {
                  v128 = *(void ***)(a3 + 32);
                }
                else
                {
                  do
                  {
                    *((_QWORD *)v122 - 3) = 0LL;
                    *((_QWORD *)v122 - 2) = 0LL;
                    *((_QWORD *)v122 - 4) = 0LL;
                    *((_QWORD *)v122 - 1) = *(v124 - 1);
                    v127 = *((_OWORD *)v124 - 2);
                    v124 -= 4;
                    *((_OWORD *)v122 - 2) = v127;
                    *((_QWORD *)v122 - 2) = v124[2];
                    v122 -= 32;
                    v124[1] = 0LL;
                    v124[2] = 0LL;
                    *v124 = 0LL;
                  }
                  while ( v125 != v124 );
                  v128 = *(void ***)(a3 + 32);
                  v125 = *(void ***)(a3 + 40);
                }
                v129 = *(_QWORD *)(a3 + 48);
                *(_QWORD *)(a3 + 32) = v122;
                *(_QWORD *)(a3 + 40) = v123;
                *(_QWORD *)(a3 + 48) = v126;
                while ( v128 != v125 )
                {
                  v125 -= 4;
                  sub_9D32C(v125);
                }
                if ( v128 )
                {
                  v130 = *(_QWORD *)(a3 + 56);
                  if ( v130 + 4096 < (unsigned __int64)v128 || v130 > (unsigned __int64)v128 )
                  {
                    free(v128);
                  }
                  else if ( *(_QWORD *)(v130 + 4096) == v129 )
                  {
                    *(_QWORD *)(v130 + 4096) = v128;
                    v131 = (void **)v343[0];
                    if ( !v343[0] )
                      goto LABEL_270;
LABEL_259:
                    v137 = (void **)v343[1];
                    if ( v343[1] != v131 )
                    {
                      do
                      {
                        if ( (*(_BYTE *)(v137 - 3) & 1) != 0 )
                          free(*(v137 - 1));
                        v138 = v137 - 6;
                        if ( (*(_BYTE *)(v137 - 6) & 1) != 0 )
                          free(*(v137 - 4));
                        v137 -= 6;
                      }
                      while ( v131 != v138 );
                    }
                    v343[1] = v131;
                    if ( v345 + 4096 < (unsigned __int64)v131 || v345 > (unsigned __int64)v131 )
                    {
                      free(v131);
                    }
                    else if ( *(void **)(v345 + 4096) == p )
                    {
                      *(_QWORD *)(v345 + 4096) = v131;
                    }
LABEL_270:
                    v81 = 0;
                    v32 = v142;
                    v341 = 1;
                    if ( (v346 & 1) == 0 )
                      goto LABEL_272;
                    goto LABEL_271;
                  }
                }
                v131 = (void **)v343[0];
                if ( !v343[0] )
                  goto LABEL_270;
                goto LABEL_259;
              case 'E':
                v10 = v32 + 1;
                *(_DWORD *)(a3 + 96) = v336;
                if ( (v341 & 1) != 0 )
                {
                  v271 = *(_QWORD *)(a3 + 40);
                  if ( *(_QWORD *)(a3 + 32) != v271 )
                  {
                    v272 = v271 - 32;
                    sub_9D32C((void **)(v271 - 32));
                    *(_QWORD *)(a3 + 40) = v272;
                  }
                }
                if ( a4 )
                  *a4 = v81;
                goto LABEL_634;
              case 'I':
                v169 = sub_9D3DC(v32, v4, a3);
                v170 = v169;
                if ( v169 == v32 || v169 == v4 )
                  goto LABEL_634;
                v171 = *(_QWORD *)(a3 + 8);
                v172 = *(unsigned __int8 *)(v171 - 24);
                v173 = (v172 & 1) == 0;
                v174 = v172 >> 1;
                if ( v173 )
                  v175 = (void *)(v171 - 23);
                else
                  v175 = *(void **)(v171 - 8);
                if ( v173 )
                  v176 = v174;
                else
                  v176 = *(_QWORD *)(v171 - 16);
                sub_9CFD0((size_t *)(v171 - 48), v175, v176);
                v347 = *(void **)(v171 - 32);
                v346 = *(_OWORD *)(v171 - 48);
                *(_QWORD *)(v171 - 40) = 0LL;
                *(_QWORD *)(v171 - 32) = 0LL;
                *(_QWORD *)(v171 - 48) = 0LL;
                v177 = *(_QWORD *)(a3 + 8);
                v178 = (_BYTE *)(v177 - 48);
                if ( (*(_BYTE *)(v177 - 24) & 1) != 0 )
                  free(*(void **)(v177 - 8));
                if ( (*v178 & 1) != 0 )
                  free(*(void **)(v177 - 32));
                v179 = *(_QWORD *)a3;
                *(_QWORD *)(a3 + 8) = v178;
                if ( (_BYTE *)v179 == v178 )
                {
                  LOBYTE(v81) = 0;
                  v134 = 1;
                  v170 = v32;
                  if ( (v346 & 1) == 0 )
                  {
LABEL_242:
                    if ( !v134 )
                      goto LABEL_142;
                    goto LABEL_634;
                  }
LABEL_241:
                  free(v347);
                  goto LABEL_242;
                }
                if ( (v346 & 1) != 0 )
                  v180 = (char *)v347;
                else
                  v180 = (char *)&v346 + 1;
                if ( (v346 & 1) != 0 )
                  v181 = *((_QWORD *)&v346 + 1);
                else
                  v181 = (unsigned __int64)(unsigned __int8)v346 >> 1;
                sub_9CFD0((size_t *)(v177 - 96), v180, v181);
                v182 = *(_QWORD *)(a3 + 8) - 48LL;
                v342 = *(_QWORD *)(a3 + 24);
                sub_9D15C((size_t **)v343, v182, &v342);
                v183 = *(_QWORD *)(a3 + 40);
                v184 = *(_QWORD *)(a3 + 48);
                if ( v183 < v184 )
                {
                  *(_QWORD *)(v183 + 24) = v345;
                  *(_OWORD *)v183 = *(_OWORD *)v343;
                  *(_QWORD *)(v183 + 16) = p;
                  v343[1] = 0LL;
                  p = 0LL;
                  v343[0] = 0LL;
                  *(_QWORD *)(a3 + 40) += 32LL;
                  v108 = (void **)v343[0];
                  if ( !v343[0] )
                    goto LABEL_240;
                  goto LABEL_229;
                }
                v229 = *(_QWORD *)(a3 + 32);
                v230 = (__int64)(v183 - v229) >> 5;
                if ( (unsigned __int64)(v230 + 1) >> 59 )
                  abort();
                v231 = v184 - v229;
                if ( (unsigned __int64)(v231 >> 5) > 0x3FFFFFFFFFFFFFELL )
                {
                  v233 = 0x7FFFFFFFFFFFFFFLL;
                }
                else
                {
                  v232 = v231 >> 4;
                  if ( v232 >= v230 + 1 )
                    v233 = v232;
                  else
                    v233 = v230 + 1;
                  if ( !v233 )
                  {
                    v234 = 0LL;
                    goto LABEL_179;
                  }
                }
                v265 = *(_QWORD *)(a3 + 56);
                v234 = *(char **)(v265 + 4096);
                if ( v265 + 4096 - (__int64)v234 >= (unsigned __int64)(32 * v233) )
                  *(_QWORD *)(v265 + 4096) = &v234[32 * v233];
                else
                  v234 = (char *)malloc(32 * v233);
LABEL_179:
                v99 = &v234[32 * v230];
                *((_QWORD *)v99 + 1) = 0LL;
                *((_QWORD *)v99 + 2) = 0LL;
                v100 = v99 + 32;
                *((_QWORD *)v99 + 3) = v345;
                *(_OWORD *)v99 = *(_OWORD *)v343;
                *((_QWORD *)v99 + 2) = p;
                v343[1] = 0LL;
                p = 0LL;
                v343[0] = 0LL;
                v102 = *(void ***)(a3 + 32);
                v101 = *(void ***)(a3 + 40);
                v103 = &v234[32 * v233];
                if ( v101 == v102 )
                {
                  v105 = *(void ***)(a3 + 32);
                }
                else
                {
                  do
                  {
                    *((_QWORD *)v99 - 3) = 0LL;
                    *((_QWORD *)v99 - 2) = 0LL;
                    *((_QWORD *)v99 - 4) = 0LL;
                    *((_QWORD *)v99 - 1) = *(v101 - 1);
                    v104 = *((_OWORD *)v101 - 2);
                    v101 -= 4;
                    *((_OWORD *)v99 - 2) = v104;
                    *((_QWORD *)v99 - 2) = v101[2];
                    v99 -= 32;
                    v101[1] = 0LL;
                    v101[2] = 0LL;
                    *v101 = 0LL;
                  }
                  while ( v102 != v101 );
                  v105 = *(void ***)(a3 + 32);
                  v102 = *(void ***)(a3 + 40);
                }
                v106 = *(_QWORD *)(a3 + 48);
                *(_QWORD *)(a3 + 32) = v99;
                *(_QWORD *)(a3 + 40) = v100;
                *(_QWORD *)(a3 + 48) = v103;
                while ( v105 != v102 )
                {
                  v102 -= 4;
                  sub_9D32C(v102);
                }
                if ( v105 )
                {
                  v107 = *(_QWORD *)(a3 + 56);
                  if ( v107 + 4096 < (unsigned __int64)v105 || v107 > (unsigned __int64)v105 )
                  {
                    free(v105);
                  }
                  else if ( *(_QWORD *)(v107 + 4096) == v106 )
                  {
                    *(_QWORD *)(v107 + 4096) = v105;
                    v108 = (void **)v343[0];
                    if ( !v343[0] )
                      goto LABEL_240;
LABEL_229:
                    v132 = (void **)v343[1];
                    if ( v343[1] != v108 )
                    {
                      do
                      {
                        if ( (*(_BYTE *)(v132 - 3) & 1) != 0 )
                          free(*(v132 - 1));
                        v133 = v132 - 6;
                        if ( (*(_BYTE *)(v132 - 6) & 1) != 0 )
                          free(*(v132 - 4));
                        v132 -= 6;
                      }
                      while ( v108 != v133 );
                    }
                    v343[1] = v108;
                    if ( v345 + 4096 < (unsigned __int64)v108 || v345 > (unsigned __int64)v108 )
                    {
                      free(v108);
                    }
                    else if ( *(void **)(v345 + 4096) == p )
                    {
                      *(_QWORD *)(v345 + 4096) = v108;
                    }
LABEL_240:
                    v134 = 0;
                    LOBYTE(v81) = 1;
                    if ( (v346 & 1) == 0 )
                      goto LABEL_242;
                    goto LABEL_241;
                  }
                }
                v108 = (void **)v343[0];
                if ( !v343[0] )
                  goto LABEL_240;
                goto LABEL_229;
              case 'L':
                if ( v32 + 1 != v4 )
                {
                  LOBYTE(v81) = 0;
                  ++v32;
                  continue;
                }
                goto LABEL_634;
              case 'S':
                if ( v32 + 1 != v4 && v32[1] == 116 )
                  goto LABEL_317;
                v199 = sub_9E1F8(v32, v4, (void **)a3);
                v170 = v199;
                if ( v199 == v32 || v199 == v4 )
                  goto LABEL_634;
                v200 = *(_QWORD *)(a3 + 8);
                v201 = *(unsigned __int8 *)(v200 - 24);
                v202 = (v201 & 1) == 0;
                v203 = v201 >> 1;
                if ( v202 )
                  v204 = (void *)(v200 - 23);
                else
                  v204 = *(void **)(v200 - 8);
                if ( v202 )
                  v205 = v203;
                else
                  v205 = *(_QWORD *)(v200 - 16);
                sub_9CFD0((size_t *)(v200 - 48), v204, v205);
                v347 = *(void **)(v200 - 32);
                v346 = *(_OWORD *)(v200 - 48);
                *(_QWORD *)(v200 - 40) = 0LL;
                *(_QWORD *)(v200 - 32) = 0LL;
                *(_QWORD *)(v200 - 48) = 0LL;
                v206 = *(_QWORD *)(a3 + 8);
                v207 = (_BYTE *)(v206 - 48);
                if ( (*(_BYTE *)(v206 - 24) & 1) != 0 )
                  free(*(void **)(v206 - 8));
                if ( (*v207 & 1) != 0 )
                  free(*(void **)(v206 - 32));
                v208 = *(_QWORD *)a3;
                *(_QWORD *)(a3 + 8) = v207;
                if ( (_BYTE *)v208 == v207 )
                {
                  v81 = 1;
                  v170 = v32;
                  if ( (v346 & 1) == 0 )
                  {
LABEL_287:
                    if ( !v81 )
                    {
LABEL_142:
                      v32 = v170;
                      continue;
                    }
                    goto LABEL_634;
                  }
LABEL_286:
                  free(v347);
                  goto LABEL_287;
                }
                v209 = *(unsigned __int8 *)(v206 - 96);
                if ( (v209 & 1) != 0 )
                {
                  if ( !*(_QWORD *)(v206 - 88) )
                  {
LABEL_402:
                    if ( (__int128 *)(v206 - 96) != &v346 )
                    {
                      if ( (v346 & 1) != 0 )
                        v210 = (char *)v347;
                      else
                        v210 = (char *)&v346 + 1;
                      if ( (v346 & 1) != 0 )
                        v211 = *((_QWORD *)&v346 + 1);
                      else
                        v211 = (unsigned __int64)(unsigned __int8)v346 >> 1;
                      sub_A1F74((size_t *)(v206 - 96), v210, v211);
                    }
                    goto LABEL_285;
                  }
                }
                else if ( !(v209 >> 1) )
                {
                  goto LABEL_402;
                }
                sub_9F8F0("::", (unsigned __int8 *)&v346, (size_t *)v343);
                if ( ((__int64)v343[0] & 1) != 0 )
                  v251 = v343[1];
                else
                  v251 = (void *)((unsigned __int64)LOBYTE(v343[0]) >> 1);
                if ( ((__int64)v343[0] & 1) != 0 )
                  v252 = (char *)p;
                else
                  v252 = (char *)v343 + 1;
                sub_9CFD0((size_t *)(*(_QWORD *)(a3 + 8) - 48LL), v252, (size_t)v251);
                if ( ((__int64)v343[0] & 1) != 0 )
                  free(p);
                v253 = *(_QWORD *)(a3 + 8) - 48LL;
                v342 = *(_QWORD *)(a3 + 24);
                sub_9D15C((size_t **)v343, v253, &v342);
                v254 = *(_QWORD *)(a3 + 40);
                v255 = *(_QWORD *)(a3 + 48);
                if ( v254 < v255 )
                {
                  *(_QWORD *)(v254 + 24) = v345;
                  *(_OWORD *)v254 = *(_OWORD *)v343;
                  *(_QWORD *)(v254 + 16) = p;
                  v343[1] = 0LL;
                  p = 0LL;
                  v343[0] = 0LL;
                  *(_QWORD *)(a3 + 40) += 32LL;
                  v98 = (void **)v343[0];
                  if ( !v343[0] )
                    goto LABEL_285;
                  goto LABEL_274;
                }
                v82 = *(_QWORD *)(a3 + 32);
                v83 = (__int64)(v254 - v82) >> 5;
                if ( (unsigned __int64)(v83 + 1) >> 59 )
                  abort();
                v84 = v255 - v82;
                if ( (unsigned __int64)(v84 >> 5) > 0x3FFFFFFFFFFFFFELL )
                {
                  v86 = 0x7FFFFFFFFFFFFFFLL;
                }
                else
                {
                  v85 = v84 >> 4;
                  if ( v85 >= v83 + 1 )
                    v86 = v85;
                  else
                    v86 = v83 + 1;
                  if ( !v86 )
                  {
                    v87 = 0LL;
                    goto LABEL_163;
                  }
                }
                v88 = *(_QWORD *)(a3 + 56);
                v87 = *(char **)(v88 + 4096);
                if ( v88 + 4096 - (__int64)v87 >= (unsigned __int64)(32 * v86) )
                  *(_QWORD *)(v88 + 4096) = &v87[32 * v86];
                else
                  v87 = (char *)malloc(32 * v86);
LABEL_163:
                v89 = &v87[32 * v83];
                *((_QWORD *)v89 + 1) = 0LL;
                *((_QWORD *)v89 + 2) = 0LL;
                v90 = v89 + 32;
                *((_QWORD *)v89 + 3) = v345;
                *(_OWORD *)v89 = *(_OWORD *)v343;
                *((_QWORD *)v89 + 2) = p;
                v343[1] = 0LL;
                p = 0LL;
                v343[0] = 0LL;
                v92 = *(void ***)(a3 + 32);
                v91 = *(void ***)(a3 + 40);
                v93 = &v87[32 * v86];
                if ( v91 == v92 )
                {
                  v95 = *(void ***)(a3 + 32);
                }
                else
                {
                  do
                  {
                    *((_QWORD *)v89 - 3) = 0LL;
                    *((_QWORD *)v89 - 2) = 0LL;
                    *((_QWORD *)v89 - 4) = 0LL;
                    *((_QWORD *)v89 - 1) = *(v91 - 1);
                    v94 = *((_OWORD *)v91 - 2);
                    v91 -= 4;
                    *((_OWORD *)v89 - 2) = v94;
                    *((_QWORD *)v89 - 2) = v91[2];
                    v89 -= 32;
                    v91[1] = 0LL;
                    v91[2] = 0LL;
                    *v91 = 0LL;
                  }
                  while ( v92 != v91 );
                  v95 = *(void ***)(a3 + 32);
                  v92 = *(void ***)(a3 + 40);
                }
                v96 = *(_QWORD *)(a3 + 48);
                *(_QWORD *)(a3 + 32) = v89;
                *(_QWORD *)(a3 + 40) = v90;
                *(_QWORD *)(a3 + 48) = v93;
                while ( v95 != v92 )
                {
                  v92 -= 4;
                  sub_9D32C(v92);
                }
                if ( v95 )
                {
                  v97 = *(_QWORD *)(a3 + 56);
                  if ( v97 + 4096 < (unsigned __int64)v95 || v97 > (unsigned __int64)v95 )
                  {
                    free(v95);
                  }
                  else if ( *(_QWORD *)(v97 + 4096) == v96 )
                  {
                    *(_QWORD *)(v97 + 4096) = v95;
                    v98 = (void **)v343[0];
                    if ( !v343[0] )
                      goto LABEL_285;
LABEL_274:
                    v139 = (void **)v343[1];
                    if ( v343[1] != v98 )
                    {
                      do
                      {
                        if ( (*(_BYTE *)(v139 - 3) & 1) != 0 )
                          free(*(v139 - 1));
                        v140 = v139 - 6;
                        if ( (*(_BYTE *)(v139 - 6) & 1) != 0 )
                          free(*(v139 - 4));
                        v139 -= 6;
                      }
                      while ( v98 != v140 );
                    }
                    v343[1] = v98;
                    if ( v345 + 4096 < (unsigned __int64)v98 || v345 > (unsigned __int64)v98 )
                    {
                      free(v98);
                    }
                    else if ( *(void **)(v345 + 4096) == p )
                    {
                      *(_QWORD *)(v345 + 4096) = v98;
                    }
LABEL_285:
                    v81 = 0;
                    v341 = 1;
                    if ( (v346 & 1) == 0 )
                      goto LABEL_287;
                    goto LABEL_286;
                  }
                }
                v98 = (void **)v343[0];
                if ( !v343[0] )
                  goto LABEL_285;
                goto LABEL_274;
              case 'T':
                v185 = sub_9F9E8(v32, v4, a3);
                v186 = (unsigned __int8 *)v185;
                if ( (unsigned __int8 *)v185 == v32 || (unsigned __int8 *)v185 == v4 )
                  goto LABEL_634;
                v187 = *(_QWORD *)(a3 + 8);
                v188 = *(unsigned __int8 *)(v187 - 24);
                v189 = (v188 & 1) == 0;
                v190 = v188 >> 1;
                if ( v189 )
                  v191 = (void *)(v187 - 23);
                else
                  v191 = *(void **)(v187 - 8);
                if ( v189 )
                  v192 = v190;
                else
                  v192 = *(_QWORD *)(v187 - 16);
                sub_9CFD0((size_t *)(v187 - 48), v191, v192);
                v347 = *(void **)(v187 - 32);
                v346 = *(_OWORD *)(v187 - 48);
                *(_QWORD *)(v187 - 40) = 0LL;
                *(_QWORD *)(v187 - 32) = 0LL;
                *(_QWORD *)(v187 - 48) = 0LL;
                v193 = *(_QWORD *)(a3 + 8);
                v194 = (_BYTE *)(v193 - 48);
                if ( (*(_BYTE *)(v193 - 24) & 1) != 0 )
                  free(*(void **)(v193 - 8));
                if ( (*v194 & 1) != 0 )
                  free(*(void **)(v193 - 32));
                v195 = *(_QWORD *)a3;
                *(_QWORD *)(a3 + 8) = v194;
                if ( (_BYTE *)v195 == v194 )
                {
                  v81 = 1;
                  if ( (v346 & 1) == 0 )
                  {
LABEL_257:
                    if ( !v81 )
                      continue;
                    goto LABEL_634;
                  }
LABEL_256:
                  free(v347);
                  goto LABEL_257;
                }
                v196 = *(unsigned __int8 *)(v193 - 96);
                if ( (v196 & 1) != 0 )
                {
                  if ( !*(_QWORD *)(v193 - 88) )
                  {
LABEL_379:
                    if ( (__int128 *)(v193 - 96) != &v346 )
                    {
                      if ( (v346 & 1) != 0 )
                        v197 = (char *)v347;
                      else
                        v197 = (char *)&v346 + 1;
                      if ( (v346 & 1) != 0 )
                        v198 = *((_QWORD *)&v346 + 1);
                      else
                        v198 = (unsigned __int64)(unsigned __int8)v346 >> 1;
                      sub_A1F74((size_t *)(v193 - 96), v197, v198);
                    }
                    goto LABEL_444;
                  }
                }
                else if ( !(v196 >> 1) )
                {
                  goto LABEL_379;
                }
                sub_9F8F0("::", (unsigned __int8 *)&v346, (size_t *)v343);
                if ( ((__int64)v343[0] & 1) != 0 )
                  v224 = v343[1];
                else
                  v224 = (void *)((unsigned __int64)LOBYTE(v343[0]) >> 1);
                if ( ((__int64)v343[0] & 1) != 0 )
                  v225 = (char *)p;
                else
                  v225 = (char *)v343 + 1;
                sub_9CFD0((size_t *)(*(_QWORD *)(a3 + 8) - 48LL), v225, (size_t)v224);
                if ( ((__int64)v343[0] & 1) != 0 )
                  free(p);
LABEL_444:
                v226 = *(_QWORD *)(a3 + 8) - 48LL;
                v342 = *(_QWORD *)(a3 + 24);
                sub_9D15C((size_t **)v343, v226, &v342);
                v227 = *(_QWORD *)(a3 + 40);
                v228 = *(_QWORD *)(a3 + 48);
                if ( v227 < v228 )
                {
                  *(_QWORD *)(v227 + 24) = v345;
                  *(_OWORD *)v227 = *(_OWORD *)v343;
                  *(_QWORD *)(v227 + 16) = p;
                  v343[1] = 0LL;
                  p = 0LL;
                  v343[0] = 0LL;
                  *(_QWORD *)(a3 + 40) += 32LL;
                  v118 = (void **)v343[0];
                  if ( !v343[0] )
                    goto LABEL_255;
                  goto LABEL_244;
                }
                v235 = *(_QWORD *)(a3 + 32);
                v236 = (__int64)(v227 - v235) >> 5;
                if ( (unsigned __int64)(v236 + 1) >> 59 )
                  abort();
                v237 = v228 - v235;
                if ( (unsigned __int64)(v237 >> 5) > 0x3FFFFFFFFFFFFFELL )
                {
                  v239 = 0x7FFFFFFFFFFFFFFLL;
                }
                else
                {
                  v238 = v237 >> 4;
                  if ( v238 >= v236 + 1 )
                    v239 = v238;
                  else
                    v239 = v236 + 1;
                  if ( !v239 )
                  {
                    v240 = 0LL;
                    goto LABEL_195;
                  }
                }
                v266 = *(_QWORD *)(a3 + 56);
                v240 = *(char **)(v266 + 4096);
                if ( v266 + 4096 - (__int64)v240 >= (unsigned __int64)(32 * v239) )
                  *(_QWORD *)(v266 + 4096) = &v240[32 * v239];
                else
                  v240 = (char *)malloc(32 * v239);
LABEL_195:
                v109 = &v240[32 * v236];
                *((_QWORD *)v109 + 1) = 0LL;
                *((_QWORD *)v109 + 2) = 0LL;
                v110 = v109 + 32;
                *((_QWORD *)v109 + 3) = v345;
                *(_OWORD *)v109 = *(_OWORD *)v343;
                *((_QWORD *)v109 + 2) = p;
                v343[1] = 0LL;
                p = 0LL;
                v343[0] = 0LL;
                v112 = *(void ***)(a3 + 32);
                v111 = *(void ***)(a3 + 40);
                v113 = &v240[32 * v239];
                if ( v111 == v112 )
                {
                  v115 = *(void ***)(a3 + 32);
                }
                else
                {
                  do
                  {
                    *((_QWORD *)v109 - 3) = 0LL;
                    *((_QWORD *)v109 - 2) = 0LL;
                    *((_QWORD *)v109 - 4) = 0LL;
                    *((_QWORD *)v109 - 1) = *(v111 - 1);
                    v114 = *((_OWORD *)v111 - 2);
                    v111 -= 4;
                    *((_OWORD *)v109 - 2) = v114;
                    *((_QWORD *)v109 - 2) = v111[2];
                    v109 -= 32;
                    v111[1] = 0LL;
                    v111[2] = 0LL;
                    *v111 = 0LL;
                  }
                  while ( v112 != v111 );
                  v115 = *(void ***)(a3 + 32);
                  v112 = *(void ***)(a3 + 40);
                }
                v116 = *(_QWORD *)(a3 + 48);
                *(_QWORD *)(a3 + 32) = v109;
                *(_QWORD *)(a3 + 40) = v110;
                *(_QWORD *)(a3 + 48) = v113;
                while ( v115 != v112 )
                {
                  v112 -= 4;
                  sub_9D32C(v112);
                }
                if ( v115 )
                {
                  v117 = *(_QWORD *)(a3 + 56);
                  if ( v117 + 4096 < (unsigned __int64)v115 || v117 > (unsigned __int64)v115 )
                  {
                    free(v115);
                  }
                  else if ( *(_QWORD *)(v117 + 4096) == v116 )
                  {
                    *(_QWORD *)(v117 + 4096) = v115;
                    v118 = (void **)v343[0];
                    if ( !v343[0] )
                      goto LABEL_255;
LABEL_244:
                    v135 = (void **)v343[1];
                    if ( v343[1] != v118 )
                    {
                      do
                      {
                        if ( (*(_BYTE *)(v135 - 3) & 1) != 0 )
                          free(*(v135 - 1));
                        v136 = v135 - 6;
                        if ( (*(_BYTE *)(v135 - 6) & 1) != 0 )
                          free(*(v135 - 4));
                        v135 -= 6;
                      }
                      while ( v118 != v136 );
                    }
                    v343[1] = v118;
                    if ( v345 + 4096 < (unsigned __int64)v118 || v345 > (unsigned __int64)v118 )
                    {
                      free(v118);
                    }
                    else if ( *(void **)(v345 + 4096) == p )
                    {
                      *(_QWORD *)(v345 + 4096) = v118;
                    }
LABEL_255:
                    v81 = 0;
                    v32 = v186;
                    v341 = 1;
                    if ( (v346 & 1) == 0 )
                      goto LABEL_257;
                    goto LABEL_256;
                  }
                }
                v118 = (void **)v343[0];
                if ( !v343[0] )
                  goto LABEL_255;
                goto LABEL_244;
              default:
LABEL_317:
                v155 = sub_A0C94(v32, v4, (char **)a3);
                v156 = (unsigned __int8 *)v155;
                if ( (unsigned __int8 *)v155 == v32 || (unsigned __int8 *)v155 == v4 )
                  goto LABEL_634;
                v157 = *(_QWORD *)(a3 + 8);
                v158 = *(unsigned __int8 *)(v157 - 24);
                v159 = (v158 & 1) == 0;
                v160 = v158 >> 1;
                if ( v159 )
                  v161 = (void *)(v157 - 23);
                else
                  v161 = *(void **)(v157 - 8);
                if ( v159 )
                  v162 = v160;
                else
                  v162 = *(_QWORD *)(v157 - 16);
                sub_9CFD0((size_t *)(v157 - 48), v161, v162);
                v347 = *(void **)(v157 - 32);
                v346 = *(_OWORD *)(v157 - 48);
                *(_QWORD *)(v157 - 40) = 0LL;
                *(_QWORD *)(v157 - 32) = 0LL;
                *(_QWORD *)(v157 - 48) = 0LL;
                v163 = *(_QWORD *)(a3 + 8);
                v164 = (_BYTE *)(v163 - 48);
                if ( (*(_BYTE *)(v163 - 24) & 1) != 0 )
                  free(*(void **)(v163 - 8));
                if ( (*v164 & 1) != 0 )
                  free(*(void **)(v163 - 32));
                v165 = *(_QWORD *)a3;
                *(_QWORD *)(a3 + 8) = v164;
                if ( (_BYTE *)v165 == v164 )
                {
                  v81 = 1;
                  if ( (v346 & 1) == 0 )
                  {
LABEL_150:
                    if ( !v81 )
                      continue;
                    goto LABEL_634;
                  }
LABEL_149:
                  free(v347);
                  goto LABEL_150;
                }
                v166 = *(unsigned __int8 *)(v163 - 96);
                if ( (v166 & 1) != 0 )
                {
                  if ( !*(_QWORD *)(v163 - 88) )
                  {
LABEL_332:
                    if ( (__int128 *)(v163 - 96) != &v346 )
                    {
                      if ( (v346 & 1) != 0 )
                        v167 = (char *)v347;
                      else
                        v167 = (char *)&v346 + 1;
                      if ( (v346 & 1) != 0 )
                        v168 = *((_QWORD *)&v346 + 1);
                      else
                        v168 = (unsigned __int64)(unsigned __int8)v346 >> 1;
                      sub_A1F74((size_t *)(v163 - 96), v167, v168);
                    }
                    goto LABEL_421;
                  }
                }
                else if ( !(v166 >> 1) )
                {
                  goto LABEL_332;
                }
                sub_9F8F0("::", (unsigned __int8 *)&v346, (size_t *)v343);
                if ( ((__int64)v343[0] & 1) != 0 )
                  v212 = v343[1];
                else
                  v212 = (void *)((unsigned __int64)LOBYTE(v343[0]) >> 1);
                if ( ((__int64)v343[0] & 1) != 0 )
                  v213 = (char *)p;
                else
                  v213 = (char *)v343 + 1;
                sub_9CFD0((size_t *)(*(_QWORD *)(a3 + 8) - 48LL), v213, (size_t)v212);
                if ( ((__int64)v343[0] & 1) != 0 )
                  free(p);
LABEL_421:
                v214 = *(_QWORD *)(a3 + 8) - 48LL;
                v342 = *(_QWORD *)(a3 + 24);
                sub_9D15C((size_t **)v343, v214, &v342);
                v215 = *(_QWORD *)(a3 + 40);
                v216 = *(_QWORD *)(a3 + 48);
                if ( v215 < v216 )
                {
                  *(_QWORD *)(v215 + 24) = v345;
                  *(_OWORD *)v215 = *(_OWORD *)v343;
                  *(_QWORD *)(v215 + 16) = p;
                  v343[1] = 0LL;
                  p = 0LL;
                  v343[0] = 0LL;
                  *(_QWORD *)(a3 + 40) += 32LL;
                  v217 = (void **)v343[0];
                  if ( !v343[0] )
                    goto LABEL_148;
                  goto LABEL_520;
                }
                v218 = *(_QWORD *)(a3 + 32);
                v219 = (__int64)(v215 - v218) >> 5;
                if ( (unsigned __int64)(v219 + 1) >> 59 )
                  abort();
                v220 = v216 - v218;
                if ( (unsigned __int64)(v220 >> 5) > 0x3FFFFFFFFFFFFFELL )
                {
                  v222 = 0x7FFFFFFFFFFFFFFLL;
                }
                else
                {
                  v221 = v220 >> 4;
                  if ( v221 >= v219 + 1 )
                    v222 = v221;
                  else
                    v222 = v219 + 1;
                  if ( !v222 )
                  {
                    v223 = 0LL;
LABEL_500:
                    v256 = &v223[32 * v219];
                    *((_QWORD *)v256 + 1) = 0LL;
                    *((_QWORD *)v256 + 2) = 0LL;
                    v257 = v256 + 32;
                    *((_QWORD *)v256 + 3) = v345;
                    *(_OWORD *)v256 = *(_OWORD *)v343;
                    *((_QWORD *)v256 + 2) = p;
                    v343[1] = 0LL;
                    p = 0LL;
                    v343[0] = 0LL;
                    v259 = *(void ***)(a3 + 32);
                    v258 = *(void ***)(a3 + 40);
                    v260 = &v223[32 * v222];
                    if ( v258 == v259 )
                    {
                      v262 = *(void ***)(a3 + 32);
                    }
                    else
                    {
                      do
                      {
                        *((_QWORD *)v256 - 3) = 0LL;
                        *((_QWORD *)v256 - 2) = 0LL;
                        *((_QWORD *)v256 - 4) = 0LL;
                        *((_QWORD *)v256 - 1) = *(v258 - 1);
                        v261 = *((_OWORD *)v258 - 2);
                        v258 -= 4;
                        *((_OWORD *)v256 - 2) = v261;
                        *((_QWORD *)v256 - 2) = v258[2];
                        v256 -= 32;
                        v258[1] = 0LL;
                        v258[2] = 0LL;
                        *v258 = 0LL;
                      }
                      while ( v259 != v258 );
                      v262 = *(void ***)(a3 + 32);
                      v259 = *(void ***)(a3 + 40);
                    }
                    v263 = *(_QWORD *)(a3 + 48);
                    *(_QWORD *)(a3 + 32) = v256;
                    *(_QWORD *)(a3 + 40) = v257;
                    *(_QWORD *)(a3 + 48) = v260;
                    while ( v262 != v259 )
                    {
                      v259 -= 4;
                      sub_9D32C(v259);
                    }
                    if ( v262 )
                    {
                      v264 = *(_QWORD *)(a3 + 56);
                      if ( v264 + 4096 < (unsigned __int64)v262 || v264 > (unsigned __int64)v262 )
                      {
                        free(v262);
                      }
                      else if ( *(_QWORD *)(v264 + 4096) == v263 )
                      {
                        *(_QWORD *)(v264 + 4096) = v262;
                        v217 = (void **)v343[0];
                        if ( !v343[0] )
                          goto LABEL_148;
                        goto LABEL_520;
                      }
                    }
                    v217 = (void **)v343[0];
                    if ( !v343[0] )
                      goto LABEL_148;
LABEL_520:
                    v267 = (void **)v343[1];
                    if ( v343[1] != v217 )
                    {
                      do
                      {
                        if ( (*(_BYTE *)(v267 - 3) & 1) != 0 )
                          free(*(v267 - 1));
                        v268 = v267 - 6;
                        if ( (*(_BYTE *)(v267 - 6) & 1) != 0 )
                          free(*(v267 - 4));
                        v267 -= 6;
                      }
                      while ( v217 != v268 );
                    }
                    v343[1] = v217;
                    if ( v345 + 4096 < (unsigned __int64)v217 || v345 > (unsigned __int64)v217 )
                    {
                      free(v217);
                    }
                    else if ( *(void **)(v345 + 4096) == p )
                    {
                      *(_QWORD *)(v345 + 4096) = v217;
                    }
LABEL_148:
                    v81 = 0;
                    v32 = v156;
                    v341 = 1;
                    if ( (v346 & 1) == 0 )
                      goto LABEL_150;
                    goto LABEL_149;
                  }
                }
                v250 = *(_QWORD *)(a3 + 56);
                v223 = *(char **)(v250 + 4096);
                if ( v250 + 4096 - (__int64)v223 >= (unsigned __int64)(32 * v222) )
                  *(_QWORD *)(v250 + 4096) = &v223[32 * v222];
                else
                  v223 = (char *)malloc(32 * v222);
                goto LABEL_500;
            }
          }
        }
        v35 = 1;
      }
      ++v32;
      *(_DWORD *)(a3 + 100) = v35;
      goto LABEL_85;
    }
    goto LABEL_633;
  }
  if ( a2 - v8 >= 2 )
  {
    if ( v9 == 83 && v8[1] == 116 )
    {
      v19 = a4;
      if ( v8 + 2 == a2 )
      {
        v20 = 0;
        v21 = a2;
      }
      else
      {
        v20 = 0;
        if ( v8[2] == 76 )
          v21 = v8 + 3;
        else
          v21 = v8 + 2;
      }
    }
    else
    {
      v19 = a4;
      v20 = 1;
      v21 = v8;
    }
    v22 = sub_A0C94(v21, a2, (char **)a3);
    v23 = (unsigned __int8 *)v22;
    v24 = v22 == (_QWORD)v21;
    if ( (unsigned __int8 *)v22 == v21 )
      v25 = v8;
    else
      v25 = (unsigned __int8 *)v22;
    if ( (v20 & 1) != 0 )
    {
      v6 = v19;
      if ( v25 != v8 )
      {
LABEL_39:
        if ( v25 != v4 )
        {
          if ( *v25 == 73 )
          {
            v27 = *(_QWORD *)(a3 + 8);
            if ( *(_QWORD *)a3 == v27 )
              return v5;
            *(_QWORD *)&v346 = *(_QWORD *)(a3 + 24);
            sub_9D15C((size_t **)v343, v27 - 48, (__int64 *)&v346);
            v28 = *(_QWORD *)(a3 + 40);
            v29 = *(_QWORD *)(a3 + 48);
            if ( v28 < v29 )
            {
              *(_QWORD *)(v28 + 24) = v345;
              *(_OWORD *)v28 = *(_OWORD *)v343;
              *(_QWORD *)(v28 + 16) = p;
              v343[1] = 0LL;
              p = 0LL;
              v343[0] = 0LL;
              *(_QWORD *)(a3 + 40) += 32LL;
              v30 = (void **)v343[0];
              if ( !v343[0] )
                goto LABEL_571;
              goto LABEL_560;
            }
            v66 = *(_QWORD *)(a3 + 32);
            v67 = (__int64)(v28 - v66) >> 5;
            if ( (unsigned __int64)(v67 + 1) >> 59 )
              abort();
            v68 = v29 - v66;
            if ( (unsigned __int64)(v68 >> 5) > 0x3FFFFFFFFFFFFFELL )
            {
              v70 = 0x7FFFFFFFFFFFFFFLL;
            }
            else
            {
              v69 = v68 >> 4;
              if ( v69 >= v67 + 1 )
                v70 = v69;
              else
                v70 = v67 + 1;
              if ( !v70 )
              {
                v71 = 0LL;
LABEL_546:
                v276 = &v71[32 * v67];
                *((_QWORD *)v276 + 1) = 0LL;
                *((_QWORD *)v276 + 2) = 0LL;
                v277 = v276 + 32;
                *((_QWORD *)v276 + 3) = v345;
                *(_OWORD *)v276 = *(_OWORD *)v343;
                *((_QWORD *)v276 + 2) = p;
                v343[1] = 0LL;
                p = 0LL;
                v343[0] = 0LL;
                v279 = *(void ***)(a3 + 32);
                v278 = *(void ***)(a3 + 40);
                v280 = &v71[32 * v70];
                if ( v278 == v279 )
                {
                  v282 = *(void ***)(a3 + 32);
                }
                else
                {
                  do
                  {
                    *((_QWORD *)v276 - 3) = 0LL;
                    *((_QWORD *)v276 - 2) = 0LL;
                    *((_QWORD *)v276 - 4) = 0LL;
                    *((_QWORD *)v276 - 1) = *(v278 - 1);
                    v281 = *((_OWORD *)v278 - 2);
                    v278 -= 4;
                    *((_OWORD *)v276 - 2) = v281;
                    *((_QWORD *)v276 - 2) = v278[2];
                    v276 -= 32;
                    v278[1] = 0LL;
                    v278[2] = 0LL;
                    *v278 = 0LL;
                  }
                  while ( v279 != v278 );
                  v282 = *(void ***)(a3 + 32);
                  v279 = *(void ***)(a3 + 40);
                }
                v283 = *(_QWORD *)(a3 + 48);
                *(_QWORD *)(a3 + 32) = v276;
                *(_QWORD *)(a3 + 40) = v277;
                *(_QWORD *)(a3 + 48) = v280;
                while ( v282 != v279 )
                {
                  v279 -= 4;
                  sub_9D32C(v279);
                }
                if ( v282 )
                {
                  v284 = *(_QWORD *)(a3 + 56);
                  if ( v284 + 4096 < (unsigned __int64)v282 || v284 > (unsigned __int64)v282 )
                  {
                    free(v282);
                  }
                  else if ( *(_QWORD *)(v284 + 4096) == v283 )
                  {
                    *(_QWORD *)(v284 + 4096) = v282;
                    v30 = (void **)v343[0];
                    if ( !v343[0] )
                      goto LABEL_571;
                    goto LABEL_560;
                  }
                }
                v30 = (void **)v343[0];
                if ( !v343[0] )
                  goto LABEL_571;
LABEL_560:
                v285 = (void **)v343[1];
                if ( v343[1] != v30 )
                {
                  do
                  {
                    if ( (*(_BYTE *)(v285 - 3) & 1) != 0 )
                      free(*(v285 - 1));
                    v286 = v285 - 6;
                    if ( (*(_BYTE *)(v285 - 6) & 1) != 0 )
                      free(*(v285 - 4));
                    v285 -= 6;
                  }
                  while ( v30 != v286 );
                }
                v343[1] = v30;
                if ( v345 + 4096 < (unsigned __int64)v30 || v345 > (unsigned __int64)v30 )
                {
                  free(v30);
                }
                else if ( *(void **)(v345 + 4096) == p )
                {
                  *(_QWORD *)(v345 + 4096) = v30;
                }
LABEL_571:
                v4 = sub_9D3DC(v25, v4, a3);
                if ( v4 != v25 )
                {
                  v287 = *(_QWORD *)(a3 + 8);
                  if ( 0xAAAAAAAAAAAAAAABLL * ((v287 - *(_QWORD *)a3) >> 4) < 2 )
                    return v5;
                  v288 = *(unsigned __int8 *)(v287 - 24);
                  v289 = (v288 & 1) == 0;
                  v290 = v288 >> 1;
                  if ( v289 )
                    v291 = (void *)(v287 - 23);
                  else
                    v291 = *(void **)(v287 - 8);
                  if ( v289 )
                    v292 = v290;
                  else
                    v292 = *(_QWORD *)(v287 - 16);
                  sub_9CFD0((size_t *)(v287 - 48), v291, v292);
                  p = *(void **)(v287 - 32);
                  *(_OWORD *)v343 = *(_OWORD *)(v287 - 48);
                  *(_QWORD *)(v287 - 40) = 0LL;
                  *(_QWORD *)(v287 - 32) = 0LL;
                  *(_QWORD *)(v287 - 48) = 0LL;
                  v293 = *(_QWORD *)(a3 + 8);
                  v294 = (_BYTE *)(v293 - 48);
                  if ( (*(_BYTE *)(v293 - 24) & 1) != 0 )
                    free(*(void **)(v293 - 8));
                  if ( (*v294 & 1) != 0 )
                    free(*(void **)(v293 - 32));
                  v295 = *(_QWORD *)a3;
                  *(_QWORD *)(a3 + 8) = v294;
                  if ( (_BYTE *)v295 != v294 )
                  {
                    v296 = (size_t *)(v293 - 96);
                    v48 = (char)v343[0];
                    if ( ((__int64)v343[0] & 1) != 0 )
                      v297 = (char *)p;
                    else
                      v297 = (char *)v343 + 1;
                    if ( ((__int64)v343[0] & 1) != 0 )
                      v298 = v343[1];
                    else
                      v298 = (void *)((unsigned __int64)LOBYTE(v343[0]) >> 1);
                    sub_9CFD0(v296, v297, (size_t)v298);
                    if ( !v6 )
                      goto LABEL_591;
LABEL_79:
                    v51 = 0;
                    *v6 = 1;
                    if ( (v48 & 1) == 0 )
                      goto LABEL_81;
                    goto LABEL_80;
                  }
LABEL_594:
                  v51 = 1;
                  v4 = v5;
                  if ( ((__int64)v343[0] & 1) == 0 )
                    goto LABEL_81;
LABEL_80:
                  free(p);
                  goto LABEL_81;
                }
                return v5;
              }
            }
            v273 = *(_QWORD *)(a3 + 56);
            v71 = *(char **)(v273 + 4096);
            if ( v273 + 4096 - (__int64)v71 >= (unsigned __int64)(32 * v70) )
              *(_QWORD *)(v273 + 4096) = &v71[32 * v70];
            else
              v71 = (char *)malloc(32 * v70);
            goto LABEL_546;
          }
          return v25;
        }
        return v4;
      }
    }
    else
    {
      v6 = v19;
      if ( !v24 )
      {
        v26 = *(_QWORD *)(a3 + 8);
        if ( *(_QWORD *)a3 == v26 )
          goto LABEL_56;
        sub_9CDD8((size_t *)(v26 - 48), 0LL, "std::", 5uLL);
        v25 = v23;
      }
      if ( v25 != v8 )
        goto LABEL_39;
    }
  }
LABEL_56:
  v36 = sub_9E1F8(v8, v4, (void **)a3);
  v37 = v36;
  if ( v36 == v8 )
    return v5;
  if ( v36 == v4 )
    return v5;
  if ( *v36 != 73 )
    return v5;
  v4 = sub_9D3DC(v36, v4, a3);
  if ( v4 == v37 )
    return v5;
  v38 = *(_QWORD *)(a3 + 8);
  if ( 0xAAAAAAAAAAAAAAABLL * ((v38 - *(_QWORD *)a3) >> 4) < 2 )
    return v5;
  v39 = *(unsigned __int8 *)(v38 - 24);
  v40 = (v39 & 1) == 0;
  v41 = v39 >> 1;
  if ( v40 )
    v42 = (void *)(v38 - 23);
  else
    v42 = *(void **)(v38 - 8);
  if ( v40 )
    v43 = v41;
  else
    v43 = *(_QWORD *)(v38 - 16);
  sub_9CFD0((size_t *)(v38 - 48), v42, v43);
  p = *(void **)(v38 - 32);
  *(_OWORD *)v343 = *(_OWORD *)(v38 - 48);
  *(_QWORD *)(v38 - 40) = 0LL;
  *(_QWORD *)(v38 - 32) = 0LL;
  *(_QWORD *)(v38 - 48) = 0LL;
  v44 = *(_QWORD *)(a3 + 8);
  v45 = (_BYTE *)(v44 - 48);
  if ( (*(_BYTE *)(v44 - 24) & 1) != 0 )
    free(*(void **)(v44 - 8));
  if ( (*v45 & 1) != 0 )
    free(*(void **)(v44 - 32));
  v46 = *(_QWORD *)a3;
  *(_QWORD *)(a3 + 8) = v45;
  if ( (_BYTE *)v46 == v45 )
    goto LABEL_594;
  v47 = (size_t *)(v44 - 96);
  v48 = (char)v343[0];
  if ( ((__int64)v343[0] & 1) != 0 )
    v49 = (char *)p;
  else
    v49 = (char *)v343 + 1;
  if ( ((__int64)v343[0] & 1) != 0 )
    v50 = v343[1];
  else
    v50 = (void *)((unsigned __int64)LOBYTE(v343[0]) >> 1);
  sub_9CFD0(v47, v49, (size_t)v50);
  if ( v6 )
    goto LABEL_79;
LABEL_591:
  v51 = 0;
  if ( (v48 & 1) != 0 )
    goto LABEL_80;
LABEL_81:
  if ( !v51 )
    return v4;
  return v5;
}
