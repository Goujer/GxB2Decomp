__int64 __fastcall xinyoudi::FileRef::FileRef(__int64 this, char a2, int a3)
{
  *(_BYTE *)(this + 8) = a2 & 1;
  *(_DWORD *)(this + 12) = a3;
  *(_QWORD *)this = off_69E88D0;
  return this;
}
