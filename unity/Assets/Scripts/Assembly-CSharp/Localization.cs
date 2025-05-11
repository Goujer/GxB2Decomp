using System;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using UnityEngine;

public static class Localization
{
	[StructLayout(LayoutKind.Auto, Size = 8)]
	public delegate byte[] LoadFunction(string path);

	[StructLayout(LayoutKind.Auto, Size = 8)]
	public delegate void OnLocalizeNotification();

	public static LoadFunction loadFunction;

	public static OnLocalizeNotification onLocalize;

	public static bool localizationHasBeenSet;

	private static string[] mLanguages;

	private static Dictionary<string, string> mOldDictionary;

	private static Dictionary<string, string[]> mDictionary;

	private static Dictionary<string, string> mReplacement;

	private static int mLanguageIndex;

	private static string mLanguage;

	private static bool mMerging;

	public static Dictionary<string, string[]> dictionary
	{
		get
		{
			return null;
		}
		set
		{
		}
	}

	public static string[] knownLanguages
	{
		get
		{
			return null;
		}
	}

	public static string language
	{
		get
		{
			return null;
		}
		set
		{
		}
	}

	[Obsolete]
	public static bool isActive
	{
		get
		{
			return false;
		}
	}

	public static bool Reload()
	{
		return false;
	}

	private static bool LoadDictionary(string value, bool merge = false)
	{
		return false;
	}

	private static bool LoadAndSelect(string value)
	{
		return false;
	}

	public static void Load(TextAsset asset)
	{
	}

	public static void Set(string languageName, byte[] bytes)
	{
	}

	public static void ReplaceKey(string key, string val)
	{
	}

	public static void ClearReplacements()
	{
	}

	public static bool LoadCSV(TextAsset asset, bool merge = false)
	{
		return false;
	}

	public static bool LoadCSV(byte[] bytes, bool merge = false)
	{
		return false;
	}

	private static bool HasLanguage(string languageName)
	{
		return false;
	}

	private static bool LoadCSV(byte[] bytes, TextAsset asset, bool merge = false)
	{
		return false;
	}

	private static void AddCSV(BetterList<string> newValues, string[] newLanguages, Dictionary<string, int> languageIndices)
	{
	}

	private static string[] ExtractStrings(BetterList<string> added, string[] newLanguages, Dictionary<string, int> languageIndices)
	{
		return null;
	}

	private static bool SelectLanguage(string language)
	{
		return false;
	}

	public static void Set(string languageName, Dictionary<string, string> dictionary)
	{
	}

	public static void Set(string key, string value)
	{
	}

	public static bool Has(string key)
	{
		return false;
	}

	public static string Get(string key, bool warnIfMissing = true)
	{
		return null;
	}

	public static string Format(string key, object parameter)
	{
		return null;
	}

	public static string Format(string key, object arg0, object arg1)
	{
		return null;
	}

	public static string Format(string key, object arg0, object arg1, object arg2)
	{
		return null;
	}

	public static string Format(string key, params object[] parameters)
	{
		return null;
	}

	[Obsolete]
	public static string Localize(string key)
	{
		return null;
	}

	public static bool Exists(string key)
	{
		return false;
	}

	public static void Set(string language, string key, string text)
	{
	}
}
