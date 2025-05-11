using System;
using System.Runtime.InteropServices;
using LuaInterface;
using UnityEngine;

public class LuaManager : MonoBehaviour
{
	[StructLayout(LayoutKind.Auto, Size = 8)]
	public delegate void MyDelegate(string a);

	private static LuaManager _instance;

	private LuaState _luaState;

	private LuaLooper _luaLooper;

	private LuaTable _profiler;

	public MyDelegate itemChangeShowUpdate;

	public MyDelegate battleReportShowUpdate;

	public string lastBattleReport;

	public static LuaManager Instance
	{
		get
		{
			return null;
		}
	}

	private void Awake()
	{
	}

	public void StartInit()
	{
	}

	private void AddSearchPath()
	{
	}

	private void OnLuaStateInited()
	{
	}

	private void StartMain()
	{
	}

	private void StartLooper()
	{
	}

	private void CallMain()
	{
	}

	private void OpenLibs()
	{
	}

	public void OpenZbsDebugger(string ip = "localhost")
	{
	}

	private static int LuaOpen_Socket_Core(IntPtr L)
	{
		return 0;
	}

	private static int LuaOpen_Mime_Core(IntPtr L)
	{
		return 0;
	}

	protected void OpenLuaSocket()
	{
	}

	private void OpenCJson()
	{
	}

	private void Bind()
	{
	}

	public void DoFile(string fn)
	{
	}

	public void CallFunction(string fn, params object[] args)
	{
	}

	public LuaState GetLuaState()
	{
		return null;
	}

	public LuaLooper GetLuaLooper()
	{
		return null;
	}

	public void LuaGC()
	{
	}

	public void AttachProfiler()
	{
	}

	public void DetachProfiler()
	{
	}

	public void ClearLua()
	{
	}

	public void Destroy()
	{
	}

	public void Reset()
	{
	}

	public void Run()
	{
	}

	public void RefreshDelegateMap()
	{
	}

	private void OnDestroy()
	{
	}

	private void OnApplicationPause(bool paused)
	{
	}

	private void OnApplicationQuit()
	{
	}

	public void TestItemChange(string dataStr)
	{
	}

	public void AddFun(string aaa, MyDelegate fun)
	{
	}

	public void showBattleReport(string dataStr)
	{
	}

	public void AddBattleFun(string aaa, MyDelegate fun)
	{
	}

	public int isShowLessLog()
	{
		return 0;
	}

	public void SetClickPos(string dataStr)
	{
	}
}
