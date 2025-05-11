void *__fastcall std::logic_error::logic_error(std::logic_error *this, const char *s)
{
  size_t v4; // x21
  __int64 v5; // x0
  __int64 v6; // x22
  void *result; // x0

  *(_QWORD *)this = off_69E8A70;
  v4 = strlen(s);
  v5 = operator new(v4 + 25);
  v6 = v5 + 24;
  *(_QWORD *)v5 = v4;
  *(_QWORD *)(v5 + 8) = v4;
  *(_DWORD *)(v5 + 16) = 0;
  result = memcpy((void *)(v5 + 24), s, v4 + 1);
  *((_QWORD *)this + 1) = v6;
  return result;
}
