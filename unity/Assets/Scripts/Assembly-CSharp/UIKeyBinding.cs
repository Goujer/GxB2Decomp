using System;
using System.Collections.Generic;
using UnityEngine;

public class UIKeyBinding : MonoBehaviour
{
	[DoNotObfuscateNGUI]
	public enum Action
	{
		PressAndClick = 0,
		Select = 1,
		All = 2
	}

	[DoNotObfuscateNGUI]
	public enum Modifier
	{
		Any = 0,
		Shift = 1,
		Ctrl = 2,
		Alt = 3,
		None = 4
	}

	private static List<UIKeyBinding> mList;

	public KeyCode keyCode;

	public Modifier modifier;

	public Action action;

	[NonSerialized]
	private bool mIgnoreUp;

	[NonSerialized]
	private bool mIsInput;

	[NonSerialized]
	private bool mPress;

	public string captionText
	{
		get
		{
			return null;
		}
	}

	public static bool IsBound(KeyCode key)
	{
		return false;
	}

	protected virtual void OnEnable()
	{
	}

	protected virtual void OnDisable()
	{
	}

	protected virtual void Start()
	{
	}

	protected virtual void OnSubmit()
	{
	}

	protected virtual bool IsModifierActive()
	{
		return false;
	}

	public static bool IsModifierActive(Modifier modifier)
	{
		return false;
	}

	protected virtual void Update()
	{
	}

	protected virtual void OnBindingPress(bool pressed)
	{
	}

	protected virtual void OnBindingClick()
	{
	}

	public override string ToString()
	{
		return null;
	}

	public static string GetString(KeyCode keyCode, Modifier modifier)
	{
		return null;
	}

	public static bool GetKeyCode(string text, out KeyCode key, out Modifier modifier)
	{
		key = default(KeyCode);
		modifier = default(Modifier);
		return false;
	}

	public static Modifier GetActiveModifier()
	{
		return default(Modifier);
	}
}
