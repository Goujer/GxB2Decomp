__int64 __fastcall sub_AC0B0(_BYTE *a1, __int64 a2, __int64 a3)
{
  _BYTE *v3; // x19
  __int64 v5; // x21
  unsigned __int64 v6; // x9
  unsigned __int64 v7; // x10
  unsigned __int64 v8; // x22
  unsigned __int64 v9; // x10
  __int64 v10; // x9
  char *v11; // x0
  _BYTE *v12; // x22
  __int64 v13; // x21
  __int64 v14; // x8
  size_t *v15; // x0
  char *v16; // x2
  size_t v17; // x3
  unsigned __int64 v18; // x10
  unsigned __int64 v19; // x22
  unsigned __int64 v20; // x10
  __int64 v21; // x9
  char *v22; // x0
  int v23; // w9
  unsigned __int64 v24; // x10
  unsigned __int64 v25; // x22
  unsigned __int64 v26; // x10
  __int64 v27; // x9
  char *v28; // x0
  unsigned __int64 v29; // x10
  unsigned __int64 v30; // x22
  unsigned __int64 v31; // x10
  __int64 v32; // x9
  char *v33; // x0
  unsigned __int64 v34; // x10
  unsigned __int64 v35; // x22
  unsigned __int64 v36; // x10
  __int64 v37; // x9
  char *v38; // x0
  unsigned __int64 v39; // x10
  unsigned __int64 v40; // x22
  unsigned __int64 v41; // x10
  __int64 v42; // x9
  char *v43; // x0
  int v44; // w9
  unsigned __int64 v45; // x10
  unsigned __int64 v46; // x22
  unsigned __int64 v47; // x10
  __int64 v48; // x9
  char *v49; // x0
  unsigned __int64 v50; // x10
  unsigned __int64 v51; // x22
  unsigned __int64 v52; // x10
  __int64 v53; // x9
  char *v54; // x0
  unsigned __int64 v55; // x10
  unsigned __int64 v56; // x22
  unsigned __int64 v57; // x10
  __int64 v58; // x9
  char *v59; // x0
  unsigned __int64 v60; // x10
  unsigned __int64 v61; // x22
  unsigned __int64 v62; // x10
  __int64 v63; // x9
  char *v64; // x0
  unsigned __int64 v65; // x10
  unsigned __int64 v66; // x22
  unsigned __int64 v67; // x10
  __int64 v68; // x9
  char *v69; // x0
  int v70; // w9
  unsigned __int64 v71; // x10
  unsigned __int64 v72; // x22
  unsigned __int64 v73; // x10
  __int64 v74; // x9
  char *v75; // x0
  unsigned __int64 v76; // x10
  unsigned __int64 v77; // x10
  unsigned __int64 v78; // x22
  unsigned __int64 v79; // x10
  __int64 v80; // x9
  char *v81; // x0
  unsigned __int64 v82; // x10
  unsigned __int64 v83; // x22
  unsigned __int64 v84; // x10
  __int64 v85; // x9
  char *v86; // x0
  unsigned __int64 v87; // x10
  unsigned __int64 v88; // x22
  unsigned __int64 v89; // x10
  __int64 v90; // x9
  char *v91; // x0
  unsigned __int64 v92; // x10
  unsigned __int64 v93; // x22
  unsigned __int64 v94; // x10
  __int64 v95; // x9
  char *v96; // x0
  unsigned __int64 v97; // x10
  unsigned __int64 v98; // x22
  unsigned __int64 v99; // x10
  __int64 v100; // x9
  char *v101; // x0
  unsigned __int64 v102; // x10
  unsigned __int64 v103; // x10
  unsigned __int64 v104; // x10
  unsigned __int64 v105; // x22
  unsigned __int64 v106; // x10
  __int64 v107; // x9
  char *v108; // x0
  unsigned __int64 v109; // x10
  unsigned __int64 v110; // x22
  unsigned __int64 v111; // x10
  __int64 v112; // x9
  char *v113; // x0
  unsigned __int64 v114; // x10
  unsigned __int64 v115; // x22
  unsigned __int64 v116; // x10
  __int64 v117; // x9
  char *v118; // x0
  char v119; // w24
  _BYTE *v120; // x22
  __int64 v121; // x8
  unsigned __int64 v122; // x10
  unsigned __int64 v123; // x22
  unsigned __int64 v124; // x10
  __int64 v125; // x9
  char *v126; // x0
  _BYTE *v127; // x22
  __int64 v128; // x8
  unsigned __int64 v129; // x10
  unsigned __int64 v130; // x22
  unsigned __int64 v131; // x10
  __int64 v132; // x9
  char *v133; // x0
  unsigned __int64 v134; // x10
  unsigned __int64 v135; // x22
  unsigned __int64 v136; // x10
  __int64 v137; // x9
  char *v138; // x0
  unsigned __int64 v139; // x9
  unsigned __int64 v140; // x10
  __int64 v141; // x8
  unsigned __int64 v142; // x10
  unsigned __int64 v143; // x22
  unsigned __int64 v144; // x10
  __int64 v145; // x9
  char *v146; // x0
  unsigned __int64 v147; // x10
  unsigned __int64 v148; // x22
  unsigned __int64 v149; // x10
  __int64 v150; // x9
  char *v151; // x0
  unsigned __int64 v152; // x10
  unsigned __int64 v153; // x22
  unsigned __int64 v154; // x10
  __int64 v155; // x9
  char *v156; // x0
  unsigned __int64 v157; // x10
  unsigned __int64 v158; // x22
  unsigned __int64 v159; // x10
  __int64 v160; // x9
  char *v161; // x0
  unsigned __int64 v162; // x10
  unsigned __int64 v163; // x22
  unsigned __int64 v164; // x10
  __int64 v165; // x9
  char *v166; // x0
  unsigned __int64 v167; // x10
  unsigned __int64 v168; // x10
  unsigned __int64 v169; // x22
  unsigned __int64 v170; // x10
  __int64 v171; // x9
  char *v172; // x0
  unsigned __int64 v173; // x10
  unsigned __int64 v174; // x22
  unsigned __int64 v175; // x10
  __int64 v176; // x9
  char *v177; // x0
  unsigned __int64 v178; // x10
  unsigned __int64 v179; // x22
  unsigned __int64 v180; // x10
  __int64 v181; // x9
  char *v182; // x0
  unsigned __int64 v183; // x10
  unsigned __int64 v184; // x22
  unsigned __int64 v185; // x10
  __int64 v186; // x9
  char *v187; // x0
  unsigned __int64 v188; // x10
  unsigned __int64 v189; // x22
  unsigned __int64 v190; // x10
  __int64 v191; // x9
  char *v192; // x0
  unsigned __int64 v193; // x10
  unsigned __int64 v194; // x22
  unsigned __int64 v195; // x10
  __int64 v196; // x9
  char *v197; // x0
  unsigned __int64 v198; // x10
  unsigned __int64 v199; // x22
  unsigned __int64 v200; // x10
  __int64 v201; // x9
  char *v202; // x0
  unsigned __int64 v203; // x10
  unsigned __int64 v204; // x10
  unsigned __int64 v205; // x10
  unsigned __int64 v206; // x10
  unsigned __int64 v207; // x22
  unsigned __int64 v208; // x10
  __int64 v209; // x9
  char *v210; // x0
  unsigned __int64 v211; // x10
  unsigned __int64 v212; // x10
  unsigned __int64 v213; // x22
  unsigned __int64 v214; // x10
  __int64 v215; // x9
  char *v216; // x0
  unsigned __int64 v217; // x22
  unsigned __int64 v218; // x10
  __int64 v219; // x9
  char *v220; // x0
  unsigned __int64 v221; // x22
  unsigned __int64 v222; // x10
  __int64 v223; // x9
  char *v224; // x0
  unsigned __int64 v225; // x22
  unsigned __int64 v226; // x10
  __int64 v227; // x9
  char *v228; // x0
  unsigned __int64 v229; // x22
  unsigned __int64 v230; // x10
  __int64 v231; // x9
  char *v232; // x0
  unsigned __int64 v233; // x22
  unsigned __int64 v234; // x10
  __int64 v235; // x9
  char *v236; // x0
  unsigned __int64 v237; // x22
  unsigned __int64 v238; // x10
  __int64 v239; // x9
  char *v240; // x0
  unsigned __int64 v241; // x22
  unsigned __int64 v242; // x10
  __int64 v243; // x9
  char *v244; // x0
  unsigned __int64 v245; // x22
  unsigned __int64 v246; // x10
  __int64 v247; // x9
  char *v248; // x0
  unsigned __int64 v249; // x22
  unsigned __int64 v250; // x10
  __int64 v251; // x9
  char *v252; // x0
  char *v253; // x8
  char *v254; // x9
  void **v255; // x11
  void **v256; // x22
  char *v257; // x10
  __int64 v258; // x12
  void **v259; // x21
  __int64 v260; // x24
  void **v261; // x25
  char *v262; // x8
  char *v263; // x9
  void **v264; // x11
  void **v265; // x22
  char *v266; // x10
  __int64 v267; // x12
  __int64 v268; // x24
  void **v269; // x25
  char *v270; // x8
  char *v271; // x9
  void **v272; // x11
  void **v273; // x22
  char *v274; // x10
  __int64 v275; // x12
  void **v276; // x25
  char *v277; // x8
  char *v278; // x9
  void **v279; // x11
  void **v280; // x22
  char *v281; // x10
  __int64 v282; // x12
  void **v283; // x25
  char *v284; // x8
  char *v285; // x9
  void **v286; // x11
  void **v287; // x22
  char *v288; // x10
  __int64 v289; // x12
  void **v290; // x25
  char *v291; // x8
  char *v292; // x9
  void **v293; // x11
  void **v294; // x22
  char *v295; // x10
  __int64 v296; // x12
  void **v297; // x25
  char *v298; // x8
  char *v299; // x9
  void **v300; // x11
  void **v301; // x22
  char *v302; // x10
  __int64 v303; // x12
  void **v304; // x25
  char *v305; // x8
  char *v306; // x9
  void **v307; // x11
  void **v308; // x22
  char *v309; // x10
  __int64 v310; // x12
  void **v311; // x25
  char *v312; // x8
  char *v313; // x9
  void **v314; // x11
  void **v315; // x22
  char *v316; // x10
  __int64 v317; // x12
  void **v318; // x25
  char *v319; // x8
  char *v320; // x9
  void **v321; // x11
  void **v322; // x22
  char *v323; // x10
  __int64 v324; // x12
  void **v325; // x25
  char *v326; // x8
  char *v327; // x9
  void **v328; // x11
  void **v329; // x22
  char *v330; // x10
  __int64 v331; // x12
  void **v332; // x25
  char *v333; // x8
  char *v334; // x9
  void **v335; // x11
  void **v336; // x22
  char *v337; // x10
  __int64 v338; // x12
  void **v339; // x25
  char *v340; // x8
  char *v341; // x9
  void **v342; // x11
  void **v343; // x22
  char *v344; // x10
  __int64 v345; // x12
  void **v346; // x25
  char *v347; // x8
  char *v348; // x9
  void **v349; // x11
  void **v350; // x22
  char *v351; // x10
  __int64 v352; // x12
  void **v353; // x25
  char *v354; // x8
  char *v355; // x9
  void **v356; // x11
  void **v357; // x22
  char *v358; // x10
  __int64 v359; // x12
  void **v360; // x25
  char *v361; // x8
  char *v362; // x9
  void **v363; // x11
  void **v364; // x22
  char *v365; // x10
  __int64 v366; // x12
  void **v367; // x25
  unsigned __int64 v368; // x8
  char *v369; // x8
  char *v370; // x9
  void **v371; // x11
  void **v372; // x22
  char *v373; // x10
  __int64 v374; // x12
  void **v375; // x25
  char *v376; // x8
  char *v377; // x9
  void **v378; // x11
  void **v379; // x22
  char *v380; // x10
  __int64 v381; // x12
  void **v382; // x25
  char *v383; // x8
  char *v384; // x9
  void **v385; // x11
  void **v386; // x22
  char *v387; // x10
  __int64 v388; // x12
  void **v389; // x25
  char *v390; // x8
  char *v391; // x9
  void **v392; // x11
  void **v393; // x22
  char *v394; // x10
  __int64 v395; // x12
  void **v396; // x25
  char *v397; // x8
  char *v398; // x9
  void **v399; // x11
  void **v400; // x22
  char *v401; // x10
  __int64 v402; // x12
  void **v403; // x25
  char *v404; // x8
  char *v405; // x9
  void **v406; // x11
  void **v407; // x22
  char *v408; // x10
  __int64 v409; // x12
  void **v410; // x25
  char *v411; // x8
  char *v412; // x9
  void **v413; // x11
  void **v414; // x22
  char *v415; // x10
  __int64 v416; // x12
  void **v417; // x25
  char *v418; // x8
  char *v419; // x9
  void **v420; // x11
  void **v421; // x22
  char *v422; // x10
  __int64 v423; // x12
  void **v424; // x25
  char *v425; // x8
  char *v426; // x9
  void **v427; // x11
  void **v428; // x22
  char *v429; // x10
  __int64 v430; // x12
  void **v431; // x25
  char *v432; // x8
  char *v433; // x9
  void **v434; // x11
  void **v435; // x22
  char *v436; // x10
  __int64 v437; // x12
  void **v438; // x25
  char *v439; // x8
  char *v440; // x9
  void **v441; // x11
  void **v442; // x22
  char *v443; // x10
  __int64 v444; // x12
  void **v445; // x25
  char *v446; // x8
  char *v447; // x9
  void **v448; // x11
  void **v449; // x22
  char *v450; // x10
  __int64 v451; // x12
  void **v452; // x25
  char *v453; // x8
  char *v454; // x9
  void **v455; // x11
  void **v456; // x22
  char *v457; // x10
  __int64 v458; // x12
  void **v459; // x25
  char *v460; // x8
  char *v461; // x9
  void **v462; // x11
  void **v463; // x22
  char *v464; // x10
  __int64 v465; // x12
  void **v466; // x25
  char *v467; // x8
  char *v468; // x9
  void **v469; // x11
  void **v470; // x22
  char *v471; // x10
  __int64 v472; // x12
  void **v473; // x25
  char *v474; // x8
  char *v475; // x9
  void **v476; // x11
  void **v477; // x22
  char *v478; // x10
  __int64 v479; // x12
  void **v480; // x25
  char *v481; // x8
  char *v482; // x9
  void **v483; // x11
  void **v484; // x22
  char *v485; // x10
  __int64 v486; // x12
  void **v487; // x25
  char *v488; // x8
  char *v489; // x9
  void **v490; // x11
  void **v491; // x22
  char *v492; // x10
  __int64 v493; // x12
  void **v494; // x25
  char *v495; // x8
  char *v496; // x9
  void **v497; // x11
  void **v498; // x22
  char *v499; // x10
  __int64 v500; // x12
  void **v501; // x25
  char *v502; // x8
  char *v503; // x9
  void **v504; // x11
  void **v505; // x22
  char *v506; // x10
  __int64 v507; // x12
  void **v508; // x25
  char *v509; // x8
  char *v510; // x9
  void **v511; // x11
  void **v512; // x22
  char *v513; // x10
  __int64 v514; // x12
  void **v515; // x25
  char *v516; // x8
  char *v517; // x9
  void **v518; // x11
  void **v519; // x22
  char *v520; // x10
  __int64 v521; // x12
  void **v522; // x25
  char *v523; // x8
  char *v524; // x9
  void **v525; // x11
  void **v526; // x22
  char *v527; // x10
  __int64 v528; // x12
  void **v529; // x25
  char *v530; // x8
  char *v531; // x9
  void **v532; // x11
  void **v533; // x22
  char *v534; // x10
  __int64 v535; // x12
  void **v536; // x25
  char *v537; // x8
  char *v538; // x9
  void **v539; // x11
  void **v540; // x22
  char *v541; // x10
  __int64 v542; // x12
  void **v543; // x25
  char *v544; // x8
  char *v545; // x9
  void **v546; // x11
  void **v547; // x22
  char *v548; // x10
  __int64 v549; // x12
  void **v550; // x25
  char *v551; // x8
  char *v552; // x9
  void **v553; // x11
  void **v554; // x22
  char *v555; // x10
  __int64 v556; // x12
  void **v557; // x25
  char *v558; // x8
  char *v559; // x9
  void **v560; // x11
  void **v561; // x22
  char *v562; // x10
  __int64 v563; // x12
  void **v564; // x25
  char *v565; // x8
  char *v566; // x9
  void **v567; // x11
  void **v568; // x22
  char *v569; // x10
  __int64 v570; // x12
  void **v571; // x25
  char *v572; // x8
  char *v573; // x9
  void **v574; // x11
  void **v575; // x22
  char *v576; // x10
  __int64 v577; // x12
  void **v578; // x25
  unsigned __int64 v579; // x8
  _QWORD v581[2]; // [xsp+8h] [xbp-68h] BYREF
  _QWORD v582[3]; // [xsp+18h] [xbp-58h] BYREF

  v3 = a1;
  v582[2] = *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 2)) + 40);
  if ( a2 - (__int64)a1 < 2 )
    return (__int64)v3;
  v5 = 0x555555555555555LL;
  switch ( *a1 )
  {
    case 'a':
      switch ( a1[1] )
      {
        case 'N':
          *(_QWORD *)((char *)v582 + 7) = 0LL;
          v582[0] = 0LL;
          qmemcpy(v581, "operator&=", 10);
          v6 = *(_QWORD *)(a3 + 8);
          v157 = *(_QWORD *)(a3 + 16);
          if ( v6 < v157 )
            goto LABEL_365;
          v158 = 0xAAAAAAAAAAAAAAABLL * ((__int64)(v6 - *(_QWORD *)a3) >> 4);
          if ( v158 + 1 > 0x555555555555555LL )
            abort();
          v159 = 0xAAAAAAAAAAAAAAABLL * ((__int64)(v157 - *(_QWORD *)a3) >> 4);
          if ( v159 >= 0x2AAAAAAAAAAAAAALL || (2 * v159 >= v158 + 1 ? (v5 = 2 * v159) : (v5 = v158 + 1), v5) )
          {
            v160 = *(_QWORD *)(a3 + 24);
            v161 = *(char **)(v160 + 4096);
            if ( v160 + 4096 - (__int64)v161 >= (unsigned __int64)(48 * v5) )
              *(_QWORD *)(v160 + 4096) = &v161[48 * v5];
            else
              v161 = (char *)malloc(48 * v5);
          }
          else
          {
            v161 = 0LL;
          }
          v453 = &v161[48 * v158];
          *v453 = 20;
          v454 = &v161[48 * v5];
          *(_QWORD *)(v453 + 1) = v581[0];
          v453[11] = 0;
          *((_DWORD *)v453 + 3) = 0;
          *((_QWORD *)v453 + 2) = 0LL;
          *(_WORD *)(v453 + 9) = v581[1];
          v581[0] = 0LL;
          LOWORD(v581[1]) = 0;
          v453[24] = 0;
          *((_QWORD *)v453 + 4) = *(_QWORD *)((char *)v582 + 7);
          *((_QWORD *)v453 + 5) = 0LL;
          *(_QWORD *)(v453 + 25) = v582[0];
          *(_QWORD *)((char *)v582 + 7) = 0LL;
          v582[0] = 0LL;
          v456 = *(void ***)a3;
          v455 = *(void ***)(a3 + 8);
          v457 = v453 + 48;
          if ( v455 == *(void ***)a3 )
          {
            v259 = *(void ***)a3;
          }
          else
          {
            do
            {
              *((_QWORD *)v453 - 4) = *(v455 - 4);
              *((_OWORD *)v453 - 3) = *((_OWORD *)v455 - 3);
              v458 = (__int64)*(v455 - 1);
              *(v455 - 5) = 0LL;
              *(v455 - 4) = 0LL;
              *(v455 - 6) = 0LL;
              *((_QWORD *)v453 - 1) = v458;
              *(_OWORD *)(v453 - 24) = *(_OWORD *)(v455 - 3);
              *(v455 - 2) = 0LL;
              *(v455 - 1) = 0LL;
              *(v455 - 3) = 0LL;
              v455 -= 6;
              v453 -= 48;
            }
            while ( v456 != v455 );
            v259 = *(void ***)a3;
            v456 = *(void ***)(a3 + 8);
          }
          v260 = *(_QWORD *)(a3 + 16);
          *(_QWORD *)a3 = v453;
          *(_QWORD *)(a3 + 8) = v457;
          *(_QWORD *)(a3 + 16) = v454;
          if ( v456 != v259 )
          {
            do
            {
              if ( (*(_BYTE *)(v456 - 3) & 1) != 0 )
                free(*(v456 - 1));
              v459 = v456 - 6;
              if ( (*(_BYTE *)(v456 - 6) & 1) != 0 )
                free(*(v456 - 4));
              v456 -= 6;
            }
            while ( v259 != v459 );
          }
          goto LABEL_1062;
        case 'S':
          *(_QWORD *)((char *)v582 + 7) = 0LL;
          v582[0] = 0LL;
          qmemcpy(v581, "operator=", 9);
          v6 = *(_QWORD *)(a3 + 8);
          v162 = *(_QWORD *)(a3 + 16);
          if ( v6 < v162 )
            goto LABEL_378;
          v163 = 0xAAAAAAAAAAAAAAABLL * ((__int64)(v6 - *(_QWORD *)a3) >> 4);
          if ( v163 + 1 > 0x555555555555555LL )
            abort();
          v164 = 0xAAAAAAAAAAAAAAABLL * ((__int64)(v162 - *(_QWORD *)a3) >> 4);
          if ( v164 >= 0x2AAAAAAAAAAAAAALL || (2 * v164 >= v163 + 1 ? (v5 = 2 * v164) : (v5 = v163 + 1), v5) )
          {
            v165 = *(_QWORD *)(a3 + 24);
            v166 = *(char **)(v165 + 4096);
            if ( v165 + 4096 - (__int64)v166 >= (unsigned __int64)(48 * v5) )
              *(_QWORD *)(v165 + 4096) = &v166[48 * v5];
            else
              v166 = (char *)malloc(48 * v5);
          }
          else
          {
            v166 = 0LL;
          }
          v460 = &v166[48 * v163];
          *v460 = 18;
          v461 = &v166[48 * v5];
          *(_QWORD *)(v460 + 1) = v581[0];
          v460[10] = 0;
          v460[9] = v581[1];
          *(_DWORD *)(v460 + 11) = 0;
          *((_QWORD *)v460 + 2) = 0LL;
          v460[15] = 0;
          v581[0] = 0LL;
          LOBYTE(v581[1]) = 0;
          v460[24] = 0;
          *((_QWORD *)v460 + 4) = *(_QWORD *)((char *)v582 + 7);
          *((_QWORD *)v460 + 5) = 0LL;
          *(_QWORD *)(v460 + 25) = v582[0];
          *(_QWORD *)((char *)v582 + 7) = 0LL;
          v582[0] = 0LL;
          v463 = *(void ***)a3;
          v462 = *(void ***)(a3 + 8);
          v464 = v460 + 48;
          if ( v462 == *(void ***)a3 )
          {
            v259 = *(void ***)a3;
          }
          else
          {
            do
            {
              *((_QWORD *)v460 - 4) = *(v462 - 4);
              *((_OWORD *)v460 - 3) = *((_OWORD *)v462 - 3);
              v465 = (__int64)*(v462 - 1);
              *(v462 - 5) = 0LL;
              *(v462 - 4) = 0LL;
              *(v462 - 6) = 0LL;
              *((_QWORD *)v460 - 1) = v465;
              *(_OWORD *)(v460 - 24) = *(_OWORD *)(v462 - 3);
              *(v462 - 2) = 0LL;
              *(v462 - 1) = 0LL;
              *(v462 - 3) = 0LL;
              v462 -= 6;
              v460 -= 48;
            }
            while ( v463 != v462 );
            v259 = *(void ***)a3;
            v463 = *(void ***)(a3 + 8);
          }
          v260 = *(_QWORD *)(a3 + 16);
          *(_QWORD *)a3 = v460;
          *(_QWORD *)(a3 + 8) = v464;
          *(_QWORD *)(a3 + 16) = v461;
          if ( v463 != v259 )
          {
            do
            {
              if ( (*(_BYTE *)(v463 - 3) & 1) != 0 )
                free(*(v463 - 1));
              v466 = v463 - 6;
              if ( (*(_BYTE *)(v463 - 6) & 1) != 0 )
                free(*(v463 - 4));
              v463 -= 6;
            }
            while ( v259 != v466 );
          }
          goto LABEL_1062;
        case 'a':
          *(_QWORD *)((char *)v582 + 7) = 0LL;
          v582[0] = 0LL;
          qmemcpy(v581, "operator&&", 10);
          v6 = *(_QWORD *)(a3 + 8);
          v134 = *(_QWORD *)(a3 + 16);
          if ( v6 < v134 )
            goto LABEL_365;
          v135 = 0xAAAAAAAAAAAAAAABLL * ((__int64)(v6 - *(_QWORD *)a3) >> 4);
          if ( v135 + 1 > 0x555555555555555LL )
            abort();
          v136 = 0xAAAAAAAAAAAAAAABLL * ((__int64)(v134 - *(_QWORD *)a3) >> 4);
          if ( v136 >= 0x2AAAAAAAAAAAAAALL || (2 * v136 >= v135 + 1 ? (v5 = 2 * v136) : (v5 = v135 + 1), v5) )
          {
            v137 = *(_QWORD *)(a3 + 24);
            v138 = *(char **)(v137 + 4096);
            if ( v137 + 4096 - (__int64)v138 >= (unsigned __int64)(48 * v5) )
              *(_QWORD *)(v137 + 4096) = &v138[48 * v5];
            else
              v138 = (char *)malloc(48 * v5);
          }
          else
          {
            v138 = 0LL;
          }
          v397 = &v138[48 * v135];
          *v397 = 20;
          v398 = &v138[48 * v5];
          *(_QWORD *)(v397 + 1) = v581[0];
          v397[11] = 0;
          *((_DWORD *)v397 + 3) = 0;
          *((_QWORD *)v397 + 2) = 0LL;
          *(_WORD *)(v397 + 9) = v581[1];
          v581[0] = 0LL;
          LOWORD(v581[1]) = 0;
          v397[24] = 0;
          *((_QWORD *)v397 + 4) = *(_QWORD *)((char *)v582 + 7);
          *((_QWORD *)v397 + 5) = 0LL;
          *(_QWORD *)(v397 + 25) = v582[0];
          *(_QWORD *)((char *)v582 + 7) = 0LL;
          v582[0] = 0LL;
          v400 = *(void ***)a3;
          v399 = *(void ***)(a3 + 8);
          v401 = v397 + 48;
          if ( v399 == *(void ***)a3 )
          {
            v259 = *(void ***)a3;
          }
          else
          {
            do
            {
              *((_QWORD *)v397 - 4) = *(v399 - 4);
              *((_OWORD *)v397 - 3) = *((_OWORD *)v399 - 3);
              v402 = (__int64)*(v399 - 1);
              *(v399 - 5) = 0LL;
              *(v399 - 4) = 0LL;
              *(v399 - 6) = 0LL;
              *((_QWORD *)v397 - 1) = v402;
              *(_OWORD *)(v397 - 24) = *(_OWORD *)(v399 - 3);
              *(v399 - 2) = 0LL;
              *(v399 - 1) = 0LL;
              *(v399 - 3) = 0LL;
              v399 -= 6;
              v397 -= 48;
            }
            while ( v400 != v399 );
            v259 = *(void ***)a3;
            v400 = *(void ***)(a3 + 8);
          }
          v260 = *(_QWORD *)(a3 + 16);
          *(_QWORD *)a3 = v397;
          *(_QWORD *)(a3 + 8) = v401;
          *(_QWORD *)(a3 + 16) = v398;
          if ( v400 != v259 )
          {
            do
            {
              if ( (*(_BYTE *)(v400 - 3) & 1) != 0 )
                free(*(v400 - 1));
              v403 = v400 - 6;
              if ( (*(_BYTE *)(v400 - 6) & 1) != 0 )
                free(*(v400 - 4));
              v400 -= 6;
            }
            while ( v259 != v403 );
          }
          goto LABEL_1062;
        case 'd':
        case 'n':
          *(_QWORD *)((char *)v582 + 7) = 0LL;
          v582[0] = 0LL;
          qmemcpy(v581, "operator&", 9);
          v6 = *(_QWORD *)(a3 + 8);
          v7 = *(_QWORD *)(a3 + 16);
          if ( v6 < v7 )
            goto LABEL_378;
          v8 = 0xAAAAAAAAAAAAAAABLL * ((__int64)(v6 - *(_QWORD *)a3) >> 4);
          if ( v8 + 1 > 0x555555555555555LL )
            abort();
          v9 = 0xAAAAAAAAAAAAAAABLL * ((__int64)(v7 - *(_QWORD *)a3) >> 4);
          if ( v9 >= 0x2AAAAAAAAAAAAAALL || (2 * v9 >= v8 + 1 ? (v5 = 2 * v9) : (v5 = v8 + 1), v5) )
          {
            v10 = *(_QWORD *)(a3 + 24);
            v11 = *(char **)(v10 + 4096);
            if ( v10 + 4096 - (__int64)v11 >= (unsigned __int64)(48 * v5) )
              *(_QWORD *)(v10 + 4096) = &v11[48 * v5];
            else
              v11 = (char *)malloc(48 * v5);
          }
          else
          {
            v11 = 0LL;
          }
          v270 = &v11[48 * v8];
          *v270 = 18;
          v271 = &v11[48 * v5];
          *(_QWORD *)(v270 + 1) = v581[0];
          v270[10] = 0;
          v270[9] = v581[1];
          *(_DWORD *)(v270 + 11) = 0;
          *((_QWORD *)v270 + 2) = 0LL;
          v270[15] = 0;
          v581[0] = 0LL;
          LOBYTE(v581[1]) = 0;
          v270[24] = 0;
          *((_QWORD *)v270 + 4) = *(_QWORD *)((char *)v582 + 7);
          *((_QWORD *)v270 + 5) = 0LL;
          *(_QWORD *)(v270 + 25) = v582[0];
          *(_QWORD *)((char *)v582 + 7) = 0LL;
          v582[0] = 0LL;
          v273 = *(void ***)a3;
          v272 = *(void ***)(a3 + 8);
          v274 = v270 + 48;
          if ( v272 == *(void ***)a3 )
          {
            v259 = *(void ***)a3;
          }
          else
          {
            do
            {
              *((_QWORD *)v270 - 4) = *(v272 - 4);
              *((_OWORD *)v270 - 3) = *((_OWORD *)v272 - 3);
              v275 = (__int64)*(v272 - 1);
              *(v272 - 5) = 0LL;
              *(v272 - 4) = 0LL;
              *(v272 - 6) = 0LL;
              *((_QWORD *)v270 - 1) = v275;
              *(_OWORD *)(v270 - 24) = *(_OWORD *)(v272 - 3);
              *(v272 - 2) = 0LL;
              *(v272 - 1) = 0LL;
              *(v272 - 3) = 0LL;
              v272 -= 6;
              v270 -= 48;
            }
            while ( v273 != v272 );
            v259 = *(void ***)a3;
            v273 = *(void ***)(a3 + 8);
          }
          v260 = *(_QWORD *)(a3 + 16);
          *(_QWORD *)a3 = v270;
          *(_QWORD *)(a3 + 8) = v274;
          *(_QWORD *)(a3 + 16) = v271;
          if ( v273 != v259 )
          {
            do
            {
              if ( (*(_BYTE *)(v273 - 3) & 1) != 0 )
                free(*(v273 - 1));
              v276 = v273 - 6;
              if ( (*(_BYTE *)(v273 - 6) & 1) != 0 )
                free(*(v273 - 4));
              v273 -= 6;
            }
            while ( v259 != v276 );
          }
          goto LABEL_1062;
        default:
          return (__int64)v3;
      }
      return (__int64)v3;
    case 'c':
      switch ( a1[1] )
      {
        case 'l':
          *(_QWORD *)((char *)v582 + 7) = 0LL;
          v582[0] = 0LL;
          qmemcpy(v581, "operator()", 10);
          v6 = *(_QWORD *)(a3 + 8);
          v55 = *(_QWORD *)(a3 + 16);
          if ( v6 < v55 )
            goto LABEL_365;
          v56 = 0xAAAAAAAAAAAAAAABLL * ((__int64)(v6 - *(_QWORD *)a3) >> 4);
          if ( v56 + 1 > 0x555555555555555LL )
            abort();
          v57 = 0xAAAAAAAAAAAAAAABLL * ((__int64)(v55 - *(_QWORD *)a3) >> 4);
          if ( v57 >= 0x2AAAAAAAAAAAAAALL || (2 * v57 >= v56 + 1 ? (v5 = 2 * v57) : (v5 = v56 + 1), v5) )
          {
            v58 = *(_QWORD *)(a3 + 24);
            v59 = *(char **)(v58 + 4096);
            if ( v58 + 4096 - (__int64)v59 >= (unsigned __int64)(48 * v5) )
              *(_QWORD *)(v58 + 4096) = &v59[48 * v5];
            else
              v59 = (char *)malloc(48 * v5);
          }
          else
          {
            v59 = 0LL;
          }
          v369 = &v59[48 * v56];
          *v369 = 20;
          v370 = &v59[48 * v5];
          *(_QWORD *)(v369 + 1) = v581[0];
          v369[11] = 0;
          *((_DWORD *)v369 + 3) = 0;
          *((_QWORD *)v369 + 2) = 0LL;
          *(_WORD *)(v369 + 9) = v581[1];
          v581[0] = 0LL;
          LOWORD(v581[1]) = 0;
          v369[24] = 0;
          *((_QWORD *)v369 + 4) = *(_QWORD *)((char *)v582 + 7);
          *((_QWORD *)v369 + 5) = 0LL;
          *(_QWORD *)(v369 + 25) = v582[0];
          *(_QWORD *)((char *)v582 + 7) = 0LL;
          v582[0] = 0LL;
          v372 = *(void ***)a3;
          v371 = *(void ***)(a3 + 8);
          v373 = v369 + 48;
          if ( v371 == *(void ***)a3 )
          {
            v259 = *(void ***)a3;
          }
          else
          {
            do
            {
              *((_QWORD *)v369 - 4) = *(v371 - 4);
              *((_OWORD *)v369 - 3) = *((_OWORD *)v371 - 3);
              v374 = (__int64)*(v371 - 1);
              *(v371 - 5) = 0LL;
              *(v371 - 4) = 0LL;
              *(v371 - 6) = 0LL;
              *((_QWORD *)v369 - 1) = v374;
              *(_OWORD *)(v369 - 24) = *(_OWORD *)(v371 - 3);
              *(v371 - 2) = 0LL;
              *(v371 - 1) = 0LL;
              *(v371 - 3) = 0LL;
              v371 -= 6;
              v369 -= 48;
            }
            while ( v372 != v371 );
            v259 = *(void ***)a3;
            v372 = *(void ***)(a3 + 8);
          }
          v260 = *(_QWORD *)(a3 + 16);
          *(_QWORD *)a3 = v369;
          *(_QWORD *)(a3 + 8) = v373;
          *(_QWORD *)(a3 + 16) = v370;
          if ( v372 != v259 )
          {
            do
            {
              if ( (*(_BYTE *)(v372 - 3) & 1) != 0 )
                free(*(v372 - 1));
              v375 = v372 - 6;
              if ( (*(_BYTE *)(v372 - 6) & 1) != 0 )
                free(*(v372 - 4));
              v372 -= 6;
            }
            while ( v259 != v375 );
          }
          goto LABEL_1062;
        case 'm':
          *(_QWORD *)((char *)v582 + 7) = 0LL;
          v582[0] = 0LL;
          qmemcpy(v581, "operator,", 9);
          v6 = *(_QWORD *)(a3 + 8);
          v114 = *(_QWORD *)(a3 + 16);
          if ( v6 < v114 )
            goto LABEL_378;
          v115 = 0xAAAAAAAAAAAAAAABLL * ((__int64)(v6 - *(_QWORD *)a3) >> 4);
          if ( v115 + 1 > 0x555555555555555LL )
            abort();
          v116 = 0xAAAAAAAAAAAAAAABLL * ((__int64)(v114 - *(_QWORD *)a3) >> 4);
          if ( v116 >= 0x2AAAAAAAAAAAAAALL || (2 * v116 >= v115 + 1 ? (v5 = 2 * v116) : (v5 = v115 + 1), v5) )
          {
            v117 = *(_QWORD *)(a3 + 24);
            v118 = *(char **)(v117 + 4096);
            if ( v117 + 4096 - (__int64)v118 >= (unsigned __int64)(48 * v5) )
              *(_QWORD *)(v117 + 4096) = &v118[48 * v5];
            else
              v118 = (char *)malloc(48 * v5);
          }
          else
          {
            v118 = 0LL;
          }
          v376 = &v118[48 * v115];
          *v376 = 18;
          v377 = &v118[48 * v5];
          *(_QWORD *)(v376 + 1) = v581[0];
          v376[10] = 0;
          v376[9] = v581[1];
          *(_DWORD *)(v376 + 11) = 0;
          *((_QWORD *)v376 + 2) = 0LL;
          v376[15] = 0;
          v581[0] = 0LL;
          LOBYTE(v581[1]) = 0;
          v376[24] = 0;
          *((_QWORD *)v376 + 4) = *(_QWORD *)((char *)v582 + 7);
          *((_QWORD *)v376 + 5) = 0LL;
          *(_QWORD *)(v376 + 25) = v582[0];
          *(_QWORD *)((char *)v582 + 7) = 0LL;
          v582[0] = 0LL;
          v379 = *(void ***)a3;
          v378 = *(void ***)(a3 + 8);
          v380 = v376 + 48;
          if ( v378 == *(void ***)a3 )
          {
            v259 = *(void ***)a3;
          }
          else
          {
            do
            {
              *((_QWORD *)v376 - 4) = *(v378 - 4);
              *((_OWORD *)v376 - 3) = *((_OWORD *)v378 - 3);
              v381 = (__int64)*(v378 - 1);
              *(v378 - 5) = 0LL;
              *(v378 - 4) = 0LL;
              *(v378 - 6) = 0LL;
              *((_QWORD *)v376 - 1) = v381;
              *(_OWORD *)(v376 - 24) = *(_OWORD *)(v378 - 3);
              *(v378 - 2) = 0LL;
              *(v378 - 1) = 0LL;
              *(v378 - 3) = 0LL;
              v378 -= 6;
              v376 -= 48;
            }
            while ( v379 != v378 );
            v259 = *(void ***)a3;
            v379 = *(void ***)(a3 + 8);
          }
          v260 = *(_QWORD *)(a3 + 16);
          *(_QWORD *)a3 = v376;
          *(_QWORD *)(a3 + 8) = v380;
          *(_QWORD *)(a3 + 16) = v377;
          if ( v379 != v259 )
          {
            do
            {
              if ( (*(_BYTE *)(v379 - 3) & 1) != 0 )
                free(*(v379 - 1));
              v382 = v379 - 6;
              if ( (*(_BYTE *)(v379 - 6) & 1) != 0 )
                free(*(v379 - 4));
              v379 -= 6;
            }
            while ( v259 != v382 );
          }
          goto LABEL_1062;
        case 'o':
          *(_QWORD *)((char *)v582 + 7) = 0LL;
          v582[0] = 0LL;
          qmemcpy(v581, "operator~", 9);
          v6 = *(_QWORD *)(a3 + 8);
          v104 = *(_QWORD *)(a3 + 16);
          if ( v6 < v104 )
            goto LABEL_378;
          v105 = 0xAAAAAAAAAAAAAAABLL * ((__int64)(v6 - *(_QWORD *)a3) >> 4);
          if ( v105 + 1 > 0x555555555555555LL )
            abort();
          v106 = 0xAAAAAAAAAAAAAAABLL * ((__int64)(v104 - *(_QWORD *)a3) >> 4);
          if ( v106 >= 0x2AAAAAAAAAAAAAALL || (2 * v106 >= v105 + 1 ? (v5 = 2 * v106) : (v5 = v105 + 1), v5) )
          {
            v107 = *(_QWORD *)(a3 + 24);
            v108 = *(char **)(v107 + 4096);
            if ( v107 + 4096 - (__int64)v108 >= (unsigned __int64)(48 * v5) )
              *(_QWORD *)(v107 + 4096) = &v108[48 * v5];
            else
              v108 = (char *)malloc(48 * v5);
          }
          else
          {
            v108 = 0LL;
          }
          v354 = &v108[48 * v105];
          *v354 = 18;
          v355 = &v108[48 * v5];
          *(_QWORD *)(v354 + 1) = v581[0];
          v354[10] = 0;
          v354[9] = v581[1];
          *(_DWORD *)(v354 + 11) = 0;
          *((_QWORD *)v354 + 2) = 0LL;
          v354[15] = 0;
          v581[0] = 0LL;
          LOBYTE(v581[1]) = 0;
          v354[24] = 0;
          *((_QWORD *)v354 + 4) = *(_QWORD *)((char *)v582 + 7);
          *((_QWORD *)v354 + 5) = 0LL;
          *(_QWORD *)(v354 + 25) = v582[0];
          *(_QWORD *)((char *)v582 + 7) = 0LL;
          v582[0] = 0LL;
          v357 = *(void ***)a3;
          v356 = *(void ***)(a3 + 8);
          v358 = v354 + 48;
          if ( v356 == *(void ***)a3 )
          {
            v259 = *(void ***)a3;
          }
          else
          {
            do
            {
              *((_QWORD *)v354 - 4) = *(v356 - 4);
              *((_OWORD *)v354 - 3) = *((_OWORD *)v356 - 3);
              v359 = (__int64)*(v356 - 1);
              *(v356 - 5) = 0LL;
              *(v356 - 4) = 0LL;
              *(v356 - 6) = 0LL;
              *((_QWORD *)v354 - 1) = v359;
              *(_OWORD *)(v354 - 24) = *(_OWORD *)(v356 - 3);
              *(v356 - 2) = 0LL;
              *(v356 - 1) = 0LL;
              *(v356 - 3) = 0LL;
              v356 -= 6;
              v354 -= 48;
            }
            while ( v357 != v356 );
            v259 = *(void ***)a3;
            v357 = *(void ***)(a3 + 8);
          }
          v260 = *(_QWORD *)(a3 + 16);
          *(_QWORD *)a3 = v354;
          *(_QWORD *)(a3 + 8) = v358;
          *(_QWORD *)(a3 + 16) = v355;
          if ( v357 != v259 )
          {
            do
            {
              if ( (*(_BYTE *)(v357 - 3) & 1) != 0 )
                free(*(v357 - 1));
              v360 = v357 - 6;
              if ( (*(_BYTE *)(v357 - 6) & 1) != 0 )
                free(*(v357 - 4));
              v357 -= 6;
            }
            while ( v259 != v360 );
          }
          goto LABEL_1062;
        case 'v':
          v119 = *(_BYTE *)(a3 + 111);
          v120 = a1 + 2;
          *(_BYTE *)(a3 + 111) = 0;
          v13 = sub_925FC(a1 + 2, a2, a3);
          *(_BYTE *)(a3 + 111) = v119;
          if ( (_BYTE *)v13 == v120 )
            return (__int64)v3;
          v121 = *(_QWORD *)(a3 + 8);
          if ( *(_QWORD *)a3 == v121 )
            return (__int64)v3;
          sub_9CDD8((size_t *)(v121 - 48), 0LL, "operator ", 9uLL);
          *(_BYTE *)(a3 + 108) = 1;
          break;
        default:
          return (__int64)v3;
      }
      return v13;
    case 'd':
      switch ( a1[1] )
      {
        case 'V':
          *(_QWORD *)((char *)v582 + 7) = 0LL;
          v582[0] = 0LL;
          qmemcpy(v581, "operator/=", 10);
          v6 = *(_QWORD *)(a3 + 8);
          v50 = *(_QWORD *)(a3 + 16);
          if ( v6 < v50 )
            goto LABEL_365;
          v51 = 0xAAAAAAAAAAAAAAABLL * ((__int64)(v6 - *(_QWORD *)a3) >> 4);
          if ( v51 + 1 > 0x555555555555555LL )
            abort();
          v52 = 0xAAAAAAAAAAAAAAABLL * ((__int64)(v50 - *(_QWORD *)a3) >> 4);
          if ( v52 >= 0x2AAAAAAAAAAAAAALL || (2 * v52 >= v51 + 1 ? (v5 = 2 * v52) : (v5 = v51 + 1), v5) )
          {
            v53 = *(_QWORD *)(a3 + 24);
            v54 = *(char **)(v53 + 4096);
            if ( v53 + 4096 - (__int64)v54 >= (unsigned __int64)(48 * v5) )
              *(_QWORD *)(v53 + 4096) = &v54[48 * v5];
            else
              v54 = (char *)malloc(48 * v5);
          }
          else
          {
            v54 = 0LL;
          }
          v404 = &v54[48 * v51];
          *v404 = 20;
          v405 = &v54[48 * v5];
          *(_QWORD *)(v404 + 1) = v581[0];
          v404[11] = 0;
          *((_DWORD *)v404 + 3) = 0;
          *((_QWORD *)v404 + 2) = 0LL;
          *(_WORD *)(v404 + 9) = v581[1];
          v581[0] = 0LL;
          LOWORD(v581[1]) = 0;
          v404[24] = 0;
          *((_QWORD *)v404 + 4) = *(_QWORD *)((char *)v582 + 7);
          *((_QWORD *)v404 + 5) = 0LL;
          *(_QWORD *)(v404 + 25) = v582[0];
          *(_QWORD *)((char *)v582 + 7) = 0LL;
          v582[0] = 0LL;
          v407 = *(void ***)a3;
          v406 = *(void ***)(a3 + 8);
          v408 = v404 + 48;
          if ( v406 == *(void ***)a3 )
          {
            v259 = *(void ***)a3;
          }
          else
          {
            do
            {
              *((_QWORD *)v404 - 4) = *(v406 - 4);
              *((_OWORD *)v404 - 3) = *((_OWORD *)v406 - 3);
              v409 = (__int64)*(v406 - 1);
              *(v406 - 5) = 0LL;
              *(v406 - 4) = 0LL;
              *(v406 - 6) = 0LL;
              *((_QWORD *)v404 - 1) = v409;
              *(_OWORD *)(v404 - 24) = *(_OWORD *)(v406 - 3);
              *(v406 - 2) = 0LL;
              *(v406 - 1) = 0LL;
              *(v406 - 3) = 0LL;
              v406 -= 6;
              v404 -= 48;
            }
            while ( v407 != v406 );
            v259 = *(void ***)a3;
            v407 = *(void ***)(a3 + 8);
          }
          v260 = *(_QWORD *)(a3 + 16);
          *(_QWORD *)a3 = v404;
          *(_QWORD *)(a3 + 8) = v408;
          *(_QWORD *)(a3 + 16) = v405;
          if ( v407 != v259 )
          {
            do
            {
              if ( (*(_BYTE *)(v407 - 3) & 1) != 0 )
                free(*(v407 - 1));
              v410 = v407 - 6;
              if ( (*(_BYTE *)(v407 - 6) & 1) != 0 )
                free(*(v407 - 4));
              v407 -= 6;
            }
            while ( v259 != v410 );
          }
          goto LABEL_1062;
        case 'a':
          memset(v581, 0, 15);
          qmemcpy(v582, "operator delete", 15);
          v139 = *(_QWORD *)(a3 + 8);
          v140 = *(_QWORD *)(a3 + 16);
          if ( v139 < v140 )
          {
            *(_BYTE *)v139 = 34;
            v3 = a1 + 2;
            *(_QWORD *)(v139 + 8) = *(_QWORD *)((char *)v582 + 7);
            v141 = v582[0];
            *(_QWORD *)(v139 + 16) = 23899LL;
            goto LABEL_295;
          }
          v221 = 0xAAAAAAAAAAAAAAABLL * ((__int64)(v139 - *(_QWORD *)a3) >> 4);
          if ( v221 + 1 > 0x555555555555555LL )
            abort();
          v222 = 0xAAAAAAAAAAAAAAABLL * ((__int64)(v140 - *(_QWORD *)a3) >> 4);
          if ( v222 >= 0x2AAAAAAAAAAAAAALL || (2 * v222 >= v221 + 1 ? (v5 = 2 * v222) : (v5 = v221 + 1), v5) )
          {
            v223 = *(_QWORD *)(a3 + 24);
            v224 = *(char **)(v223 + 4096);
            if ( v223 + 4096 - (__int64)v224 >= (unsigned __int64)(48 * v5) )
              *(_QWORD *)(v223 + 4096) = &v224[48 * v5];
            else
              v224 = (char *)malloc(48 * v5);
          }
          else
          {
            v224 = 0LL;
          }
          v425 = &v224[48 * v221];
          *v425 = 34;
          v426 = &v224[48 * v5];
          *((_QWORD *)v425 + 1) = *(_QWORD *)((char *)v582 + 7);
          *((_QWORD *)v425 + 2) = 23899LL;
          *(_QWORD *)(v425 + 1) = v582[0];
          *(_QWORD *)((char *)v582 + 7) = 0LL;
          v582[0] = 0LL;
          v425[24] = 0;
          *((_QWORD *)v425 + 4) = *(_QWORD *)((char *)v581 + 7);
          *((_QWORD *)v425 + 5) = 0LL;
          *(_QWORD *)(v425 + 25) = v581[0];
          memset(v581, 0, 15);
          v428 = *(void ***)a3;
          v427 = *(void ***)(a3 + 8);
          v429 = v425 + 48;
          if ( v427 == *(void ***)a3 )
          {
            v259 = *(void ***)a3;
          }
          else
          {
            do
            {
              *((_QWORD *)v425 - 4) = *(v427 - 4);
              *((_OWORD *)v425 - 3) = *((_OWORD *)v427 - 3);
              v430 = (__int64)*(v427 - 1);
              *(v427 - 5) = 0LL;
              *(v427 - 4) = 0LL;
              *(v427 - 6) = 0LL;
              *((_QWORD *)v425 - 1) = v430;
              *(_OWORD *)(v425 - 24) = *(_OWORD *)(v427 - 3);
              *(v427 - 2) = 0LL;
              *(v427 - 1) = 0LL;
              *(v427 - 3) = 0LL;
              v427 -= 6;
              v425 -= 48;
            }
            while ( v428 != v427 );
            v259 = *(void ***)a3;
            v428 = *(void ***)(a3 + 8);
          }
          v260 = *(_QWORD *)(a3 + 16);
          *(_QWORD *)a3 = v425;
          *(_QWORD *)(a3 + 8) = v429;
          *(_QWORD *)(a3 + 16) = v426;
          if ( v428 != v259 )
          {
            do
            {
              if ( (*(_BYTE *)(v428 - 3) & 1) != 0 )
                free(*(v428 - 1));
              v431 = v428 - 6;
              if ( (*(_BYTE *)(v428 - 6) & 1) != 0 )
                free(*(v428 - 4));
              v428 -= 6;
            }
            while ( v259 != v431 );
          }
          goto LABEL_1062;
        case 'e':
          *(_QWORD *)((char *)v582 + 7) = 0LL;
          v582[0] = 0LL;
          qmemcpy(v581, "operator*", 9);
          v6 = *(_QWORD *)(a3 + 8);
          v122 = *(_QWORD *)(a3 + 16);
          if ( v6 < v122 )
            goto LABEL_378;
          v123 = 0xAAAAAAAAAAAAAAABLL * ((__int64)(v6 - *(_QWORD *)a3) >> 4);
          if ( v123 + 1 > 0x555555555555555LL )
            abort();
          v124 = 0xAAAAAAAAAAAAAAABLL * ((__int64)(v122 - *(_QWORD *)a3) >> 4);
          if ( v124 >= 0x2AAAAAAAAAAAAAALL || (2 * v124 >= v123 + 1 ? (v5 = 2 * v124) : (v5 = v123 + 1), v5) )
          {
            v125 = *(_QWORD *)(a3 + 24);
            v126 = *(char **)(v125 + 4096);
            if ( v125 + 4096 - (__int64)v126 >= (unsigned __int64)(48 * v5) )
              *(_QWORD *)(v125 + 4096) = &v126[48 * v5];
            else
              v126 = (char *)malloc(48 * v5);
          }
          else
          {
            v126 = 0LL;
          }
          v383 = &v126[48 * v123];
          *v383 = 18;
          v384 = &v126[48 * v5];
          *(_QWORD *)(v383 + 1) = v581[0];
          v383[10] = 0;
          v383[9] = v581[1];
          *(_DWORD *)(v383 + 11) = 0;
          *((_QWORD *)v383 + 2) = 0LL;
          v383[15] = 0;
          v581[0] = 0LL;
          LOBYTE(v581[1]) = 0;
          v383[24] = 0;
          *((_QWORD *)v383 + 4) = *(_QWORD *)((char *)v582 + 7);
          *((_QWORD *)v383 + 5) = 0LL;
          *(_QWORD *)(v383 + 25) = v582[0];
          *(_QWORD *)((char *)v582 + 7) = 0LL;
          v582[0] = 0LL;
          v386 = *(void ***)a3;
          v385 = *(void ***)(a3 + 8);
          v387 = v383 + 48;
          if ( v385 == *(void ***)a3 )
          {
            v259 = *(void ***)a3;
          }
          else
          {
            do
            {
              *((_QWORD *)v383 - 4) = *(v385 - 4);
              *((_OWORD *)v383 - 3) = *((_OWORD *)v385 - 3);
              v388 = (__int64)*(v385 - 1);
              *(v385 - 5) = 0LL;
              *(v385 - 4) = 0LL;
              *(v385 - 6) = 0LL;
              *((_QWORD *)v383 - 1) = v388;
              *(_OWORD *)(v383 - 24) = *(_OWORD *)(v385 - 3);
              *(v385 - 2) = 0LL;
              *(v385 - 1) = 0LL;
              *(v385 - 3) = 0LL;
              v385 -= 6;
              v383 -= 48;
            }
            while ( v386 != v385 );
            v259 = *(void ***)a3;
            v386 = *(void ***)(a3 + 8);
          }
          v260 = *(_QWORD *)(a3 + 16);
          *(_QWORD *)a3 = v383;
          *(_QWORD *)(a3 + 8) = v387;
          *(_QWORD *)(a3 + 16) = v384;
          if ( v386 != v259 )
          {
            do
            {
              if ( (*(_BYTE *)(v386 - 3) & 1) != 0 )
                free(*(v386 - 1));
              v389 = v386 - 6;
              if ( (*(_BYTE *)(v386 - 6) & 1) != 0 )
                free(*(v386 - 4));
              v386 -= 6;
            }
            while ( v259 != v389 );
          }
          goto LABEL_1062;
        case 'l':
          memset(v581, 0, 15);
          qmemcpy(v582, "operator delete", 15);
          v139 = *(_QWORD *)(a3 + 8);
          v167 = *(_QWORD *)(a3 + 16);
          if ( v139 >= v167 )
          {
            v225 = 0xAAAAAAAAAAAAAAABLL * ((__int64)(v139 - *(_QWORD *)a3) >> 4);
            if ( v225 + 1 > 0x555555555555555LL )
              abort();
            v226 = 0xAAAAAAAAAAAAAAABLL * ((__int64)(v167 - *(_QWORD *)a3) >> 4);
            if ( v226 >= 0x2AAAAAAAAAAAAAALL || (2 * v226 >= v225 + 1 ? (v5 = 2 * v226) : (v5 = v225 + 1), v5) )
            {
              v227 = *(_QWORD *)(a3 + 24);
              v228 = *(char **)(v227 + 4096);
              if ( v227 + 4096 - (__int64)v228 >= (unsigned __int64)(48 * v5) )
                *(_QWORD *)(v227 + 4096) = &v228[48 * v5];
              else
                v228 = (char *)malloc(48 * v5);
            }
            else
            {
              v228 = 0LL;
            }
            v467 = &v228[48 * v225];
            *v467 = 30;
            v468 = &v228[48 * v5];
            *((_QWORD *)v467 + 1) = *(_QWORD *)((char *)v582 + 7);
            *((_QWORD *)v467 + 2) = 0LL;
            *(_QWORD *)(v467 + 1) = v582[0];
            *(_QWORD *)((char *)v582 + 7) = 0LL;
            v582[0] = 0LL;
            v467[24] = 0;
            *((_QWORD *)v467 + 4) = *(_QWORD *)((char *)v581 + 7);
            *((_QWORD *)v467 + 5) = 0LL;
            *(_QWORD *)(v467 + 25) = v581[0];
            memset(v581, 0, 15);
            v470 = *(void ***)a3;
            v469 = *(void ***)(a3 + 8);
            v471 = v467 + 48;
            if ( v469 == *(void ***)a3 )
            {
              v259 = *(void ***)a3;
            }
            else
            {
              do
              {
                *((_QWORD *)v467 - 4) = *(v469 - 4);
                *((_OWORD *)v467 - 3) = *((_OWORD *)v469 - 3);
                v472 = (__int64)*(v469 - 1);
                *(v469 - 5) = 0LL;
                *(v469 - 4) = 0LL;
                *(v469 - 6) = 0LL;
                *((_QWORD *)v467 - 1) = v472;
                *(_OWORD *)(v467 - 24) = *(_OWORD *)(v469 - 3);
                *(v469 - 2) = 0LL;
                *(v469 - 1) = 0LL;
                *(v469 - 3) = 0LL;
                v469 -= 6;
                v467 -= 48;
              }
              while ( v470 != v469 );
              v259 = *(void ***)a3;
              v470 = *(void ***)(a3 + 8);
            }
            v260 = *(_QWORD *)(a3 + 16);
            *(_QWORD *)a3 = v467;
            *(_QWORD *)(a3 + 8) = v471;
            *(_QWORD *)(a3 + 16) = v468;
            if ( v470 != v259 )
            {
              do
              {
                if ( (*(_BYTE *)(v470 - 3) & 1) != 0 )
                  free(*(v470 - 1));
                v473 = v470 - 6;
                if ( (*(_BYTE *)(v470 - 6) & 1) != 0 )
                  free(*(v470 - 4));
                v470 -= 6;
              }
              while ( v259 != v473 );
            }
            goto LABEL_1062;
          }
          *(_BYTE *)v139 = 30;
          v3 = a1 + 2;
          *(_QWORD *)(v139 + 8) = *(_QWORD *)((char *)v582 + 7);
          *(_QWORD *)(v139 + 16) = 0LL;
          v141 = v582[0];
LABEL_295:
          *(_QWORD *)(v139 + 1) = v141;
          *(_QWORD *)((char *)v582 + 7) = 0LL;
          v582[0] = 0LL;
          *(_BYTE *)(v139 + 24) = 0;
          *(_QWORD *)(v139 + 32) = *(_QWORD *)((char *)v581 + 7);
          *(_QWORD *)(v139 + 40) = 0LL;
          *(_QWORD *)(v139 + 25) = v581[0];
          memset(v581, 0, 15);
          break;
        case 'v':
          *(_QWORD *)((char *)v582 + 7) = 0LL;
          v582[0] = 0LL;
          qmemcpy(v581, "operator/", 9);
          v6 = *(_QWORD *)(a3 + 8);
          v178 = *(_QWORD *)(a3 + 16);
          if ( v6 < v178 )
            goto LABEL_378;
          v179 = 0xAAAAAAAAAAAAAAABLL * ((__int64)(v6 - *(_QWORD *)a3) >> 4);
          if ( v179 + 1 > 0x555555555555555LL )
            abort();
          v180 = 0xAAAAAAAAAAAAAAABLL * ((__int64)(v178 - *(_QWORD *)a3) >> 4);
          if ( v180 >= 0x2AAAAAAAAAAAAAALL || (2 * v180 >= v179 + 1 ? (v5 = 2 * v180) : (v5 = v179 + 1), v5) )
          {
            v181 = *(_QWORD *)(a3 + 24);
            v182 = *(char **)(v181 + 4096);
            if ( v181 + 4096 - (__int64)v182 >= (unsigned __int64)(48 * v5) )
              *(_QWORD *)(v181 + 4096) = &v182[48 * v5];
            else
              v182 = (char *)malloc(48 * v5);
          }
          else
          {
            v182 = 0LL;
          }
          v488 = &v182[48 * v179];
          *v488 = 18;
          v489 = &v182[48 * v5];
          *(_QWORD *)(v488 + 1) = v581[0];
          v488[10] = 0;
          v488[9] = v581[1];
          *(_DWORD *)(v488 + 11) = 0;
          *((_QWORD *)v488 + 2) = 0LL;
          v488[15] = 0;
          v581[0] = 0LL;
          LOBYTE(v581[1]) = 0;
          v488[24] = 0;
          *((_QWORD *)v488 + 4) = *(_QWORD *)((char *)v582 + 7);
          *((_QWORD *)v488 + 5) = 0LL;
          *(_QWORD *)(v488 + 25) = v582[0];
          *(_QWORD *)((char *)v582 + 7) = 0LL;
          v582[0] = 0LL;
          v491 = *(void ***)a3;
          v490 = *(void ***)(a3 + 8);
          v492 = v488 + 48;
          if ( v490 == *(void ***)a3 )
          {
            v259 = *(void ***)a3;
          }
          else
          {
            do
            {
              *((_QWORD *)v488 - 4) = *(v490 - 4);
              *((_OWORD *)v488 - 3) = *((_OWORD *)v490 - 3);
              v493 = (__int64)*(v490 - 1);
              *(v490 - 5) = 0LL;
              *(v490 - 4) = 0LL;
              *(v490 - 6) = 0LL;
              *((_QWORD *)v488 - 1) = v493;
              *(_OWORD *)(v488 - 24) = *(_OWORD *)(v490 - 3);
              *(v490 - 2) = 0LL;
              *(v490 - 1) = 0LL;
              *(v490 - 3) = 0LL;
              v490 -= 6;
              v488 -= 48;
            }
            while ( v491 != v490 );
            v259 = *(void ***)a3;
            v491 = *(void ***)(a3 + 8);
          }
          v260 = *(_QWORD *)(a3 + 16);
          *(_QWORD *)a3 = v488;
          *(_QWORD *)(a3 + 8) = v492;
          *(_QWORD *)(a3 + 16) = v489;
          if ( v491 != v259 )
          {
            do
            {
              if ( (*(_BYTE *)(v491 - 3) & 1) != 0 )
                free(*(v491 - 1));
              v494 = v491 - 6;
              if ( (*(_BYTE *)(v491 - 6) & 1) != 0 )
                free(*(v491 - 4));
              v491 -= 6;
            }
            while ( v259 != v494 );
          }
          goto LABEL_1062;
        default:
          return (__int64)v3;
      }
      goto LABEL_380;
    case 'e':
      v44 = (unsigned __int8)a1[1];
      if ( v44 == 79 )
      {
        *(_QWORD *)((char *)v582 + 7) = 0LL;
        v582[0] = 0LL;
        qmemcpy(v581, "operator^=", 10);
        v6 = *(_QWORD *)(a3 + 8);
        v87 = *(_QWORD *)(a3 + 16);
        if ( v6 < v87 )
          goto LABEL_365;
        v88 = 0xAAAAAAAAAAAAAAABLL * ((__int64)(v6 - *(_QWORD *)a3) >> 4);
        if ( v88 + 1 > 0x555555555555555LL )
          abort();
        v89 = 0xAAAAAAAAAAAAAAABLL * ((__int64)(v87 - *(_QWORD *)a3) >> 4);
        if ( v89 >= 0x2AAAAAAAAAAAAAALL || (2 * v89 >= v88 + 1 ? (v5 = 2 * v89) : (v5 = v88 + 1), v5) )
        {
          v90 = *(_QWORD *)(a3 + 24);
          v91 = *(char **)(v90 + 4096);
          if ( v90 + 4096 - (__int64)v91 >= (unsigned __int64)(48 * v5) )
            *(_QWORD *)(v90 + 4096) = &v91[48 * v5];
          else
            v91 = (char *)malloc(48 * v5);
        }
        else
        {
          v91 = 0LL;
        }
        v298 = &v91[48 * v88];
        *v298 = 20;
        v299 = &v91[48 * v5];
        *(_QWORD *)(v298 + 1) = v581[0];
        v298[11] = 0;
        *((_DWORD *)v298 + 3) = 0;
        *((_QWORD *)v298 + 2) = 0LL;
        *(_WORD *)(v298 + 9) = v581[1];
        v581[0] = 0LL;
        LOWORD(v581[1]) = 0;
        v298[24] = 0;
        *((_QWORD *)v298 + 4) = *(_QWORD *)((char *)v582 + 7);
        *((_QWORD *)v298 + 5) = 0LL;
        *(_QWORD *)(v298 + 25) = v582[0];
        *(_QWORD *)((char *)v582 + 7) = 0LL;
        v582[0] = 0LL;
        v301 = *(void ***)a3;
        v300 = *(void ***)(a3 + 8);
        v302 = v298 + 48;
        if ( v300 == *(void ***)a3 )
        {
          v259 = *(void ***)a3;
        }
        else
        {
          do
          {
            *((_QWORD *)v298 - 4) = *(v300 - 4);
            *((_OWORD *)v298 - 3) = *((_OWORD *)v300 - 3);
            v303 = (__int64)*(v300 - 1);
            *(v300 - 5) = 0LL;
            *(v300 - 4) = 0LL;
            *(v300 - 6) = 0LL;
            *((_QWORD *)v298 - 1) = v303;
            *(_OWORD *)(v298 - 24) = *(_OWORD *)(v300 - 3);
            *(v300 - 2) = 0LL;
            *(v300 - 1) = 0LL;
            *(v300 - 3) = 0LL;
            v300 -= 6;
            v298 -= 48;
          }
          while ( v301 != v300 );
          v259 = *(void ***)a3;
          v301 = *(void ***)(a3 + 8);
        }
        v260 = *(_QWORD *)(a3 + 16);
        *(_QWORD *)a3 = v298;
        *(_QWORD *)(a3 + 8) = v302;
        *(_QWORD *)(a3 + 16) = v299;
        if ( v301 != v259 )
        {
          do
          {
            if ( (*(_BYTE *)(v301 - 3) & 1) != 0 )
              free(*(v301 - 1));
            v304 = v301 - 6;
            if ( (*(_BYTE *)(v301 - 6) & 1) != 0 )
              free(*(v301 - 4));
            v301 -= 6;
          }
          while ( v259 != v304 );
        }
        goto LABEL_1062;
      }
      if ( v44 == 113 )
      {
        *(_QWORD *)((char *)v582 + 7) = 0LL;
        v582[0] = 0LL;
        qmemcpy(v581, "operator==", 10);
        v6 = *(_QWORD *)(a3 + 8);
        v82 = *(_QWORD *)(a3 + 16);
        if ( v6 < v82 )
          goto LABEL_365;
        v83 = 0xAAAAAAAAAAAAAAABLL * ((__int64)(v6 - *(_QWORD *)a3) >> 4);
        if ( v83 + 1 > 0x555555555555555LL )
          abort();
        v84 = 0xAAAAAAAAAAAAAAABLL * ((__int64)(v82 - *(_QWORD *)a3) >> 4);
        if ( v84 >= 0x2AAAAAAAAAAAAAALL || (2 * v84 >= v83 + 1 ? (v5 = 2 * v84) : (v5 = v83 + 1), v5) )
        {
          v85 = *(_QWORD *)(a3 + 24);
          v86 = *(char **)(v85 + 4096);
          if ( v85 + 4096 - (__int64)v86 >= (unsigned __int64)(48 * v5) )
            *(_QWORD *)(v85 + 4096) = &v86[48 * v5];
          else
            v86 = (char *)malloc(48 * v5);
        }
        else
        {
          v86 = 0LL;
        }
        v291 = &v86[48 * v83];
        *v291 = 20;
        v292 = &v86[48 * v5];
        *(_QWORD *)(v291 + 1) = v581[0];
        v291[11] = 0;
        *((_DWORD *)v291 + 3) = 0;
        *((_QWORD *)v291 + 2) = 0LL;
        *(_WORD *)(v291 + 9) = v581[1];
        v581[0] = 0LL;
        LOWORD(v581[1]) = 0;
        v291[24] = 0;
        *((_QWORD *)v291 + 4) = *(_QWORD *)((char *)v582 + 7);
        *((_QWORD *)v291 + 5) = 0LL;
        *(_QWORD *)(v291 + 25) = v582[0];
        *(_QWORD *)((char *)v582 + 7) = 0LL;
        v582[0] = 0LL;
        v294 = *(void ***)a3;
        v293 = *(void ***)(a3 + 8);
        v295 = v291 + 48;
        if ( v293 == *(void ***)a3 )
        {
          v259 = *(void ***)a3;
        }
        else
        {
          do
          {
            *((_QWORD *)v291 - 4) = *(v293 - 4);
            *((_OWORD *)v291 - 3) = *((_OWORD *)v293 - 3);
            v296 = (__int64)*(v293 - 1);
            *(v293 - 5) = 0LL;
            *(v293 - 4) = 0LL;
            *(v293 - 6) = 0LL;
            *((_QWORD *)v291 - 1) = v296;
            *(_OWORD *)(v291 - 24) = *(_OWORD *)(v293 - 3);
            *(v293 - 2) = 0LL;
            *(v293 - 1) = 0LL;
            *(v293 - 3) = 0LL;
            v293 -= 6;
            v291 -= 48;
          }
          while ( v294 != v293 );
          v259 = *(void ***)a3;
          v294 = *(void ***)(a3 + 8);
        }
        v260 = *(_QWORD *)(a3 + 16);
        *(_QWORD *)a3 = v291;
        *(_QWORD *)(a3 + 8) = v295;
        *(_QWORD *)(a3 + 16) = v292;
        if ( v294 != v259 )
        {
          do
          {
            if ( (*(_BYTE *)(v294 - 3) & 1) != 0 )
              free(*(v294 - 1));
            v297 = v294 - 6;
            if ( (*(_BYTE *)(v294 - 6) & 1) != 0 )
              free(*(v294 - 4));
            v294 -= 6;
          }
          while ( v259 != v297 );
        }
        goto LABEL_1062;
      }
      if ( v44 != 111 )
        return (__int64)v3;
      *(_QWORD *)((char *)v582 + 7) = 0LL;
      v582[0] = 0LL;
      qmemcpy(v581, "operator^", 9);
      v6 = *(_QWORD *)(a3 + 8);
      v45 = *(_QWORD *)(a3 + 16);
      if ( v6 >= v45 )
      {
        v46 = 0xAAAAAAAAAAAAAAABLL * ((__int64)(v6 - *(_QWORD *)a3) >> 4);
        if ( v46 + 1 > 0x555555555555555LL )
          abort();
        v47 = 0xAAAAAAAAAAAAAAABLL * ((__int64)(v45 - *(_QWORD *)a3) >> 4);
        if ( v47 >= 0x2AAAAAAAAAAAAAALL || (2 * v47 >= v46 + 1 ? (v5 = 2 * v47) : (v5 = v46 + 1), v5) )
        {
          v48 = *(_QWORD *)(a3 + 24);
          v49 = *(char **)(v48 + 4096);
          if ( v48 + 4096 - (__int64)v49 >= (unsigned __int64)(48 * v5) )
            *(_QWORD *)(v48 + 4096) = &v49[48 * v5];
          else
            v49 = (char *)malloc(48 * v5);
        }
        else
        {
          v49 = 0LL;
        }
        v305 = &v49[48 * v46];
        *v305 = 18;
        v306 = &v49[48 * v5];
        *(_QWORD *)(v305 + 1) = v581[0];
        v305[10] = 0;
        v305[9] = v581[1];
        *(_DWORD *)(v305 + 11) = 0;
        *((_QWORD *)v305 + 2) = 0LL;
        v305[15] = 0;
        v581[0] = 0LL;
        LOBYTE(v581[1]) = 0;
        v305[24] = 0;
        *((_QWORD *)v305 + 4) = *(_QWORD *)((char *)v582 + 7);
        *((_QWORD *)v305 + 5) = 0LL;
        *(_QWORD *)(v305 + 25) = v582[0];
        *(_QWORD *)((char *)v582 + 7) = 0LL;
        v582[0] = 0LL;
        v308 = *(void ***)a3;
        v307 = *(void ***)(a3 + 8);
        v309 = v305 + 48;
        if ( v307 == *(void ***)a3 )
        {
          v259 = *(void ***)a3;
        }
        else
        {
          do
          {
            *((_QWORD *)v305 - 4) = *(v307 - 4);
            *((_OWORD *)v305 - 3) = *((_OWORD *)v307 - 3);
            v310 = (__int64)*(v307 - 1);
            *(v307 - 5) = 0LL;
            *(v307 - 4) = 0LL;
            *(v307 - 6) = 0LL;
            *((_QWORD *)v305 - 1) = v310;
            *(_OWORD *)(v305 - 24) = *(_OWORD *)(v307 - 3);
            *(v307 - 2) = 0LL;
            *(v307 - 1) = 0LL;
            *(v307 - 3) = 0LL;
            v307 -= 6;
            v305 -= 48;
          }
          while ( v308 != v307 );
          v259 = *(void ***)a3;
          v308 = *(void ***)(a3 + 8);
        }
        v260 = *(_QWORD *)(a3 + 16);
        *(_QWORD *)a3 = v305;
        *(_QWORD *)(a3 + 8) = v309;
        *(_QWORD *)(a3 + 16) = v306;
        if ( v308 != v259 )
        {
          do
          {
            if ( (*(_BYTE *)(v308 - 3) & 1) != 0 )
              free(*(v308 - 1));
            v311 = v308 - 6;
            if ( (*(_BYTE *)(v308 - 6) & 1) != 0 )
              free(*(v308 - 4));
            v308 -= 6;
          }
          while ( v259 != v311 );
        }
        goto LABEL_1062;
      }
      goto LABEL_378;
    case 'g':
      v23 = (unsigned __int8)a1[1];
      if ( v23 == 116 )
      {
        *(_QWORD *)((char *)v582 + 7) = 0LL;
        v582[0] = 0LL;
        qmemcpy(v581, "operator>", 9);
        v6 = *(_QWORD *)(a3 + 8);
        v77 = *(_QWORD *)(a3 + 16);
        if ( v6 < v77 )
          goto LABEL_378;
        v78 = 0xAAAAAAAAAAAAAAABLL * ((__int64)(v6 - *(_QWORD *)a3) >> 4);
        if ( v78 + 1 > 0x555555555555555LL )
          abort();
        v79 = 0xAAAAAAAAAAAAAAABLL * ((__int64)(v77 - *(_QWORD *)a3) >> 4);
        if ( v79 >= 0x2AAAAAAAAAAAAAALL || (2 * v79 >= v78 + 1 ? (v5 = 2 * v79) : (v5 = v78 + 1), v5) )
        {
          v80 = *(_QWORD *)(a3 + 24);
          v81 = *(char **)(v80 + 4096);
          if ( v80 + 4096 - (__int64)v81 >= (unsigned __int64)(48 * v5) )
            *(_QWORD *)(v80 + 4096) = &v81[48 * v5];
          else
            v81 = (char *)malloc(48 * v5);
        }
        else
        {
          v81 = 0LL;
        }
        v284 = &v81[48 * v78];
        *v284 = 18;
        v285 = &v81[48 * v5];
        *(_QWORD *)(v284 + 1) = v581[0];
        v284[10] = 0;
        v284[9] = v581[1];
        *(_DWORD *)(v284 + 11) = 0;
        *((_QWORD *)v284 + 2) = 0LL;
        v284[15] = 0;
        v581[0] = 0LL;
        LOBYTE(v581[1]) = 0;
        v284[24] = 0;
        *((_QWORD *)v284 + 4) = *(_QWORD *)((char *)v582 + 7);
        *((_QWORD *)v284 + 5) = 0LL;
        *(_QWORD *)(v284 + 25) = v582[0];
        *(_QWORD *)((char *)v582 + 7) = 0LL;
        v582[0] = 0LL;
        v287 = *(void ***)a3;
        v286 = *(void ***)(a3 + 8);
        v288 = v284 + 48;
        if ( v286 == *(void ***)a3 )
        {
          v259 = *(void ***)a3;
        }
        else
        {
          do
          {
            *((_QWORD *)v284 - 4) = *(v286 - 4);
            *((_OWORD *)v284 - 3) = *((_OWORD *)v286 - 3);
            v289 = (__int64)*(v286 - 1);
            *(v286 - 5) = 0LL;
            *(v286 - 4) = 0LL;
            *(v286 - 6) = 0LL;
            *((_QWORD *)v284 - 1) = v289;
            *(_OWORD *)(v284 - 24) = *(_OWORD *)(v286 - 3);
            *(v286 - 2) = 0LL;
            *(v286 - 1) = 0LL;
            *(v286 - 3) = 0LL;
            v286 -= 6;
            v284 -= 48;
          }
          while ( v287 != v286 );
          v259 = *(void ***)a3;
          v287 = *(void ***)(a3 + 8);
        }
        v260 = *(_QWORD *)(a3 + 16);
        *(_QWORD *)a3 = v284;
        *(_QWORD *)(a3 + 8) = v288;
        *(_QWORD *)(a3 + 16) = v285;
        if ( v287 != v259 )
        {
          do
          {
            if ( (*(_BYTE *)(v287 - 3) & 1) != 0 )
              free(*(v287 - 1));
            v290 = v287 - 6;
            if ( (*(_BYTE *)(v287 - 6) & 1) != 0 )
              free(*(v287 - 4));
            v287 -= 6;
          }
          while ( v259 != v290 );
        }
        goto LABEL_1062;
      }
      if ( v23 != 101 )
        return (__int64)v3;
      *(_QWORD *)((char *)v582 + 7) = 0LL;
      v582[0] = 0LL;
      qmemcpy(v581, "operator>=", 10);
      v6 = *(_QWORD *)(a3 + 8);
      v24 = *(_QWORD *)(a3 + 16);
      if ( v6 >= v24 )
      {
        v25 = 0xAAAAAAAAAAAAAAABLL * ((__int64)(v6 - *(_QWORD *)a3) >> 4);
        if ( v25 + 1 > 0x555555555555555LL )
          abort();
        v26 = 0xAAAAAAAAAAAAAAABLL * ((__int64)(v24 - *(_QWORD *)a3) >> 4);
        if ( v26 >= 0x2AAAAAAAAAAAAAALL || (2 * v26 >= v25 + 1 ? (v5 = 2 * v26) : (v5 = v25 + 1), v5) )
        {
          v27 = *(_QWORD *)(a3 + 24);
          v28 = *(char **)(v27 + 4096);
          if ( v27 + 4096 - (__int64)v28 >= (unsigned __int64)(48 * v5) )
            *(_QWORD *)(v27 + 4096) = &v28[48 * v5];
          else
            v28 = (char *)malloc(48 * v5);
        }
        else
        {
          v28 = 0LL;
        }
        v277 = &v28[48 * v25];
        *v277 = 20;
        v278 = &v28[48 * v5];
        *(_QWORD *)(v277 + 1) = v581[0];
        v277[11] = 0;
        *((_DWORD *)v277 + 3) = 0;
        *((_QWORD *)v277 + 2) = 0LL;
        *(_WORD *)(v277 + 9) = v581[1];
        v581[0] = 0LL;
        LOWORD(v581[1]) = 0;
        v277[24] = 0;
        *((_QWORD *)v277 + 4) = *(_QWORD *)((char *)v582 + 7);
        *((_QWORD *)v277 + 5) = 0LL;
        *(_QWORD *)(v277 + 25) = v582[0];
        *(_QWORD *)((char *)v582 + 7) = 0LL;
        v582[0] = 0LL;
        v280 = *(void ***)a3;
        v279 = *(void ***)(a3 + 8);
        v281 = v277 + 48;
        if ( v279 == *(void ***)a3 )
        {
          v259 = *(void ***)a3;
        }
        else
        {
          do
          {
            *((_QWORD *)v277 - 4) = *(v279 - 4);
            *((_OWORD *)v277 - 3) = *((_OWORD *)v279 - 3);
            v282 = (__int64)*(v279 - 1);
            *(v279 - 5) = 0LL;
            *(v279 - 4) = 0LL;
            *(v279 - 6) = 0LL;
            *((_QWORD *)v277 - 1) = v282;
            *(_OWORD *)(v277 - 24) = *(_OWORD *)(v279 - 3);
            *(v279 - 2) = 0LL;
            *(v279 - 1) = 0LL;
            *(v279 - 3) = 0LL;
            v279 -= 6;
            v277 -= 48;
          }
          while ( v280 != v279 );
          v259 = *(void ***)a3;
          v280 = *(void ***)(a3 + 8);
        }
        v260 = *(_QWORD *)(a3 + 16);
        *(_QWORD *)a3 = v277;
        *(_QWORD *)(a3 + 8) = v281;
        *(_QWORD *)(a3 + 16) = v278;
        if ( v280 != v259 )
        {
          do
          {
            if ( (*(_BYTE *)(v280 - 3) & 1) != 0 )
              free(*(v280 - 1));
            v283 = v280 - 6;
            if ( (*(_BYTE *)(v280 - 6) & 1) != 0 )
              free(*(v280 - 4));
            v280 -= 6;
          }
          while ( v259 != v283 );
        }
        goto LABEL_1062;
      }
      goto LABEL_365;
    case 'i':
      if ( a1[1] != 120 )
        return (__int64)v3;
      *(_QWORD *)((char *)v582 + 7) = 0LL;
      v582[0] = 0LL;
      qmemcpy(v581, "operator[]", 10);
      v6 = *(_QWORD *)(a3 + 8);
      v34 = *(_QWORD *)(a3 + 16);
      if ( v6 < v34 )
        goto LABEL_365;
      v35 = 0xAAAAAAAAAAAAAAABLL * ((__int64)(v6 - *(_QWORD *)a3) >> 4);
      if ( v35 + 1 > 0x555555555555555LL )
        abort();
      v36 = 0xAAAAAAAAAAAAAAABLL * ((__int64)(v34 - *(_QWORD *)a3) >> 4);
      if ( v36 >= 0x2AAAAAAAAAAAAAALL || (2 * v36 >= v35 + 1 ? (v5 = 2 * v36) : (v5 = v35 + 1), v5) )
      {
        v37 = *(_QWORD *)(a3 + 24);
        v38 = *(char **)(v37 + 4096);
        if ( v37 + 4096 - (__int64)v38 >= (unsigned __int64)(48 * v5) )
          *(_QWORD *)(v37 + 4096) = &v38[48 * v5];
        else
          v38 = (char *)malloc(48 * v5);
      }
      else
      {
        v38 = 0LL;
      }
      v253 = &v38[48 * v35];
      *v253 = 20;
      v254 = &v38[48 * v5];
      *(_QWORD *)(v253 + 1) = v581[0];
      v253[11] = 0;
      *((_DWORD *)v253 + 3) = 0;
      *((_QWORD *)v253 + 2) = 0LL;
      *(_WORD *)(v253 + 9) = v581[1];
      v581[0] = 0LL;
      LOWORD(v581[1]) = 0;
      v253[24] = 0;
      *((_QWORD *)v253 + 4) = *(_QWORD *)((char *)v582 + 7);
      *((_QWORD *)v253 + 5) = 0LL;
      *(_QWORD *)(v253 + 25) = v582[0];
      *(_QWORD *)((char *)v582 + 7) = 0LL;
      v582[0] = 0LL;
      v256 = *(void ***)a3;
      v255 = *(void ***)(a3 + 8);
      v257 = v253 + 48;
      if ( v255 == *(void ***)a3 )
      {
        v259 = *(void ***)a3;
      }
      else
      {
        do
        {
          *((_QWORD *)v253 - 4) = *(v255 - 4);
          *((_OWORD *)v253 - 3) = *((_OWORD *)v255 - 3);
          v258 = (__int64)*(v255 - 1);
          *(v255 - 5) = 0LL;
          *(v255 - 4) = 0LL;
          *(v255 - 6) = 0LL;
          *((_QWORD *)v253 - 1) = v258;
          *(_OWORD *)(v253 - 24) = *(_OWORD *)(v255 - 3);
          *(v255 - 2) = 0LL;
          *(v255 - 1) = 0LL;
          *(v255 - 3) = 0LL;
          v255 -= 6;
          v253 -= 48;
        }
        while ( v256 != v255 );
        v259 = *(void ***)a3;
        v256 = *(void ***)(a3 + 8);
      }
      v260 = *(_QWORD *)(a3 + 16);
      *(_QWORD *)a3 = v253;
      *(_QWORD *)(a3 + 8) = v257;
      *(_QWORD *)(a3 + 16) = v254;
      if ( v256 != v259 )
      {
        do
        {
          if ( (*(_BYTE *)(v256 - 3) & 1) != 0 )
            free(*(v256 - 1));
          v261 = v256 - 6;
          if ( (*(_BYTE *)(v256 - 6) & 1) != 0 )
            free(*(v256 - 4));
          v256 -= 6;
        }
        while ( v259 != v261 );
      }
      goto LABEL_1062;
    case 'l':
      switch ( a1[1] )
      {
        case 'S':
          *(_QWORD *)((char *)v582 + 7) = 0LL;
          v582[0] = 0LL;
          qmemcpy(v581, "operator<<=", 11);
          v6 = *(_QWORD *)(a3 + 8);
          v60 = *(_QWORD *)(a3 + 16);
          if ( v6 < v60 )
            goto LABEL_183;
          v61 = 0xAAAAAAAAAAAAAAABLL * ((__int64)(v6 - *(_QWORD *)a3) >> 4);
          if ( v61 + 1 > 0x555555555555555LL )
            abort();
          v62 = 0xAAAAAAAAAAAAAAABLL * ((__int64)(v60 - *(_QWORD *)a3) >> 4);
          if ( v62 >= 0x2AAAAAAAAAAAAAALL || (2 * v62 >= v61 + 1 ? (v5 = 2 * v62) : (v5 = v61 + 1), v5) )
          {
            v63 = *(_QWORD *)(a3 + 24);
            v64 = *(char **)(v63 + 4096);
            if ( v63 + 4096 - (__int64)v64 >= (unsigned __int64)(48 * v5) )
              *(_QWORD *)(v63 + 4096) = &v64[48 * v5];
            else
              v64 = (char *)malloc(48 * v5);
          }
          else
          {
            v64 = 0LL;
          }
          v411 = &v64[48 * v61];
          *v411 = 22;
          v412 = &v64[48 * v5];
          *(_QWORD *)(v411 + 1) = v581[0];
          v411[11] = BYTE2(v581[1]);
          v411[12] = 0;
          *(_WORD *)(v411 + 9) = v581[1];
          *(_WORD *)(v411 + 13) = 0;
          *((_QWORD *)v411 + 2) = 0LL;
          v411[15] = 0;
          v581[0] = 0LL;
          LOWORD(v581[1]) = 0;
          BYTE2(v581[1]) = 0;
          v411[24] = 0;
          *((_QWORD *)v411 + 4) = *(_QWORD *)((char *)v582 + 7);
          *((_QWORD *)v411 + 5) = 0LL;
          *(_QWORD *)(v411 + 25) = v582[0];
          *(_QWORD *)((char *)v582 + 7) = 0LL;
          v582[0] = 0LL;
          v414 = *(void ***)a3;
          v413 = *(void ***)(a3 + 8);
          v415 = v411 + 48;
          if ( v413 == *(void ***)a3 )
          {
            v259 = *(void ***)a3;
          }
          else
          {
            do
            {
              *((_QWORD *)v411 - 4) = *(v413 - 4);
              *((_OWORD *)v411 - 3) = *((_OWORD *)v413 - 3);
              v416 = (__int64)*(v413 - 1);
              *(v413 - 5) = 0LL;
              *(v413 - 4) = 0LL;
              *(v413 - 6) = 0LL;
              *((_QWORD *)v411 - 1) = v416;
              *(_OWORD *)(v411 - 24) = *(_OWORD *)(v413 - 3);
              *(v413 - 2) = 0LL;
              *(v413 - 1) = 0LL;
              *(v413 - 3) = 0LL;
              v413 -= 6;
              v411 -= 48;
            }
            while ( v414 != v413 );
            v259 = *(void ***)a3;
            v414 = *(void ***)(a3 + 8);
          }
          v260 = *(_QWORD *)(a3 + 16);
          *(_QWORD *)a3 = v411;
          *(_QWORD *)(a3 + 8) = v415;
          *(_QWORD *)(a3 + 16) = v412;
          if ( v414 != v259 )
          {
            do
            {
              if ( (*(_BYTE *)(v414 - 3) & 1) != 0 )
                free(*(v414 - 1));
              v417 = v414 - 6;
              if ( (*(_BYTE *)(v414 - 6) & 1) != 0 )
                free(*(v414 - 4));
              v414 -= 6;
            }
            while ( v259 != v417 );
          }
          goto LABEL_1062;
        case 'e':
          *(_QWORD *)((char *)v582 + 7) = 0LL;
          v582[0] = 0LL;
          qmemcpy(v581, "operator<=", 10);
          v6 = *(_QWORD *)(a3 + 8);
          v142 = *(_QWORD *)(a3 + 16);
          if ( v6 < v142 )
            goto LABEL_365;
          v143 = 0xAAAAAAAAAAAAAAABLL * ((__int64)(v6 - *(_QWORD *)a3) >> 4);
          if ( v143 + 1 > 0x555555555555555LL )
            abort();
          v144 = 0xAAAAAAAAAAAAAAABLL * ((__int64)(v142 - *(_QWORD *)a3) >> 4);
          if ( v144 >= 0x2AAAAAAAAAAAAAALL || (2 * v144 >= v143 + 1 ? (v5 = 2 * v144) : (v5 = v143 + 1), v5) )
          {
            v145 = *(_QWORD *)(a3 + 24);
            v146 = *(char **)(v145 + 4096);
            if ( v145 + 4096 - (__int64)v146 >= (unsigned __int64)(48 * v5) )
              *(_QWORD *)(v145 + 4096) = &v146[48 * v5];
            else
              v146 = (char *)malloc(48 * v5);
          }
          else
          {
            v146 = 0LL;
          }
          v432 = &v146[48 * v143];
          *v432 = 20;
          v433 = &v146[48 * v5];
          *(_QWORD *)(v432 + 1) = v581[0];
          v432[11] = 0;
          *((_DWORD *)v432 + 3) = 0;
          *((_QWORD *)v432 + 2) = 0LL;
          *(_WORD *)(v432 + 9) = v581[1];
          v581[0] = 0LL;
          LOWORD(v581[1]) = 0;
          v432[24] = 0;
          *((_QWORD *)v432 + 4) = *(_QWORD *)((char *)v582 + 7);
          *((_QWORD *)v432 + 5) = 0LL;
          *(_QWORD *)(v432 + 25) = v582[0];
          *(_QWORD *)((char *)v582 + 7) = 0LL;
          v582[0] = 0LL;
          v435 = *(void ***)a3;
          v434 = *(void ***)(a3 + 8);
          v436 = v432 + 48;
          if ( v434 == *(void ***)a3 )
          {
            v259 = *(void ***)a3;
          }
          else
          {
            do
            {
              *((_QWORD *)v432 - 4) = *(v434 - 4);
              *((_OWORD *)v432 - 3) = *((_OWORD *)v434 - 3);
              v437 = (__int64)*(v434 - 1);
              *(v434 - 5) = 0LL;
              *(v434 - 4) = 0LL;
              *(v434 - 6) = 0LL;
              *((_QWORD *)v432 - 1) = v437;
              *(_OWORD *)(v432 - 24) = *(_OWORD *)(v434 - 3);
              *(v434 - 2) = 0LL;
              *(v434 - 1) = 0LL;
              *(v434 - 3) = 0LL;
              v434 -= 6;
              v432 -= 48;
            }
            while ( v435 != v434 );
            v259 = *(void ***)a3;
            v435 = *(void ***)(a3 + 8);
          }
          v260 = *(_QWORD *)(a3 + 16);
          *(_QWORD *)a3 = v432;
          *(_QWORD *)(a3 + 8) = v436;
          *(_QWORD *)(a3 + 16) = v433;
          if ( v435 != v259 )
          {
            do
            {
              if ( (*(_BYTE *)(v435 - 3) & 1) != 0 )
                free(*(v435 - 1));
              v438 = v435 - 6;
              if ( (*(_BYTE *)(v435 - 6) & 1) != 0 )
                free(*(v435 - 4));
              v435 -= 6;
            }
            while ( v259 != v438 );
          }
          goto LABEL_1062;
        case 'i':
          v127 = a1 + 2;
          v13 = sub_B190C(a1 + 2, a2, a3);
          if ( (_BYTE *)v13 == v127 )
            return (__int64)v3;
          v128 = *(_QWORD *)(a3 + 8);
          if ( *(_QWORD *)a3 == v128 )
            return (__int64)v3;
          v15 = (size_t *)(v128 - 48);
          v16 = "operator\"\" ";
          v17 = 11LL;
          break;
        case 's':
          *(_QWORD *)((char *)v582 + 7) = 0LL;
          v582[0] = 0LL;
          qmemcpy(v581, "operator<<", 10);
          v6 = *(_QWORD *)(a3 + 8);
          v168 = *(_QWORD *)(a3 + 16);
          if ( v6 < v168 )
            goto LABEL_365;
          v169 = 0xAAAAAAAAAAAAAAABLL * ((__int64)(v6 - *(_QWORD *)a3) >> 4);
          if ( v169 + 1 > 0x555555555555555LL )
            abort();
          v170 = 0xAAAAAAAAAAAAAAABLL * ((__int64)(v168 - *(_QWORD *)a3) >> 4);
          if ( v170 >= 0x2AAAAAAAAAAAAAALL || (2 * v170 >= v169 + 1 ? (v5 = 2 * v170) : (v5 = v169 + 1), v5) )
          {
            v171 = *(_QWORD *)(a3 + 24);
            v172 = *(char **)(v171 + 4096);
            if ( v171 + 4096 - (__int64)v172 >= (unsigned __int64)(48 * v5) )
              *(_QWORD *)(v171 + 4096) = &v172[48 * v5];
            else
              v172 = (char *)malloc(48 * v5);
          }
          else
          {
            v172 = 0LL;
          }
          v474 = &v172[48 * v169];
          *v474 = 20;
          v475 = &v172[48 * v5];
          *(_QWORD *)(v474 + 1) = v581[0];
          v474[11] = 0;
          *((_DWORD *)v474 + 3) = 0;
          *((_QWORD *)v474 + 2) = 0LL;
          *(_WORD *)(v474 + 9) = v581[1];
          v581[0] = 0LL;
          LOWORD(v581[1]) = 0;
          v474[24] = 0;
          *((_QWORD *)v474 + 4) = *(_QWORD *)((char *)v582 + 7);
          *((_QWORD *)v474 + 5) = 0LL;
          *(_QWORD *)(v474 + 25) = v582[0];
          *(_QWORD *)((char *)v582 + 7) = 0LL;
          v582[0] = 0LL;
          v477 = *(void ***)a3;
          v476 = *(void ***)(a3 + 8);
          v478 = v474 + 48;
          if ( v476 == *(void ***)a3 )
          {
            v259 = *(void ***)a3;
          }
          else
          {
            do
            {
              *((_QWORD *)v474 - 4) = *(v476 - 4);
              *((_OWORD *)v474 - 3) = *((_OWORD *)v476 - 3);
              v479 = (__int64)*(v476 - 1);
              *(v476 - 5) = 0LL;
              *(v476 - 4) = 0LL;
              *(v476 - 6) = 0LL;
              *((_QWORD *)v474 - 1) = v479;
              *(_OWORD *)(v474 - 24) = *(_OWORD *)(v476 - 3);
              *(v476 - 2) = 0LL;
              *(v476 - 1) = 0LL;
              *(v476 - 3) = 0LL;
              v476 -= 6;
              v474 -= 48;
            }
            while ( v477 != v476 );
            v259 = *(void ***)a3;
            v477 = *(void ***)(a3 + 8);
          }
          v260 = *(_QWORD *)(a3 + 16);
          *(_QWORD *)a3 = v474;
          *(_QWORD *)(a3 + 8) = v478;
          *(_QWORD *)(a3 + 16) = v475;
          if ( v477 != v259 )
          {
            do
            {
              if ( (*(_BYTE *)(v477 - 3) & 1) != 0 )
                free(*(v477 - 1));
              v480 = v477 - 6;
              if ( (*(_BYTE *)(v477 - 6) & 1) != 0 )
                free(*(v477 - 4));
              v477 -= 6;
            }
            while ( v259 != v480 );
          }
          goto LABEL_1062;
        case 't':
          *(_QWORD *)((char *)v582 + 7) = 0LL;
          v582[0] = 0LL;
          qmemcpy(v581, "operator<", 9);
          v6 = *(_QWORD *)(a3 + 8);
          v183 = *(_QWORD *)(a3 + 16);
          if ( v6 < v183 )
            goto LABEL_378;
          v184 = 0xAAAAAAAAAAAAAAABLL * ((__int64)(v6 - *(_QWORD *)a3) >> 4);
          if ( v184 + 1 > 0x555555555555555LL )
            abort();
          v185 = 0xAAAAAAAAAAAAAAABLL * ((__int64)(v183 - *(_QWORD *)a3) >> 4);
          if ( v185 >= 0x2AAAAAAAAAAAAAALL || (2 * v185 >= v184 + 1 ? (v5 = 2 * v185) : (v5 = v184 + 1), v5) )
          {
            v186 = *(_QWORD *)(a3 + 24);
            v187 = *(char **)(v186 + 4096);
            if ( v186 + 4096 - (__int64)v187 >= (unsigned __int64)(48 * v5) )
              *(_QWORD *)(v186 + 4096) = &v187[48 * v5];
            else
              v187 = (char *)malloc(48 * v5);
          }
          else
          {
            v187 = 0LL;
          }
          v495 = &v187[48 * v184];
          *v495 = 18;
          v496 = &v187[48 * v5];
          *(_QWORD *)(v495 + 1) = v581[0];
          v495[10] = 0;
          v495[9] = v581[1];
          *(_DWORD *)(v495 + 11) = 0;
          *((_QWORD *)v495 + 2) = 0LL;
          v495[15] = 0;
          v581[0] = 0LL;
          LOBYTE(v581[1]) = 0;
          v495[24] = 0;
          *((_QWORD *)v495 + 4) = *(_QWORD *)((char *)v582 + 7);
          *((_QWORD *)v495 + 5) = 0LL;
          *(_QWORD *)(v495 + 25) = v582[0];
          *(_QWORD *)((char *)v582 + 7) = 0LL;
          v582[0] = 0LL;
          v498 = *(void ***)a3;
          v497 = *(void ***)(a3 + 8);
          v499 = v495 + 48;
          if ( v497 == *(void ***)a3 )
          {
            v259 = *(void ***)a3;
          }
          else
          {
            do
            {
              *((_QWORD *)v495 - 4) = *(v497 - 4);
              *((_OWORD *)v495 - 3) = *((_OWORD *)v497 - 3);
              v500 = (__int64)*(v497 - 1);
              *(v497 - 5) = 0LL;
              *(v497 - 4) = 0LL;
              *(v497 - 6) = 0LL;
              *((_QWORD *)v495 - 1) = v500;
              *(_OWORD *)(v495 - 24) = *(_OWORD *)(v497 - 3);
              *(v497 - 2) = 0LL;
              *(v497 - 1) = 0LL;
              *(v497 - 3) = 0LL;
              v497 -= 6;
              v495 -= 48;
            }
            while ( v498 != v497 );
            v259 = *(void ***)a3;
            v498 = *(void ***)(a3 + 8);
          }
          v260 = *(_QWORD *)(a3 + 16);
          *(_QWORD *)a3 = v495;
          *(_QWORD *)(a3 + 8) = v499;
          *(_QWORD *)(a3 + 16) = v496;
          if ( v498 != v259 )
          {
            do
            {
              if ( (*(_BYTE *)(v498 - 3) & 1) != 0 )
                free(*(v498 - 1));
              v501 = v498 - 6;
              if ( (*(_BYTE *)(v498 - 6) & 1) != 0 )
                free(*(v498 - 4));
              v498 -= 6;
            }
            while ( v259 != v501 );
          }
          goto LABEL_1062;
        default:
          return (__int64)v3;
      }
      goto LABEL_226;
    case 'm':
      switch ( a1[1] )
      {
        case 'I':
          *(_QWORD *)((char *)v582 + 7) = 0LL;
          v582[0] = 0LL;
          qmemcpy(v581, "operator-=", 10);
          v6 = *(_QWORD *)(a3 + 8);
          v65 = *(_QWORD *)(a3 + 16);
          if ( v6 < v65 )
            goto LABEL_365;
          v66 = 0xAAAAAAAAAAAAAAABLL * ((__int64)(v6 - *(_QWORD *)a3) >> 4);
          if ( v66 + 1 > 0x555555555555555LL )
            abort();
          v67 = 0xAAAAAAAAAAAAAAABLL * ((__int64)(v65 - *(_QWORD *)a3) >> 4);
          if ( v67 >= 0x2AAAAAAAAAAAAAALL || (2 * v67 >= v66 + 1 ? (v5 = 2 * v67) : (v5 = v66 + 1), v5) )
          {
            v68 = *(_QWORD *)(a3 + 24);
            v69 = *(char **)(v68 + 4096);
            if ( v68 + 4096 - (__int64)v69 >= (unsigned __int64)(48 * v5) )
              *(_QWORD *)(v68 + 4096) = &v69[48 * v5];
            else
              v69 = (char *)malloc(48 * v5);
          }
          else
          {
            v69 = 0LL;
          }
          v418 = &v69[48 * v66];
          *v418 = 20;
          v419 = &v69[48 * v5];
          *(_QWORD *)(v418 + 1) = v581[0];
          v418[11] = 0;
          *((_DWORD *)v418 + 3) = 0;
          *((_QWORD *)v418 + 2) = 0LL;
          *(_WORD *)(v418 + 9) = v581[1];
          v581[0] = 0LL;
          LOWORD(v581[1]) = 0;
          v418[24] = 0;
          *((_QWORD *)v418 + 4) = *(_QWORD *)((char *)v582 + 7);
          *((_QWORD *)v418 + 5) = 0LL;
          *(_QWORD *)(v418 + 25) = v582[0];
          *(_QWORD *)((char *)v582 + 7) = 0LL;
          v582[0] = 0LL;
          v421 = *(void ***)a3;
          v420 = *(void ***)(a3 + 8);
          v422 = v418 + 48;
          if ( v420 == *(void ***)a3 )
          {
            v259 = *(void ***)a3;
          }
          else
          {
            do
            {
              *((_QWORD *)v418 - 4) = *(v420 - 4);
              *((_OWORD *)v418 - 3) = *((_OWORD *)v420 - 3);
              v423 = (__int64)*(v420 - 1);
              *(v420 - 5) = 0LL;
              *(v420 - 4) = 0LL;
              *(v420 - 6) = 0LL;
              *((_QWORD *)v418 - 1) = v423;
              *(_OWORD *)(v418 - 24) = *(_OWORD *)(v420 - 3);
              *(v420 - 2) = 0LL;
              *(v420 - 1) = 0LL;
              *(v420 - 3) = 0LL;
              v420 -= 6;
              v418 -= 48;
            }
            while ( v421 != v420 );
            v259 = *(void ***)a3;
            v421 = *(void ***)(a3 + 8);
          }
          v260 = *(_QWORD *)(a3 + 16);
          *(_QWORD *)a3 = v418;
          *(_QWORD *)(a3 + 8) = v422;
          *(_QWORD *)(a3 + 16) = v419;
          if ( v421 != v259 )
          {
            do
            {
              if ( (*(_BYTE *)(v421 - 3) & 1) != 0 )
                free(*(v421 - 1));
              v424 = v421 - 6;
              if ( (*(_BYTE *)(v421 - 6) & 1) != 0 )
                free(*(v421 - 4));
              v421 -= 6;
            }
            while ( v259 != v424 );
          }
          goto LABEL_1062;
        case 'L':
          *(_QWORD *)((char *)v582 + 7) = 0LL;
          v582[0] = 0LL;
          qmemcpy(v581, "operator*=", 10);
          v6 = *(_QWORD *)(a3 + 8);
          v147 = *(_QWORD *)(a3 + 16);
          if ( v6 < v147 )
            goto LABEL_365;
          v148 = 0xAAAAAAAAAAAAAAABLL * ((__int64)(v6 - *(_QWORD *)a3) >> 4);
          if ( v148 + 1 > 0x555555555555555LL )
            abort();
          v149 = 0xAAAAAAAAAAAAAAABLL * ((__int64)(v147 - *(_QWORD *)a3) >> 4);
          if ( v149 >= 0x2AAAAAAAAAAAAAALL || (2 * v149 >= v148 + 1 ? (v5 = 2 * v149) : (v5 = v148 + 1), v5) )
          {
            v150 = *(_QWORD *)(a3 + 24);
            v151 = *(char **)(v150 + 4096);
            if ( v150 + 4096 - (__int64)v151 >= (unsigned __int64)(48 * v5) )
              *(_QWORD *)(v150 + 4096) = &v151[48 * v5];
            else
              v151 = (char *)malloc(48 * v5);
          }
          else
          {
            v151 = 0LL;
          }
          v439 = &v151[48 * v148];
          *v439 = 20;
          v440 = &v151[48 * v5];
          *(_QWORD *)(v439 + 1) = v581[0];
          v439[11] = 0;
          *((_DWORD *)v439 + 3) = 0;
          *((_QWORD *)v439 + 2) = 0LL;
          *(_WORD *)(v439 + 9) = v581[1];
          v581[0] = 0LL;
          LOWORD(v581[1]) = 0;
          v439[24] = 0;
          *((_QWORD *)v439 + 4) = *(_QWORD *)((char *)v582 + 7);
          *((_QWORD *)v439 + 5) = 0LL;
          *(_QWORD *)(v439 + 25) = v582[0];
          *(_QWORD *)((char *)v582 + 7) = 0LL;
          v582[0] = 0LL;
          v442 = *(void ***)a3;
          v441 = *(void ***)(a3 + 8);
          v443 = v439 + 48;
          if ( v441 == *(void ***)a3 )
          {
            v259 = *(void ***)a3;
          }
          else
          {
            do
            {
              *((_QWORD *)v439 - 4) = *(v441 - 4);
              *((_OWORD *)v439 - 3) = *((_OWORD *)v441 - 3);
              v444 = (__int64)*(v441 - 1);
              *(v441 - 5) = 0LL;
              *(v441 - 4) = 0LL;
              *(v441 - 6) = 0LL;
              *((_QWORD *)v439 - 1) = v444;
              *(_OWORD *)(v439 - 24) = *(_OWORD *)(v441 - 3);
              *(v441 - 2) = 0LL;
              *(v441 - 1) = 0LL;
              *(v441 - 3) = 0LL;
              v441 -= 6;
              v439 -= 48;
            }
            while ( v442 != v441 );
            v259 = *(void ***)a3;
            v442 = *(void ***)(a3 + 8);
          }
          v260 = *(_QWORD *)(a3 + 16);
          *(_QWORD *)a3 = v439;
          *(_QWORD *)(a3 + 8) = v443;
          *(_QWORD *)(a3 + 16) = v440;
          if ( v442 != v259 )
          {
            do
            {
              if ( (*(_BYTE *)(v442 - 3) & 1) != 0 )
                free(*(v442 - 1));
              v445 = v442 - 6;
              if ( (*(_BYTE *)(v442 - 6) & 1) != 0 )
                free(*(v442 - 4));
              v442 -= 6;
            }
            while ( v259 != v445 );
          }
          goto LABEL_1062;
        case 'i':
          *(_QWORD *)((char *)v582 + 7) = 0LL;
          v582[0] = 0LL;
          qmemcpy(v581, "operator-", 9);
          v6 = *(_QWORD *)(a3 + 8);
          v129 = *(_QWORD *)(a3 + 16);
          if ( v6 < v129 )
            goto LABEL_378;
          v130 = 0xAAAAAAAAAAAAAAABLL * ((__int64)(v6 - *(_QWORD *)a3) >> 4);
          if ( v130 + 1 > 0x555555555555555LL )
            abort();
          v131 = 0xAAAAAAAAAAAAAAABLL * ((__int64)(v129 - *(_QWORD *)a3) >> 4);
          if ( v131 >= 0x2AAAAAAAAAAAAAALL || (2 * v131 >= v130 + 1 ? (v5 = 2 * v131) : (v5 = v130 + 1), v5) )
          {
            v132 = *(_QWORD *)(a3 + 24);
            v133 = *(char **)(v132 + 4096);
            if ( v132 + 4096 - (__int64)v133 >= (unsigned __int64)(48 * v5) )
              *(_QWORD *)(v132 + 4096) = &v133[48 * v5];
            else
              v133 = (char *)malloc(48 * v5);
          }
          else
          {
            v133 = 0LL;
          }
          v390 = &v133[48 * v130];
          *v390 = 18;
          v391 = &v133[48 * v5];
          *(_QWORD *)(v390 + 1) = v581[0];
          v390[10] = 0;
          v390[9] = v581[1];
          *(_DWORD *)(v390 + 11) = 0;
          *((_QWORD *)v390 + 2) = 0LL;
          v390[15] = 0;
          v581[0] = 0LL;
          LOBYTE(v581[1]) = 0;
          v390[24] = 0;
          *((_QWORD *)v390 + 4) = *(_QWORD *)((char *)v582 + 7);
          *((_QWORD *)v390 + 5) = 0LL;
          *(_QWORD *)(v390 + 25) = v582[0];
          *(_QWORD *)((char *)v582 + 7) = 0LL;
          v582[0] = 0LL;
          v393 = *(void ***)a3;
          v392 = *(void ***)(a3 + 8);
          v394 = v390 + 48;
          if ( v392 == *(void ***)a3 )
          {
            v259 = *(void ***)a3;
          }
          else
          {
            do
            {
              *((_QWORD *)v390 - 4) = *(v392 - 4);
              *((_OWORD *)v390 - 3) = *((_OWORD *)v392 - 3);
              v395 = (__int64)*(v392 - 1);
              *(v392 - 5) = 0LL;
              *(v392 - 4) = 0LL;
              *(v392 - 6) = 0LL;
              *((_QWORD *)v390 - 1) = v395;
              *(_OWORD *)(v390 - 24) = *(_OWORD *)(v392 - 3);
              *(v392 - 2) = 0LL;
              *(v392 - 1) = 0LL;
              *(v392 - 3) = 0LL;
              v392 -= 6;
              v390 -= 48;
            }
            while ( v393 != v392 );
            v259 = *(void ***)a3;
            v393 = *(void ***)(a3 + 8);
          }
          v260 = *(_QWORD *)(a3 + 16);
          *(_QWORD *)a3 = v390;
          *(_QWORD *)(a3 + 8) = v394;
          *(_QWORD *)(a3 + 16) = v391;
          if ( v393 != v259 )
          {
            do
            {
              if ( (*(_BYTE *)(v393 - 3) & 1) != 0 )
                free(*(v393 - 1));
              v396 = v393 - 6;
              if ( (*(_BYTE *)(v393 - 6) & 1) != 0 )
                free(*(v393 - 4));
              v393 -= 6;
            }
            while ( v259 != v396 );
          }
          goto LABEL_1062;
        case 'l':
          *(_QWORD *)((char *)v582 + 7) = 0LL;
          v582[0] = 0LL;
          qmemcpy(v581, "operator*", 9);
          v6 = *(_QWORD *)(a3 + 8);
          v173 = *(_QWORD *)(a3 + 16);
          if ( v6 < v173 )
            goto LABEL_378;
          v174 = 0xAAAAAAAAAAAAAAABLL * ((__int64)(v6 - *(_QWORD *)a3) >> 4);
          if ( v174 + 1 > 0x555555555555555LL )
            abort();
          v175 = 0xAAAAAAAAAAAAAAABLL * ((__int64)(v173 - *(_QWORD *)a3) >> 4);
          if ( v175 >= 0x2AAAAAAAAAAAAAALL || (2 * v175 >= v174 + 1 ? (v5 = 2 * v175) : (v5 = v174 + 1), v5) )
          {
            v176 = *(_QWORD *)(a3 + 24);
            v177 = *(char **)(v176 + 4096);
            if ( v176 + 4096 - (__int64)v177 >= (unsigned __int64)(48 * v5) )
              *(_QWORD *)(v176 + 4096) = &v177[48 * v5];
            else
              v177 = (char *)malloc(48 * v5);
          }
          else
          {
            v177 = 0LL;
          }
          v481 = &v177[48 * v174];
          *v481 = 18;
          v482 = &v177[48 * v5];
          *(_QWORD *)(v481 + 1) = v581[0];
          v481[10] = 0;
          v481[9] = v581[1];
          *(_DWORD *)(v481 + 11) = 0;
          *((_QWORD *)v481 + 2) = 0LL;
          v481[15] = 0;
          v581[0] = 0LL;
          LOBYTE(v581[1]) = 0;
          v481[24] = 0;
          *((_QWORD *)v481 + 4) = *(_QWORD *)((char *)v582 + 7);
          *((_QWORD *)v481 + 5) = 0LL;
          *(_QWORD *)(v481 + 25) = v582[0];
          *(_QWORD *)((char *)v582 + 7) = 0LL;
          v582[0] = 0LL;
          v484 = *(void ***)a3;
          v483 = *(void ***)(a3 + 8);
          v485 = v481 + 48;
          if ( v483 == *(void ***)a3 )
          {
            v259 = *(void ***)a3;
          }
          else
          {
            do
            {
              *((_QWORD *)v481 - 4) = *(v483 - 4);
              *((_OWORD *)v481 - 3) = *((_OWORD *)v483 - 3);
              v486 = (__int64)*(v483 - 1);
              *(v483 - 5) = 0LL;
              *(v483 - 4) = 0LL;
              *(v483 - 6) = 0LL;
              *((_QWORD *)v481 - 1) = v486;
              *(_OWORD *)(v481 - 24) = *(_OWORD *)(v483 - 3);
              *(v483 - 2) = 0LL;
              *(v483 - 1) = 0LL;
              *(v483 - 3) = 0LL;
              v483 -= 6;
              v481 -= 48;
            }
            while ( v484 != v483 );
            v259 = *(void ***)a3;
            v484 = *(void ***)(a3 + 8);
          }
          v260 = *(_QWORD *)(a3 + 16);
          *(_QWORD *)a3 = v481;
          *(_QWORD *)(a3 + 8) = v485;
          *(_QWORD *)(a3 + 16) = v482;
          if ( v484 != v259 )
          {
            do
            {
              if ( (*(_BYTE *)(v484 - 3) & 1) != 0 )
                free(*(v484 - 1));
              v487 = v484 - 6;
              if ( (*(_BYTE *)(v484 - 6) & 1) != 0 )
                free(*(v484 - 4));
              v484 -= 6;
            }
            while ( v259 != v487 );
          }
          goto LABEL_1062;
        case 'm':
          *(_QWORD *)((char *)v582 + 7) = 0LL;
          v582[0] = 0LL;
          qmemcpy(v581, "operator--", 10);
          v6 = *(_QWORD *)(a3 + 8);
          v188 = *(_QWORD *)(a3 + 16);
          if ( v6 < v188 )
            goto LABEL_365;
          v189 = 0xAAAAAAAAAAAAAAABLL * ((__int64)(v6 - *(_QWORD *)a3) >> 4);
          if ( v189 + 1 > 0x555555555555555LL )
            abort();
          v190 = 0xAAAAAAAAAAAAAAABLL * ((__int64)(v188 - *(_QWORD *)a3) >> 4);
          if ( v190 >= 0x2AAAAAAAAAAAAAALL || (2 * v190 >= v189 + 1 ? (v5 = 2 * v190) : (v5 = v189 + 1), v5) )
          {
            v191 = *(_QWORD *)(a3 + 24);
            v192 = *(char **)(v191 + 4096);
            if ( v191 + 4096 - (__int64)v192 >= (unsigned __int64)(48 * v5) )
              *(_QWORD *)(v191 + 4096) = &v192[48 * v5];
            else
              v192 = (char *)malloc(48 * v5);
          }
          else
          {
            v192 = 0LL;
          }
          v502 = &v192[48 * v189];
          *v502 = 20;
          v503 = &v192[48 * v5];
          *(_QWORD *)(v502 + 1) = v581[0];
          v502[11] = 0;
          *((_DWORD *)v502 + 3) = 0;
          *((_QWORD *)v502 + 2) = 0LL;
          *(_WORD *)(v502 + 9) = v581[1];
          v581[0] = 0LL;
          LOWORD(v581[1]) = 0;
          v502[24] = 0;
          *((_QWORD *)v502 + 4) = *(_QWORD *)((char *)v582 + 7);
          *((_QWORD *)v502 + 5) = 0LL;
          *(_QWORD *)(v502 + 25) = v582[0];
          *(_QWORD *)((char *)v582 + 7) = 0LL;
          v582[0] = 0LL;
          v505 = *(void ***)a3;
          v504 = *(void ***)(a3 + 8);
          v506 = v502 + 48;
          if ( v504 == *(void ***)a3 )
          {
            v259 = *(void ***)a3;
          }
          else
          {
            do
            {
              *((_QWORD *)v502 - 4) = *(v504 - 4);
              *((_OWORD *)v502 - 3) = *((_OWORD *)v504 - 3);
              v507 = (__int64)*(v504 - 1);
              *(v504 - 5) = 0LL;
              *(v504 - 4) = 0LL;
              *(v504 - 6) = 0LL;
              *((_QWORD *)v502 - 1) = v507;
              *(_OWORD *)(v502 - 24) = *(_OWORD *)(v504 - 3);
              *(v504 - 2) = 0LL;
              *(v504 - 1) = 0LL;
              *(v504 - 3) = 0LL;
              v504 -= 6;
              v502 -= 48;
            }
            while ( v505 != v504 );
            v259 = *(void ***)a3;
            v505 = *(void ***)(a3 + 8);
          }
          v260 = *(_QWORD *)(a3 + 16);
          *(_QWORD *)a3 = v502;
          *(_QWORD *)(a3 + 8) = v506;
          *(_QWORD *)(a3 + 16) = v503;
          if ( v505 != v259 )
          {
            do
            {
              if ( (*(_BYTE *)(v505 - 3) & 1) != 0 )
                free(*(v505 - 1));
              v508 = v505 - 6;
              if ( (*(_BYTE *)(v505 - 6) & 1) != 0 )
                free(*(v505 - 4));
              v505 -= 6;
            }
            while ( v259 != v508 );
          }
          goto LABEL_1062;
        default:
          return (__int64)v3;
      }
      return (__int64)v3;
    case 'n':
      switch ( a1[1] )
      {
        case 'a':
          *(_QWORD *)((char *)v582 + 7) = 0LL;
          v582[0] = 0LL;
          qmemcpy(v581, "operator new[]", 14);
          v6 = *(_QWORD *)(a3 + 8);
          v76 = *(_QWORD *)(a3 + 16);
          if ( v6 < v76 )
          {
            *(_BYTE *)v6 = 28;
            v3 = a1 + 2;
            *(_QWORD *)(v6 + 7) = *(_QWORD *)((char *)v581 + 6);
            *(_BYTE *)(v6 + 15) = 0;
            *(_QWORD *)(v6 + 16) = 0LL;
            *(_QWORD *)(v6 + 1) = v581[0];
            *(_QWORD *)((char *)v581 + 6) = 0LL;
            goto LABEL_361;
          }
          v229 = 0xAAAAAAAAAAAAAAABLL * ((__int64)(v6 - *(_QWORD *)a3) >> 4);
          if ( v229 + 1 > 0x555555555555555LL )
            abort();
          v230 = 0xAAAAAAAAAAAAAAABLL * ((__int64)(v76 - *(_QWORD *)a3) >> 4);
          if ( v230 >= 0x2AAAAAAAAAAAAAALL || (2 * v230 >= v229 + 1 ? (v5 = 2 * v230) : (v5 = v229 + 1), v5) )
          {
            v231 = *(_QWORD *)(a3 + 24);
            v232 = *(char **)(v231 + 4096);
            if ( v231 + 4096 - (__int64)v232 >= (unsigned __int64)(48 * v5) )
              *(_QWORD *)(v231 + 4096) = &v232[48 * v5];
            else
              v232 = (char *)malloc(48 * v5);
          }
          else
          {
            v232 = 0LL;
          }
          v509 = &v232[48 * v229];
          *v509 = 28;
          v510 = &v232[48 * v5];
          *(_QWORD *)(v509 + 7) = *(_QWORD *)((char *)v581 + 6);
          v509[15] = 0;
          *((_QWORD *)v509 + 2) = 0LL;
          *(_QWORD *)(v509 + 1) = v581[0];
          *(_QWORD *)((char *)v581 + 6) = 0LL;
          v581[0] = 0LL;
          v509[24] = 0;
          *((_QWORD *)v509 + 4) = *(_QWORD *)((char *)v582 + 7);
          *((_QWORD *)v509 + 5) = 0LL;
          *(_QWORD *)(v509 + 25) = v582[0];
          *(_QWORD *)((char *)v582 + 7) = 0LL;
          v582[0] = 0LL;
          v512 = *(void ***)a3;
          v511 = *(void ***)(a3 + 8);
          v513 = v509 + 48;
          if ( v511 == *(void ***)a3 )
          {
            v259 = *(void ***)a3;
          }
          else
          {
            do
            {
              *((_QWORD *)v509 - 4) = *(v511 - 4);
              *((_OWORD *)v509 - 3) = *((_OWORD *)v511 - 3);
              v514 = (__int64)*(v511 - 1);
              *(v511 - 5) = 0LL;
              *(v511 - 4) = 0LL;
              *(v511 - 6) = 0LL;
              *((_QWORD *)v509 - 1) = v514;
              *(_OWORD *)(v509 - 24) = *(_OWORD *)(v511 - 3);
              *(v511 - 2) = 0LL;
              *(v511 - 1) = 0LL;
              *(v511 - 3) = 0LL;
              v511 -= 6;
              v509 -= 48;
            }
            while ( v512 != v511 );
            v259 = *(void ***)a3;
            v512 = *(void ***)(a3 + 8);
          }
          v260 = *(_QWORD *)(a3 + 16);
          *(_QWORD *)a3 = v509;
          *(_QWORD *)(a3 + 8) = v513;
          *(_QWORD *)(a3 + 16) = v510;
          if ( v512 != v259 )
          {
            do
            {
              if ( (*(_BYTE *)(v512 - 3) & 1) != 0 )
                free(*(v512 - 1));
              v515 = v512 - 6;
              if ( (*(_BYTE *)(v512 - 6) & 1) != 0 )
                free(*(v512 - 4));
              v512 -= 6;
            }
            while ( v259 != v515 );
          }
          goto LABEL_1062;
        case 'e':
          *(_QWORD *)((char *)v582 + 7) = 0LL;
          v582[0] = 0LL;
          qmemcpy(v581, "operator!=", 10);
          v6 = *(_QWORD *)(a3 + 8);
          v193 = *(_QWORD *)(a3 + 16);
          if ( v6 < v193 )
            goto LABEL_365;
          v194 = 0xAAAAAAAAAAAAAAABLL * ((__int64)(v6 - *(_QWORD *)a3) >> 4);
          if ( v194 + 1 > 0x555555555555555LL )
            abort();
          v195 = 0xAAAAAAAAAAAAAAABLL * ((__int64)(v193 - *(_QWORD *)a3) >> 4);
          if ( v195 >= 0x2AAAAAAAAAAAAAALL || (2 * v195 >= v194 + 1 ? (v5 = 2 * v195) : (v5 = v194 + 1), v5) )
          {
            v196 = *(_QWORD *)(a3 + 24);
            v197 = *(char **)(v196 + 4096);
            if ( v196 + 4096 - (__int64)v197 >= (unsigned __int64)(48 * v5) )
              *(_QWORD *)(v196 + 4096) = &v197[48 * v5];
            else
              v197 = (char *)malloc(48 * v5);
          }
          else
          {
            v197 = 0LL;
          }
          v516 = &v197[48 * v194];
          *v516 = 20;
          v517 = &v197[48 * v5];
          *(_QWORD *)(v516 + 1) = v581[0];
          v516[11] = 0;
          *((_DWORD *)v516 + 3) = 0;
          *((_QWORD *)v516 + 2) = 0LL;
          *(_WORD *)(v516 + 9) = v581[1];
          v581[0] = 0LL;
          LOWORD(v581[1]) = 0;
          v516[24] = 0;
          *((_QWORD *)v516 + 4) = *(_QWORD *)((char *)v582 + 7);
          *((_QWORD *)v516 + 5) = 0LL;
          *(_QWORD *)(v516 + 25) = v582[0];
          *(_QWORD *)((char *)v582 + 7) = 0LL;
          v582[0] = 0LL;
          v519 = *(void ***)a3;
          v518 = *(void ***)(a3 + 8);
          v520 = v516 + 48;
          if ( v518 == *(void ***)a3 )
          {
            v259 = *(void ***)a3;
          }
          else
          {
            do
            {
              *((_QWORD *)v516 - 4) = *(v518 - 4);
              *((_OWORD *)v516 - 3) = *((_OWORD *)v518 - 3);
              v521 = (__int64)*(v518 - 1);
              *(v518 - 5) = 0LL;
              *(v518 - 4) = 0LL;
              *(v518 - 6) = 0LL;
              *((_QWORD *)v516 - 1) = v521;
              *(_OWORD *)(v516 - 24) = *(_OWORD *)(v518 - 3);
              *(v518 - 2) = 0LL;
              *(v518 - 1) = 0LL;
              *(v518 - 3) = 0LL;
              v518 -= 6;
              v516 -= 48;
            }
            while ( v519 != v518 );
            v259 = *(void ***)a3;
            v519 = *(void ***)(a3 + 8);
          }
          v260 = *(_QWORD *)(a3 + 16);
          *(_QWORD *)a3 = v516;
          *(_QWORD *)(a3 + 8) = v520;
          *(_QWORD *)(a3 + 16) = v517;
          if ( v519 != v259 )
          {
            do
            {
              if ( (*(_BYTE *)(v519 - 3) & 1) != 0 )
                free(*(v519 - 1));
              v522 = v519 - 6;
              if ( (*(_BYTE *)(v519 - 6) & 1) != 0 )
                free(*(v519 - 4));
              v519 -= 6;
            }
            while ( v259 != v522 );
          }
          goto LABEL_1062;
        case 'g':
          *(_QWORD *)((char *)v582 + 7) = 0LL;
          v582[0] = 0LL;
          qmemcpy(v581, "operator-", 9);
          v6 = *(_QWORD *)(a3 + 8);
          v152 = *(_QWORD *)(a3 + 16);
          if ( v6 < v152 )
            goto LABEL_378;
          v153 = 0xAAAAAAAAAAAAAAABLL * ((__int64)(v6 - *(_QWORD *)a3) >> 4);
          if ( v153 + 1 > 0x555555555555555LL )
            abort();
          v154 = 0xAAAAAAAAAAAAAAABLL * ((__int64)(v152 - *(_QWORD *)a3) >> 4);
          if ( v154 >= 0x2AAAAAAAAAAAAAALL || (2 * v154 >= v153 + 1 ? (v5 = 2 * v154) : (v5 = v153 + 1), v5) )
          {
            v155 = *(_QWORD *)(a3 + 24);
            v156 = *(char **)(v155 + 4096);
            if ( v155 + 4096 - (__int64)v156 >= (unsigned __int64)(48 * v5) )
              *(_QWORD *)(v155 + 4096) = &v156[48 * v5];
            else
              v156 = (char *)malloc(48 * v5);
          }
          else
          {
            v156 = 0LL;
          }
          v446 = &v156[48 * v153];
          *v446 = 18;
          v447 = &v156[48 * v5];
          *(_QWORD *)(v446 + 1) = v581[0];
          v446[10] = 0;
          v446[9] = v581[1];
          *(_DWORD *)(v446 + 11) = 0;
          *((_QWORD *)v446 + 2) = 0LL;
          v446[15] = 0;
          v581[0] = 0LL;
          LOBYTE(v581[1]) = 0;
          v446[24] = 0;
          *((_QWORD *)v446 + 4) = *(_QWORD *)((char *)v582 + 7);
          *((_QWORD *)v446 + 5) = 0LL;
          *(_QWORD *)(v446 + 25) = v582[0];
          *(_QWORD *)((char *)v582 + 7) = 0LL;
          v582[0] = 0LL;
          v449 = *(void ***)a3;
          v448 = *(void ***)(a3 + 8);
          v450 = v446 + 48;
          if ( v448 == *(void ***)a3 )
          {
            v259 = *(void ***)a3;
          }
          else
          {
            do
            {
              *((_QWORD *)v446 - 4) = *(v448 - 4);
              *((_OWORD *)v446 - 3) = *((_OWORD *)v448 - 3);
              v451 = (__int64)*(v448 - 1);
              *(v448 - 5) = 0LL;
              *(v448 - 4) = 0LL;
              *(v448 - 6) = 0LL;
              *((_QWORD *)v446 - 1) = v451;
              *(_OWORD *)(v446 - 24) = *(_OWORD *)(v448 - 3);
              *(v448 - 2) = 0LL;
              *(v448 - 1) = 0LL;
              *(v448 - 3) = 0LL;
              v448 -= 6;
              v446 -= 48;
            }
            while ( v449 != v448 );
            v259 = *(void ***)a3;
            v449 = *(void ***)(a3 + 8);
          }
          v260 = *(_QWORD *)(a3 + 16);
          *(_QWORD *)a3 = v446;
          *(_QWORD *)(a3 + 8) = v450;
          *(_QWORD *)(a3 + 16) = v447;
          if ( v449 != v259 )
          {
            do
            {
              if ( (*(_BYTE *)(v449 - 3) & 1) != 0 )
                free(*(v449 - 1));
              v452 = v449 - 6;
              if ( (*(_BYTE *)(v449 - 6) & 1) != 0 )
                free(*(v449 - 4));
              v449 -= 6;
            }
            while ( v259 != v452 );
          }
          goto LABEL_1062;
        case 't':
          *(_QWORD *)((char *)v582 + 7) = 0LL;
          v582[0] = 0LL;
          qmemcpy(v581, "operator!", 9);
          v6 = *(_QWORD *)(a3 + 8);
          v198 = *(_QWORD *)(a3 + 16);
          if ( v6 < v198 )
            goto LABEL_378;
          v199 = 0xAAAAAAAAAAAAAAABLL * ((__int64)(v6 - *(_QWORD *)a3) >> 4);
          if ( v199 + 1 > 0x555555555555555LL )
            abort();
          v200 = 0xAAAAAAAAAAAAAAABLL * ((__int64)(v198 - *(_QWORD *)a3) >> 4);
          if ( v200 >= 0x2AAAAAAAAAAAAAALL || (2 * v200 >= v199 + 1 ? (v5 = 2 * v200) : (v5 = v199 + 1), v5) )
          {
            v201 = *(_QWORD *)(a3 + 24);
            v202 = *(char **)(v201 + 4096);
            if ( v201 + 4096 - (__int64)v202 >= (unsigned __int64)(48 * v5) )
              *(_QWORD *)(v201 + 4096) = &v202[48 * v5];
            else
              v202 = (char *)malloc(48 * v5);
          }
          else
          {
            v202 = 0LL;
          }
          v523 = &v202[48 * v199];
          *v523 = 18;
          v524 = &v202[48 * v5];
          *(_QWORD *)(v523 + 1) = v581[0];
          v523[10] = 0;
          v523[9] = v581[1];
          *(_DWORD *)(v523 + 11) = 0;
          *((_QWORD *)v523 + 2) = 0LL;
          v523[15] = 0;
          v581[0] = 0LL;
          LOBYTE(v581[1]) = 0;
          v523[24] = 0;
          *((_QWORD *)v523 + 4) = *(_QWORD *)((char *)v582 + 7);
          *((_QWORD *)v523 + 5) = 0LL;
          *(_QWORD *)(v523 + 25) = v582[0];
          *(_QWORD *)((char *)v582 + 7) = 0LL;
          v582[0] = 0LL;
          v526 = *(void ***)a3;
          v525 = *(void ***)(a3 + 8);
          v527 = v523 + 48;
          if ( v525 == *(void ***)a3 )
          {
            v259 = *(void ***)a3;
          }
          else
          {
            do
            {
              *((_QWORD *)v523 - 4) = *(v525 - 4);
              *((_OWORD *)v523 - 3) = *((_OWORD *)v525 - 3);
              v528 = (__int64)*(v525 - 1);
              *(v525 - 5) = 0LL;
              *(v525 - 4) = 0LL;
              *(v525 - 6) = 0LL;
              *((_QWORD *)v523 - 1) = v528;
              *(_OWORD *)(v523 - 24) = *(_OWORD *)(v525 - 3);
              *(v525 - 2) = 0LL;
              *(v525 - 1) = 0LL;
              *(v525 - 3) = 0LL;
              v525 -= 6;
              v523 -= 48;
            }
            while ( v526 != v525 );
            v259 = *(void ***)a3;
            v526 = *(void ***)(a3 + 8);
          }
          v260 = *(_QWORD *)(a3 + 16);
          *(_QWORD *)a3 = v523;
          *(_QWORD *)(a3 + 8) = v527;
          *(_QWORD *)(a3 + 16) = v524;
          if ( v526 != v259 )
          {
            do
            {
              if ( (*(_BYTE *)(v526 - 3) & 1) != 0 )
                free(*(v526 - 1));
              v529 = v526 - 6;
              if ( (*(_BYTE *)(v526 - 6) & 1) != 0 )
                free(*(v526 - 4));
              v526 -= 6;
            }
            while ( v259 != v529 );
          }
          goto LABEL_1062;
        case 'w':
          *(_QWORD *)((char *)v582 + 7) = 0LL;
          v582[0] = 0LL;
          qmemcpy(v581, "operator new", 12);
          v6 = *(_QWORD *)(a3 + 8);
          v203 = *(_QWORD *)(a3 + 16);
          if ( v6 >= v203 )
          {
            v233 = 0xAAAAAAAAAAAAAAABLL * ((__int64)(v6 - *(_QWORD *)a3) >> 4);
            if ( v233 + 1 > 0x555555555555555LL )
              abort();
            v234 = 0xAAAAAAAAAAAAAAABLL * ((__int64)(v203 - *(_QWORD *)a3) >> 4);
            if ( v234 >= 0x2AAAAAAAAAAAAAALL || (2 * v234 >= v233 + 1 ? (v5 = 2 * v234) : (v5 = v233 + 1), v5) )
            {
              v235 = *(_QWORD *)(a3 + 24);
              v236 = *(char **)(v235 + 4096);
              if ( v235 + 4096 - (__int64)v236 >= (unsigned __int64)(48 * v5) )
                *(_QWORD *)(v235 + 4096) = &v236[48 * v5];
              else
                v236 = (char *)malloc(48 * v5);
            }
            else
            {
              v236 = 0LL;
            }
            v530 = &v236[48 * v233];
            *v530 = 24;
            v531 = &v236[48 * v5];
            *(_DWORD *)(v530 + 9) = v581[1];
            v530[13] = 0;
            *((_WORD *)v530 + 7) = 0;
            *((_QWORD *)v530 + 2) = 0LL;
            *(_QWORD *)(v530 + 1) = v581[0];
            LODWORD(v581[1]) = 0;
            v581[0] = 0LL;
            v530[24] = 0;
            *((_QWORD *)v530 + 4) = *(_QWORD *)((char *)v582 + 7);
            *((_QWORD *)v530 + 5) = 0LL;
            *(_QWORD *)(v530 + 25) = v582[0];
            *(_QWORD *)((char *)v582 + 7) = 0LL;
            v582[0] = 0LL;
            v533 = *(void ***)a3;
            v532 = *(void ***)(a3 + 8);
            v534 = v530 + 48;
            if ( v532 == *(void ***)a3 )
            {
              v259 = *(void ***)a3;
            }
            else
            {
              do
              {
                *((_QWORD *)v530 - 4) = *(v532 - 4);
                *((_OWORD *)v530 - 3) = *((_OWORD *)v532 - 3);
                v535 = (__int64)*(v532 - 1);
                *(v532 - 5) = 0LL;
                *(v532 - 4) = 0LL;
                *(v532 - 6) = 0LL;
                *((_QWORD *)v530 - 1) = v535;
                *(_OWORD *)(v530 - 24) = *(_OWORD *)(v532 - 3);
                *(v532 - 2) = 0LL;
                *(v532 - 1) = 0LL;
                *(v532 - 3) = 0LL;
                v532 -= 6;
                v530 -= 48;
              }
              while ( v533 != v532 );
              v259 = *(void ***)a3;
              v533 = *(void ***)(a3 + 8);
            }
            v260 = *(_QWORD *)(a3 + 16);
            *(_QWORD *)a3 = v530;
            *(_QWORD *)(a3 + 8) = v534;
            *(_QWORD *)(a3 + 16) = v531;
            if ( v533 != v259 )
            {
              do
              {
                if ( (*(_BYTE *)(v533 - 3) & 1) != 0 )
                  free(*(v533 - 1));
                v536 = v533 - 6;
                if ( (*(_BYTE *)(v533 - 6) & 1) != 0 )
                  free(*(v533 - 4));
                v533 -= 6;
              }
              while ( v259 != v536 );
            }
            goto LABEL_1062;
          }
          *(_BYTE *)v6 = 24;
          v3 = a1 + 2;
          *(_DWORD *)(v6 + 9) = v581[1];
          *(_BYTE *)(v6 + 13) = 0;
          *(_WORD *)(v6 + 14) = 0;
          *(_QWORD *)(v6 + 16) = 0LL;
          *(_QWORD *)(v6 + 1) = v581[0];
          LODWORD(v581[1]) = 0;
LABEL_361:
          v581[0] = 0LL;
          break;
        default:
          return (__int64)v3;
      }
      goto LABEL_379;
    case 'o':
      v70 = (unsigned __int8)a1[1];
      if ( v70 == 82 )
      {
        *(_QWORD *)((char *)v582 + 7) = 0LL;
        v582[0] = 0LL;
        qmemcpy(v581, "operator|=", 10);
        v6 = *(_QWORD *)(a3 + 8);
        v97 = *(_QWORD *)(a3 + 16);
        if ( v6 >= v97 )
        {
          v98 = 0xAAAAAAAAAAAAAAABLL * ((__int64)(v6 - *(_QWORD *)a3) >> 4);
          if ( v98 + 1 > 0x555555555555555LL )
            abort();
          v99 = 0xAAAAAAAAAAAAAAABLL * ((__int64)(v97 - *(_QWORD *)a3) >> 4);
          if ( v99 >= 0x2AAAAAAAAAAAAAALL || (2 * v99 >= v98 + 1 ? (v5 = 2 * v99) : (v5 = v98 + 1), v5) )
          {
            v100 = *(_QWORD *)(a3 + 24);
            v101 = *(char **)(v100 + 4096);
            if ( v100 + 4096 - (__int64)v101 >= (unsigned __int64)(48 * v5) )
              *(_QWORD *)(v100 + 4096) = &v101[48 * v5];
            else
              v101 = (char *)malloc(48 * v5);
          }
          else
          {
            v101 = 0LL;
          }
          v319 = &v101[48 * v98];
          *v319 = 20;
          v320 = &v101[48 * v5];
          *(_QWORD *)(v319 + 1) = v581[0];
          v319[11] = 0;
          *((_DWORD *)v319 + 3) = 0;
          *((_QWORD *)v319 + 2) = 0LL;
          *(_WORD *)(v319 + 9) = v581[1];
          v581[0] = 0LL;
          LOWORD(v581[1]) = 0;
          v319[24] = 0;
          *((_QWORD *)v319 + 4) = *(_QWORD *)((char *)v582 + 7);
          *((_QWORD *)v319 + 5) = 0LL;
          *(_QWORD *)(v319 + 25) = v582[0];
          *(_QWORD *)((char *)v582 + 7) = 0LL;
          v582[0] = 0LL;
          v322 = *(void ***)a3;
          v321 = *(void ***)(a3 + 8);
          v323 = v319 + 48;
          if ( v321 == *(void ***)a3 )
          {
            v259 = *(void ***)a3;
          }
          else
          {
            do
            {
              *((_QWORD *)v319 - 4) = *(v321 - 4);
              *((_OWORD *)v319 - 3) = *((_OWORD *)v321 - 3);
              v324 = (__int64)*(v321 - 1);
              *(v321 - 5) = 0LL;
              *(v321 - 4) = 0LL;
              *(v321 - 6) = 0LL;
              *((_QWORD *)v319 - 1) = v324;
              *(_OWORD *)(v319 - 24) = *(_OWORD *)(v321 - 3);
              *(v321 - 2) = 0LL;
              *(v321 - 1) = 0LL;
              *(v321 - 3) = 0LL;
              v321 -= 6;
              v319 -= 48;
            }
            while ( v322 != v321 );
            v259 = *(void ***)a3;
            v322 = *(void ***)(a3 + 8);
          }
          v260 = *(_QWORD *)(a3 + 16);
          *(_QWORD *)a3 = v319;
          *(_QWORD *)(a3 + 8) = v323;
          *(_QWORD *)(a3 + 16) = v320;
          if ( v322 != v259 )
          {
            do
            {
              if ( (*(_BYTE *)(v322 - 3) & 1) != 0 )
                free(*(v322 - 1));
              v325 = v322 - 6;
              if ( (*(_BYTE *)(v322 - 6) & 1) != 0 )
                free(*(v322 - 4));
              v322 -= 6;
            }
            while ( v259 != v325 );
          }
          goto LABEL_1062;
        }
        goto LABEL_365;
      }
      if ( v70 == 114 )
      {
        *(_QWORD *)((char *)v582 + 7) = 0LL;
        v582[0] = 0LL;
        qmemcpy(v581, "operator|", 9);
        v6 = *(_QWORD *)(a3 + 8);
        v92 = *(_QWORD *)(a3 + 16);
        if ( v6 >= v92 )
        {
          v93 = 0xAAAAAAAAAAAAAAABLL * ((__int64)(v6 - *(_QWORD *)a3) >> 4);
          if ( v93 + 1 > 0x555555555555555LL )
            abort();
          v94 = 0xAAAAAAAAAAAAAAABLL * ((__int64)(v92 - *(_QWORD *)a3) >> 4);
          if ( v94 >= 0x2AAAAAAAAAAAAAALL || (2 * v94 >= v93 + 1 ? (v5 = 2 * v94) : (v5 = v93 + 1), v5) )
          {
            v95 = *(_QWORD *)(a3 + 24);
            v96 = *(char **)(v95 + 4096);
            if ( v95 + 4096 - (__int64)v96 >= (unsigned __int64)(48 * v5) )
              *(_QWORD *)(v95 + 4096) = &v96[48 * v5];
            else
              v96 = (char *)malloc(48 * v5);
          }
          else
          {
            v96 = 0LL;
          }
          v312 = &v96[48 * v93];
          *v312 = 18;
          v313 = &v96[48 * v5];
          *(_QWORD *)(v312 + 1) = v581[0];
          v312[10] = 0;
          v312[9] = v581[1];
          *(_DWORD *)(v312 + 11) = 0;
          *((_QWORD *)v312 + 2) = 0LL;
          v312[15] = 0;
          v581[0] = 0LL;
          LOBYTE(v581[1]) = 0;
          v312[24] = 0;
          *((_QWORD *)v312 + 4) = *(_QWORD *)((char *)v582 + 7);
          *((_QWORD *)v312 + 5) = 0LL;
          *(_QWORD *)(v312 + 25) = v582[0];
          *(_QWORD *)((char *)v582 + 7) = 0LL;
          v582[0] = 0LL;
          v315 = *(void ***)a3;
          v314 = *(void ***)(a3 + 8);
          v316 = v312 + 48;
          if ( v314 == *(void ***)a3 )
          {
            v259 = *(void ***)a3;
          }
          else
          {
            do
            {
              *((_QWORD *)v312 - 4) = *(v314 - 4);
              *((_OWORD *)v312 - 3) = *((_OWORD *)v314 - 3);
              v317 = (__int64)*(v314 - 1);
              *(v314 - 5) = 0LL;
              *(v314 - 4) = 0LL;
              *(v314 - 6) = 0LL;
              *((_QWORD *)v312 - 1) = v317;
              *(_OWORD *)(v312 - 24) = *(_OWORD *)(v314 - 3);
              *(v314 - 2) = 0LL;
              *(v314 - 1) = 0LL;
              *(v314 - 3) = 0LL;
              v314 -= 6;
              v312 -= 48;
            }
            while ( v315 != v314 );
            v259 = *(void ***)a3;
            v315 = *(void ***)(a3 + 8);
          }
          v260 = *(_QWORD *)(a3 + 16);
          *(_QWORD *)a3 = v312;
          *(_QWORD *)(a3 + 8) = v316;
          *(_QWORD *)(a3 + 16) = v313;
          if ( v315 != v259 )
          {
            do
            {
              if ( (*(_BYTE *)(v315 - 3) & 1) != 0 )
                free(*(v315 - 1));
              v318 = v315 - 6;
              if ( (*(_BYTE *)(v315 - 6) & 1) != 0 )
                free(*(v315 - 4));
              v315 -= 6;
            }
            while ( v259 != v318 );
          }
          goto LABEL_1062;
        }
LABEL_378:
        *(_BYTE *)v6 = 18;
        v3 = a1 + 2;
        *(_QWORD *)(v6 + 1) = v581[0];
        *(_BYTE *)(v6 + 10) = 0;
        *(_BYTE *)(v6 + 9) = v581[1];
        *(_DWORD *)(v6 + 11) = 0;
        *(_QWORD *)(v6 + 16) = 0LL;
        *(_BYTE *)(v6 + 15) = 0;
        v581[0] = 0LL;
        LOBYTE(v581[1]) = 0;
LABEL_379:
        *(_BYTE *)(v6 + 24) = 0;
        *(_QWORD *)(v6 + 32) = *(_QWORD *)((char *)v582 + 7);
        *(_QWORD *)(v6 + 40) = 0LL;
        *(_QWORD *)(v6 + 25) = v582[0];
        *(_QWORD *)((char *)v582 + 7) = 0LL;
        v582[0] = 0LL;
LABEL_380:
        *(_QWORD *)(a3 + 8) += 48LL;
        return (__int64)v3;
      }
      if ( v70 != 111 )
        return (__int64)v3;
      *(_QWORD *)((char *)v582 + 7) = 0LL;
      v582[0] = 0LL;
      qmemcpy(v581, "operator||", 10);
      v6 = *(_QWORD *)(a3 + 8);
      v71 = *(_QWORD *)(a3 + 16);
      if ( v6 < v71 )
      {
LABEL_365:
        *(_BYTE *)v6 = 20;
        v3 = a1 + 2;
        *(_QWORD *)(v6 + 1) = v581[0];
        *(_BYTE *)(v6 + 11) = 0;
        *(_DWORD *)(v6 + 12) = 0;
        *(_QWORD *)(v6 + 16) = 0LL;
        *(_WORD *)(v6 + 9) = v581[1];
        v581[0] = 0LL;
        LOWORD(v581[1]) = 0;
        goto LABEL_379;
      }
      v72 = 0xAAAAAAAAAAAAAAABLL * ((__int64)(v6 - *(_QWORD *)a3) >> 4);
      if ( v72 + 1 > 0x555555555555555LL )
        abort();
      v73 = 0xAAAAAAAAAAAAAAABLL * ((__int64)(v71 - *(_QWORD *)a3) >> 4);
      if ( v73 >= 0x2AAAAAAAAAAAAAALL || (2 * v73 >= v72 + 1 ? (v5 = 2 * v73) : (v5 = v72 + 1), v5) )
      {
        v74 = *(_QWORD *)(a3 + 24);
        v75 = *(char **)(v74 + 4096);
        if ( v74 + 4096 - (__int64)v75 >= (unsigned __int64)(48 * v5) )
          *(_QWORD *)(v74 + 4096) = &v75[48 * v5];
        else
          v75 = (char *)malloc(48 * v5);
      }
      else
      {
        v75 = 0LL;
      }
      v326 = &v75[48 * v72];
      *v326 = 20;
      v327 = &v75[48 * v5];
      *(_QWORD *)(v326 + 1) = v581[0];
      v326[11] = 0;
      *((_DWORD *)v326 + 3) = 0;
      *((_QWORD *)v326 + 2) = 0LL;
      *(_WORD *)(v326 + 9) = v581[1];
      v581[0] = 0LL;
      LOWORD(v581[1]) = 0;
      v326[24] = 0;
      *((_QWORD *)v326 + 4) = *(_QWORD *)((char *)v582 + 7);
      *((_QWORD *)v326 + 5) = 0LL;
      *(_QWORD *)(v326 + 25) = v582[0];
      *(_QWORD *)((char *)v582 + 7) = 0LL;
      v582[0] = 0LL;
      v329 = *(void ***)a3;
      v328 = *(void ***)(a3 + 8);
      v330 = v326 + 48;
      if ( v328 == *(void ***)a3 )
      {
        v259 = *(void ***)a3;
      }
      else
      {
        do
        {
          *((_QWORD *)v326 - 4) = *(v328 - 4);
          *((_OWORD *)v326 - 3) = *((_OWORD *)v328 - 3);
          v331 = (__int64)*(v328 - 1);
          *(v328 - 5) = 0LL;
          *(v328 - 4) = 0LL;
          *(v328 - 6) = 0LL;
          *((_QWORD *)v326 - 1) = v331;
          *(_OWORD *)(v326 - 24) = *(_OWORD *)(v328 - 3);
          *(v328 - 2) = 0LL;
          *(v328 - 1) = 0LL;
          *(v328 - 3) = 0LL;
          v328 -= 6;
          v326 -= 48;
        }
        while ( v329 != v328 );
        v259 = *(void ***)a3;
        v329 = *(void ***)(a3 + 8);
      }
      v260 = *(_QWORD *)(a3 + 16);
      *(_QWORD *)a3 = v326;
      *(_QWORD *)(a3 + 8) = v330;
      *(_QWORD *)(a3 + 16) = v327;
      if ( v329 != v259 )
      {
        do
        {
          if ( (*(_BYTE *)(v329 - 3) & 1) != 0 )
            free(*(v329 - 1));
          v332 = v329 - 6;
          if ( (*(_BYTE *)(v329 - 6) & 1) != 0 )
            free(*(v329 - 4));
          v329 -= 6;
        }
        while ( v259 != v332 );
      }
LABEL_1062:
      if ( v259 )
      {
        v579 = *(_QWORD *)(a3 + 24);
        if ( v579 + 4096 < (unsigned __int64)v259 || v579 > (unsigned __int64)v259 )
        {
LABEL_1067:
          free(v259);
        }
        else if ( *(_QWORD *)(v579 + 4096) == v260 )
        {
          *(_QWORD *)(v579 + 4096) = v259;
        }
      }
LABEL_1068:
      v3 += 2;
      return (__int64)v3;
    case 'p':
      switch ( a1[1] )
      {
        case 'L':
          *(_QWORD *)((char *)v582 + 7) = 0LL;
          v582[0] = 0LL;
          qmemcpy(v581, "operator+=", 10);
          v6 = *(_QWORD *)(a3 + 8);
          v18 = *(_QWORD *)(a3 + 16);
          if ( v6 < v18 )
            goto LABEL_365;
          v19 = 0xAAAAAAAAAAAAAAABLL * ((__int64)(v6 - *(_QWORD *)a3) >> 4);
          if ( v19 + 1 > 0x555555555555555LL )
            abort();
          v20 = 0xAAAAAAAAAAAAAAABLL * ((__int64)(v18 - *(_QWORD *)a3) >> 4);
          if ( v20 >= 0x2AAAAAAAAAAAAAALL || (2 * v20 >= v19 + 1 ? (v5 = 2 * v20) : (v5 = v19 + 1), v5) )
          {
            v21 = *(_QWORD *)(a3 + 24);
            v22 = *(char **)(v21 + 4096);
            if ( v21 + 4096 - (__int64)v22 >= (unsigned __int64)(48 * v5) )
              *(_QWORD *)(v21 + 4096) = &v22[48 * v5];
            else
              v22 = (char *)malloc(48 * v5);
          }
          else
          {
            v22 = 0LL;
          }
          v551 = &v22[48 * v19];
          *v551 = 20;
          v552 = &v22[48 * v5];
          *(_QWORD *)(v551 + 1) = v581[0];
          v551[11] = 0;
          *((_DWORD *)v551 + 3) = 0;
          *((_QWORD *)v551 + 2) = 0LL;
          *(_WORD *)(v551 + 9) = v581[1];
          v581[0] = 0LL;
          LOWORD(v581[1]) = 0;
          v551[24] = 0;
          *((_QWORD *)v551 + 4) = *(_QWORD *)((char *)v582 + 7);
          *((_QWORD *)v551 + 5) = 0LL;
          *(_QWORD *)(v551 + 25) = v582[0];
          *(_QWORD *)((char *)v582 + 7) = 0LL;
          v582[0] = 0LL;
          v554 = *(void ***)a3;
          v553 = *(void ***)(a3 + 8);
          v555 = v551 + 48;
          if ( v553 == *(void ***)a3 )
          {
            v259 = *(void ***)a3;
          }
          else
          {
            do
            {
              *((_QWORD *)v551 - 4) = *(v553 - 4);
              *((_OWORD *)v551 - 3) = *((_OWORD *)v553 - 3);
              v556 = (__int64)*(v553 - 1);
              *(v553 - 5) = 0LL;
              *(v553 - 4) = 0LL;
              *(v553 - 6) = 0LL;
              *((_QWORD *)v551 - 1) = v556;
              *(_OWORD *)(v551 - 24) = *(_OWORD *)(v553 - 3);
              *(v553 - 2) = 0LL;
              *(v553 - 1) = 0LL;
              *(v553 - 3) = 0LL;
              v553 -= 6;
              v551 -= 48;
            }
            while ( v554 != v553 );
            v259 = *(void ***)a3;
            v554 = *(void ***)(a3 + 8);
          }
          v260 = *(_QWORD *)(a3 + 16);
          *(_QWORD *)a3 = v551;
          *(_QWORD *)(a3 + 8) = v555;
          *(_QWORD *)(a3 + 16) = v552;
          if ( v554 != v259 )
          {
            do
            {
              if ( (*(_BYTE *)(v554 - 3) & 1) != 0 )
                free(*(v554 - 1));
              v557 = v554 - 6;
              if ( (*(_BYTE *)(v554 - 6) & 1) != 0 )
                free(*(v554 - 4));
              v554 -= 6;
            }
            while ( v259 != v557 );
          }
          goto LABEL_1062;
        case 'l':
          *(_QWORD *)((char *)v582 + 7) = 0LL;
          v582[0] = 0LL;
          qmemcpy(v581, "operator+", 9);
          v6 = *(_QWORD *)(a3 + 8);
          v206 = *(_QWORD *)(a3 + 16);
          if ( v6 < v206 )
            goto LABEL_378;
          v207 = 0xAAAAAAAAAAAAAAABLL * ((__int64)(v6 - *(_QWORD *)a3) >> 4);
          if ( v207 + 1 > 0x555555555555555LL )
            abort();
          v208 = 0xAAAAAAAAAAAAAAABLL * ((__int64)(v206 - *(_QWORD *)a3) >> 4);
          if ( v208 >= 0x2AAAAAAAAAAAAAALL || (2 * v208 >= v207 + 1 ? (v5 = 2 * v208) : (v5 = v207 + 1), v5) )
          {
            v209 = *(_QWORD *)(a3 + 24);
            v210 = *(char **)(v209 + 4096);
            if ( v209 + 4096 - (__int64)v210 >= (unsigned __int64)(48 * v5) )
              *(_QWORD *)(v209 + 4096) = &v210[48 * v5];
            else
              v210 = (char *)malloc(48 * v5);
          }
          else
          {
            v210 = 0LL;
          }
          v558 = &v210[48 * v207];
          *v558 = 18;
          v559 = &v210[48 * v5];
          *(_QWORD *)(v558 + 1) = v581[0];
          v558[10] = 0;
          v558[9] = v581[1];
          *(_DWORD *)(v558 + 11) = 0;
          *((_QWORD *)v558 + 2) = 0LL;
          v558[15] = 0;
          v581[0] = 0LL;
          LOBYTE(v581[1]) = 0;
          v558[24] = 0;
          *((_QWORD *)v558 + 4) = *(_QWORD *)((char *)v582 + 7);
          *((_QWORD *)v558 + 5) = 0LL;
          *(_QWORD *)(v558 + 25) = v582[0];
          *(_QWORD *)((char *)v582 + 7) = 0LL;
          v582[0] = 0LL;
          v561 = *(void ***)a3;
          v560 = *(void ***)(a3 + 8);
          v562 = v558 + 48;
          if ( v560 == *(void ***)a3 )
          {
            v259 = *(void ***)a3;
          }
          else
          {
            do
            {
              *((_QWORD *)v558 - 4) = *(v560 - 4);
              *((_OWORD *)v558 - 3) = *((_OWORD *)v560 - 3);
              v563 = (__int64)*(v560 - 1);
              *(v560 - 5) = 0LL;
              *(v560 - 4) = 0LL;
              *(v560 - 6) = 0LL;
              *((_QWORD *)v558 - 1) = v563;
              *(_OWORD *)(v558 - 24) = *(_OWORD *)(v560 - 3);
              *(v560 - 2) = 0LL;
              *(v560 - 1) = 0LL;
              *(v560 - 3) = 0LL;
              v560 -= 6;
              v558 -= 48;
            }
            while ( v561 != v560 );
            v259 = *(void ***)a3;
            v561 = *(void ***)(a3 + 8);
          }
          v260 = *(_QWORD *)(a3 + 16);
          *(_QWORD *)a3 = v558;
          *(_QWORD *)(a3 + 8) = v562;
          *(_QWORD *)(a3 + 16) = v559;
          if ( v561 != v259 )
          {
            do
            {
              if ( (*(_BYTE *)(v561 - 3) & 1) != 0 )
                free(*(v561 - 1));
              v564 = v561 - 6;
              if ( (*(_BYTE *)(v561 - 6) & 1) != 0 )
                free(*(v561 - 4));
              v561 -= 6;
            }
            while ( v259 != v564 );
          }
          goto LABEL_1062;
        case 'm':
          *(_QWORD *)((char *)v582 + 7) = 0LL;
          v582[0] = 0LL;
          qmemcpy(v581, "operator->*", 11);
          v6 = *(_QWORD *)(a3 + 8);
          v204 = *(_QWORD *)(a3 + 16);
          if ( v6 < v204 )
            goto LABEL_183;
          v237 = 0xAAAAAAAAAAAAAAABLL * ((__int64)(v6 - *(_QWORD *)a3) >> 4);
          if ( v237 + 1 > 0x555555555555555LL )
            abort();
          v238 = 0xAAAAAAAAAAAAAAABLL * ((__int64)(v204 - *(_QWORD *)a3) >> 4);
          if ( v238 >= 0x2AAAAAAAAAAAAAALL || (2 * v238 >= v237 + 1 ? (v5 = 2 * v238) : (v5 = v237 + 1), v5) )
          {
            v239 = *(_QWORD *)(a3 + 24);
            v240 = *(char **)(v239 + 4096);
            if ( v239 + 4096 - (__int64)v240 >= (unsigned __int64)(48 * v5) )
              *(_QWORD *)(v239 + 4096) = &v240[48 * v5];
            else
              v240 = (char *)malloc(48 * v5);
          }
          else
          {
            v240 = 0LL;
          }
          v537 = &v240[48 * v237];
          *v537 = 22;
          v538 = &v240[48 * v5];
          *(_QWORD *)(v537 + 1) = v581[0];
          v537[11] = BYTE2(v581[1]);
          v537[12] = 0;
          *(_WORD *)(v537 + 9) = v581[1];
          *(_WORD *)(v537 + 13) = 0;
          *((_QWORD *)v537 + 2) = 0LL;
          v537[15] = 0;
          v581[0] = 0LL;
          LOWORD(v581[1]) = 0;
          BYTE2(v581[1]) = 0;
          v537[24] = 0;
          *((_QWORD *)v537 + 4) = *(_QWORD *)((char *)v582 + 7);
          *((_QWORD *)v537 + 5) = 0LL;
          *(_QWORD *)(v537 + 25) = v582[0];
          *(_QWORD *)((char *)v582 + 7) = 0LL;
          v582[0] = 0LL;
          v540 = *(void ***)a3;
          v539 = *(void ***)(a3 + 8);
          v541 = v537 + 48;
          if ( v539 == *(void ***)a3 )
          {
            v259 = *(void ***)a3;
          }
          else
          {
            do
            {
              *((_QWORD *)v537 - 4) = *(v539 - 4);
              *((_OWORD *)v537 - 3) = *((_OWORD *)v539 - 3);
              v542 = (__int64)*(v539 - 1);
              *(v539 - 5) = 0LL;
              *(v539 - 4) = 0LL;
              *(v539 - 6) = 0LL;
              *((_QWORD *)v537 - 1) = v542;
              *(_OWORD *)(v537 - 24) = *(_OWORD *)(v539 - 3);
              *(v539 - 2) = 0LL;
              *(v539 - 1) = 0LL;
              *(v539 - 3) = 0LL;
              v539 -= 6;
              v537 -= 48;
            }
            while ( v540 != v539 );
            v259 = *(void ***)a3;
            v540 = *(void ***)(a3 + 8);
          }
          v260 = *(_QWORD *)(a3 + 16);
          *(_QWORD *)a3 = v537;
          *(_QWORD *)(a3 + 8) = v541;
          *(_QWORD *)(a3 + 16) = v538;
          if ( v540 != v259 )
          {
            do
            {
              if ( (*(_BYTE *)(v540 - 3) & 1) != 0 )
                free(*(v540 - 1));
              v543 = v540 - 6;
              if ( (*(_BYTE *)(v540 - 6) & 1) != 0 )
                free(*(v540 - 4));
              v540 -= 6;
            }
            while ( v259 != v543 );
          }
          goto LABEL_1062;
        case 'p':
          *(_QWORD *)((char *)v582 + 7) = 0LL;
          v582[0] = 0LL;
          qmemcpy(v581, "operator++", 10);
          v6 = *(_QWORD *)(a3 + 8);
          v211 = *(_QWORD *)(a3 + 16);
          if ( v6 < v211 )
            goto LABEL_365;
          v245 = 0xAAAAAAAAAAAAAAABLL * ((__int64)(v6 - *(_QWORD *)a3) >> 4);
          if ( v245 + 1 > 0x555555555555555LL )
            abort();
          v246 = 0xAAAAAAAAAAAAAAABLL * ((__int64)(v211 - *(_QWORD *)a3) >> 4);
          if ( v246 >= 0x2AAAAAAAAAAAAAALL || (2 * v246 >= v245 + 1 ? (v5 = 2 * v246) : (v5 = v245 + 1), v5) )
          {
            v247 = *(_QWORD *)(a3 + 24);
            v248 = *(char **)(v247 + 4096);
            if ( v247 + 4096 - (__int64)v248 >= (unsigned __int64)(48 * v5) )
              *(_QWORD *)(v247 + 4096) = &v248[48 * v5];
            else
              v248 = (char *)malloc(48 * v5);
          }
          else
          {
            v248 = 0LL;
          }
          v565 = &v248[48 * v245];
          *v565 = 20;
          v566 = &v248[48 * v5];
          *(_QWORD *)(v565 + 1) = v581[0];
          v565[11] = 0;
          *((_DWORD *)v565 + 3) = 0;
          *((_QWORD *)v565 + 2) = 0LL;
          *(_WORD *)(v565 + 9) = v581[1];
          v581[0] = 0LL;
          LOWORD(v581[1]) = 0;
          v565[24] = 0;
          *((_QWORD *)v565 + 4) = *(_QWORD *)((char *)v582 + 7);
          *((_QWORD *)v565 + 5) = 0LL;
          *(_QWORD *)(v565 + 25) = v582[0];
          *(_QWORD *)((char *)v582 + 7) = 0LL;
          v582[0] = 0LL;
          v568 = *(void ***)a3;
          v567 = *(void ***)(a3 + 8);
          v569 = v565 + 48;
          if ( v567 == *(void ***)a3 )
          {
            v259 = *(void ***)a3;
          }
          else
          {
            do
            {
              *((_QWORD *)v565 - 4) = *(v567 - 4);
              *((_OWORD *)v565 - 3) = *((_OWORD *)v567 - 3);
              v570 = (__int64)*(v567 - 1);
              *(v567 - 5) = 0LL;
              *(v567 - 4) = 0LL;
              *(v567 - 6) = 0LL;
              *((_QWORD *)v565 - 1) = v570;
              *(_OWORD *)(v565 - 24) = *(_OWORD *)(v567 - 3);
              *(v567 - 2) = 0LL;
              *(v567 - 1) = 0LL;
              *(v567 - 3) = 0LL;
              v567 -= 6;
              v565 -= 48;
            }
            while ( v568 != v567 );
            v259 = *(void ***)a3;
            v568 = *(void ***)(a3 + 8);
          }
          v260 = *(_QWORD *)(a3 + 16);
          *(_QWORD *)a3 = v565;
          *(_QWORD *)(a3 + 8) = v569;
          *(_QWORD *)(a3 + 16) = v566;
          if ( v568 != v259 )
          {
            do
            {
              if ( (*(_BYTE *)(v568 - 3) & 1) != 0 )
                free(*(v568 - 1));
              v571 = v568 - 6;
              if ( (*(_BYTE *)(v568 - 6) & 1) != 0 )
                free(*(v568 - 4));
              v568 -= 6;
            }
            while ( v259 != v571 );
          }
          goto LABEL_1062;
        case 's':
          *(_QWORD *)((char *)v582 + 7) = 0LL;
          v582[0] = 0LL;
          qmemcpy(v581, "operator+", 9);
          v6 = *(_QWORD *)(a3 + 8);
          v212 = *(_QWORD *)(a3 + 16);
          if ( v6 < v212 )
            goto LABEL_378;
          v249 = 0xAAAAAAAAAAAAAAABLL * ((__int64)(v6 - *(_QWORD *)a3) >> 4);
          if ( v249 + 1 > 0x555555555555555LL )
            abort();
          v250 = 0xAAAAAAAAAAAAAAABLL * ((__int64)(v212 - *(_QWORD *)a3) >> 4);
          if ( v250 >= 0x2AAAAAAAAAAAAAALL || (2 * v250 >= v249 + 1 ? (v5 = 2 * v250) : (v5 = v249 + 1), v5) )
          {
            v251 = *(_QWORD *)(a3 + 24);
            v252 = *(char **)(v251 + 4096);
            if ( v251 + 4096 - (__int64)v252 >= (unsigned __int64)(48 * v5) )
              *(_QWORD *)(v251 + 4096) = &v252[48 * v5];
            else
              v252 = (char *)malloc(48 * v5);
          }
          else
          {
            v252 = 0LL;
          }
          v572 = &v252[48 * v249];
          *v572 = 18;
          v573 = &v252[48 * v5];
          *(_QWORD *)(v572 + 1) = v581[0];
          v572[10] = 0;
          v572[9] = v581[1];
          *(_DWORD *)(v572 + 11) = 0;
          *((_QWORD *)v572 + 2) = 0LL;
          v572[15] = 0;
          v581[0] = 0LL;
          LOBYTE(v581[1]) = 0;
          v572[24] = 0;
          *((_QWORD *)v572 + 4) = *(_QWORD *)((char *)v582 + 7);
          *((_QWORD *)v572 + 5) = 0LL;
          *(_QWORD *)(v572 + 25) = v582[0];
          *(_QWORD *)((char *)v582 + 7) = 0LL;
          v582[0] = 0LL;
          v575 = *(void ***)a3;
          v574 = *(void ***)(a3 + 8);
          v576 = v572 + 48;
          if ( v574 == *(void ***)a3 )
          {
            v259 = *(void ***)a3;
          }
          else
          {
            do
            {
              *((_QWORD *)v572 - 4) = *(v574 - 4);
              *((_OWORD *)v572 - 3) = *((_OWORD *)v574 - 3);
              v577 = (__int64)*(v574 - 1);
              *(v574 - 5) = 0LL;
              *(v574 - 4) = 0LL;
              *(v574 - 6) = 0LL;
              *((_QWORD *)v572 - 1) = v577;
              *(_OWORD *)(v572 - 24) = *(_OWORD *)(v574 - 3);
              *(v574 - 2) = 0LL;
              *(v574 - 1) = 0LL;
              *(v574 - 3) = 0LL;
              v574 -= 6;
              v572 -= 48;
            }
            while ( v575 != v574 );
            v259 = *(void ***)a3;
            v575 = *(void ***)(a3 + 8);
          }
          v260 = *(_QWORD *)(a3 + 16);
          *(_QWORD *)a3 = v572;
          *(_QWORD *)(a3 + 8) = v576;
          *(_QWORD *)(a3 + 16) = v573;
          if ( v575 != v259 )
          {
            do
            {
              if ( (*(_BYTE *)(v575 - 3) & 1) != 0 )
                free(*(v575 - 1));
              v578 = v575 - 6;
              if ( (*(_BYTE *)(v575 - 6) & 1) != 0 )
                free(*(v575 - 4));
              v575 -= 6;
            }
            while ( v259 != v578 );
          }
          goto LABEL_1062;
        case 't':
          *(_QWORD *)((char *)v582 + 7) = 0LL;
          v582[0] = 0LL;
          qmemcpy(v581, "operator->", 10);
          v6 = *(_QWORD *)(a3 + 8);
          v205 = *(_QWORD *)(a3 + 16);
          if ( v6 < v205 )
            goto LABEL_365;
          v241 = 0xAAAAAAAAAAAAAAABLL * ((__int64)(v6 - *(_QWORD *)a3) >> 4);
          if ( v241 + 1 > 0x555555555555555LL )
            abort();
          v242 = 0xAAAAAAAAAAAAAAABLL * ((__int64)(v205 - *(_QWORD *)a3) >> 4);
          if ( v242 >= 0x2AAAAAAAAAAAAAALL || (2 * v242 >= v241 + 1 ? (v5 = 2 * v242) : (v5 = v241 + 1), v5) )
          {
            v243 = *(_QWORD *)(a3 + 24);
            v244 = *(char **)(v243 + 4096);
            if ( v243 + 4096 - (__int64)v244 >= (unsigned __int64)(48 * v5) )
              *(_QWORD *)(v243 + 4096) = &v244[48 * v5];
            else
              v244 = (char *)malloc(48 * v5);
          }
          else
          {
            v244 = 0LL;
          }
          v544 = &v244[48 * v241];
          *v544 = 20;
          v545 = &v244[48 * v5];
          *(_QWORD *)(v544 + 1) = v581[0];
          v544[11] = 0;
          *((_DWORD *)v544 + 3) = 0;
          *((_QWORD *)v544 + 2) = 0LL;
          *(_WORD *)(v544 + 9) = v581[1];
          v581[0] = 0LL;
          LOWORD(v581[1]) = 0;
          v544[24] = 0;
          *((_QWORD *)v544 + 4) = *(_QWORD *)((char *)v582 + 7);
          *((_QWORD *)v544 + 5) = 0LL;
          *(_QWORD *)(v544 + 25) = v582[0];
          *(_QWORD *)((char *)v582 + 7) = 0LL;
          v582[0] = 0LL;
          v547 = *(void ***)a3;
          v546 = *(void ***)(a3 + 8);
          v548 = v544 + 48;
          if ( v546 == *(void ***)a3 )
          {
            v259 = *(void ***)a3;
          }
          else
          {
            do
            {
              *((_QWORD *)v544 - 4) = *(v546 - 4);
              *((_OWORD *)v544 - 3) = *((_OWORD *)v546 - 3);
              v549 = (__int64)*(v546 - 1);
              *(v546 - 5) = 0LL;
              *(v546 - 4) = 0LL;
              *(v546 - 6) = 0LL;
              *((_QWORD *)v544 - 1) = v549;
              *(_OWORD *)(v544 - 24) = *(_OWORD *)(v546 - 3);
              *(v546 - 2) = 0LL;
              *(v546 - 1) = 0LL;
              *(v546 - 3) = 0LL;
              v546 -= 6;
              v544 -= 48;
            }
            while ( v547 != v546 );
            v259 = *(void ***)a3;
            v547 = *(void ***)(a3 + 8);
          }
          v260 = *(_QWORD *)(a3 + 16);
          *(_QWORD *)a3 = v544;
          *(_QWORD *)(a3 + 8) = v548;
          *(_QWORD *)(a3 + 16) = v545;
          if ( v547 != v259 )
          {
            do
            {
              if ( (*(_BYTE *)(v547 - 3) & 1) != 0 )
                free(*(v547 - 1));
              v550 = v547 - 6;
              if ( (*(_BYTE *)(v547 - 6) & 1) != 0 )
                free(*(v547 - 4));
              v547 -= 6;
            }
            while ( v259 != v550 );
          }
          goto LABEL_1062;
        default:
          return (__int64)v3;
      }
      return (__int64)v3;
    case 'q':
      if ( a1[1] != 117 )
        return (__int64)v3;
      *(_QWORD *)((char *)v582 + 7) = 0LL;
      v582[0] = 0LL;
      qmemcpy(v581, "operator?", 9);
      v6 = *(_QWORD *)(a3 + 8);
      v39 = *(_QWORD *)(a3 + 16);
      if ( v6 < v39 )
        goto LABEL_378;
      v40 = 0xAAAAAAAAAAAAAAABLL * ((__int64)(v6 - *(_QWORD *)a3) >> 4);
      if ( v40 + 1 > 0x555555555555555LL )
        abort();
      v41 = 0xAAAAAAAAAAAAAAABLL * ((__int64)(v39 - *(_QWORD *)a3) >> 4);
      if ( v41 >= 0x2AAAAAAAAAAAAAALL || (2 * v41 >= v40 + 1 ? (v5 = 2 * v41) : (v5 = v40 + 1), v5) )
      {
        v42 = *(_QWORD *)(a3 + 24);
        v43 = *(char **)(v42 + 4096);
        if ( v42 + 4096 - (__int64)v43 >= (unsigned __int64)(48 * v5) )
          *(_QWORD *)(v42 + 4096) = &v43[48 * v5];
        else
          v43 = (char *)malloc(48 * v5);
      }
      else
      {
        v43 = 0LL;
      }
      v262 = &v43[48 * v40];
      *v262 = 18;
      v263 = &v43[48 * v5];
      *(_QWORD *)(v262 + 1) = v581[0];
      v262[10] = 0;
      v262[9] = v581[1];
      *(_DWORD *)(v262 + 11) = 0;
      *((_QWORD *)v262 + 2) = 0LL;
      v262[15] = 0;
      v581[0] = 0LL;
      LOBYTE(v581[1]) = 0;
      v262[24] = 0;
      *((_QWORD *)v262 + 4) = *(_QWORD *)((char *)v582 + 7);
      *((_QWORD *)v262 + 5) = 0LL;
      *(_QWORD *)(v262 + 25) = v582[0];
      *(_QWORD *)((char *)v582 + 7) = 0LL;
      v582[0] = 0LL;
      v265 = *(void ***)a3;
      v264 = *(void ***)(a3 + 8);
      v266 = v262 + 48;
      if ( v264 == *(void ***)a3 )
      {
        v259 = *(void ***)a3;
      }
      else
      {
        do
        {
          *((_QWORD *)v262 - 4) = *(v264 - 4);
          *((_OWORD *)v262 - 3) = *((_OWORD *)v264 - 3);
          v267 = (__int64)*(v264 - 1);
          *(v264 - 5) = 0LL;
          *(v264 - 4) = 0LL;
          *(v264 - 6) = 0LL;
          *((_QWORD *)v262 - 1) = v267;
          *(_OWORD *)(v262 - 24) = *(_OWORD *)(v264 - 3);
          *(v264 - 2) = 0LL;
          *(v264 - 1) = 0LL;
          *(v264 - 3) = 0LL;
          v264 -= 6;
          v262 -= 48;
        }
        while ( v265 != v264 );
        v259 = *(void ***)a3;
        v265 = *(void ***)(a3 + 8);
      }
      v268 = *(_QWORD *)(a3 + 16);
      *(_QWORD *)a3 = v262;
      *(_QWORD *)(a3 + 8) = v266;
      *(_QWORD *)(a3 + 16) = v263;
      if ( v265 != v259 )
      {
        do
        {
          if ( (*(_BYTE *)(v265 - 3) & 1) != 0 )
            free(*(v265 - 1));
          v269 = v265 - 6;
          if ( (*(_BYTE *)(v265 - 6) & 1) != 0 )
            free(*(v265 - 4));
          v265 -= 6;
        }
        while ( v259 != v269 );
      }
LABEL_698:
      if ( !v259 )
        goto LABEL_1068;
      v368 = *(_QWORD *)(a3 + 24);
      if ( v368 + 4096 < (unsigned __int64)v259 || v368 > (unsigned __int64)v259 )
        goto LABEL_1067;
      if ( *(_QWORD *)(v368 + 4096) != v268 )
        goto LABEL_1068;
      *(_QWORD *)(v368 + 4096) = v259;
      v3 += 2;
      return (__int64)v3;
    case 'r':
      switch ( a1[1] )
      {
        case 'M':
          *(_QWORD *)((char *)v582 + 7) = 0LL;
          v582[0] = 0LL;
          qmemcpy(v581, "operator%=", 10);
          v6 = *(_QWORD *)(a3 + 8);
          v29 = *(_QWORD *)(a3 + 16);
          if ( v6 < v29 )
            goto LABEL_365;
          v30 = 0xAAAAAAAAAAAAAAABLL * ((__int64)(v6 - *(_QWORD *)a3) >> 4);
          if ( v30 + 1 > 0x555555555555555LL )
            abort();
          v31 = 0xAAAAAAAAAAAAAAABLL * ((__int64)(v29 - *(_QWORD *)a3) >> 4);
          if ( v31 >= 0x2AAAAAAAAAAAAAALL || (2 * v31 >= v30 + 1 ? (v5 = 2 * v31) : (v5 = v30 + 1), v5) )
          {
            v32 = *(_QWORD *)(a3 + 24);
            v33 = *(char **)(v32 + 4096);
            if ( v32 + 4096 - (__int64)v33 >= (unsigned __int64)(48 * v5) )
              *(_QWORD *)(v32 + 4096) = &v33[48 * v5];
            else
              v33 = (char *)malloc(48 * v5);
          }
          else
          {
            v33 = 0LL;
          }
          v340 = &v33[48 * v30];
          *v340 = 20;
          v341 = &v33[48 * v5];
          *(_QWORD *)(v340 + 1) = v581[0];
          v340[11] = 0;
          *((_DWORD *)v340 + 3) = 0;
          *((_QWORD *)v340 + 2) = 0LL;
          *(_WORD *)(v340 + 9) = v581[1];
          v581[0] = 0LL;
          LOWORD(v581[1]) = 0;
          v340[24] = 0;
          *((_QWORD *)v340 + 4) = *(_QWORD *)((char *)v582 + 7);
          *((_QWORD *)v340 + 5) = 0LL;
          *(_QWORD *)(v340 + 25) = v582[0];
          *(_QWORD *)((char *)v582 + 7) = 0LL;
          v582[0] = 0LL;
          v343 = *(void ***)a3;
          v342 = *(void ***)(a3 + 8);
          v344 = v340 + 48;
          if ( v342 == *(void ***)a3 )
          {
            v259 = *(void ***)a3;
          }
          else
          {
            do
            {
              *((_QWORD *)v340 - 4) = *(v342 - 4);
              *((_OWORD *)v340 - 3) = *((_OWORD *)v342 - 3);
              v345 = (__int64)*(v342 - 1);
              *(v342 - 5) = 0LL;
              *(v342 - 4) = 0LL;
              *(v342 - 6) = 0LL;
              *((_QWORD *)v340 - 1) = v345;
              *(_OWORD *)(v340 - 24) = *(_OWORD *)(v342 - 3);
              *(v342 - 2) = 0LL;
              *(v342 - 1) = 0LL;
              *(v342 - 3) = 0LL;
              v342 -= 6;
              v340 -= 48;
            }
            while ( v343 != v342 );
            v259 = *(void ***)a3;
            v343 = *(void ***)(a3 + 8);
          }
          v268 = *(_QWORD *)(a3 + 16);
          *(_QWORD *)a3 = v340;
          *(_QWORD *)(a3 + 8) = v344;
          *(_QWORD *)(a3 + 16) = v341;
          if ( v343 != v259 )
          {
            do
            {
              if ( (*(_BYTE *)(v343 - 3) & 1) != 0 )
                free(*(v343 - 1));
              v346 = v343 - 6;
              if ( (*(_BYTE *)(v343 - 6) & 1) != 0 )
                free(*(v343 - 4));
              v343 -= 6;
            }
            while ( v259 != v346 );
          }
          goto LABEL_698;
        case 'S':
          *(_QWORD *)((char *)v582 + 7) = 0LL;
          v582[0] = 0LL;
          qmemcpy(v581, "operator>>=", 11);
          v6 = *(_QWORD *)(a3 + 8);
          v103 = *(_QWORD *)(a3 + 16);
          if ( v6 < v103 )
          {
LABEL_183:
            *(_BYTE *)v6 = 22;
            v3 = a1 + 2;
            *(_QWORD *)(v6 + 1) = v581[0];
            *(_BYTE *)(v6 + 11) = BYTE2(v581[1]);
            *(_BYTE *)(v6 + 12) = 0;
            *(_WORD *)(v6 + 9) = v581[1];
            *(_WORD *)(v6 + 13) = 0;
            *(_QWORD *)(v6 + 16) = 0LL;
            *(_BYTE *)(v6 + 15) = 0;
            v581[0] = 0LL;
            LOWORD(v581[1]) = 0;
            BYTE2(v581[1]) = 0;
            goto LABEL_379;
          }
          v217 = 0xAAAAAAAAAAAAAAABLL * ((__int64)(v6 - *(_QWORD *)a3) >> 4);
          if ( v217 + 1 > 0x555555555555555LL )
            abort();
          v218 = 0xAAAAAAAAAAAAAAABLL * ((__int64)(v103 - *(_QWORD *)a3) >> 4);
          if ( v218 >= 0x2AAAAAAAAAAAAAALL || (2 * v218 >= v217 + 1 ? (v5 = 2 * v218) : (v5 = v217 + 1), v5) )
          {
            v219 = *(_QWORD *)(a3 + 24);
            v220 = *(char **)(v219 + 4096);
            if ( v219 + 4096 - (__int64)v220 >= (unsigned __int64)(48 * v5) )
              *(_QWORD *)(v219 + 4096) = &v220[48 * v5];
            else
              v220 = (char *)malloc(48 * v5);
          }
          else
          {
            v220 = 0LL;
          }
          v347 = &v220[48 * v217];
          *v347 = 22;
          v348 = &v220[48 * v5];
          *(_QWORD *)(v347 + 1) = v581[0];
          v347[11] = BYTE2(v581[1]);
          v347[12] = 0;
          *(_WORD *)(v347 + 9) = v581[1];
          *(_WORD *)(v347 + 13) = 0;
          *((_QWORD *)v347 + 2) = 0LL;
          v347[15] = 0;
          v581[0] = 0LL;
          LOWORD(v581[1]) = 0;
          BYTE2(v581[1]) = 0;
          v347[24] = 0;
          *((_QWORD *)v347 + 4) = *(_QWORD *)((char *)v582 + 7);
          *((_QWORD *)v347 + 5) = 0LL;
          *(_QWORD *)(v347 + 25) = v582[0];
          *(_QWORD *)((char *)v582 + 7) = 0LL;
          v582[0] = 0LL;
          v350 = *(void ***)a3;
          v349 = *(void ***)(a3 + 8);
          v351 = v347 + 48;
          if ( v349 == *(void ***)a3 )
          {
            v259 = *(void ***)a3;
          }
          else
          {
            do
            {
              *((_QWORD *)v347 - 4) = *(v349 - 4);
              *((_OWORD *)v347 - 3) = *((_OWORD *)v349 - 3);
              v352 = (__int64)*(v349 - 1);
              *(v349 - 5) = 0LL;
              *(v349 - 4) = 0LL;
              *(v349 - 6) = 0LL;
              *((_QWORD *)v347 - 1) = v352;
              *(_OWORD *)(v347 - 24) = *(_OWORD *)(v349 - 3);
              *(v349 - 2) = 0LL;
              *(v349 - 1) = 0LL;
              *(v349 - 3) = 0LL;
              v349 -= 6;
              v347 -= 48;
            }
            while ( v350 != v349 );
            v259 = *(void ***)a3;
            v350 = *(void ***)(a3 + 8);
          }
          v268 = *(_QWORD *)(a3 + 16);
          *(_QWORD *)a3 = v347;
          *(_QWORD *)(a3 + 8) = v351;
          *(_QWORD *)(a3 + 16) = v348;
          if ( v350 != v259 )
          {
            do
            {
              if ( (*(_BYTE *)(v350 - 3) & 1) != 0 )
                free(*(v350 - 1));
              v353 = v350 - 6;
              if ( (*(_BYTE *)(v350 - 6) & 1) != 0 )
                free(*(v350 - 4));
              v350 -= 6;
            }
            while ( v259 != v353 );
          }
          break;
        case 'm':
          *(_QWORD *)((char *)v582 + 7) = 0LL;
          v582[0] = 0LL;
          qmemcpy(v581, "operator%", 9);
          v6 = *(_QWORD *)(a3 + 8);
          v102 = *(_QWORD *)(a3 + 16);
          if ( v6 < v102 )
            goto LABEL_378;
          v213 = 0xAAAAAAAAAAAAAAABLL * ((__int64)(v6 - *(_QWORD *)a3) >> 4);
          if ( v213 + 1 > 0x555555555555555LL )
            abort();
          v214 = 0xAAAAAAAAAAAAAAABLL * ((__int64)(v102 - *(_QWORD *)a3) >> 4);
          if ( v214 >= 0x2AAAAAAAAAAAAAALL || (2 * v214 >= v213 + 1 ? (v5 = 2 * v214) : (v5 = v213 + 1), v5) )
          {
            v215 = *(_QWORD *)(a3 + 24);
            v216 = *(char **)(v215 + 4096);
            if ( v215 + 4096 - (__int64)v216 >= (unsigned __int64)(48 * v5) )
              *(_QWORD *)(v215 + 4096) = &v216[48 * v5];
            else
              v216 = (char *)malloc(48 * v5);
          }
          else
          {
            v216 = 0LL;
          }
          v333 = &v216[48 * v213];
          *v333 = 18;
          v334 = &v216[48 * v5];
          *(_QWORD *)(v333 + 1) = v581[0];
          v333[10] = 0;
          v333[9] = v581[1];
          *(_DWORD *)(v333 + 11) = 0;
          *((_QWORD *)v333 + 2) = 0LL;
          v333[15] = 0;
          v581[0] = 0LL;
          LOBYTE(v581[1]) = 0;
          v333[24] = 0;
          *((_QWORD *)v333 + 4) = *(_QWORD *)((char *)v582 + 7);
          *((_QWORD *)v333 + 5) = 0LL;
          *(_QWORD *)(v333 + 25) = v582[0];
          *(_QWORD *)((char *)v582 + 7) = 0LL;
          v582[0] = 0LL;
          v336 = *(void ***)a3;
          v335 = *(void ***)(a3 + 8);
          v337 = v333 + 48;
          if ( v335 == *(void ***)a3 )
          {
            v259 = *(void ***)a3;
          }
          else
          {
            do
            {
              *((_QWORD *)v333 - 4) = *(v335 - 4);
              *((_OWORD *)v333 - 3) = *((_OWORD *)v335 - 3);
              v338 = (__int64)*(v335 - 1);
              *(v335 - 5) = 0LL;
              *(v335 - 4) = 0LL;
              *(v335 - 6) = 0LL;
              *((_QWORD *)v333 - 1) = v338;
              *(_OWORD *)(v333 - 24) = *(_OWORD *)(v335 - 3);
              *(v335 - 2) = 0LL;
              *(v335 - 1) = 0LL;
              *(v335 - 3) = 0LL;
              v335 -= 6;
              v333 -= 48;
            }
            while ( v336 != v335 );
            v259 = *(void ***)a3;
            v336 = *(void ***)(a3 + 8);
          }
          v268 = *(_QWORD *)(a3 + 16);
          *(_QWORD *)a3 = v333;
          *(_QWORD *)(a3 + 8) = v337;
          *(_QWORD *)(a3 + 16) = v334;
          if ( v336 != v259 )
          {
            do
            {
              if ( (*(_BYTE *)(v336 - 3) & 1) != 0 )
                free(*(v336 - 1));
              v339 = v336 - 6;
              if ( (*(_BYTE *)(v336 - 6) & 1) != 0 )
                free(*(v336 - 4));
              v336 -= 6;
            }
            while ( v259 != v339 );
          }
          goto LABEL_698;
        case 's':
          *(_QWORD *)((char *)v582 + 7) = 0LL;
          v582[0] = 0LL;
          qmemcpy(v581, "operator>>", 10);
          v6 = *(_QWORD *)(a3 + 8);
          v109 = *(_QWORD *)(a3 + 16);
          if ( v6 < v109 )
            goto LABEL_365;
          v110 = 0xAAAAAAAAAAAAAAABLL * ((__int64)(v6 - *(_QWORD *)a3) >> 4);
          if ( v110 + 1 > 0x555555555555555LL )
            abort();
          v111 = 0xAAAAAAAAAAAAAAABLL * ((__int64)(v109 - *(_QWORD *)a3) >> 4);
          if ( v111 >= 0x2AAAAAAAAAAAAAALL || (2 * v111 >= v110 + 1 ? (v5 = 2 * v111) : (v5 = v110 + 1), v5) )
          {
            v112 = *(_QWORD *)(a3 + 24);
            v113 = *(char **)(v112 + 4096);
            if ( v112 + 4096 - (__int64)v113 >= (unsigned __int64)(48 * v5) )
              *(_QWORD *)(v112 + 4096) = &v113[48 * v5];
            else
              v113 = (char *)malloc(48 * v5);
          }
          else
          {
            v113 = 0LL;
          }
          v361 = &v113[48 * v110];
          *v361 = 20;
          v362 = &v113[48 * v5];
          *(_QWORD *)(v361 + 1) = v581[0];
          v361[11] = 0;
          *((_DWORD *)v361 + 3) = 0;
          *((_QWORD *)v361 + 2) = 0LL;
          *(_WORD *)(v361 + 9) = v581[1];
          v581[0] = 0LL;
          LOWORD(v581[1]) = 0;
          v361[24] = 0;
          *((_QWORD *)v361 + 4) = *(_QWORD *)((char *)v582 + 7);
          *((_QWORD *)v361 + 5) = 0LL;
          *(_QWORD *)(v361 + 25) = v582[0];
          *(_QWORD *)((char *)v582 + 7) = 0LL;
          v582[0] = 0LL;
          v364 = *(void ***)a3;
          v363 = *(void ***)(a3 + 8);
          v365 = v361 + 48;
          if ( v363 == *(void ***)a3 )
          {
            v259 = *(void ***)a3;
          }
          else
          {
            do
            {
              *((_QWORD *)v361 - 4) = *(v363 - 4);
              *((_OWORD *)v361 - 3) = *((_OWORD *)v363 - 3);
              v366 = (__int64)*(v363 - 1);
              *(v363 - 5) = 0LL;
              *(v363 - 4) = 0LL;
              *(v363 - 6) = 0LL;
              *((_QWORD *)v361 - 1) = v366;
              *(_OWORD *)(v361 - 24) = *(_OWORD *)(v363 - 3);
              *(v363 - 2) = 0LL;
              *(v363 - 1) = 0LL;
              *(v363 - 3) = 0LL;
              v363 -= 6;
              v361 -= 48;
            }
            while ( v364 != v363 );
            v259 = *(void ***)a3;
            v364 = *(void ***)(a3 + 8);
          }
          v268 = *(_QWORD *)(a3 + 16);
          *(_QWORD *)a3 = v361;
          *(_QWORD *)(a3 + 8) = v365;
          *(_QWORD *)(a3 + 16) = v362;
          if ( v364 != v259 )
          {
            do
            {
              if ( (*(_BYTE *)(v364 - 3) & 1) != 0 )
                free(*(v364 - 1));
              v367 = v364 - 6;
              if ( (*(_BYTE *)(v364 - 6) & 1) != 0 )
                free(*(v364 - 4));
              v364 -= 6;
            }
            while ( v259 != v367 );
          }
          goto LABEL_698;
        default:
          return (__int64)v3;
      }
      goto LABEL_698;
    case 'v':
      if ( (unsigned int)(unsigned __int8)a1[1] - 48 > 9 )
        return (__int64)v3;
      v12 = a1 + 2;
      v13 = sub_B190C(a1 + 2, a2, a3);
      if ( (_BYTE *)v13 == v12 )
        return (__int64)v3;
      v14 = *(_QWORD *)(a3 + 8);
      if ( *(_QWORD *)a3 == v14 )
        return (__int64)v3;
      v15 = (size_t *)(v14 - 48);
      v16 = "operator ";
      v17 = 9LL;
LABEL_226:
      sub_9CDD8(v15, 0LL, v16, v17);
      return v13;
    default:
      return (__int64)v3;
  }
}
