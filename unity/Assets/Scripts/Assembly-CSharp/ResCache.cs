using System;
using System.Collections.Generic;
using UnityEngine;

public static class ResCache
{
	private static Dictionary<Type, Dictionary<string, UnityEngine.Object>> _defaultRes;

	private static Dictionary<Type, Dictionary<string, UnityEngine.Object[]>> _defaultAllRes;

	public static T LoadDefaultAsset<T>(string path) where T : UnityEngine.Object
	{
		return null;
	}

	public static T[] LoadDefaultAllAssets<T>(string path) where T : UnityEngine.Object
	{
		return null;
	}

	public static void AddLoadingSprite(UIWidget widget, int depth = 0, int offsetX = 0, int offsetY = 0, float scale = 1f)
	{
	}

	public static void RemoveLoadingSprite(UIWidget widget)
	{
	}

	private static GameObject FindLoadingSprite(UIWidget widget)
	{
		return null;
	}

	public static void SetUISprite(UISprite uiSprite, string path, string spriteName)
	{
	}

	public static void SetUISpriteAsync(UISprite uiSprite, string path, string spriteName, ResManager.LoadDelegate callback = null, bool showLoading = false, int depth = 0, int offsetX = 0, int offsetY = 0, float scacale = 1f)
	{
	}

	public static void SetUITexture(UITexture uiTexture, string path)
	{
	}

	public static void SetUITextureAsync(UITexture uiTexture, string path, ResManager.LoadDelegate callback = null, bool showLoading = false, int depth = 0, int offsetX = 0, int offsetY = 0, float scacale = 1f)
	{
	}

	public static Sprite SetSprite(SpriteRenderer spriteRenderer, string path, string name)
	{
		return null;
	}

	public static void SetSpriteAsync(SpriteRenderer spriteRenderer, string path, string name, ResManager.LoadDelegate callback = null)
	{
	}

	public static Sprite SetClipSprite(SpriteRenderer spriteRenderer, string path, string name)
	{
		return null;
	}

	public static void SetClipSpriteAsync(SpriteRenderer spriteRenderer, string path, string name, ResManager.LoadDelegate callback = null)
	{
	}

	public static GameObject AddChild(GameObject parent, GameObject go)
	{
		return null;
	}

	public static GameObject AddChild(GameObject parent, GameObject go, int layer)
	{
		return null;
	}

	public static void LoadInstanceGameObject(string path, ResManager.LoadDelegate callback)
	{
	}

	public static void LoadInstanceGameObjectAsync(string path, ResManager.LoadDelegate callback)
	{
	}

	public static GameObject AddGameObject(GameObject parent, string path)
	{
		return null;
	}

	public static GameObject AddGameObjectSpine(GameObject parent, string path)
	{
		return null;
	}

	public static GameObject NewGameObject(string path)
	{
		return null;
	}

	public static GameObject NewGameObjectSpine(string path)
	{
		return null;
	}

	public static void AddGameObjectAsync(GameObject parent, string path, ResManager.LoadDelegate callback = null)
	{
	}

	public static GameObject CacheGameObject(GameObject parent, string path)
	{
		return null;
	}

	public static void CacheGameObjectAsync(GameObject parent, string path, ResManager.LoadDelegate callback = null)
	{
	}

	public static AnimationClip AddAnimationClip(Animation anim, string path)
	{
		return null;
	}

	public static void AddAnimationClipAsync(Animation anim, string path, ResManager.LoadDelegate callback = null)
	{
	}

	public static Material SetMaterial(UIWidget uiWidget, string path)
	{
		return null;
	}

	public static Material SetMaterial(Renderer renderer, string path)
	{
		return null;
	}

	public static Material LoadInstanceMaterial(GameObject go, string path)
	{
		return null;
	}

	public static TextAsset LoadTextAsset(string path)
	{
		return null;
	}

	public static void SetSceneData(GameObject go, string path)
	{
	}

	public static void PreloadAsset<T>(string path, ResManager.LoadDelegate callback = null) where T : UnityEngine.Object
	{
	}

	public static void PreloadSpriteAtlas(string path, ResManager.LoadDelegate callback = null)
	{
	}

	public static void PreloadGameObject(string path, ResManager.LoadDelegate callback = null)
	{
	}

	public static RenderTexture LoadRenderTexture(GameObject go, string path)
	{
		return null;
	}

	public static void ReleaseAssets(string[] paths, Type[] types)
	{
	}

	public static void PreloadAssets(string group, string[] paths, ResManager.LoadDelegate callback)
	{
	}

	public static void PreloadABs(string group, string[] abUrls, ResManager.LoadDelegate callback)
	{
	}

	public static void ReleaseABs(string[] paths)
	{
	}

	public static void ReleasePreload(string group)
	{
	}

	public static void DownloadAssets(string group, string[] paths, ResManager.DownloadDelegate callback, ResManager.DownloadGroupProgressDelegate progressCallback, float interval = 0f)
	{
	}

	public static void DownloadABs(string group, string[] abUrls, ResManager.DownloadDelegate callback, ResManager.DownloadGroupProgressDelegate progressCallback, float interval = 0f)
	{
	}

	public static void CancelDownload(string group)
	{
	}

	public static void cacheABs(string[] paths)
	{
	}

	public static void removeCacheABs(string[] paths)
	{
	}
}
