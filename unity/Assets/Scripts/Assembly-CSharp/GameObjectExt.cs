using System;
using UnityEngine;

public static class GameObjectExt
{
	public static Transform NodeByName(this GameObject gameObject, string name)
	{
		return null;
	}

	public static Component ComponentByName(this GameObject gameObject, string name, Type type)
	{
		return null;
	}

	public static Component ComponentByName(this GameObject gameObject, string name, string typeName)
	{
		return null;
	}

	public static Component[] ComponentsByName(this GameObject gameObject, Type type)
	{
		return null;
	}

	public static Component[] GetComponentsInChildren(this GameObject gameObject, Type type, bool isActive)
	{
		return null;
	}

	public static void SetLocalPosition(this GameObject gameObject, float x, float y, float z)
	{
	}

	public static void SetLocalScale(this GameObject gameObject, float x, float y, float z)
	{
	}

	public static void X(this GameObject gameObject, float x)
	{
	}

	public static void Y(this GameObject gameObject, float y)
	{
	}

	public static void Z(this GameObject gameObject, float z)
	{
	}

	public static float X(this GameObject gameObject)
	{
		return 0f;
	}

	public static float Y(this GameObject gameObject)
	{
		return 0f;
	}

	public static float Z(this GameObject gameObject)
	{
		return 0f;
	}

	public static T AttachComponent<T>(this GameObject gameObject) where T : Component
	{
		return null;
	}

	public static void RemoveComponent<T>(this GameObject gameObject) where T : Component
	{
	}
}
