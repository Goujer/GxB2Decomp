using System;
using System.Runtime.InteropServices;

public static class ApkUtils
{
	[PreserveSig]
	public static extern IntPtr DllAUCreateInstance();

	[PreserveSig]
	public static extern void DllAUDestroyInstance();

	[PreserveSig]
	public static extern bool DllAUIsFileExist(string fn, bool isLua = false);

	[PreserveSig]
	public static extern uint DllAUGetFileSize(string fn, bool isLua = false);

	[PreserveSig]
	public static extern void DllAUGetFileContent(string fn, byte[] content, bool isLua = false);

	public static IntPtr CreateInstance()
	{
		return (IntPtr)0;
	}

	public static void DestroyInstance()
	{
	}

	public static bool IsFileExist(string fn, bool isLua = false)
	{
		return false;
	}

	public static uint GetFileSize(string fn, bool isLua = false)
	{
		return 0u;
	}

	public static byte[] GetFileContent(string fn, bool isLua = false)
	{
		return null;
	}
}
