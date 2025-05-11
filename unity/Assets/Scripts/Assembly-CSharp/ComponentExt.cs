using System;
using UnityEngine;

public static class ComponentExt
{
	public static Transform NodeByName(this Component component, string name)
	{
		return null;
	}

	public static Component ComponentByName(this Component component, string name, Type type)
	{
		return null;
	}

	public static Component ComponentByName(this Component component, string name, string typeName)
	{
		return null;
	}

	public static Component[] ComponentsByName(this Component component, Type type)
	{
		return null;
	}

	public static Component AddComponent(this Component component, Type type)
	{
		return null;
	}

	public static Component GetComponent(this Component component, Type type)
	{
		return null;
	}

	public static Component GetComponent(this Component component, string typeName)
	{
		return null;
	}

	public static void SetActive(this Component component, bool active)
	{
	}

	public static void SetLocalPosition(this Component component, float x, float y, float z)
	{
	}

	public static void SetLocalScale(this Component component, float x, float y, float z)
	{
	}

	public static void X(this Component component, float x)
	{
	}

	public static void Y(this Component component, float y)
	{
	}

	public static float X(this Component component)
	{
		return 0f;
	}

	public static float Y(this Component component)
	{
		return 0f;
	}

	public static T AttachComponent<T>(this Component component) where T : Component
	{
		return null;
	}

	public static void RemoveComponent<T>(this Component component) where T : Component
	{
	}
}
