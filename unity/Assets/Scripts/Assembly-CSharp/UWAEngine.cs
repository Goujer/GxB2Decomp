using System;
using UnityEngine;

public class UWAEngine
{
	public enum Mode
	{
		Overview = 0,
		Mono = 1,
		Assets = 2,
		Lua = 3,
		Unset = 4
	}

	public static int FrameId
	{
		get
		{
			return 0;
		}
	}

	public static void StaticInit(bool poco = false)
	{
	}

	public static void Start(Mode mode)
	{
	}

	public static void Stop()
	{
	}

	public static void Tag(string tag)
	{
	}

	public static void SetUIActive(bool active)
	{
	}

	public static void AssetDumpInOverview()
	{
	}

	public static void PushSample(string sampleName)
	{
	}

	public static void PopSample()
	{
	}

	public static void Upload(Action<bool> callback, string user, string password, string projectName, int timeLimitS)
	{
	}

	public static void Upload(Action<bool> callback, string user, string password, int projectId, int timeLimitS)
	{
	}

	public static void LogValue(string valueName, float value)
	{
	}

	public static void LogValue(string valueName, int value)
	{
	}

	public static void LogValue(string valueName, Vector3 value)
	{
	}

	public static void LogValue(string valueName, bool value)
	{
	}

	public static void AddMarker(string valueName)
	{
	}

	public static void SetOverrideLuaLib(string luaLib)
	{
	}
}
