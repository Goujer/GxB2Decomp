using System;
using UnityEngine;
using UnityEngine.SceneManagement;

public static class SceneUtils
{
	public static Action<Scene, LoadSceneMode> SceneLoadedCallback;

	public static Action<Scene> SceneUnloadedCallback;

	private static int asyncUploadTimeSliceBackup;

	private static int asyncUploadTimeSliceLoadScene;

	static SceneUtils()
	{
	}

	public static void Reset()
	{
	}

	public static void SceneLoaded(Scene scene, LoadSceneMode mode)
	{
	}

	public static void SceneUnloaded(Scene scene)
	{
	}

	private static void ModifySettings()
	{
	}

	private static void RestoreSettings()
	{
	}

	public static void LoadScene(string sceneName, LoadSceneMode mode, Action<Scene, LoadSceneMode> callback)
	{
	}

	public static void UnloadScene(string sceneName, Action<Scene> callback)
	{
	}

	public static Scene CreateScene(string sceneName)
	{
		return default(Scene);
	}

	public static bool SetActiveScene(Scene scene)
	{
		return false;
	}

	public static Scene GetSceneByName(string sceneName)
	{
		return default(Scene);
	}

	public static int GetSceneCount()
	{
		return 0;
	}

	public static Scene GetSceneAt(int index)
	{
		return default(Scene);
	}

	public static void MoveGameObjectToScene(GameObject go, Scene scene)
	{
	}

	public static void MoveGameObjectToScene(GameObject go, string sceneName)
	{
	}

	public static bool HasLoadedScene(string sceneName)
	{
		return false;
	}

	public static void SetGlobalShadowDirAndShader(Vector3 dir, bool isEnable)
	{
	}

	public static void SetGlobalShadowCameraEnable(bool isEnable)
	{
	}

	public static void SetGlobalShadowColor(float r, float g, float b, float a)
	{
	}

	public static void SetLightProbeEnable(GameObject go, bool enable)
	{
	}

	public static Collider2D OverlapCircle(Vector2 point, float radius)
	{
		return null;
	}

	public static Collider2D[] OverlapCircleAll(Vector2 point, float radius)
	{
		return null;
	}

	public static Collider2D[] OverlapCircleAll(Vector2 point, float radius, int layerMask)
	{
		return null;
	}
}
