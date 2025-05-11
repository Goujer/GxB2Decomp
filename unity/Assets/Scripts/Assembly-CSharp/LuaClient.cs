using System;
using LuaInterface;
using UnityEngine;
using UnityEngine.SceneManagement;

public class LuaClient : MonoBehaviour
{
	protected LuaState luaState;

	protected LuaLooper loop;

	protected LuaFunction levelLoaded;

	protected bool openLuaSocket;

	protected bool beZbStart;

	private LuaTable profiler;

	public static LuaClient Instance { get; protected set; }

	protected virtual LuaFileUtils InitLoader()
	{
		return null;
	}

	protected virtual void LoadLuaFiles()
	{
	}

	protected virtual void OpenLibs()
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

	protected void OpenCJson()
	{
	}

	protected virtual void CallMain()
	{
	}

	protected virtual void StartMain()
	{
	}

	protected void StartLooper()
	{
	}

	protected virtual void Bind()
	{
	}

	protected void Init()
	{
	}

	protected void Awake()
	{
	}

	protected virtual void OnLoadFinished()
	{
	}

	private void OnLevelLoaded(int level)
	{
	}

	private void OnSceneLoaded(Scene scene, LoadSceneMode mode)
	{
	}

	public virtual void Destroy()
	{
	}

	protected void OnDestroy()
	{
	}

	protected void OnApplicationQuit()
	{
	}

	public static LuaState GetMainState()
	{
		return null;
	}

	public LuaLooper GetLooper()
	{
		return null;
	}

	public void AttachProfiler()
	{
	}

	public void DetachProfiler()
	{
	}
}
