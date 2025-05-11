__int64 __fastcall std::__murmur2_or_cityhash<unsigned long,64ul>::operator()(
        __int64 a1,
        __int64 *a2,
        unsigned __int64 a3)
{
  __int64 v4; // x15
  __int64 v5; // x8
  __int64 v6; // x9
  __int64 v7; // x13
  __int64 v8; // x16
  __int64 v9; // x17
  __int64 v10; // x8
  __int64 v11; // x14
  __int64 v12; // x18
  __int64 v13; // x12
  __int64 v14; // x13
  __int64 v15; // x9
  __int64 v16; // x15
  __int64 v17; // x17
  __int64 v18; // x8
  __int64 v19; // x15
  __int64 v20; // x9
  unsigned __int64 v21; // x9
  __int64 v22; // x13
  __int64 v23; // x14
  unsigned __int64 v24; // x9
  unsigned __int64 v25; // x12
  __int64 v26; // x13
  unsigned __int64 v27; // x9
  unsigned __int64 v28; // x10
  unsigned __int64 v29; // x9
  __int64 v30; // x11
  __int64 v31; // x13
  __int64 v32; // x16
  __int64 v33; // x14
  __int64 v34; // x18
  unsigned __int64 v35; // x12
  unsigned __int64 v36; // x15
  __int64 v37; // x0
  unsigned __int64 v38; // x10
  __int64 v39; // x16
  __int64 v40; // x17
  unsigned __int64 v41; // x2
  __int64 v42; // x14
  __int64 v43; // x18
  __int64 v44; // x11
  __int64 v45; // x14
  _QWORD *v46; // x1
  __int64 v47; // x17
  __int64 v48; // t1
  unsigned __int64 v49; // x0
  unsigned __int64 v50; // x12
  unsigned __int64 v51; // x4
  __int64 v52; // x14
  unsigned __int64 v53; // x16
  unsigned __int64 v54; // x18
  unsigned __int64 v55; // x15
  unsigned __int64 i; // x13
  unsigned __int64 v57; // x0
  __int64 v58; // x3
  __int64 v59; // x15
  unsigned __int64 v60; // x17
  __int64 v61; // t2
  __int64 v62; // x5
  __int64 v63; // x18
  unsigned __int64 v64; // x2
  __int64 v65; // t2
  __int64 v66; // x4
  __int64 v67; // x0
  __int64 v68; // x3
  __int64 v69; // x14
  __int64 v70; // x6
  __int64 v71; // x0
  __int64 v72; // x11
  unsigned __int64 v73; // x17
  __int64 v74; // x12
  unsigned __int64 v75; // x9
  unsigned __int64 v76; // x10
  unsigned __int64 v77; // x9

  if ( a3 > 0x20 )
  {
    if ( a3 <= 0x40 )
    {
      v4 = *(__int64 *)((char *)a2 + a3 - 16);
      v5 = a2[2];
      v6 = a2[3];
      v7 = *a2 - 0x3C5A37A36834CED9LL * (v4 + a3);
      v8 = *(__int64 *)((char *)a2 + a3 - 32) + v5;
      v9 = *(__int64 *)((char *)a2 + a3 - 8) + v6;
      v10 = v7 + a2[1] + v5;
      v11 = __ROR8__(v7 + a2[1], 7) + __ROR8__(v7, 37);
      v12 = v9 + v8;
      v13 = *(__int64 *)((char *)a2 + a3 - 24) + v8;
      v14 = __ROR8__(v7 + v6, 52);
      v15 = v10 + v6;
      v16 = v13 + v4;
      v17 = v16 + v9;
      v18 = v11 + v14 + __ROR8__(v10, 31);
      v19 = __ROR8__(v16, 31);
      v20 = v15 + __ROR8__(v8, 37) + __ROR8__(v13, 7) + __ROR8__(v12, 52);
      v21 = (0xC3A5C85C97CB3127LL * (v17 + v18) - 0x651E95C4D06FBFB1LL * (v20 + v19)) ^ ((0xC3A5C85C97CB3127LL
                                                                                        * (v17 + v18)
                                                                                        - 0x651E95C4D06FBFB1LL
                                                                                        * (v20 + v19)) >> 47);
      return 0x9AE16A3B2F90404FLL * ((v18 - 0x3C5A37A36834CED9LL * v21) ^ ((v18 - 0x3C5A37A36834CED9LL * v21) >> 47));
    }
    v30 = *(__int64 *)((char *)a2 + a3 - 48);
    v31 = *(__int64 *)((char *)a2 + a3 - 40);
    v32 = *(__int64 *)((char *)a2 + a3 - 56);
    v34 = *(__int64 *)((char *)a2 + a3 - 24);
    v33 = *(__int64 *)((char *)a2 + a3 - 16);
    v35 = a3 - 1;
    v36 = *(__int64 *)((char *)a2 + a3 - 64) + a3;
    v37 = *(__int64 *)((char *)a2 + a3 - 8);
    v38 = v32 + v33;
    v39 = v36 + v32 + v30;
    v40 = v38 - 0x4B6D499041670D8DLL + *(__int64 *)((char *)a2 + a3 - 32);
    v41 = (0x9DDFEA08EB382D69LL * (v34 ^ (v30 + a3))) ^ v34 ^ ((0x9DDFEA08EB382D69LL * (v34 ^ (v30 + a3))) >> 47);
    v42 = v40 + v34 + v33;
    v43 = v40 + v31 + v37;
    v44 = v42 + v37;
    v45 = __ROR8__(v42, 44) + v40;
    v48 = *a2;
    v46 = a2 + 4;
    v47 = v48;
    v49 = v35 & 0xFFFFFFFFFFFFFFC0LL;
    v50 = v45 + __ROR8__(v43, 21);
    v51 = __ROR8__(v39, 44) + v36;
    v52 = v39 + v31;
    v53 = v48 - 0x4B6D499041670D8DLL * v31;
    v54 = 0x9DDFEA08EB382D69LL * ((0x9DDFEA08EB382D69LL * v41) ^ ((0x9DDFEA08EB382D69LL * v41) >> 47));
    v55 = v51
        + __ROR8__(
            v31 + v36 - 0x622015F714C7D297LL * ((0x9DDFEA08EB382D69LL * v41) ^ ((0x9DDFEA08EB382D69LL * v41) >> 47)),
            21);
    for ( i = 64 - v49; ; i += 64LL )
    {
      v57 = v38 + v55;
      v58 = v46[1];
      v59 = v47 - 0x4B6D499041670D8DLL * v55;
      v60 = v53 + v52 + v38;
      v61 = __ROR8__(v54 + v44, 33);
      v63 = v46[2];
      v62 = v46[3];
      v53 = 0xB492B66FBE98F273LL * v61;
      v64 = 0xB492B66FBE98F273LL * v61 + v50 + *v46;
      v65 = __ROR8__(v57 + v63, 42);
      v66 = *(v46 - 1);
      v67 = v64 + v58;
      v38 = v58 + v52 - 0x4B6D499041670D8DLL * v65;
      v69 = *(v46 - 3);
      v68 = *(v46 - 2);
      v70 = v59 + v44 + v66;
      v71 = v67 + v63;
      v72 = v59 + v69 + v68;
      v73 = 0xB492B66FBE98F273LL * __ROR8__(v60 + v69, 37);
      v52 = v72 + v66;
      v54 = v73 ^ v50;
      v74 = __ROR8__(v72, 44) + v59;
      v44 = v71 + v62;
      v55 = v74 + __ROR8__(v70 + v54, 21);
      v50 = __ROR8__(v71, 44) + v64 + __ROR8__(v38 + v68 + v64 + v62, 21);
      if ( !i )
        break;
      v47 = v46[4];
      v46 += 8;
    }
    v75 = v54 - 0x4B6D499041670D8DLL * (v38 ^ (v38 >> 47));
    v76 = v53
        - 0x622015F714C7D297LL
        * ((0x9DDFEA08EB382D69LL
          * ((0x9DDFEA08EB382D69LL * (v50 ^ v55)) ^ v50 ^ ((0x9DDFEA08EB382D69LL * (v50 ^ v55)) >> 47))) ^ ((0x9DDFEA08EB382D69LL * ((0x9DDFEA08EB382D69LL * (v50 ^ v55)) ^ v50 ^ ((0x9DDFEA08EB382D69LL * (v50 ^ v55)) >> 47))) >> 47));
    v77 = 0x9DDFEA08EB382D69LL
        * (v76 ^ (v75
                - 0x622015F714C7D297LL
                * ((0x9DDFEA08EB382D69LL
                  * ((0x9DDFEA08EB382D69LL * (v44 ^ v52)) ^ v44 ^ ((0x9DDFEA08EB382D69LL * (v44 ^ v52)) >> 47))) ^ ((0x9DDFEA08EB382D69LL * ((0x9DDFEA08EB382D69LL * (v44 ^ v52)) ^ v44 ^ ((0x9DDFEA08EB382D69LL * (v44 ^ v52)) >> 47))) >> 47))));
    v29 = v77 ^ v76 ^ (v77 >> 47);
  }
  else
  {
    if ( a3 <= 0x10 )
      return std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_0_to_16();
    v22 = a2[1];
    v23 = *(__int64 *)((char *)a2 + a3 - 8);
    v24 = 0xB492B66FBE98F273LL * *a2;
    v25 = v22 ^ 0xC949D7C7509E6557LL;
    v26 = __ROR8__(v24 - v22, 43);
    v27 = v24 + a3 - 0x9AE16A3B2F90404FLL * v23 + __ROR8__(v25, 20);
    v28 = 0x9DDFEA08EB382D69LL
        * ((v26
          - 0x3C5A37A36834CED9LL * *(__int64 *)((char *)a2 + a3 - 16)
          + ((0xBE41013C00000000LL * v23) | ((0x9AE16A3B2F90404FLL * v23) >> 30))) ^ v27);
    v29 = v28 ^ v27 ^ (v28 >> 47);
  }
  return 0x9DDFEA08EB382D69LL * ((0x9DDFEA08EB382D69LL * v29) ^ ((0x9DDFEA08EB382D69LL * v29) >> 47));
}
