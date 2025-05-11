using System;
using UnityEngine;

public static class CaptureUtils
{
	public static void CaptureJPG(Rect rect, Camera[] cams, int bufferDepth, string name, Action<string, byte[]> callback)
	{
	}

	public static void CapturePNG(Rect rect, Camera[] cams, int bufferDepth, string name, Action<string, byte[]> callback)
	{
	}

	private static Texture2D Capture(Rect rect, Camera[] cams, int bufferDepth, TextureFormat format)
	{
		return null;
	}
}
