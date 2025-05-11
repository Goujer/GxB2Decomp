void __usercall sub_B1FF4(size_t *a1@<X0>, __int64 a2@<X8>)
{
  unsigned __int64 v3; // x22
  size_t v4; // x21
  size_t v6; // x23
  const void *v7; // x0
  const void *v8; // x0
  const void *v9; // x0
  size_t v10; // x21
  const void *v11; // x0
  unsigned __int8 *v12; // x22
  unsigned __int8 *v13; // x21
  int v14; // w8
  int v15; // w9
  int v16; // t1
  unsigned __int8 *v17; // x23
  int v18; // w20
  int v19; // w0
  const void *v20; // x20
  void *v21; // x19
  const char *v22; // x8
  void *v23; // x0
  __int64 v24; // x9
  __int64 v25; // x8
  unsigned __int64 v26; // x23
  unsigned __int8 *v27; // x19
  unsigned __int8 *v28; // x0
  unsigned __int64 v29; // x10
  unsigned __int8 *v30; // x8
  unsigned __int8 *v31; // x9
  unsigned __int8 v32; // t1
  _OWORD *v33; // x11
  __int128 *v34; // x12
  unsigned __int64 v35; // x13
  __int128 v36; // q0
  __int128 v37; // q1

  v3 = *(unsigned __int8 *)a1;
  v4 = a1[1];
  if ( (v3 & 1) != 0 )
    v6 = a1[1];
  else
    v6 = v3 >> 1;
  switch ( v6 )
  {
    case 0uLL:
      *(_QWORD *)(a2 + 8) = 0LL;
      *(_QWORD *)(a2 + 16) = 0LL;
      *(_QWORD *)a2 = 0LL;
      if ( (v3 & 1) == 0 )
      {
        *(_QWORD *)(a2 + 16) = a1[2];
        *(_OWORD *)a2 = *(_OWORD *)a1;
        return;
      }
      if ( v4 >= 0xFFFFFFFFFFFFFFF0LL )
        goto LABEL_75;
      v20 = (const void *)a1[2];
      if ( v4 >= 0x17 )
      {
        v23 = malloc((v4 + 16) & 0xFFFFFFFFFFFFFFF0LL);
        *(_QWORD *)(a2 + 8) = v4;
        *(_QWORD *)(a2 + 16) = v23;
        *(_QWORD *)a2 = (v4 + 16) & 0xFFFFFFFFFFFFFFF0LL | 1;
        v21 = v23;
      }
      else
      {
        *(_BYTE *)a2 = 2 * v4;
        v21 = (void *)(a2 + 1);
        if ( !v4 )
          goto LABEL_54;
      }
      memcpy(v21, v20, v4);
LABEL_54:
      *((_BYTE *)v21 + v4) = 0;
      return;
    case 0xBuLL:
      if ( (v3 & 1) != 0 )
        v7 = (const void *)a1[2];
      else
        v7 = (char *)a1 + 1;
      if ( memcmp(v7, "std::string", 0xBuLL) )
        goto LABEL_20;
      sub_A1F74(a1, "std::basic_string<char, std::char_traits<char>, std::allocator<char> >", 0x46uLL);
      *(_QWORD *)(a2 + 8) = 0LL;
      *(_QWORD *)(a2 + 16) = 0LL;
      *(_QWORD *)a2 = 0LL;
      *(_BYTE *)a2 = 24;
      strcpy((char *)(a2 + 1), "basic_string");
      return;
    case 0xCuLL:
      if ( (v3 & 1) != 0 )
        v8 = (const void *)a1[2];
      else
        v8 = (char *)a1 + 1;
      if ( !memcmp(v8, "std::istream", 0xCuLL) )
      {
        sub_A1F74(a1, "std::basic_istream<char, std::char_traits<char> >", 0x31uLL);
        v22 = "basic_istream";
        *(_QWORD *)(a2 + 8) = 0LL;
        *(_QWORD *)(a2 + 16) = 0LL;
        *(_QWORD *)a2 = 0LL;
LABEL_56:
        v24 = *(_QWORD *)v22;
        v25 = *(_QWORD *)(v22 + 5);
        *(_BYTE *)a2 = 26;
        *(_QWORD *)(a2 + 1) = v24;
        *(_QWORD *)(a2 + 6) = v25;
        *(_BYTE *)(a2 + 14) = 0;
        return;
      }
      if ( (v3 & 1) != 0 )
        v9 = (const void *)a1[2];
      else
        v9 = (char *)a1 + 1;
      if ( !memcmp(v9, "std::ostream", 0xCuLL) )
      {
        sub_A1F74(a1, "std::basic_ostream<char, std::char_traits<char> >", 0x31uLL);
        *(_QWORD *)(a2 + 8) = 0LL;
        *(_QWORD *)(a2 + 16) = 0LL;
        *(_QWORD *)a2 = 0LL;
        v22 = "basic_ostream";
        goto LABEL_56;
      }
LABEL_20:
      v10 = a1[2];
LABEL_25:
      if ( (v3 & 1) != 0 )
        v12 = (unsigned __int8 *)v10;
      else
        v12 = (unsigned __int8 *)a1 + 1;
      v13 = &v12[v6];
      if ( v12[v6 - 1] == 62 )
      {
        v14 = 1;
LABEL_33:
        while ( 2 )
        {
          --v13;
          do
          {
            if ( v12 == v13 )
              goto LABEL_45;
            v16 = *--v13;
            v15 = v16;
            if ( v16 == 62 )
            {
              ++v14;
              ++v13;
              goto LABEL_33;
            }
          }
          while ( v15 != 60 );
          if ( --v14 )
          {
            ++v13;
            continue;
          }
          break;
        }
      }
      if ( v13 - v12 < 2 )
      {
LABEL_45:
        *(_QWORD *)(a2 + 8) = 0LL;
        *(_QWORD *)(a2 + 16) = 0LL;
        *(_QWORD *)a2 = 0LL;
        return;
      }
      v17 = v13 - 1;
      while ( v12 != v17 )
      {
        v18 = *v17;
        if ( v18 == 58 )
        {
          v12 = v17 + 1;
          break;
        }
        v19 = isalpha(v18);
        --v17;
        if ( v18 != 95 && (unsigned int)(v18 - 48) >= 0xA && !v19 )
          goto LABEL_45;
      }
      v26 = v13 - v12;
      *(_QWORD *)(a2 + 8) = 0LL;
      *(_QWORD *)(a2 + 16) = 0LL;
      *(_QWORD *)a2 = 0LL;
      if ( (unsigned __int64)(v13 - v12) >= 0xFFFFFFFFFFFFFFF0LL )
LABEL_75:
        abort();
      if ( v26 <= 0x16 )
      {
        *(_BYTE *)a2 = 2 * v26;
        v27 = (unsigned __int8 *)(a2 + 1);
        if ( v12 == v13 )
          goto LABEL_70;
LABEL_63:
        if ( v26 >= 0x20
          && (v29 = v26 & 0xFFFFFFFFFFFFFFE0LL, (v26 & 0xFFFFFFFFFFFFFFE0LL) != 0)
          && (v27 >= v13 || v12 >= &v27[v26]) )
        {
          v30 = &v12[v29];
          v31 = &v27[v29];
          v33 = v27 + 16;
          v34 = (__int128 *)(v12 + 16);
          v35 = v26 & 0xFFFFFFFFFFFFFFE0LL;
          do
          {
            v36 = *(v34 - 1);
            v37 = *v34;
            v35 -= 32LL;
            v34 += 2;
            *(v33 - 1) = v36;
            *v33 = v37;
            v33 += 2;
          }
          while ( v35 );
          if ( v29 == v26 )
            goto LABEL_69;
        }
        else
        {
          v30 = v12;
          v31 = v27;
        }
        do
        {
          v32 = *v30++;
          *v31++ = v32;
        }
        while ( v13 != v30 );
LABEL_69:
        v27 += v26;
        goto LABEL_70;
      }
      v28 = (unsigned __int8 *)malloc((v26 + 16) & 0xFFFFFFFFFFFFFFF0LL);
      *(_QWORD *)(a2 + 8) = v26;
      *(_QWORD *)(a2 + 16) = v28;
      *(_QWORD *)a2 = (v26 + 16) & 0xFFFFFFFFFFFFFFF0LL | 1;
      v27 = v28;
      if ( v12 != v13 )
        goto LABEL_63;
LABEL_70:
      *v27 = 0;
      return;
    case 0xDuLL:
      v10 = a1[2];
      if ( (v3 & 1) != 0 )
        v11 = (const void *)a1[2];
      else
        v11 = (char *)a1 + 1;
      if ( memcmp(v11, "std::iostream", 0xDuLL) )
        goto LABEL_25;
      sub_A1F74(a1, "std::basic_iostream<char, std::char_traits<char> >", 0x32uLL);
      *(_QWORD *)(a2 + 16) = 0LL;
      *(_BYTE *)a2 = 28;
      strcpy((char *)(a2 + 1), "basic_iostream");
      return;
    default:
      goto LABEL_20;
  }
}
