using System;
using System.Collections.Generic;

public static class UIManager
{
	private static Dictionary<string, UIBase> _uiDict;

	public static UISplash ShowSplash(Action callback)
	{
		return null;
	}

	public static UIKoInform ShowKoInform(Action callback)
	{
		return null;
	}

	public static UILoading ShowLoading()
	{
		return null;
	}

	public static UIAccountBanned ShowBanned(string title, string message, string message2, string info, string yesText, string noText, Action<bool> callback)
	{
		return null;
	}

	public static UIAlert ShowConfirmAlert(string title, string message, string yesText, bool showClose, Action<bool> callback, Action closeCallback = null)
	{
		return null;
	}

	public static UIAlert ShowAlert(string title, string message, string yesText, string noText, bool showClose, Action<bool> callback, Action closeCallback = null)
	{
		return null;
	}

	public static UIUpdateAnnounce ShowUpdateAnnounce(string title, string message, string banner, string buttonText, Action callback)
	{
		return null;
	}

	public static UIAutoRepair ShowAutoRepair(string title, string message, string urls, bool inGame, bool showClose, Action<string> callback, Action closeCallback = null)
	{
		return null;
	}

	public static UIAutoRepair ShowAutoRepair(string title, string message, string urls, bool inGame, string playerID, string logPath, bool showClose, Action<string> callback, Action closeCallback = null)
	{
		return null;
	}

	public static UIAutoRepairRes ShowAutoRepairRes(string title, string message, string autoRes1, string autoRes2, string autoRes3, string autoRes4, string autoRes5, string message2, string message3, string yesText, Action callback)
	{
		return null;
	}

	private static T InitUIComponent<T>(string ui) where T : UIBase
	{
		return null;
	}

	private static UIBase GetUIComponent(string ui)
	{
		return null;
	}

	public static void Close(string ui)
	{
	}

	public static void CloseAll()
	{
	}

	public static bool IsOpen(string ui)
	{
		return false;
	}

	public static void SetLoadingVersion(string version)
	{
	}

	public static void SetLoadingMessage(string message)
	{
	}

	public static void SetLoadingProgress(string progress)
	{
	}

	public static void SetLoadingProgress(float progress, bool notify)
	{
	}

	public static void SetLoadingProgress(float progress, float step, bool notify)
	{
	}

	public static void SetLoadingStartLabel(string text)
	{
	}

	public static void SetLoadingStartScreen(Action callback)
	{
	}

	public static void ShowProgrssBar(bool flag)
	{
	}
}
