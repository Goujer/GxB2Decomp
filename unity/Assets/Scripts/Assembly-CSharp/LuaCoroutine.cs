using System;
using System.Collections;
using System.Diagnostics;
using LuaInterface;
using UnityEngine;

public static class LuaCoroutine
{
	private static MonoBehaviour mb;

	private static string strCo;

	public static void Register(LuaState state, MonoBehaviour behaviour)
	{
	}

	private static int _WaitForSeconds(IntPtr L)
	{
		return 0;
	}

	[DebuggerHidden]
	private static IEnumerator CoWaitForSeconds(float sec, LuaFunction func)
	{
		return null;
	}

	private static int WaitForFixedUpdate(IntPtr L)
	{
		return 0;
	}

	[DebuggerHidden]
	private static IEnumerator CoWaitForFixedUpdate(LuaFunction func)
	{
		return null;
	}

	private static int WaitForEndOfFrame(IntPtr L)
	{
		return 0;
	}

	[DebuggerHidden]
	private static IEnumerator CoWaitForEndOfFrame(LuaFunction func)
	{
		return null;
	}

	private static int Yield(IntPtr L)
	{
		return 0;
	}

	[DebuggerHidden]
	private static IEnumerator CoYield(object o, LuaFunction func)
	{
		return null;
	}

	private static int StopCoroutine(IntPtr L)
	{
		return 0;
	}
}
