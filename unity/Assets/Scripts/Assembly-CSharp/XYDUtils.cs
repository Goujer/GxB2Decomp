using System;
using System.Collections.Generic;
using LuaInterface;
using UnityEngine;

public static class XYDUtils
{
	private class CompareSubPanels : IComparer<UIPanel>
	{
		public int Compare(UIPanel left, UIPanel right)
		{
			return 0;
		}
	}

	private static Dictionary<string, string> EmojiDic;

	public static float TweenDeltaTime;

	public static Color normalColorFilter;

	public static Color greyColor;

	public static Color darkColorFilter;

	public static string spineTexShader;

	public static int MaxInt
	{
		get
		{
			return 0;
		}
	}

	public static bool IsIPhoneX()
	{
		return false;
	}

	public static bool Is32Bit()
	{
		return false;
	}

	public static bool Is64Bit()
	{
		return false;
	}

	public static string CalcMD5(byte[] data)
	{
		return null;
	}

	public static int CompVersion(string versionA, string versionB)
	{
		return 0;
	}

	public static bool IsSupportLang(string lang)
	{
		return false;
	}

	public static bool IsSupportDeviceLang()
	{
		return false;
	}

	public static string GetGameLang()
	{
		return null;
	}

	public static bool IsArabicLang()
	{
		return false;
	}

	public static string GetSetLang()
	{
		return null;
	}

	public static string GetGameLangCode()
	{
		return null;
	}

	public static string GetTransLangCode()
	{
		return null;
	}

	public static GameObject CreateGameObject(string name)
	{
		return null;
	}

	public static GameObject FindGameObject(string tag)
	{
		return null;
	}

	public static void SetTransformParent(GameObject child, GameObject parent)
	{
	}

	public static Material CreateMaterialWithShader(string shader)
	{
		return null;
	}

	public static GameObject CreateCamera(string name, string tag)
	{
		return null;
	}

	public static Texture2D CreateTexture2D(int width, int height)
	{
		return null;
	}

	public static Texture2D CreateTexture2D(int width, int height, int format, bool mipMap)
	{
		return null;
	}

	public static Texture2D CreateTexture2D(int width, int height, int format, bool mipMap, bool linear)
	{
		return null;
	}

	public static float SmoothDamp1(float cur, float tar, ref float speed, float time)
	{
		return 0f;
	}

	public static Vector3 SmoothDamp3(Vector3 cur, Vector3 tar, Vector3 speed, float time)
	{
		return default(Vector3);
	}

	public static GameObject FindChild(GameObject obj, string name)
	{
		return null;
	}

	public static void AddEventDelegate(List<EventDelegate> list, EventDelegate.Callback callback)
	{
	}

	public static void AddEventDelegate(List<EventDelegate> list, EventDelegate.Callback callback, bool oneShot)
	{
	}

	public static void AddUISliderDragFinish(UISlider uiSlider, LuaFunction luafunc)
	{
	}

	public static void SetTargetMinPanel(GameObject obj, int depth)
	{
	}

	public static int GetMaxTargetDepth(GameObject obj, bool includeInactive = false)
	{
		return 0;
	}

	public static GameObject GetPanelDepthMaxMin(GameObject target, bool maxDepth, bool includeInactive)
	{
		return null;
	}

	private static List<UIPanel> GetPanelSorted(GameObject target, bool includeInactive = false)
	{
		return null;
	}

	private static List<UIPanel> GetParentPanelSorted(GameObject target, bool includeInactive = false)
	{
		return null;
	}

	public static GameObject GetParentPanelDepthMaxMin(GameObject target, bool maxDepth, bool includeInactive)
	{
		return null;
	}

	public static Transform FindDeepChild(GameObject _target, string _childName)
	{
		return null;
	}

	public static bool IsFingerOverUI()
	{
		return false;
	}

	public static bool IsMouseOverUI()
	{
		return false;
	}

	public static string HandleHtmlStr(string str, bool useEmoji)
	{
		return null;
	}

	public static bool IsPad()
	{
		return false;
	}

	public static bool IsKo()
	{
		return false;
	}

	public static void QuitGame()
	{
	}

	public static int TimeStamp()
	{
		return 0;
	}

	public static void SetHeadIcon(UISprite uiSprite, string filePath, string spriteName)
	{
	}

	public static void SetHeadTexture(UITexture uiTexture, string filePath, string textureName)
	{
	}

	public static byte[] Str2Byte(string str)
	{
		return null;
	}

	public static List<Color32> CreateColorList(int capacity)
	{
		return null;
	}

	public static List<Vector2> CreateVector2List(int capacity)
	{
		return null;
	}

	public static Mesh CreatePlane(float width, float height, float pivotX, float pivotZ, Rect uvRect, Color color)
	{
		return null;
	}

	public static float LinearInterpokation(float d1, float d2, float a1, float a2, float d, bool limit)
	{
		return 0f;
	}

	public static Vector3 Tracing(Vector3 lineVector, Vector3 linePoint)
	{
		return default(Vector3);
	}

	public static string GetNowTicks()
	{
		return null;
	}

	public static bool IsTest()
	{
		return false;
	}

	public static string VersionCheckUrl()
	{
		return null;
	}

	public static string CdnUrl()
	{
		return null;
	}

	public static string AvatarUrl()
	{
		return null;
	}

	public static string UploadUrl()
	{
		return null;
	}

	public static void SetDarkenBtnBehavior(GameObject go, Action onClick)
	{
	}

	public static void UseFilter(GameObject go, Color filter)
	{
	}

	public static void RemoveFilter(GameObject go)
	{
	}

	public static void ApplyChildrenGrey(GameObject go)
	{
	}

	public static void ApplyChildrenOrigin(GameObject go)
	{
	}

	public static void ChangeTextureShders(GameObject go, string shaderName, Color color, bool isActive)
	{
	}

	public static void ResumeTextureShders(GameObject go, bool isActive)
	{
	}

	public static bool Texture2DLoadImg(Texture2D texture, byte[] data)
	{
		return false;
	}

	public static Texture2D CameraCapture(Camera camera, Rect rect, int rWidth, int rHeight)
	{
		return null;
	}

	public static byte[] EncodeToPNG(Texture2D tex)
	{
		return null;
	}

	public static string GetMd5Hash(byte[] input)
	{
		return null;
	}

	public static int GetBytesLength(byte[] input)
	{
		return 0;
	}
}
