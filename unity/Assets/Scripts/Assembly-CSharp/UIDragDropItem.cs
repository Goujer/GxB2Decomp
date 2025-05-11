using System;
using System.Collections.Generic;
using UnityEngine;

public class UIDragDropItem : MonoBehaviour
{
	[DoNotObfuscateNGUI]
	public enum Restriction
	{
		None = 0,
		Horizontal = 1,
		Vertical = 2,
		PressAndHold = 3
	}

	public Restriction restriction;

	public bool clickToDrag;

	public bool cloneOnDrag;

	public bool interactable;

	[HideInInspector]
	public float pressAndHoldDelay;

	[NonSerialized]
	protected Transform mTrans;

	[NonSerialized]
	protected Transform mParent;

	[NonSerialized]
	protected Collider mCollider;

	[NonSerialized]
	protected Collider2D mCollider2D;

	[NonSerialized]
	protected UIButton mButton;

	[NonSerialized]
	protected UIRoot mRoot;

	[NonSerialized]
	protected UIGrid mGrid;

	[NonSerialized]
	protected UITable mTable;

	[NonSerialized]
	protected float mDragStartTime;

	[NonSerialized]
	protected UIDragScrollView mDragScrollView;

	[NonSerialized]
	protected bool mPressed;

	[NonSerialized]
	protected bool mDragging;

	[NonSerialized]
	protected UICamera.MouseOrTouch mTouch;

	[NonSerialized]
	public static List<UIDragDropItem> draggedItems;

	public static bool IsDragged(GameObject go)
	{
		return false;
	}

	protected virtual void Awake()
	{
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

	protected virtual void OnPress(bool isPressed)
	{
	}

	protected virtual void OnClick()
	{
	}

	protected void OnGlobalPress(GameObject go, bool state)
	{
	}

	protected void OnGlobalClick(GameObject go)
	{
	}

	protected virtual void Update()
	{
	}

	protected virtual void OnDragStart()
	{
	}

	public virtual UIDragDropItem StartDragging()
	{
		return null;
	}

	protected virtual void OnClone(GameObject original)
	{
	}

	protected virtual void OnDrag(Vector2 delta)
	{
	}

	protected virtual void OnDragEnd()
	{
	}

	public void StopDragging(GameObject go = null)
	{
	}

	protected virtual void OnDragDropStart()
	{
	}

	protected virtual void OnDragDropMove(Vector2 delta)
	{
	}

	protected virtual void OnDragDropRelease(GameObject surface)
	{
	}

	protected virtual void DestroySelf()
	{
	}

	protected virtual void OnDragDropEnd(GameObject surface)
	{
	}

	protected void EnableDragScrollView()
	{
	}

	protected void OnApplicationFocus(bool focus)
	{
	}
}
