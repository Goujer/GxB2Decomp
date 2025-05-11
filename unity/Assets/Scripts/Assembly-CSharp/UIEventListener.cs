using System.Runtime.InteropServices;
using UnityEngine;

public class UIEventListener : MonoBehaviour
{
	[StructLayout(LayoutKind.Auto, Size = 8)]
	public delegate void VoidDelegate(GameObject go);

	[StructLayout(LayoutKind.Auto, Size = 8)]
	public delegate void BoolDelegate(GameObject go, bool state);

	[StructLayout(LayoutKind.Auto, Size = 8)]
	public delegate void FloatDelegate(GameObject go, float delta);

	[StructLayout(LayoutKind.Auto, Size = 8)]
	public delegate void VectorDelegate(GameObject go, Vector2 delta);

	[StructLayout(LayoutKind.Auto, Size = 8)]
	public delegate void ObjectDelegate(GameObject go, GameObject obj);

	[StructLayout(LayoutKind.Auto, Size = 8)]
	public delegate void KeyCodeDelegate(GameObject go, KeyCode key);

	public object parameter;

	public VoidDelegate onSubmit;

	public VoidDelegate onClick;

	public VoidDelegate guideClick;

	public VoidDelegate onDoubleClick;

	public BoolDelegate onHover;

	public BoolDelegate onPress;

	public VoidDelegate onLongPress;

	public BoolDelegate onSelect;

	public FloatDelegate onScroll;

	public VoidDelegate onDragStart;

	public VectorDelegate onDrag;

	public VoidDelegate onDragOver;

	public VoidDelegate onDragOut;

	public VoidDelegate onDragEnd;

	public ObjectDelegate onDrop;

	public KeyCodeDelegate onKey;

	public BoolDelegate onTooltip;

	public bool needsActiveCollider;

	private bool isColliderEnabled
	{
		get
		{
			return false;
		}
	}

	private void OnSubmit()
	{
	}

	private void OnClick()
	{
	}

	private void OnLongPress()
	{
	}

	private void OnDoubleClick()
	{
	}

	private void OnHover(bool isOver)
	{
	}

	private void OnPress(bool isPressed)
	{
	}

	private void OnSelect(bool selected)
	{
	}

	private void OnScroll(float delta)
	{
	}

	private void OnDragStart()
	{
	}

	private void OnDrag(Vector2 delta)
	{
	}

	private void OnDragOver()
	{
	}

	private void OnDragOut()
	{
	}

	private void OnDragEnd()
	{
	}

	private void OnDrop(GameObject go)
	{
	}

	private void OnKey(KeyCode key)
	{
	}

	private void OnTooltip(bool show)
	{
	}

	public void Clear()
	{
	}

	private void OnDestroy()
	{
	}

	public static UIEventListener Get(GameObject go)
	{
		return null;
	}

	public void addEvent(string eventName, VoidDelegate callback)
	{
	}

	public void removeEvent(string eventName, VoidDelegate callback)
	{
	}
}
