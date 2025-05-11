using System;
using UnityEngine;

public static class TransformExt
{
	public static Transform NodeByName(this Transform transform, string name)
	{
		return null;
	}

	public static Component ComponentByName(this Transform transform, string name, Type type)
	{
		return null;
	}

	public static Component ComponentByName(this Transform transform, string name, string typeName)
	{
		return null;
	}

	public static Component[] ComponentsByName(this Transform transform, Type type)
	{
		return null;
	}

	public static Component AddComponent(this Transform transform, Type type)
	{
		return null;
	}

	public static Component GetComponent(this Transform transform, Type type)
	{
		return null;
	}

	public static Component GetComponent(this Transform transform, string typeName)
	{
		return null;
	}

	public static void SetActive(this Transform transform, bool active)
	{
	}

	public static void SetLocalPosition(this Transform transform, float x, float y, float z)
	{
	}

	public static void SetLocalScale(this Transform transform, float x, float y, float z)
	{
	}

	public static void X(this Transform transform, float x)
	{
	}

	public static void Y(this Transform transform, float y)
	{
	}

	public static void Z(this Transform transform, float z)
	{
	}

	public static float X(this Transform transform)
	{
		return 0f;
	}

	public static float Y(this Transform transform)
	{
		return 0f;
	}

	public static float Z(this Transform transform)
	{
		return 0f;
	}

	public static T AttachComponent<T>(this Transform transform) where T : Component
	{
		return null;
	}

	public static void RemoveComponent<T>(this Transform transform) where T : Component
	{
	}
}
