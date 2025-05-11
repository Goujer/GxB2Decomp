using System.Collections.Generic;
using UnityEngine;

public class WebAtlas
{
	private static Dictionary<string, WebAtlas> _webAtlases;

	public Texture2D mTexture;

	public Material mMaterial;

	public UISpriteData mSpriteData;

	public static WebAtlas LoadImage(string path, string spriteName, TextureFormat textureFormat)
	{
		return null;
	}

	public static void Clear()
	{
	}
}
