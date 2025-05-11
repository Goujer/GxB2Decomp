char *__fastcall sub_B83E4(char *result, unsigned __int64 a2, __int64 a3, char *dest)
{
  __int64 *v7; // x24
  unsigned __int64 v8; // x2
  char v9; // w1
  char *v10; // x20
  int v11; // w3
  char *v12; // x0
  __int64 *v13; // x3
  __int64 *v14; // x3
  __int64 v15; // x0
  char *v16; // x2
  __int64 v17; // x1
  __int64 v18; // [xsp-660h] [xbp-660h] BYREF
  unsigned __int64 v19; // [xsp+68h] [xbp+68h]
  __int64 v20; // [xsp+78h] [xbp+78h] BYREF
  __int64 v21; // [xsp+80h] [xbp+80h] BYREF
  unsigned __int64 v22; // [xsp+88h] [xbp+88h] BYREF

  *((_QWORD *)dest + 196) = 0LL;
  v7 = 0LL;
  while ( (unsigned __int64)result < a2 )
  {
    v8 = *((_QWORD *)dest + 201);
    if ( v8 >= *(_QWORD *)(a3 + 792) + (*(_QWORD *)(a3 + 832) >> 63) )
      break;
    v9 = *result;
    v10 = result + 1;
    v11 = *result & 0xC0;
    switch ( v11 )
    {
      case 64:
        *((_QWORD *)dest + 201) = v8 + (v9 & 0x3F) * *((_QWORD *)dest + 204);
        break;
      case 128:
        v20 = v9 & 0x3F;
        ((void (__fastcall __noreturn *)(char *, __int64 *))loc_B7E94)(result + 1, &v21);
      case 192:
        *(_DWORD *)&dest[16 * (v9 & 0x3F) + 8] = 0;
        break;
      default:
        switch ( *result )
        {
          case 0:
            goto LABEL_41;
          case 1:
            v19 = (unsigned __int8)dest[1648];
            v12 = (char *)sub_B836C(v19);
            v10 = sub_B7EFC(v19, v12, v10, &v22);
            *((_QWORD *)dest + 201) = v22;
            break;
          case 2:
            v10 = result + 2;
            *((_QWORD *)dest + 201) = v8 + (unsigned __int8)result[1] * *((_QWORD *)dest + 204);
            break;
          case 3:
            v10 = result + 3;
            *((_QWORD *)dest + 201) = v8 + *(unsigned __int16 *)(result + 1) * *((_QWORD *)dest + 204);
            break;
          case 4:
            v10 = result + 5;
            *((_QWORD *)dest + 201) = v8 + *(unsigned int *)(result + 1) * *((_QWORD *)dest + 204);
            break;
          case 5:
            ((void (__fastcall __noreturn *)(char *, __int64 *))loc_B7E94)(result + 1, &v20);
          case 6:
          case 8:
            ((void (__fastcall __noreturn *)(char *, __int64 *))loc_B7E94)(result + 1, &v20);
          case 7:
            ((void (__fastcall __noreturn *)(char *, __int64 *))loc_B7E94)(result + 1, &v20);
          case 9:
            ((void (__fastcall __noreturn *)(char *, __int64 *))loc_B7E94)(result + 1, &v20);
          case 10:
            if ( v7 )
            {
              v13 = v7;
              v7 = (__int64 *)v7[196];
            }
            else
            {
              v13 = &v18;
            }
            *((_QWORD *)dest + 196) = memcpy(v13, dest, 0x648uLL);
            break;
          case 11:
            v19 = *((_QWORD *)dest + 196);
            memcpy(dest, (const void *)v19, 0x648uLL);
            v14 = (__int64 *)v19;
            *(_QWORD *)(v19 + 1568) = v7;
            v7 = v14;
            break;
          case 12:
            ((void (__fastcall __noreturn *)(char *, __int64 *))loc_B7E94)(result + 1, &v21);
          case 13:
            ((void (__fastcall __noreturn *)(char *, __int64 *))loc_B7E94)(result + 1, &v21);
          case 14:
            ((void (__fastcall __noreturn *)(char *, __int64 *))loc_B7E94)(result + 1, &v21);
          case 15:
            *((_QWORD *)dest + 199) = v10;
            *((_DWORD *)dest + 400) = 2;
            ((void (__fastcall __noreturn *)(char *, __int64 *))loc_B7E94)(result + 1, &v21);
          case 16:
            ((void (__fastcall __noreturn *)(char *, __int64 *))loc_B7E94)(result + 1, &v20);
          case 17:
            ((void (__fastcall __noreturn *)(char *, __int64 *))loc_B7E94)(result + 1, &v20);
          case 18:
            ((void (__fastcall __noreturn *)(char *, __int64 *))loc_B7E94)(result + 1, &v21);
          case 19:
            v10 = sub_B7EBC(result + 1, &v22);
            *((_QWORD *)dest + 197) = v22 * *((_QWORD *)dest + 203);
            break;
          case 20:
            ((void (__fastcall __noreturn *)(char *, __int64 *))loc_B7E94)(result + 1, &v20);
          case 21:
            ((void (__fastcall __noreturn *)(char *, __int64 *))loc_B7E94)(result + 1, &v20);
          case 22:
            ((void (__fastcall __noreturn *)(char *, __int64 *))loc_B7E94)(result + 1, &v20);
          case 45:
            v15 = 16LL;
            v16 = dest + 256;
            v20 = 16LL;
            v17 = 0LL;
            do
            {
              *((_DWORD *)v16 + 2) = 1;
              ++v15;
              *(_QWORD *)v16 = v17;
              v16 += 16;
              v17 += 8LL;
            }
            while ( v15 != 32 );
            break;
          case 46:
            ((void (__fastcall __noreturn *)(char *, __int64 *))loc_B7E94)(result + 1, &v21);
          case 47:
            ((void (__fastcall __noreturn *)(char *, __int64 *))loc_B7E94)(result + 1, &v20);
          default:
            abort();
        }
        break;
    }
LABEL_41:
    result = v10;
  }
  return result;
}
