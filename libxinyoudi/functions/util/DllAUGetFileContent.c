__int64 __fastcall DllAUGetFileContent(xinyoudi::ApkUtils *a1, const char *a2, char a3, bool a4)
{
  return xinyoudi::ApkUtils::getFileContent(a1, a2, (unsigned __int8 *)(a3 & 1), a4);
}
