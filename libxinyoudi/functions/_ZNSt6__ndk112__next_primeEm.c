unsigned __int64 __fastcall std::__next_prime(unsigned __int64 this)
{
  int *v1; // x8
  __int64 v2; // x9
  unsigned __int64 v3; // x9
  __int64 v4; // x14
  __int64 v5; // x12
  unsigned int *v6; // x11
  __int64 v7; // x10
  int *v8; // x11
  __int64 v9; // x13
  unsigned int *v10; // x15
  __int64 v11; // x12
  unsigned __int64 v12; // x14
  unsigned __int64 i; // x15
  unsigned __int64 v14; // x16
  unsigned __int64 v15; // x15
  int v16; // w16
  int v17; // w17
  unsigned __int64 v18; // x16
  unsigned __int64 v19; // x16
  unsigned __int64 v20; // x16
  unsigned __int64 v21; // x16
  unsigned __int64 v22; // x16
  unsigned __int64 v23; // x16
  unsigned __int64 v24; // x16
  unsigned __int64 v25; // x16
  unsigned __int64 v26; // x16
  unsigned __int64 v27; // x16
  unsigned __int64 v28; // x16
  unsigned __int64 v29; // x16
  unsigned __int64 v30; // x16
  unsigned __int64 v31; // x16
  unsigned __int64 v32; // x16
  unsigned __int64 v33; // x16
  unsigned __int64 v34; // x16
  unsigned __int64 v35; // x16
  unsigned __int64 v36; // x16
  unsigned __int64 v37; // x16
  unsigned __int64 v38; // x16
  unsigned __int64 v39; // x16
  unsigned __int64 v40; // x16
  unsigned __int64 v41; // x16
  unsigned __int64 v42; // x16
  unsigned __int64 v43; // x16
  unsigned __int64 v44; // x16
  unsigned __int64 v45; // x16
  unsigned __int64 v46; // x16
  unsigned __int64 v47; // x16
  unsigned __int64 v48; // x16
  unsigned __int64 v49; // x16
  unsigned __int64 v50; // x16
  unsigned __int64 v51; // x16
  unsigned __int64 v52; // x16
  unsigned __int64 v53; // x16
  unsigned __int64 v54; // x16
  unsigned __int64 v55; // x16
  unsigned __int64 v56; // x16
  unsigned __int64 v57; // x16
  unsigned __int64 v58; // x16
  unsigned __int64 v59; // x16
  unsigned __int64 v60; // x16
  unsigned __int64 v61; // x16
  unsigned __int64 v62; // x16
  unsigned __int64 v63; // x16
  unsigned __int64 v64; // x17
  unsigned __int64 v65; // x16
  unsigned __int64 v66; // x16
  bool v67; // zf
  std::runtime_error *exception; // x19

  if ( this > 0xD3 )
  {
    if ( this >= 0xFFFFFFFFFFFFFFC6LL )
    {
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(exception, "__next_prime overflow");
      *(_QWORD *)exception = off_69E8C48;
      __cxa_throw(
        exception,
        (struct type_info *)&`typeinfo for'std::overflow_error,
        (void (*)(void *))std::underflow_error::~underflow_error);
    }
    v3 = this / 0xD2;
    v4 = 210 * (this / 0xD2);
    v5 = 48LL;
    v6 = dword_69D06B0;
    while ( 1 )
    {
      v9 = v5;
      if ( !v5 )
        break;
      v5 /= 2LL;
      v10 = &v6[v5];
      if ( this % 0xD2 > *v10 )
      {
        v6 = v10 + 1;
        v5 = v9 - 1 - v5;
      }
    }
    v11 = v6 - dword_69D06B0;
LABEL_17:
    v12 = v4 + dword_69D06B0[v11];
    for ( i = 5LL; i < 0x2F; ++i )
    {
      v14 = (unsigned int)dword_69D05F0[i];
      if ( v12 / v14 < v14 )
        return v12;
      if ( v12 == v12 / v14 * v14 )
      {
LABEL_13:
        if ( v11 == 47 )
        {
          ++v3;
          v11 = 0LL;
        }
        else
        {
          ++v11;
        }
        v4 = 210 * v3;
        goto LABEL_17;
      }
    }
    v15 = 211LL;
    while ( 1 )
    {
      if ( v12 / v15 < v15 )
      {
        v16 = 1;
        this = v12;
        v17 = 1;
        goto LABEL_127;
      }
      if ( v12 == v12 / v15 * v15 )
      {
        v16 = 9;
        v17 = 9;
        goto LABEL_127;
      }
      v18 = v12 / (v15 + 10);
      if ( v18 < v15 + 10 )
        goto LABEL_27;
      if ( v12 == v18 * (v15 + 10) )
        break;
      v19 = v12 / (v15 + 12);
      if ( v19 < v15 + 12 )
        goto LABEL_27;
      if ( v12 == v19 * (v15 + 12) )
        break;
      v20 = v12 / (v15 + 16);
      if ( v20 < v15 + 16 )
        goto LABEL_27;
      if ( v12 == v20 * (v15 + 16) )
        break;
      v21 = v12 / (v15 + 18);
      if ( v21 < v15 + 18 )
        goto LABEL_27;
      if ( v12 == v21 * (v15 + 18) )
        break;
      v22 = v12 / (v15 + 22);
      if ( v22 < v15 + 22 )
        goto LABEL_27;
      if ( v12 == v22 * (v15 + 22) )
        break;
      v23 = v12 / (v15 + 28);
      if ( v23 < v15 + 28 )
        goto LABEL_27;
      if ( v12 == v23 * (v15 + 28) )
        break;
      v24 = v12 / (v15 + 30);
      if ( v24 < v15 + 30 )
        goto LABEL_27;
      if ( v12 == v24 * (v15 + 30) )
        break;
      v25 = v12 / (v15 + 36);
      if ( v25 < v15 + 36 )
        goto LABEL_27;
      if ( v12 == v25 * (v15 + 36) )
        break;
      v26 = v12 / (v15 + 40);
      if ( v26 < v15 + 40 )
        goto LABEL_27;
      if ( v12 == v26 * (v15 + 40) )
        break;
      v27 = v12 / (v15 + 42);
      if ( v27 < v15 + 42 )
        goto LABEL_27;
      if ( v12 == v27 * (v15 + 42) )
        break;
      v28 = v12 / (v15 + 46);
      if ( v28 < v15 + 46 )
        goto LABEL_27;
      if ( v12 == v28 * (v15 + 46) )
        break;
      v29 = v12 / (v15 + 52);
      if ( v29 < v15 + 52 )
        goto LABEL_27;
      if ( v12 == v29 * (v15 + 52) )
        break;
      v30 = v12 / (v15 + 58);
      if ( v30 < v15 + 58 )
        goto LABEL_27;
      if ( v12 == v30 * (v15 + 58) )
        break;
      v31 = v12 / (v15 + 60);
      if ( v31 < v15 + 60 )
        goto LABEL_27;
      if ( v12 == v31 * (v15 + 60) )
        break;
      v32 = v12 / (v15 + 66);
      if ( v32 < v15 + 66 )
        goto LABEL_27;
      if ( v12 == v32 * (v15 + 66) )
        break;
      v33 = v12 / (v15 + 70);
      if ( v33 < v15 + 70 )
        goto LABEL_27;
      if ( v12 == v33 * (v15 + 70) )
        break;
      v34 = v12 / (v15 + 72);
      if ( v34 < v15 + 72 )
        goto LABEL_27;
      if ( v12 == v34 * (v15 + 72) )
        break;
      v35 = v12 / (v15 + 78);
      if ( v35 < v15 + 78 )
        goto LABEL_27;
      if ( v12 == v35 * (v15 + 78) )
        break;
      v36 = v12 / (v15 + 82);
      if ( v36 < v15 + 82 )
        goto LABEL_27;
      if ( v12 == v36 * (v15 + 82) )
        break;
      v37 = v12 / (v15 + 88);
      if ( v37 < v15 + 88 )
        goto LABEL_27;
      if ( v12 == v37 * (v15 + 88) )
        break;
      v38 = v12 / (v15 + 96);
      if ( v38 < v15 + 96 )
        goto LABEL_27;
      if ( v12 == v38 * (v15 + 96) )
        break;
      v39 = v12 / (v15 + 100);
      if ( v39 < v15 + 100 )
        goto LABEL_27;
      if ( v12 == v39 * (v15 + 100) )
        break;
      v40 = v12 / (v15 + 102);
      if ( v40 < v15 + 102 )
        goto LABEL_27;
      if ( v12 == v40 * (v15 + 102) )
        break;
      v41 = v12 / (v15 + 106);
      if ( v41 < v15 + 106 )
        goto LABEL_27;
      if ( v12 == v41 * (v15 + 106) )
        break;
      v42 = v12 / (v15 + 108);
      if ( v42 < v15 + 108 )
        goto LABEL_27;
      if ( v12 == v42 * (v15 + 108) )
        break;
      v43 = v12 / (v15 + 112);
      if ( v43 < v15 + 112 )
        goto LABEL_27;
      if ( v12 == v43 * (v15 + 112) )
        break;
      v44 = v12 / (v15 + 120);
      if ( v44 < v15 + 120 )
        goto LABEL_27;
      if ( v12 == v44 * (v15 + 120) )
        break;
      v45 = v12 / (v15 + 126);
      if ( v45 < v15 + 126 )
        goto LABEL_27;
      if ( v12 == v45 * (v15 + 126) )
        break;
      v46 = v12 / (v15 + 130);
      if ( v46 < v15 + 130 )
        goto LABEL_27;
      if ( v12 == v46 * (v15 + 130) )
        break;
      v47 = v12 / (v15 + 136);
      if ( v47 < v15 + 136 )
        goto LABEL_27;
      if ( v12 == v47 * (v15 + 136) )
        break;
      v48 = v12 / (v15 + 138);
      if ( v48 < v15 + 138 )
        goto LABEL_27;
      if ( v12 == v48 * (v15 + 138) )
        break;
      v49 = v12 / (v15 + 142);
      if ( v49 < v15 + 142 )
        goto LABEL_27;
      if ( v12 == v49 * (v15 + 142) )
        break;
      v50 = v12 / (v15 + 148);
      if ( v50 < v15 + 148 )
        goto LABEL_27;
      if ( v12 == v50 * (v15 + 148) )
        break;
      v51 = v12 / (v15 + 150);
      if ( v51 < v15 + 150 )
        goto LABEL_27;
      if ( v12 == v51 * (v15 + 150) )
        break;
      v52 = v12 / (v15 + 156);
      if ( v52 < v15 + 156 )
        goto LABEL_27;
      if ( v12 == v52 * (v15 + 156) )
        break;
      v53 = v12 / (v15 + 162);
      if ( v53 < v15 + 162 )
        goto LABEL_27;
      if ( v12 == v53 * (v15 + 162) )
        break;
      v54 = v12 / (v15 + 166);
      if ( v54 < v15 + 166 )
        goto LABEL_27;
      if ( v12 == v54 * (v15 + 166) )
        break;
      v55 = v12 / (v15 + 168);
      if ( v55 < v15 + 168 )
        goto LABEL_27;
      if ( v12 == v55 * (v15 + 168) )
        break;
      v56 = v12 / (v15 + 172);
      if ( v56 < v15 + 172 )
        goto LABEL_27;
      if ( v12 == v56 * (v15 + 172) )
        break;
      v57 = v12 / (v15 + 178);
      if ( v57 < v15 + 178 )
        goto LABEL_27;
      if ( v12 == v57 * (v15 + 178) )
        break;
      v58 = v12 / (v15 + 180);
      if ( v58 < v15 + 180 )
        goto LABEL_27;
      if ( v12 == v58 * (v15 + 180) )
        break;
      v59 = v12 / (v15 + 186);
      if ( v59 < v15 + 186 )
        goto LABEL_27;
      if ( v12 == v59 * (v15 + 186) )
        break;
      v60 = v12 / (v15 + 190);
      if ( v60 < v15 + 190 )
        goto LABEL_27;
      if ( v12 == v60 * (v15 + 190) )
        break;
      v61 = v12 / (v15 + 192);
      if ( v61 < v15 + 192 )
        goto LABEL_27;
      if ( v12 == v61 * (v15 + 192) )
        break;
      v62 = v12 / (v15 + 196);
      if ( v62 < v15 + 196 )
        goto LABEL_27;
      if ( v12 == v62 * (v15 + 196) )
        break;
      v63 = v12 / (v15 + 198);
      if ( v63 < v15 + 198 )
      {
LABEL_27:
        v16 = 1;
        this = v12;
        v17 = 1;
        goto LABEL_127;
      }
      if ( v12 == v63 * (v15 + 198) )
        break;
      v64 = v15 + 208;
      v65 = v12 / (v15 + 208);
      if ( v65 < v15 + 208 )
        goto LABEL_27;
      v66 = v65 * v64;
      v15 += 210LL;
      v67 = v12 == v66;
      if ( v12 == v66 )
        v16 = 9;
      else
        v16 = 0;
      if ( v67 )
        v15 = v64;
      v17 = v16;
      if ( (v16 & 0xF) != 0 )
        goto LABEL_127;
    }
    v16 = 9;
    v17 = 9;
LABEL_127:
    if ( v17 == 9 || !v16 )
      goto LABEL_13;
  }
  else
  {
    v1 = dword_69D05F0;
    v2 = 48LL;
    while ( 1 )
    {
      v7 = v2;
      if ( !v2 )
        break;
      v2 /= 2LL;
      v8 = &v1[v2];
      if ( (unsigned int)*v8 < this )
      {
        v1 = v8 + 1;
        v2 = v7 - 1 - v2;
      }
    }
    return (unsigned int)*v1;
  }
  return this;
}
