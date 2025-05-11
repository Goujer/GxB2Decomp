using System;
using System.Runtime.InteropServices;

public class XYDBeakpad
{
	[StructLayout(LayoutKind.Auto, Size = 8)]
	public delegate void UnityCallBack(IntPtr context, int success, string path);

	private static void CallBack(IntPtr context, int success, string path)
	{
	}

	[PreserveSig]
	public static extern void InitBreakpad(string supportPath, UnityCallBack unityCallBack);

	[PreserveSig]
	public static extern void Crash();

	public static void TestCrash()
	{
	}

	public static void Setup()
	{
	}
}
