__int64 __fastcall Java_com_xyd_utils_ApkUtils_initialize(JNIEnv *a1, int a2, jobject assetManager)
{
  AAssetManager *v3; // x1
  AAssetManager *v4; // x19

  v4 = AAssetManager_fromJava(a1, assetManager);
  if ( !v4 )
    __android_log_print(6, "ApkUtils-Unity", "AssetManager is nullptr in initialize!");
  return xinyoudi::ApkUtils::setAssetManager(v4, v3);
}
