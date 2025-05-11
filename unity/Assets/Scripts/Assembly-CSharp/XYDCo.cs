using System;
using System.Collections;
using System.Collections.Generic;
using System.Diagnostics;
using LuaInterface;
using UnityEngine;

public static class XYDCo
{
	private static readonly Dictionary<string, IEnumerator> coroutines_;

	private static WaitForEndOfFrame endOfFrame;

	public static bool IsWaitCoroutine(string name)
	{
		return false;
	}

	public static void WaitForTime(float waitTime, Action action, string name)
	{
	}

	public static void WaitForTime(float waitTime, LuaFunction func, string name)
	{
	}

	public static void WaitForFrame(int frameCount, Action action, string name)
	{
	}

	public static void WaitForFrame(int frameCount, LuaFunction func, string name)
	{
	}

	public static void WaitForEndOfFrame(Action action, string name)
	{
	}

	public static void WaitForEndOfFrame(LuaFunction func, string name)
	{
	}

	public static void WaitForFixedUpdate(Action action, string name)
	{
	}

	public static void StopWait(string name)
	{
	}

	[DebuggerHidden]
	private static IEnumerator WaitForTimeCoroutine(float waitTime, Action action, string name)
	{
		return null;
	}

	[DebuggerHidden]
	private static IEnumerator WaitForFrameCoroutine(int frameCount, Action action, string name)
	{
		return null;
	}

	[DebuggerHidden]
	private static IEnumerator WaitForEndOfFrameCoroutine(Action action, string name)
	{
		return null;
	}

	[DebuggerHidden]
	private static IEnumerator WaitForFixedUpdatCoroutine(Action action, string name)
	{
		return null;
	}

	public static void Reset()
	{
	}
}
