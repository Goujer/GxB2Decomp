__int64 __fastcall sub_B8D00(char *a1, unsigned __int64 a2, __int64 a3, __int64 a4)
{
  int v7; // w25
  unsigned int v8; // w26
  char *v9; // x27
  __int64 v10; // x0
  int v11; // w1
  int v12; // w0
  char *v13; // x27
  char *v14; // x0
  char *v15; // x0
  __int64 GR; // x0
  int v17; // w0
  __int64 v18; // x1
  __int64 v19; // x0
  __int64 v20; // x2
  __int64 v21; // x3
  __int64 v22; // x4
  __int64 v23; // x2
  __int64 v24; // x1
  __int64 v25; // x0
  unsigned __int8 v27; // [xsp+68h] [xbp+68h]
  __int64 v28; // [xsp+70h] [xbp+70h] BYREF
  __int64 v29; // [xsp+78h] [xbp+78h] BYREF
  __int64 v30; // [xsp+80h] [xbp+80h] BYREF
  __int64 v31; // [xsp+88h] [xbp+88h] BYREF
  _QWORD v32[64]; // [xsp+90h] [xbp+90h]

  v32[0] = a4;
  v7 = 1;
  while ( (unsigned __int64)a1 < a2 )
  {
    v8 = (unsigned __int8)*a1;
    v9 = a1 + 1;
    if ( v8 > 0x20 )
    {
      if ( v8 > 0x4F )
      {
        if ( v8 == 144 )
          ((void (__fastcall __noreturn *)(char *, __int64 *))loc_B7E94)(a1 + 1, &v28);
        if ( v8 <= 0x90 )
        {
          if ( v8 > 0x6F )
          {
            v9 = sub_B7EBC(a1 + 1, &v30);
            GR = Unwind_GetGR(a3, v8 - 112);
            v10 = GR + v30;
          }
          else
          {
            v10 = Unwind_GetGR(a3, v8 - 80);
          }
          goto LABEL_117;
        }
        if ( v8 == 148 )
          goto LABEL_76;
        if ( v8 <= 0x94 )
        {
          if ( v8 == 146 )
            ((void (__fastcall __noreturn *)(char *, __int64 *))loc_B7E94)(a1 + 1, &v28);
LABEL_116:
          abort();
        }
        if ( v8 != 150 )
        {
          if ( v8 != 241 )
            goto LABEL_116;
          v13 = a1 + 2;
          v27 = a1[1];
          v14 = (char *)sub_B836C(v27);
          v15 = sub_B7EFC(v27, v14, v13, (unsigned __int64 *)&v31);
LABEL_60:
          v9 = v15;
          v10 = v31;
          goto LABEL_117;
        }
      }
      else
      {
        if ( v8 >= 0x30 )
        {
          v10 = v8 - 48;
          goto LABEL_117;
        }
        if ( v8 <= 0x27 )
        {
          if ( v8 != 35 )
            goto LABEL_91;
          goto LABEL_76;
        }
        if ( v8 > 0x2E )
        {
          v9 = &a1[*(__int16 *)(a1 + 1) + 3];
        }
        else
        {
          if ( v8 >= 0x29 )
          {
LABEL_91:
            if ( v7 > 1 )
            {
              v24 = v32[v7 - 2];
              v25 = v32[v7 - 1];
              switch ( *a1 )
              {
                case 26:
                  v10 = v25 & v24;
                  goto LABEL_109;
                case 27:
                  v10 = v24 / v25;
                  goto LABEL_109;
                case 28:
                  v10 = v24 - v25;
                  goto LABEL_109;
                case 29:
                  v10 = v24 % (unsigned __int64)v25;
                  goto LABEL_109;
                case 30:
                  v10 = v25 * v24;
                  goto LABEL_109;
                case 33:
                  v10 = v25 | v24;
                  goto LABEL_109;
                case 34:
                  v10 = v25 + v24;
                  goto LABEL_109;
                case 36:
                  v10 = v24 << v25;
                  goto LABEL_109;
                case 37:
                  v10 = (unsigned __int64)v24 >> v25;
                  goto LABEL_109;
                case 38:
                  v10 = v24 >> v25;
                  goto LABEL_109;
                case 39:
                  v10 = v25 ^ v24;
                  goto LABEL_109;
                case 41:
                  v10 = v24 == v25;
                  goto LABEL_109;
                case 42:
                  v10 = v24 >= v25;
                  goto LABEL_109;
                case 43:
                  v10 = v24 > v25;
                  goto LABEL_109;
                case 44:
                  v10 = v24 <= v25;
                  goto LABEL_109;
                case 45:
                  v10 = v24 < v25;
                  goto LABEL_109;
                case 46:
                  v10 = v24 != v25;
LABEL_109:
                  v7 -= 2;
                  goto LABEL_117;
                default:
                  goto LABEL_116;
              }
            }
            goto LABEL_116;
          }
          if ( !v7 )
            goto LABEL_116;
          --v7;
          v9 = a1 + 3;
          if ( v32[v7] )
            v9 = &a1[*(__int16 *)(a1 + 1) + 3];
        }
      }
    }
    else
    {
      if ( v8 >= 0x1F )
        goto LABEL_76;
      if ( v8 == 16 )
        ((void (__fastcall __noreturn *)(char *, __int64 *))loc_B7E94)(a1 + 1, &v29);
      if ( v8 <= 0x10 )
      {
        if ( v8 == 10 )
        {
          v10 = *(unsigned __int16 *)(a1 + 1);
        }
        else
        {
          if ( v8 <= 0xA )
          {
            if ( v8 != 6 )
            {
              if ( v8 > 6 )
              {
                v9 = a1 + 2;
                if ( v8 == 8 )
                {
                  v10 = (unsigned __int8)a1[1];
                }
                else
                {
                  if ( v8 != 9 )
                    goto LABEL_116;
                  v10 = a1[1];
                }
              }
              else
              {
                if ( v8 != 3 )
                  goto LABEL_116;
                v10 = *(_QWORD *)(a1 + 1);
                v9 = a1 + 9;
              }
              goto LABEL_117;
            }
LABEL_76:
            if ( !v7 )
              goto LABEL_116;
            v23 = v32[--v7];
            if ( v8 == 31 )
            {
              v10 = -v23;
            }
            else if ( v8 > 0x1F )
            {
              if ( v8 == 35 )
                ((void (__fastcall __noreturn *)(char *, __int64 *))loc_B7E94)(a1 + 1, &v29);
              if ( v8 == 148 )
              {
                v9 = a1 + 2;
                switch ( a1[1] )
                {
                  case 1:
                    v10 = *(unsigned __int8 *)v23;
                    goto LABEL_117;
                  case 2:
                    v10 = *(unsigned __int16 *)v23;
                    goto LABEL_117;
                  case 4:
                    v10 = *(unsigned int *)v23;
                    goto LABEL_117;
                  case 8:
                    goto LABEL_88;
                  default:
                    goto LABEL_116;
                }
              }
              v10 = ~v23;
            }
            else if ( v8 == 6 )
            {
LABEL_88:
              v10 = *(_QWORD *)v23;
            }
            else
            {
              v10 = (v23 ^ (v23 >> 63)) + ((unsigned __int64)v23 >> 63);
            }
            goto LABEL_117;
          }
          if ( v8 == 13 )
          {
            v10 = *(int *)(a1 + 1);
            goto LABEL_58;
          }
          if ( v8 > 0xD )
          {
            v9 = a1 + 9;
            v10 = *(_QWORD *)(a1 + 1);
            goto LABEL_117;
          }
          if ( v8 != 11 )
          {
            v10 = *(unsigned int *)(a1 + 1);
LABEL_58:
            v9 = a1 + 5;
            goto LABEL_117;
          }
          v10 = *(__int16 *)(a1 + 1);
        }
        v9 = a1 + 3;
        goto LABEL_117;
      }
      if ( v8 == 21 )
      {
        v18 = (unsigned __int8)a1[1];
        v30 = v18;
        v9 = a1 + 2;
        v19 = v7 - 1;
        if ( v18 >= v19 )
          goto LABEL_116;
        v10 = v32[v19 - v18];
        goto LABEL_117;
      }
      if ( v8 <= 0x15 )
      {
        if ( v8 == 18 )
        {
          if ( !v7 )
            goto LABEL_116;
          v17 = v7 - 1;
        }
        else
        {
          if ( v8 < 0x12 )
          {
            v15 = sub_B7EBC(a1 + 1, &v31);
            goto LABEL_60;
          }
          if ( v8 == 19 )
          {
            if ( !v7 )
              goto LABEL_116;
            --v7;
            goto LABEL_119;
          }
          if ( v7 <= 1 )
            goto LABEL_116;
          v17 = v7 - 2;
        }
        v10 = v32[v17];
LABEL_117:
        if ( (unsigned int)v7 > 0x3F )
          goto LABEL_116;
        v32[v7++] = v10;
        goto LABEL_119;
      }
      if ( v8 == 25 )
        goto LABEL_76;
      if ( v8 > 0x19 )
        goto LABEL_91;
      v11 = v7 - 1;
      v12 = v7 - 2;
      if ( v8 == 22 )
      {
        if ( v7 <= 1 )
          goto LABEL_116;
        v20 = v32[v11];
        v32[v11] = v32[v12];
        v32[v12] = v20;
      }
      else
      {
        if ( v8 != 23 || v7 <= 2 )
          goto LABEL_116;
        v21 = v32[v11];
        v22 = v32[v7 - 3];
        v32[v11] = v32[v12];
        v32[v12] = v22;
        v32[v7 - 3] = v21;
      }
    }
LABEL_119:
    a1 = v9;
  }
  if ( !v7 )
    goto LABEL_116;
  return v32[v7 - 1];
}
